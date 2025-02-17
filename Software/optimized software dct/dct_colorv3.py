import numpy as np
from PIL import Image
import cv2
import time
import tile_compressor
import image_codec
import quality_statistics
import queue
import threading
import multiprocessing as mp

image_path = "test_images/img10.jpg"  # Replace with your image path
EN_SUBSAMPLE = False
EN_OUTPUT_FILTER = False
EN_FILE_GEN = False
DCT_KERNEL_SIZE = 8

current_images = None
k_values = [0.125 * (2 ** i) for i in range(12)]  # 0.125 to 256
res_values = [128 * (2 ** i) for i in range(6)]   # 128 to 4096
zoom_scales = {}  # Dictionary to store zoom scales for each window
WINDOW_ORIGINAL = 'Original Image'
WINDOW_PROCESSED = 'Processed Image'
WINDOW_CHANNELS = 'Channel Visualization'
WINDOW_CONTROLS = 'Controls'
active_window = WINDOW_ORIGINAL  # Track which window is currently active

processing_queue = queue.Queue()
current_task = None
processing_thread = None
last_trackbar_update = 0
TRACKBAR_DELAY = 0.1  # 100ms delay between updates
display_needs_update = False  # New flag to track when display should update



def process_channel_core(channel_array, k=1, qs=0.125, channel_data=None):
    h, w = channel_array.shape
    channel_array = channel_array.astype(np.int16)
    dct_kernel_size = DCT_KERNEL_SIZE

    input_tiles = np.transpose(image_codec.generate_tiles(channel_array, dct_kernel_size, h//dct_kernel_size, w//dct_kernel_size), (0, 1, 3, 2))
    dct1 = np.transpose(image_codec.shift_by_3(image_codec.dct_1d_vectorized(input_tiles)), (0, 1, 3, 2))
    dct_matrices = image_codec.quantize(image_codec.dct_1d_vectorized(dct1), qs)

    # Print largest and smallest numbers, and minimum size/element in bits
    print(f"DCT1: Max: {np.max(dct1)}, Min: {np.min(dct1)}, Size: {np.ceil(np.log2(np.max(dct1))+1):.2f} bits")
    print(f"Quantized: Max: {np.max(dct_matrices)}, Min: {np.min(dct_matrices)}, Size: {np.ceil(np.log2(np.max(dct_matrices))+1):.2f} bits")

    # Process and verify compression
    if EN_FILE_GEN:
        size, decompressed_matrices = tile_compressor.verify_compression(dct_matrices, channel_data)
        # Perform IDCT on decompressed matrices
        output = np.transpose(image_codec.idct_vectorized(decompressed_matrices, k), (0, 2, 1, 3)).reshape(h, w)
    else:
        output = np.transpose(image_codec.idct_vectorized(dct_matrices, k), (0, 2, 1, 3)).reshape(h, w)
        size = 0

    if EN_OUTPUT_FILTER:
        output = image_codec.deringing_filter(output, sigma=0.5)
    else:
        output = output.astype(np.uint8)

    return output, size


def resize_image(image, target_size):
    """
    Process image in two steps:
    1. Crop to square from center using the smallest dimension
    2. Resize square image to target_size x target_size
    """
    h, w = image.shape[:2]

    # Find smallest dimension
    size = min(h, w)

    # Calculate center crop coordinates
    mid_h = h // 2
    mid_w = w // 2
    start_h = mid_h - (size // 2)
    start_w = mid_w - (size // 2)

    # Crop to square
    cropped = image[start_h:start_h + size, start_w:start_w + size]

    # Resize square image to target size
    return cv2.resize(cropped, (target_size, target_size))


def chroma_subsample(matrix):
    # Ensure even dimensions
    if matrix.shape[0] % 2 != 0:
        matrix = matrix[:-1, :]
    if matrix.shape[1] % 2 != 0:
        matrix = matrix[:, :-1]

    return np.mean(matrix.reshape(matrix.shape[0] // 2, 2, matrix.shape[1] // 2, 2), axis=(1, 3))


def chroma_upsample(subsampled_matrix, target_height, target_width):
    # Repeat each value in both dimensions
    upsampled = np.repeat(np.repeat(subsampled_matrix, 2, axis=0), 2, axis=1)

    # Ensure we match the target dimensions (in case of odd dimensions)
    if upsampled.shape[0] > target_height:
        upsampled = upsampled[:target_height, :]
    if upsampled.shape[1] > target_width:
        upsampled = upsampled[:, :target_width]

    return upsampled


def process_color_image(image_path, k=1, resolution=512):
    """Process a color image, compressing all channels into a single file."""
    # Read and prepare image
    img = Image.open(image_path)
    img_array = np.array(img)
    start_time = time.time()

    # Resize image
    img_array = resize_image(img_array, resolution)

    original_size = img_array.nbytes / 1024

    # Convert to YCrCb
    Y, Cr, Cb = image_codec.rgb2ycrcb(img_array[:, :, 0].astype(np.int32),
                                      img_array[:, :, 1].astype(np.int32),
                                      img_array[:, :, 2].astype(np.int32))

    # Perform chroma subsampling, copy every even element and replace the odd element with it
    if EN_SUBSAMPLE:
        Cr_subsampled = chroma_subsample(Cr)
        Cb_subsampled = chroma_subsample(Cb)
        print(f"Original Cr shape: {Cr.shape}, Subsampled Cr shape: {Cr_subsampled.shape}")
        print(f"Original Cb shape: {Cb.shape}, Subsampled Cb shape: {Cb_subsampled.shape}")
    else:
        Cr_subsampled = Cr
        Cb_subsampled = Cb
    # List to store channel data, used as "collector"
    channel_data = []

    # Process each channel
    qs = 0
    if k <= 0:
        qs = 0
    else:
        qs = int(np.log2(k / 0.125))
    Y_processed, Y_size = process_channel_core(Y, k, qs, channel_data)
    Cr_processed, Cr_size = process_channel_core(Cr_subsampled, k, qs,  channel_data)
    Cb_processed, Cb_size = process_channel_core(Cb_subsampled, k, qs, channel_data)

    # Write all channels to a single file
    compressed_size = tile_compressor.write_compressed_channels(channel_data, 'compressed_image.hex')

    # Convert back to RGB
    if EN_SUBSAMPLE:
        Cr_upsampled = chroma_upsample(Cr_processed, Y_processed.shape[0], Y_processed.shape[1])
        Cb_upsampled = chroma_upsample(Cb_processed, Y_processed.shape[0], Y_processed.shape[1])
    else:
        Cr_upsampled = Cr_processed
        Cb_upsampled = Cb_processed

    imgprocessed = cv2.merge([Y_processed, Cr_upsampled, Cb_upsampled])
    imgRGB = cv2.cvtColor(imgprocessed, cv2.COLOR_YCrCb2RGB)

    # Calculate statistics
    compression_ratio = 100 * (1 - (compressed_size / original_size))
    end_time = time.time()
    print(f"\nProcessing time (ms): {1000 * (end_time - start_time):.2f}")

    return (img_array, imgRGB, Y_processed, Cr_upsampled, Cb_upsampled,
            quality_statistics.calculate_psnr(img_array, imgRGB),
            quality_statistics.calculate_msssim(img_array, imgRGB),
            original_size, compressed_size, compression_ratio)


def bgr_to_rgb(image):
    """Convert BGR to RGB"""
    return cv2.cvtColor(image, cv2.COLOR_BGR2RGB)


def rgb_to_bgr(image):
    """Convert RGB to BGR for display"""
    return cv2.cvtColor(image, cv2.COLOR_RGB2BGR)


class ProcessingTask:
    def __init__(self, k, resolution):
        self.k = k
        self.resolution = resolution
        self.timestamp = time.time()


def process_thread_function():
    """Background thread for image processing"""
    global current_images, current_task, display_needs_update
    while True:
        try:
            # Get the newest task, discard others
            while not processing_queue.empty():
                task = processing_queue.get_nowait()
                if task is None:  # Exit signal
                    return
                current_task = task

            if current_task is not None:
                # Process the image
                result = process_color_image(image_path, current_task.k, current_task.resolution)
                # Store the result and trigger display update
                current_images = result
                current_task = None
                display_needs_update = True  # Set flag for main thread to update display
            else:
                time.sleep(0.01)  # Small sleep when idle
        except queue.Empty:
            time.sleep(0.01)  # Small sleep when queue is empty
        except Exception as e:
            print(f"Error in processing thread: {e}")
            current_task = None
            time.sleep(0.01)


def zoom_image(image, scale, center=None):
    """Zoom into image while maintaining window size"""
    if scale <= 0:
        return image

    height, width = image.shape[:2]

    if center is None:
        center = (width // 2, height // 2)

    # Calculate new dimensions
    new_width = int(width / scale)
    new_height = int(height / scale)

    # Calculate region to crop
    x1 = max(0, center[0] - new_width // 2)
    y1 = max(0, center[1] - new_height // 2)
    x2 = min(width, x1 + new_width)
    y2 = min(height, y1 + new_height)

    # Adjust crop region if it's too close to the edges
    if x2 - x1 < new_width:
        if x1 == 0:
            x2 = min(width, new_width)
        else:
            x1 = max(0, width - new_width)
            x2 = width

    if y2 - y1 < new_height:
        if y1 == 0:
            y2 = min(height, new_height)
        else:
            y1 = max(0, height - new_height)
            y2 = height

    # Crop and resize
    cropped = image[y1:y2, x1:x2]
    return cv2.resize(cropped, (width, height), interpolation=cv2.INTER_LINEAR)


def add_text_with_constant_size(image, text, position, base_height=1080):
    """Add text with size relative to a base resolution"""
    height = image.shape[0]
    # Scale font size based on height ratio, but with a more conservative scaling
    scale = min(height / base_height, 1.0)  # Cap scale at 1.0
    font_scale = max(0.5, 1.0 * scale)  # Minimum scale of 0.5
    thickness = max(1, int(2 * scale))  # Minimum thickness of 1

    # Calculate text size to ensure it stays on screen
    (text_width, text_height), baseline = cv2.getTextSize(text, cv2.FONT_HERSHEY_SIMPLEX, font_scale, thickness)

    # Adjust position to ensure text stays within image bounds
    x, y = position
    x = min(x, image.shape[1] - text_width - 10)  # Keep 10px margin
    x = max(10, x)  # Minimum 10px from left
    y = min(y, image.shape[0] - 10)  # Keep 10px margin from bottom
    y = max(text_height + 10, y)  # Minimum 10px from top plus text height

    # Add black outline for better visibility
    cv2.putText(image, text, (x, y), cv2.FONT_HERSHEY_SIMPLEX, font_scale, (0, 0, 0), thickness + 1)
    cv2.putText(image, text, (x, y), cv2.FONT_HERSHEY_SIMPLEX, font_scale, (255, 255, 255), thickness)


def update_display():
    """Update all display windows with current images"""
    global current_images, zoom_scales
    if current_images is None:
        return

    original, processed, y_channel, cr_channel, cb_channel, psnr, msssim, orig_size, comp_size, comp_ratio = current_images
    resolution = original.shape[0]
    k = k_values[cv2.getTrackbarPos('Quantization (k)', 'Controls')]

    # Convert RGB to BGR for display
    original_display = rgb_to_bgr(original.copy())
    processed_display = rgb_to_bgr(processed.copy())

    # Apply zoom to images if zoom scale is set
    if 'Original Image' in zoom_scales:
        original_display = zoom_image(original_display, zoom_scales['Original Image'])

    if 'Processed Image' in zoom_scales:
        processed_display = zoom_image(processed_display, zoom_scales['Processed Image'])

    # Create a composite image for channels
    channels_display = np.zeros((resolution * 2, resolution * 2, 3), dtype=np.uint8)
    channels_display[:resolution, :resolution] = cv2.cvtColor(y_channel, cv2.COLOR_GRAY2BGR)
    channels_display[:resolution, resolution:] = cv2.cvtColor(cr_channel, cv2.COLOR_GRAY2BGR)
    channels_display[resolution:, :resolution] = cv2.cvtColor(cb_channel, cv2.COLOR_GRAY2BGR)
    channels_display[resolution:, resolution:] = rgb_to_bgr(processed)

    if 'Channel Visualization' in zoom_scales:
        channels_display = zoom_image(channels_display, zoom_scales['Channel Visualization'])

    # Add metrics text with constant size
    metrics_text = f'PSNR: {psnr:.2f} dB | MS-SSIM: {msssim:.4f}'
    metrics_text2 = f'Compression: {comp_ratio:.2f}% | Size: {comp_size:.2f}KB'

    add_text_with_constant_size(original_display, f'Original ({resolution}x{resolution})', (10, 30))
    add_text_with_constant_size(processed_display, f'k={k:.3f} | ' + metrics_text, (10, 30))
    add_text_with_constant_size(processed_display, metrics_text2, (10, 70))

    # Add channel labels with constant size
    add_text_with_constant_size(channels_display, 'Y Channel', (10, 30))
    add_text_with_constant_size(channels_display, 'Cr Channel', (resolution + 10, 30))
    add_text_with_constant_size(channels_display, 'Cb Channel', (10, resolution + 30))
    add_text_with_constant_size(channels_display, 'Processed', (resolution + 10, resolution + 30))

    # Show images
    cv2.imshow('Original Image', original_display)
    cv2.imshow('Processed Image', processed_display)
    cv2.imshow('Channel Visualization', channels_display)


def on_trackbar_change(*args):
    """Callback for trackbar changes - now forces display updates"""
    global last_trackbar_update, display_needs_update

    # Throttle updates
    current_time = time.time()
    if current_time - last_trackbar_update < TRACKBAR_DELAY:
        return

    last_trackbar_update = current_time

    k = k_values[cv2.getTrackbarPos('Quantization (k)', WINDOW_CONTROLS)]
    resolution = res_values[cv2.getTrackbarPos('Resolution', WINDOW_CONTROLS)]

    # Queue the new processing task
    processing_queue.put(ProcessingTask(k, resolution))

    # Force an immediate display update if we have current images
    if current_images is not None and display_needs_update:
        update_display()
        display_needs_update = False


def mouse_callback(event, x, y, flags, param):
    """Handle mouse events for zooming and window activation"""
    global mouse_x, mouse_y, active_window

    window_name = param
    if event == cv2.EVENT_MOUSEMOVE:
        mouse_x, mouse_y = x, y
    # Set active window when mouse enters window
    if event == cv2.EVENT_MOUSEMOVE or event == cv2.EVENT_LBUTTONDOWN:
        active_window = window_name


def adjust_zoom(window_name, direction):
    """Adjust zoom level for a specific window"""
    global zoom_scales

    # Initialize zoom scale if not exists
    if window_name not in zoom_scales:
        zoom_scales[window_name] = 1.0

    # Adjust zoom scale
    if direction > 0:  # Zoom in
        zoom_scales[window_name] *= 1.1
    else:  # Zoom out
        zoom_scales[window_name] /= 1.1

    # Limit zoom scale
    zoom_scales[window_name] = max(1.0, min(10.0, zoom_scales[window_name]))

    # Update display
    update_display()


def create_interactive_display(image_path):
    global current_images, zoom_scales, active_window, processing_thread, display_needs_update
    mp.set_start_method('spawn', force=True)

    # Start processing thread
    processing_thread = threading.Thread(target=process_thread_function, daemon=True)
    processing_thread.start()

    # Create windows with initial size
    initial_width, initial_height = 800, 600

    # Create windows
    cv2.namedWindow(WINDOW_ORIGINAL, cv2.WINDOW_NORMAL)
    cv2.namedWindow(WINDOW_PROCESSED, cv2.WINDOW_NORMAL)
    cv2.namedWindow(WINDOW_CHANNELS, cv2.WINDOW_NORMAL)
    cv2.namedWindow(WINDOW_CONTROLS)

    # Set initial window sizes
    cv2.resizeWindow(WINDOW_ORIGINAL, initial_width, initial_height)
    cv2.resizeWindow(WINDOW_PROCESSED, initial_width, initial_height)
    cv2.resizeWindow(WINDOW_CHANNELS, initial_width, initial_height)

    # Initialize zoom scales
    zoom_scales = {
        WINDOW_ORIGINAL: 1.0,
        WINDOW_PROCESSED: 1.0,
        WINDOW_CHANNELS: 1.0
    }

    # Set mouse callbacks
    cv2.setMouseCallback(WINDOW_ORIGINAL, mouse_callback, WINDOW_ORIGINAL)
    cv2.setMouseCallback(WINDOW_PROCESSED, mouse_callback, WINDOW_PROCESSED)
    cv2.setMouseCallback(WINDOW_CHANNELS, mouse_callback, WINDOW_CHANNELS)

    # Create trackbars
    cv2.createTrackbar('Quantization (k)', WINDOW_CONTROLS, 0, len(k_values) - 1, on_trackbar_change)
    cv2.createTrackbar('Resolution', WINDOW_CONTROLS, 4, len(res_values) - 1, on_trackbar_change)

    # Queue initial processing
    on_trackbar_change()

    # Move windows to specific positions
    cv2.moveWindow(WINDOW_CONTROLS, 0, 0)
    cv2.moveWindow(WINDOW_ORIGINAL, 300, 0)
    cv2.moveWindow(WINDOW_PROCESSED, 300, initial_height + 50)
    cv2.moveWindow(WINDOW_CHANNELS, initial_width + 350, 0)

    print("Controls:")
    print("- Move mouse over a window and use + and - keys to zoom in/out")
    print("- Press 'r' to reset zoom for active window")
    print("- Press ESC to exit")
    print("- Active window is determined by mouse position")

    last_display_update = 0
    DISPLAY_UPDATE_DELAY = 0.016  # ~60 FPS max for smoother updates

    while True:
        # Force more frequent checks for updates
        for _ in range(5):  # Check multiple times per main loop iteration
            if display_needs_update and current_images is not None:
                current_time = time.time()
                if (current_time - last_display_update) >= DISPLAY_UPDATE_DELAY:
                    update_display()
                    display_needs_update = False
                    last_display_update = current_time
                    break

            # Brief sleep to prevent CPU hogging
            time.sleep(0.002)  # 2ms sleep

        # Handle key events
        key = cv2.waitKey(1) & 0xFF

        if key == 27:  # ESC key
            # Signal processing thread to exit
            processing_queue.put(None)
            processing_thread.join(timeout=1.0)
            break
        elif key == ord('+') or key == ord('='):
            if active_window in zoom_scales:
                adjust_zoom(active_window, 1)
        elif key == ord('-'):
            if active_window in zoom_scales:
                adjust_zoom(active_window, -1)
        elif key == ord('r'):
            if active_window in zoom_scales:
                zoom_scales[active_window] = 1.0
                update_display()

    # Cleanup
    cv2.destroyAllWindows()

if __name__ == "__main__":
    create_interactive_display(image_path)