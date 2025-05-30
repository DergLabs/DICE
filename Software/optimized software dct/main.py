# Library Imports
from app_libraries import *

# App Constants
from app_constants import *

# App Helper files 
import tile_compressor
import tile_compressorV2
import image_codec
import quality_statistics


# Process image channel
def process_channel_core(channel_array, k=0.125, qs=1, channel_data=None, filename=None, ch=None, 
                         sigma_spatial=1.5, sigma_intensity=25, edge_threshold=30, border_width=1,
                         deblock_strength=4, deblock_threshold=8):
    
    # Make a copy and ensure proper dtype
    channel_array = np.ascontiguousarray(channel_array, dtype=np.uint8)
    h, w = channel_array.shape
    channel_array = np.ascontiguousarray(channel_array, dtype=dct_datatype)
    dct_kernel_size = DCT_KERNEL_SIZE

    # Generate tiles
    input_tiles = np.ascontiguousarray(
        np.transpose(image_codec.generate_tiles(channel_array, dct_kernel_size, 
                                               h//dct_kernel_size, w//dct_kernel_size), 
                    (0, 1, 3, 2)), 
        dtype=dct_datatype
    )
    
    # First DCT pass
    dct1 = np.ascontiguousarray(
        np.transpose(image_codec.shift_by_3(image_codec.dct_1d_vectorized(input_tiles)), 
                    (0, 1, 3, 2)), 
        dtype=dct_datatype
    )
    
    # Second DCT pass and quantization
    dct_matrices = np.ascontiguousarray(
        image_codec.quantize(image_codec.dct_1d_vectorized(dct1), qs),
        dtype=dct_datatype
    )
    
    print(f"DCT Matrices Dtype: {dct_matrices.dtype}")
    print(f"DCT Matrices Shape: {dct_matrices.shape}")

    # Print max number of bits needed to represent the data
    min_val = np.min(dct_matrices)
    max_val = np.max(dct_matrices)
    print(f"Min Value: {min_val}, Max Value: {max_val}")
    print(f"Max Bits Needed: {np.uint8(np.log2(max(abs(min_val), abs(max_val))))}")

    # *** THIS IS THE CRITICAL PART ***
    # Ensure the array is in the correct format before calling compress_tile
    # Try different array preparations to see which one works
    try:
        # Method 1: Standard contiguous array with correct dtype
        dct_matrices_prepared = np.ascontiguousarray(dct_matrices, dtype=dct_datatype)
        size, compressed_data, entropy_model = tile_compressorV2.compress_tile(dct_matrices_prepared)
    except TypeError:
        try:
            # Method 2: Try with int16 dtype (which seems to be what your dct_datatype is set to)
            print("First method failed, trying with explicit int16...")
            dct_matrices_prepared = np.ascontiguousarray(dct_matrices, dtype=np.int16)
            size, compressed_data, entropy_model = tile_compressorV2.compress_tile(dct_matrices_prepared)
        except TypeError:
            try:
                # Method 3: Try with np.array() wrapping and fortran order
                print("Second method failed, trying with Fortran order...")
                dct_matrices_prepared = np.asfortranarray(dct_matrices, dtype=np.int16)
                size, compressed_data, entropy_model = tile_compressorV2.compress_tile(dct_matrices_prepared)
            except TypeError:
                # Method 4: Last resort - copy the array completely
                print("Third method failed, trying with complete copy...")
                dct_matrices_prepared = np.array(dct_matrices, dtype=np.int16, copy=True, order='C')
                size, compressed_data, entropy_model = tile_compressorV2.compress_tile(dct_matrices_prepared)

    # Only attempt to read the file if we've successfully saved it
    if EN_FILE_GEN and filename:
        # Save compressed data to file
        save_result = tile_compressorV2.save_compressed_data(compressed_data, entropy_model, filename)
        if not save_result:
            print(f"Warning: Failed to save compressed data to {filename}")
            # Continue processing without file I/O
            output = np.ascontiguousarray(
                np.transpose(image_codec.idct_vectorized(dct_matrices, k), 
                            (0, 2, 1, 3)).reshape(h, w),
                dtype=np.uint8
            )
            
            if EN_OUTPUT_FILTER:
                output = np.ascontiguousarray(
                    image_codec.combined_deringing_deblocking(
                        output, 
                        sigma_spatial=sigma_spatial, 
                        sigma_intensity=sigma_intensity,
                        edge_threshold=edge_threshold, 
                        border_width=border_width,
                        deblock_strength=deblock_strength,
                        deblock_threshold=deblock_threshold
                    ),
                    dtype=np.uint8
                )
            else:
                output = np.ascontiguousarray(output, dtype=np.uint8)
                
            return output, size, compressed_data, entropy_model

        # No need to read from the file we just created - just use the data we already have
        decompressed_data = np.ascontiguousarray(dct_matrices, dtype=dct_datatype)
    else:
        # If file generation is disabled, just use the matrices we have
        decompressed_data = np.ascontiguousarray(dct_matrices, dtype=dct_datatype)
    
    # Perform IDCT 
    output = np.ascontiguousarray(
        np.transpose(image_codec.idct_vectorized(decompressed_data, k), 
                    (0, 2, 1, 3)).reshape(h, w),
        dtype=np.uint8
    )
    
    if EN_OUTPUT_FILTER:
        output = np.ascontiguousarray(
            image_codec.combined_deringing_deblocking(
                output, 
                sigma_spatial=sigma_spatial, 
                sigma_intensity=sigma_intensity,
                edge_threshold=edge_threshold, 
                border_width=border_width,
                deblock_strength=deblock_strength,
                deblock_threshold=deblock_threshold
            ),
            dtype=np.uint8
        )
    else:
        output = np.ascontiguousarray(output, dtype=np.uint8)

    return output, size, compressed_data, entropy_model

# Opens and formats image
def process_color_image(image_path, k=1, resolution=512, 
                        sigma_spatial=1.5, sigma_intensity=25, 
                        edge_threshold=30, border_width=1,
                        deblock_strength=4, deblock_threshold=8):
    """
    Process a color image, compressing all channels into a single file.
    """
    try:
        # Read and prepare image
        img = Image.open(image_path)
        img_array = np.array(img)
        
        # Remove alpha channel if present
        if len(img_array.shape) == 3 and img_array.shape[2] == 4:
            img_array = img_array[:, :, :3]
            
        # Ensure img_array is contiguous and in the right format
        img_array = np.ascontiguousarray(img_array, dtype=np.uint8)
        
        start_time = time.time()

        print(f"Input Image Shape: {img_array.shape}")
    
        # Resize image - make sure the output is contiguous
        img_array = np.ascontiguousarray(image_codec.resize_image(img_array, resolution), dtype=np.uint8)
    
        original_size = img_array.nbytes / 1024
    
        # Convert to YCrCb - use temporary variables to avoid type issues
        R = np.ascontiguousarray(img_array[:, :, 0], dtype=ycrcb_datatype)
        G = np.ascontiguousarray(img_array[:, :, 1], dtype=ycrcb_datatype)
        B = np.ascontiguousarray(img_array[:, :, 2], dtype=ycrcb_datatype)
        
        # Convert to YCrCb
        Y, Cr, Cb = image_codec.rgb2ycrcb(R, G, B)
        
        # Ensure Y, Cr, Cb are contiguous and have the right types
        Y = np.ascontiguousarray(Y, dtype=np.uint8)
        Cr = np.ascontiguousarray(Cr, dtype=np.uint8)
        Cb = np.ascontiguousarray(Cb, dtype=np.uint8)
    
        # Perform chroma subsampling
        if EN_SUBSAMPLE:
            Cr_subsampled = np.ascontiguousarray(image_codec.chroma_subsample(Cr), dtype=np.uint8)
            Cb_subsampled = np.ascontiguousarray(image_codec.chroma_subsample(Cb), dtype=np.uint8)
            print(f"Original Cr shape: {Cr.shape}, Subsampled Cr shape: {Cr_subsampled.shape}")
            print(f"Original Cb shape: {Cb.shape}, Subsampled Cb shape: {Cb_subsampled.shape}")
        else:
            Cr_subsampled = np.ascontiguousarray(Cr, dtype=np.uint8)
            Cb_subsampled = np.ascontiguousarray(Cb, dtype=np.uint8)
            
        # Process each channel
        if k == 0:
            Y_k = 0.125
            Y_qs = 0
            C_k = 0.25
            C_qs = 1
        else:
            # For all other k values
            Y_k = k * 2
            Y_qs = int(np.log2(k / 0.125)) + 1
            C_k = Y_k * 2
            C_qs = Y_qs + 1
        
        # Process individual channels
        print(f"Processing Y Channel...")
        Y_processed, Y_size, Y_compressed, Y_model = process_channel_core(
                Y, Y_k, Y_qs, None, "Y_channel.hex", "Y", 
                sigma_spatial, sigma_intensity, edge_threshold, border_width,
                deblock_strength, deblock_threshold)
        
        print(f"Processing Cr Channel...")
        Cr_processed, Cr_size, Cr_compressed, Cr_model = process_channel_core(
            Cr_subsampled, C_k, C_qs, None, "Cr_channel.hex", "Cr",
            sigma_spatial, sigma_intensity, edge_threshold, border_width,
            deblock_strength, deblock_threshold)
        
        print(f"Processing Cb Channel...")
        Cb_processed, Cb_size, Cb_compressed, Cb_model = process_channel_core(
            Cb_subsampled, C_k, C_qs, None, "Cb_channel.hex", "Cb", 
            sigma_spatial, sigma_intensity, edge_threshold, border_width,
            deblock_strength, deblock_threshold)
    
        # Calculate total compressed size
        compressed_size = Y_size + Cr_size + Cb_size
        
        # Only try to save all channels if we've enabled file generation
        if EN_FILE_GEN:
            # Write all channels to a single file
            try:
                image_file, all_channels_size = tile_compressorV2.save_channels(
                    Y_compressed, Y_model, 
                    Cr_compressed, Cr_model, 
                    Cb_compressed, Cb_model, 
                    'compressed_image.hex'
                )
                # Update compressed size with the actual file size
                compressed_size = all_channels_size
            except Exception as e:
                print(f"Warning: Failed to save all channels to file: {e}")
                # Continue with the individual channel sizes
                pass
    
        # Convert back to RGB
        if EN_SUBSAMPLE:
            Cr_upsampled = np.ascontiguousarray(
                image_codec.chroma_upsample(Cr_processed, Y_processed.shape[0], Y_processed.shape[1]), 
                dtype=np.uint8
            )
            Cb_upsampled = np.ascontiguousarray(
                image_codec.chroma_upsample(Cb_processed, Y_processed.shape[0], Y_processed.shape[1]), 
                dtype=np.uint8
            )
        else:
            Cr_upsampled = np.ascontiguousarray(Cr_processed, dtype=np.uint8)
            Cb_upsampled = np.ascontiguousarray(Cb_processed, dtype=np.uint8)
    
        # Ensure all channels are uint8 and contiguous before merging
        Y_processed = np.ascontiguousarray(Y_processed, dtype=np.uint8)
        Cr_upsampled = np.ascontiguousarray(Cr_upsampled, dtype=np.uint8)
        Cb_upsampled = np.ascontiguousarray(Cb_upsampled, dtype=np.uint8)
        
        try:
            # Method 1: Use OpenCV merge (try this first)
            channels = [Y_processed, Cr_upsampled, Cb_upsampled]
            # Check that all channels have the same shape
            if not all(ch.shape == channels[0].shape for ch in channels):
                print("Warning: Channel shapes don't match")
                print(f"Y shape: {Y_processed.shape}")
                print(f"Cr shape: {Cr_upsampled.shape}")
                print(f"Cb shape: {Cb_upsampled.shape}")
                # Resize channels to match if needed
                h, w = Y_processed.shape
                Cr_upsampled = cv2.resize(Cr_upsampled, (w, h))
                Cb_upsampled = cv2.resize(Cb_upsampled, (w, h))
                
            imgprocessed = cv2.merge([Y_processed, Cr_upsampled, Cb_upsampled])
        except Exception as e:
            print(f"Merge failed: {e}, trying alternative method")
            # Method 2: Create a new array and assign channel values (fallback)
            h, w = Y_processed.shape
            imgprocessed = np.zeros((h, w, 3), dtype=np.uint8)
            imgprocessed[:,:,0] = Y_processed
            imgprocessed[:,:,1] = Cr_upsampled
            imgprocessed[:,:,2] = Cb_upsampled
    
        # Convert to RGB
        try:
            imgRGB = cv2.cvtColor(imgprocessed, cv2.COLOR_YCrCb2RGB)
        except Exception as e:
            print(f"Color conversion failed: {e}")
            # If conversion fails, create a grayscale RGB image from Y channel (fallback)
            h, w = Y_processed.shape
            imgRGB = np.zeros((h, w, 3), dtype=np.uint8)
            imgRGB[:,:,0] = Y_processed
            imgRGB[:,:,1] = Y_processed
            imgRGB[:,:,2] = Y_processed
        
        # Ensure RGB output is contiguous
        imgRGB = np.ascontiguousarray(imgRGB, dtype=np.uint8)
    
        # Calculate statistics
        compression_ratio = 100 * (1 - (compressed_size / original_size))
        end_time = time.time()
        print(f"\nProcessing time (ms): {1000 * (end_time - start_time):.2f}")
    
        # Try to load JPEG comparison if available
        try:
            imgjpg = Image.open("2048.png").convert("RGB")
            imgjpg_array = np.ascontiguousarray(np.array(imgjpg), dtype=np.uint8)
            # Resize to match our processed image
            imgjpg_array = np.ascontiguousarray(
                image_codec.resize_image(imgjpg_array, resolution), 
                dtype=np.uint8
            )
            
            return (img_array, imgRGB, Y_processed, Cr_upsampled, Cb_upsampled,
                    quality_statistics.calculate_psnr(imgjpg_array, imgRGB),
                    quality_statistics.calculate_msssim(imgjpg_array, imgRGB),
                    original_size, compressed_size, compression_ratio)
        except Exception as e:
            print(f"Warning: Could not load JPEG for comparison: {e}")
            # Use original image for comparison metrics if JPEG not available
            return (img_array, imgRGB, Y_processed, Cr_upsampled, Cb_upsampled,
                    quality_statistics.calculate_psnr(img_array, imgRGB),
                    quality_statistics.calculate_msssim(img_array, imgRGB),
                    original_size, compressed_size, compression_ratio)
                    
    except Exception as e:
        print(f"Error in process_color_image: {e}")
        import traceback
        traceback.print_exc()  # Add detailed error info
        
        # Return default values to prevent UI crash
        # Create blank placeholders with requested resolution
        blank = np.zeros((resolution, resolution, 3), dtype=np.uint8)
        blank_channel = np.zeros((resolution, resolution), dtype=np.uint8)
        return (blank, blank, blank_channel, blank_channel, blank_channel, 0, 0, 0, 0, 0)

# Creates processing thread 
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
                # Process the image with all parameters
                result = process_color_image(
                    image_path, 
                    current_task.k, 
                    current_task.resolution, 
                    current_task.sigma_spatial,
                    current_task.sigma_intensity,
                    current_task.edge_threshold,
                    current_task.border_width,
                    current_task.deblock_strength,
                    current_task.deblock_threshold
                )
                # Store the result and trigger display update
                current_images = result
                current_task = None
                display_needs_update = True
            else:
                time.sleep(0.01)
        except queue.Empty:
            time.sleep(0.01)
        except Exception as e:
            print(f"Error in processing thread: {e}")
            current_task = None
            time.sleep(0.01)

# Create Display
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
    
    # Add trackbars for bilateral filter parameters
    cv2.createTrackbar('Spatial Sigma', WINDOW_CONTROLS, 2, len(sigma_spatial_values) - 1, on_trackbar_change)
    cv2.createTrackbar('Intensity Sigma', WINDOW_CONTROLS, 4, len(sigma_intensity_values) - 1, on_trackbar_change)
    cv2.createTrackbar('Edge Threshold', WINDOW_CONTROLS, 2, len(edge_threshold_values) - 1, on_trackbar_change)
    cv2.createTrackbar('Border Width', WINDOW_CONTROLS, 0, len(border_width_values) - 1, on_trackbar_change)
    
    # Add new trackbars for deblocking filter
    cv2.createTrackbar('Deblock Strength', WINDOW_CONTROLS, 3, len(deblock_strength_values) - 1, on_trackbar_change)
    cv2.createTrackbar('Deblock Threshold', WINDOW_CONTROLS, 3, len(deblock_threshold_values) - 1, on_trackbar_change)

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
    print("- Adjust 'Spatial Sigma' to control the spatial extent of the bilateral filter")
    print("- Adjust 'Intensity Sigma' to control how much intensity differences are preserved")
    print("- Adjust 'Edge Threshold' slider to control sensitivity of edge detection")
    print("- Adjust 'Border Width' slider to control width of block boundary smoothing")
    print("- Adjust 'Deblock Strength' slider to control strength of deblocking filter (higher = stronger)")
    print("- Adjust 'Deblock Threshold' slider to control deblocking threshold (lower = more aggressive)")

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


class ProcessingTask:
    def __init__(self, k, resolution, sigma_spatial, sigma_intensity, 
                 edge_threshold, border_width, deblock_strength, deblock_threshold):
        self.k = k
        self.resolution = resolution
        self.sigma_spatial = sigma_spatial
        self.sigma_intensity = sigma_intensity
        self.edge_threshold = edge_threshold
        self.border_width = border_width
        self.deblock_strength = deblock_strength
        self.deblock_threshold = deblock_threshold
        self.timestamp = time.time()


def bgr_to_rgb(image):
    """Convert BGR to RGB"""
    return cv2.cvtColor(image, cv2.COLOR_BGR2RGB)


def rgb_to_bgr(image):
    """Convert RGB to BGR for display"""
    return cv2.cvtColor(image, cv2.COLOR_RGB2BGR)


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
    sigma_spatial = sigma_spatial_values[cv2.getTrackbarPos('Spatial Sigma', 'Controls')]
    sigma_intensity = sigma_intensity_values[cv2.getTrackbarPos('Intensity Sigma', 'Controls')]
    edge_threshold = edge_threshold_values[cv2.getTrackbarPos('Edge Threshold', 'Controls')]
    border_width = border_width_values[cv2.getTrackbarPos('Border Width', 'Controls')]
    deblock_strength = deblock_strength_values[cv2.getTrackbarPos('Deblock Strength', 'Controls')]
    deblock_threshold = deblock_threshold_values[cv2.getTrackbarPos('Deblock Threshold', 'Controls')]

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
    metrics_text3 = f'Edge: {edge_threshold} | Border: {border_width}px | Spatial σ: {sigma_spatial} | Intensity σ: {sigma_intensity}'
    metrics_text4 = f'Deblock Strength: {deblock_strength} | Threshold: {deblock_threshold}'

    add_text_with_constant_size(original_display, f'Original ({resolution}x{resolution})', (10, 30))
    add_text_with_constant_size(processed_display, f'k={k:.3f} | {metrics_text}', (10, 30))
    add_text_with_constant_size(processed_display, metrics_text2, (10, 70))
    add_text_with_constant_size(processed_display, metrics_text3, (10, 110))
    add_text_with_constant_size(processed_display, metrics_text4, (10, 150))  # Add deblocking info

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
    sigma_spatial = sigma_spatial_values[cv2.getTrackbarPos('Spatial Sigma', WINDOW_CONTROLS)]
    sigma_intensity = sigma_intensity_values[cv2.getTrackbarPos('Intensity Sigma', WINDOW_CONTROLS)]
    edge_threshold = edge_threshold_values[cv2.getTrackbarPos('Edge Threshold', WINDOW_CONTROLS)]
    border_width = border_width_values[cv2.getTrackbarPos('Border Width', WINDOW_CONTROLS)]
    deblock_strength = deblock_strength_values[cv2.getTrackbarPos('Deblock Strength', WINDOW_CONTROLS)]
    deblock_threshold = deblock_threshold_values[cv2.getTrackbarPos('Deblock Threshold', WINDOW_CONTROLS)]

    # Queue the new processing task with all parameters
    processing_queue.put(ProcessingTask(k, resolution, sigma_spatial, sigma_intensity, 
                                        edge_threshold, border_width,
                                        deblock_strength, deblock_threshold))

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


if __name__ == "__main__":
    create_interactive_display(image_path)
    '''img = Image.open(image_path).convert("RGB")
    img_array = np.array(img)
    img_array = resize_image(img_array, 2048)
    original_size = img_array.nbytes / 1024

    imgjpg = Image.open("2048_70.jpg")
    imgjpg_array = np.array(imgjpg)
    imgjpg_array = resize_image(imgjpg_array, 2048)
    original_size_jpg = imgjpg_array.nbytes / 1024

    psrn = quality_statistics.calculate_psnr(imgjpg_array, img_array)
    msssim = quality_statistics.calculate_msssim(imgjpg_array, img_array)

    print(f"Original Size: {original_size:.2f} KB")
    print(f"PSNR: {psrn:.2f} dB")
    print(f"MS-SSIM: {msssim:.4f}")'''