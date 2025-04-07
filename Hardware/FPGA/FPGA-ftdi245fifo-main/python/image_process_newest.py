import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
from matplotlib.widgets import TextBox
import matplotlib.gridspec as gridspec
import cv2
from USB_FTX232H_FT60X import USB_FTX232H_FT60X_sync245mode
import time
from numba import njit

DEBUG = True
IMG_DIM = 64
IMG_SIZE = 2048 # Size of image
TILE_SIZE = 16 # Size of the tiles that input 2048x2048 image will be split into
BLOCK_SIZE = 8 # Size of 8x8 DCT Blocks
np.set_printoptions(threshold=np.inf)

# Magic matrices - don't touch!
T = np.array([
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 0, 0, 0, 0, -1, -1],
    [1, 1, -1, -1, -1, -1, 1, 1],
    [0, 0, -1, 0, 0, 1, 0, 0],
    [1, -1, -1, 1, 1, -1, -1, 1],
    [1, -1, 0, 0, 0, 0, 1, -1],
    [1, -1, 1, -1, -1, 1, -1, 1],
    [0, 0, 0, -1, 1, 0, 0, 0]
], dtype=np.float32)

Qd = np.array([
    [2, 2, 1, 4, 4, 8, 16, 32],
    [2, 4, 2, 8, 4, 16, 8, 16],
    [2, 2, 2, 8, 4, 8, 8, 16],
    [4, 8, 4, 16, 16, 32, 16, 32],
    [2, 4, 4, 16, 32, 16, 16, 16],
    [4, 8, 16, 16, 16, 32, 16, 32],
    [8, 8, 16, 32, 32, 32, 16, 32],
    [16, 32, 32, 32, 32, 32, 32, 32]
], dtype=np.int16)


def idct_vectorized(dct_blocks):
    # Dequantization - broadcasting handles multiple blocks
    Mdequantized = dct_blocks * Qd

    # Reshape to handle all blocks at once
    blocks_shape = Mdequantized.shape
    reshaped_blocks = Mdequantized.reshape(-1, 8, 8)

    # Vectorized matrix multiplication for all blocks
    temp = np.matmul(T.T, reshaped_blocks.transpose(0, 2, 1))
    final_out = np.matmul(temp, T)

    # Reshape back to original block structure
    final_out = final_out.transpose(0, 2, 1).reshape(blocks_shape)

    # Clip values
    return np.maximum(np.minimum(final_out, 255), 0)


def generate_tiles(image):
    '''# Split image into 4d array of 64x64 blocks
    strips = np.split(image, image.shape[0] // TILE_SIZE, axis=0)

    # For each strip, split along columns
    blocks = [np.split(strip, image.shape[1] // TILE_SIZE, axis=1) for strip in strips]

    # Convert to numpy array
    tiled_image = np.array(blocks)

    return tiled_image'''
    # Calculate dimensions
    h, w = image.shape
    n_tiles_h = h // TILE_SIZE
    n_tiles_w = w // TILE_SIZE

    # Reshape directly to tiles using a single operation
    # Reshape to (n_tiles_h, TILE_SIZE, n_tiles_w, TILE_SIZE) then transpose to get desired order
    tiled_image = image.reshape(n_tiles_h, TILE_SIZE, n_tiles_w, TILE_SIZE).transpose(0, 2, 1, 3)

    return tiled_image


def decode_image_array(image, BLOCK_SIZE):
    x = int(TILE_SIZE / BLOCK_SIZE)
    y = int(TILE_SIZE / BLOCK_SIZE)

    # Reshape input to blocks
    tile_blocks = image.reshape(x, y, BLOCK_SIZE, BLOCK_SIZE)

    # Process all blocks at once
    idct_output = idct_vectorized(tile_blocks)

    # Reshape to final image
    final_image = idct_output.transpose(0, 2, 1, 3).reshape(TILE_SIZE, TILE_SIZE).astype(np.uint8)

    return final_image


def encode_image_array_vectorized(image_blocks):
    # Calculate dimensions
    n_blocks_x, n_blocks_y = image_blocks.shape[0:2]

    # Reshape directly to blocks
    blocks = image_blocks.reshape(n_blocks_x, n_blocks_y,
                                image_blocks.shape[2] // BLOCK_SIZE, BLOCK_SIZE,
                                image_blocks.shape[3] // BLOCK_SIZE, BLOCK_SIZE)

    # Rearrange dimensions to get blocks in correct order and transpose each 8x8 block
    # The last two dimensions (3, 5) represent the rows and columns of each 8x8 block
    # By swapping them in the transpose operation, we transpose each 8x8 block
    blocks = blocks.transpose(0, 1, 2, 4, 5, 3)

    # Flatten the block dimensions
    flattened = blocks.reshape(n_blocks_x, n_blocks_y, 1, -1)

    return flattened



def process_channels_combined(usb, Y, Cr, Cb, k=1):
    # Convert 2048x2048 channel arrays to 32x32 array of 64x64 pixel blocks
    Y_tiles = generate_tiles(Y)
    Cr_tiles = generate_tiles(Cr)
    Cb_tiles = generate_tiles(Cb)

    # For each tile, encode into 32x32 array of 1x4096 hex strings
    Y_output = np.zeros_like(Y_tiles, dtype=np.uint8)
    Cr_output = np.zeros_like(Cr_tiles, dtype=np.uint8)
    Cb_output = np.zeros_like(Cb_tiles, dtype=np.uint8)


    print("Encoding...")
    Y_formatted = encode_image_array_vectorized(Y_tiles)
    Cr_formatted = encode_image_array_vectorized(Cr_tiles)
    Cb_formatted = encode_image_array_vectorized(Cb_tiles)


    temp_array = np.zeros(TILE_SIZE * TILE_SIZE * 4, dtype=np.uint8)
    tile_size_sq = TILE_SIZE * TILE_SIZE

    # Calculate dimensions
    n_tiles_y, n_tiles_x = Y_output.shape[0:2]

    print("Sending...")
    start_time = time.time()
    total_bytes_sent = 0
    for row in range(Y_tiles.shape[0]):

        current_time = time.time()
        elapsed_time = current_time - start_time
        data_rate = (total_bytes_sent / (1024)) / elapsed_time if elapsed_time > 0 else 0
        print(f"\rProcessing Row {row}/{len(Y_tiles)} | Data Rate: {data_rate:.2f}KB/s", end="", flush=True)

        for col in range(Y_tiles.shape[1]):

            # Convert to hex strings
            temp_array[0::4] = Cr_formatted[row, col][0]  # Every 4th element starting at index 0
            temp_array[1::4] = Y_formatted[row, col][0]  # Every 4th element starting at index 1
            temp_array[2::4] = Cb_formatted[row, col][0]  # Every 4th element starting at index 2

            # send data
            txlen = usb.send(bytes(bytearray(temp_array)))
            total_bytes_sent += txlen

            #data_in_temp = usb.recv(txlen)
            data_array = np.frombuffer(usb.recv(txlen), dtype=np.uint8)

            Y_output[row, col] = decode_image_array(data_array.astype(np.int8)[::4][:tile_size_sq], BLOCK_SIZE)
            Cr_output[row, col] = decode_image_array(data_array.astype(np.int8)[3::4][:tile_size_sq], BLOCK_SIZE)
            Cb_output[row, col] = decode_image_array(data_array.astype(np.int8)[1::4][:tile_size_sq], BLOCK_SIZE)


    # Reshape Y_output to intermediate form and transpose to correct layout
    Y_final = Y_output.transpose(0, 2, 1, 3).reshape(n_tiles_y * TILE_SIZE, n_tiles_x * TILE_SIZE)
    Cr_final = Cr_output.transpose(0, 2, 1, 3).reshape(n_tiles_y * TILE_SIZE, n_tiles_x * TILE_SIZE)
    Cb_final = Cb_output.transpose(0, 2, 1, 3).reshape(n_tiles_y * TILE_SIZE, n_tiles_x * TILE_SIZE)

    print("\nDone...")

    return Y_final, Cr_final, Cb_final


def resize_image(image):
    """Pad image dimensions to either 1024x1024 or 2048x2048 depending on input size"""
    h, w = image.shape[:2]  # Works for both 2D and 3D arrays

    ''''# Determine target size based on which is closer
    target_1024 = 1024
    target_2048 = 2048

    # Calculate differences from both target sizes
    diff_1024 = abs(h - target_1024) + abs(w - target_1024)
    diff_2048 = abs(h - target_2048) + abs(w - target_2048)

    # Choose target size based on which is closer
    target_size = target_1024 if diff_1024 < diff_2048 else target_2048'''

    # Resize image
    resized_image = cv2.resize(image, (IMG_SIZE, IMG_SIZE))

    return resized_image


def process_color_image(usb, image_path, k=1):
    # Read color image
    img = Image.open(image_path)
    img_array = np.array(img)
    #print(f"Image Shape: {img_array.shape}")
    # Pad image to multiple of 64
    img_array = resize_image(img_array)
    img_array = cv2.subtract(img_array, 1)
    #print(f"Image Shape: {img_array.shape}")

    # RGB to YCrCb
    imgYCC = cv2.cvtColor(img_array, cv2.COLOR_RGB2YCrCb)
    Y = imgYCC[:, :, 0]
    Cr = imgYCC[:, :, 1]
    Cb = imgYCC[:, :, 2]

    # Process channels
    Y_processed, Cr_processed, Cb_processed = process_channels_combined(usb, Y, Cr, Cb, k)

    # YCrCb to RGB
    imgprocessed = cv2.merge([Y_processed, Cr_processed, Cb_processed])
    imgRGB = cv2.cvtColor(imgprocessed, cv2.COLOR_YCrCb2RGB)

    return img_array, imgRGB, Y_processed, Cr_processed, Cb_processed


def create_interactive_display(image_path, usb):
    # Create figure with GridSpec for better control over subplot sizes
    fig = plt.figure(figsize=(15, 10))
    gs = gridspec.GridSpec(3, 3, height_ratios=[1, 1, 0.1])

    # Initial processing with k=1
    original, processed, Y_processed, Cr_processed, Cb_processed = process_color_image(usb, image_path, k=1)

    # Create subplots
    ax_orig = plt.subplot(gs[0, 0])
    ax_proc = plt.subplot(gs[1, 0])
    ax_y = plt.subplot(gs[0, 1])
    ax_cr = plt.subplot(gs[0, 2])
    ax_cb = plt.subplot(gs[1, 1])
    ax_text = plt.subplot(gs[2, :])  # Text box will span all columns

    # Initial plots
    img_orig = ax_orig.imshow(original)
    img_proc = ax_proc.imshow(processed)
    img_y = ax_y.imshow(Y_processed, cmap='gray')
    img_cr = ax_cr.imshow(Cr_processed, cmap='RdYlBu')
    img_cb = ax_cb.imshow(Cb_processed, cmap='RdYlBu')

    # Set titles and remove axes
    ax_orig.set_title('Original Image')
    ax_proc.set_title('Processed Image')
    ax_y.set_title('Y Channel')
    ax_cr.set_title('Cr Channel')
    ax_cb.set_title('Cb Channel')

    for ax in [ax_orig, ax_proc, ax_y, ax_cr, ax_cb]:
        ax.axis('off')

    # Remove axes from text box area but keep the space
    ax_text.axis('off')

    # Create text box
    text_box_ax = plt.axes([0.3, 0.05, 0.2, 0.03])  # [left, bottom, width, height]
    text_box = TextBox(text_box_ax, 'Quantization factor (k): ', initial='1')

    def update(text):
        try:
            k = float(text)
            if k <= 0:
                print("k must be positive")
                return

            # Process image with new k value
            print("Processing image with k =", k)
            _, processed_new, y_new, cr_new, cb_new = process_color_image(image_path, k)
            print("Done")

            # Update images
            img_proc.set_data(processed_new)
            img_y.set_data(y_new)
            img_cr.set_data(cr_new)
            img_cb.set_data(cb_new)

            # Redraw
            fig.canvas.draw_idle()

        except ValueError:
            print("Please enter a valid number")

    text_box.on_submit(update)

    plt.tight_layout()
    plt.show()


if __name__ == "__main__":
    image_path = "beach.jpg"  # Replace with your image path

    usb = USB_FTX232H_FT60X_sync245mode(device_to_open_list=
                                        (('FTX232H', 'USB <-> Serial Converter'),
                                         # firstly try to open FTX232H (FT232H or FT2232H) device named 'USB <-> Serial Converter'. Note that 'USB <-> Serial Converter' is the default name of FT232H or FT2232H chip unless the user has modified it. If the chip's name has been modified, you can use FT_Prog software to look up it.
                                         ('FT60X', 'FTDI SuperSpeed-FIFO Bridge'))
                                        # secondly try to open FT60X (FT600 or FT601) device named 'FTDI SuperSpeed-FIFO Bridge'. Note that 'FTDI SuperSpeed-FIFO Bridge' is the default name of FT600 or FT601 chip unless the user has modified it.
                                        )

    create_interactive_display(image_path, usb)

    #process_color_image(usb, image_path)

    usb.close()