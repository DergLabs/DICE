import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
from matplotlib.widgets import TextBox
import matplotlib.gridspec as gridspec
import cv2
from USB_FTX232H_FT60X import USB_FTX232H_FT60X_sync245mode
import time
import huffman_encoder
import quality_statistics

DEBUG = True
IMG_DIM = 64
IMG_SIZE = 2048 # Size of image
TILE_SIZE = 16 # Size of the tiles that input 2048x2048 image will be split into
BLOCK_SIZE = 8 # Size of 8x8 DCT Blocks
image_path = "img5.jpg"  # Replace with your image path
X_DIM = int(TILE_SIZE/BLOCK_SIZE)
Y_DIM = int(TILE_SIZE/BLOCK_SIZE)
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
    # Calculate dimensions
    h, w = image.shape
    TILE_SIZE_LOC = TILE_SIZE
    n_tiles_h = h // TILE_SIZE_LOC
    n_tiles_w = w // TILE_SIZE_LOC

    # Reshape directly to tiles using a single operation
    # Reshape to (n_tiles_h, TILE_SIZE, n_tiles_w, TILE_SIZE) then transpose to get desired order
    tiled_image = image.reshape(n_tiles_h, TILE_SIZE_LOC, n_tiles_w, TILE_SIZE_LOC).transpose(0, 2, 1, 3)

    return tiled_image


def decode_image_array(image):
    # Convert global variables to local for improved loop performance
    BLOCK_SIZE_LOC = BLOCK_SIZE
    X_LOC = X_DIM
    Y_LOC = Y_DIM
    TILE_SIZE_LOC = TILE_SIZE

    # Reshape input to blocks
    tile_blocks = image.reshape(X_LOC, Y_LOC, BLOCK_SIZE_LOC, BLOCK_SIZE_LOC)

    # Process all blocks at once
    idct_output = idct_vectorized(tile_blocks)

    # Reshape to final image
    final_image = idct_output.transpose(0, 2, 1, 3).reshape(TILE_SIZE_LOC, TILE_SIZE_LOC).astype(np.uint8)

    return final_image


def encode_image_array(image_blocks):
    # Convert global variables to local for improved loop performance
    BLOCK_SIZE_LOC = BLOCK_SIZE
    # Calculate dimensions
    n_blocks_x, n_blocks_y = image_blocks.shape[0:2]

    # Reshape directly to blocks
    blocks = image_blocks.reshape(n_blocks_x, n_blocks_y,
                                image_blocks.shape[2] // BLOCK_SIZE_LOC, BLOCK_SIZE_LOC,
                                image_blocks.shape[3] // BLOCK_SIZE_LOC, BLOCK_SIZE_LOC)

    # Rearrange dimensions to get blocks in correct order and transpose each 8x8 block
    # The last two dimensions (3, 5) represent the rows and columns of each 8x8 block
    # By swapping them in the transpose operation, we transpose each 8x8 block
    blocks = blocks.transpose(0, 1, 2, 4, 5, 3)

    # Flatten the block dimensions
    flattened = blocks.reshape(n_blocks_x, n_blocks_y, 1, -1)

    return flattened


def process_channels_combined(usb, Y, Cr, Cb, k=1):
    # Convert Global variables to local scope, slightly improves loop performance
    IMG_SIZE_LOC = IMG_SIZE
    TILE_SIZE_LOC = TILE_SIZE

    # Convert 2048x2048 channel arrays to 32x32 array of 64x64 pixel blocks
    Y_tiles = generate_tiles(Y)
    Cr_tiles = generate_tiles(Cr)
    Cb_tiles = generate_tiles(Cb)

    # For each tile, encode into 32x32 array of 1x4096 hex strings
    Y_output = np.zeros_like(Y_tiles, dtype=np.uint8)
    Cr_output = np.zeros_like(Cr_tiles, dtype=np.uint8)
    Cb_output = np.zeros_like(Cb_tiles, dtype=np.uint8)

    Y_returned = np.zeros((IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, TILE_SIZE_LOC * TILE_SIZE_LOC), dtype=np.int8)
    Cr_returned = np.zeros((IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, TILE_SIZE_LOC * TILE_SIZE_LOC), dtype=np.int8)
    Cb_returned = np.zeros((IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, TILE_SIZE_LOC * TILE_SIZE_LOC), dtype=np.int8)

    print("Formatting...")
    Y_formatted = encode_image_array(Y_tiles)
    Cr_formatted = encode_image_array(Cr_tiles)
    Cb_formatted = encode_image_array(Cb_tiles)


    temp_array = np.zeros(TILE_SIZE_LOC * TILE_SIZE_LOC * 4, dtype=np.uint8)
    tile_size_sq = TILE_SIZE_LOC * TILE_SIZE_LOC

    # Calculate dimensions
    n_tiles_y, n_tiles_x = Y_output.shape[0:2]

    print("Encoding...")
    img_byte_array = np.zeros((IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, TILE_SIZE_LOC * TILE_SIZE_LOC * 4), dtype=np.uint8)
    # Encode tiles as byte arrays
    img_byte_array[:, :, 0::4] = Cr_formatted.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1)
    img_byte_array[:, :, 1::4] = Y_formatted.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1)
    img_byte_array[:, :, 2::4] = Cb_formatted.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1)


    print("Sending...")
    start_time = time.time()
    total_bytes_sent = 0

    for row in range(Y_tiles.shape[0]):
        current_time = time.time()
        elapsed_time = current_time - start_time
        data_rate = (total_bytes_sent / (1024)) / elapsed_time if elapsed_time > 0 else 0
        print(f"\rProcessing Row {row}/{len(Y_tiles)} | Data Rate: {data_rate:.2f}KB/s", end="", flush=True)
        for col in range(Y_tiles.shape[1]):
            # send data
            #txlen = usb.send(bytes(bytearray(temp_array)))
            txlen = usb.send(bytes(bytearray(img_byte_array[row][col])))
            total_bytes_sent += txlen

            #data_in_temp = usb.recv(txlen)
            data_array = np.frombuffer(usb.recv(txlen), dtype=np.uint8)

            Y_returned[row][col] = data_array.astype(np.int8)[::4][:tile_size_sq]
            Cr_returned[row][col] = data_array.astype(np.int8)[3::4][:tile_size_sq]
            Cb_returned[row][col] = data_array.astype(np.int8)[1::4][:tile_size_sq]


    print("\nDecoding...")
    Y_all = Y_returned.reshape(-1, TILE_SIZE_LOC * TILE_SIZE_LOC)  # Flatten all tiles into 2D array
    Cr_all = Cr_returned.reshape(-1, TILE_SIZE_LOC * TILE_SIZE_LOC)
    Cb_all = Cb_returned.reshape(-1, TILE_SIZE_LOC * TILE_SIZE_LOC)

    _, Y_size = huffman_encoder.huffman_encode(Y_returned)
    _, Cr_size = huffman_encoder.huffman_encode(Cr_returned)
    _, Cb_size = huffman_encoder.huffman_encode(Cb_returned)

    # Process all tiles at once
    Y_output = np.array([decode_image_array(tile) for tile in Y_all])
    Cr_output = np.array([decode_image_array(tile) for tile in Cr_all])
    Cb_output = np.array([decode_image_array(tile) for tile in Cb_all])

    # Reshape back to original tile structure
    Y_output = Y_output.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, TILE_SIZE_LOC, TILE_SIZE_LOC)
    Cr_output = Cr_output.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, TILE_SIZE_LOC, TILE_SIZE_LOC)
    Cb_output = Cb_output.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, TILE_SIZE_LOC, TILE_SIZE_LOC)

    end_time = time.time()

    print("Packaging Tiles...")
    # Reshape Y_output to intermediate form and transpose to correct layout
    Y_final = Y_output.transpose(0, 2, 1, 3).reshape(n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC)
    Cr_final = Cr_output.transpose(0, 2, 1, 3).reshape(n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC)
    Cb_final = Cb_output.transpose(0, 2, 1, 3).reshape(n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC)

    print("\nDone...")
    print(f"\nTotal Time Taken: {end_time - start_time:.2f}s")

    return Y_final, Cr_final, Cb_final, Y_size, Cr_size, Cb_size


def resize_image(image):
    """
    Process image in two steps:
    1. Crop to square from center using smallest dimension
    2. Resize square image to IMG_SIZE x IMG_SIZE
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
    return cv2.resize(cropped, (IMG_SIZE, IMG_SIZE))


def process_color_image(usb, image_path, k=1):
    # Read color image
    img = Image.open(image_path)
    img_array = np.array(img)
    #print(f"Image Shape: {img_array.shape}")
    # Pad image to multiple of 64
    img_array = resize_image(img_array)
    #img_array = cv2.subtract(img_array, 1)
    #print(f"Image Shape: {img_array.shape}")

    R = img_array[:, :, 0]
    G = img_array[:, :, 1]
    B = img_array[:, :, 2]

    # RGB to YCrCb
    '''imgYCC = cv2.cvtColor(img_array, cv2.COLOR_RGB2YCrCb)
    Y = imgYCC[:, :, 0]
    Cr = imgYCC[:, :, 1]
    Cb = imgYCC[:, :, 2]'''

    # Process channels
    Y_processed, Cr_processed, Cb_processed, Y_size, Cr_size, Cb_size = process_channels_combined(usb, R, G, B, k)

    # Get image size stats
    original_size = img_array.nbytes
    compressed_size = Y_size + Cr_size + Cb_size
    compression_ratio = 100 * (1 - (compressed_size / original_size))

    # YCrCb to RGB
    #Y_processed = Y_processed - 10
    imgprocessed = cv2.merge([Y_processed, Cr_processed, Cb_processed])
    imgRGB = cv2.cvtColor(imgprocessed, cv2.COLOR_YCrCb2RGB)

    # Get PSNR and MS-SSIM from reconstructed Image
    PSNR = quality_statistics.calculate_psnr(img_array, imgRGB)
    MSSSIM = quality_statistics.calculate_msssim(img_array, imgRGB)

    return img_array, imgRGB, Y_processed, Cr_processed, Cb_processed, PSNR, MSSSIM, original_size, compressed_size, compression_ratio


def create_interactive_display(image_path, usb):
    fig = plt.figure(figsize=(15, 12))
    gs = gridspec.GridSpec(4, 3, height_ratios=[1, 1, 0.2, 0.1])

    # Initial processing with k=1
    (original, processed, y_channel, cr_channel, cb_channel,
     psnr, msssim, orig_size, comp_size, comp_ratio) = process_color_image(usb, image_path, k=1)

    # Create subplots
    ax_orig = plt.subplot(gs[0, 0])
    ax_proc = plt.subplot(gs[1, 0])
    ax_y = plt.subplot(gs[0, 1])
    ax_cr = plt.subplot(gs[0, 2])
    ax_cb = plt.subplot(gs[1, 1])
    ax_metrics = plt.subplot(gs[2, :])
    ax_text = plt.subplot(gs[3, :])

    # Initial plots
    img_orig = ax_orig.imshow(original)
    img_proc = ax_proc.imshow(processed)
    img_y = ax_y.imshow(y_channel, cmap='gray')
    img_cr = ax_cr.imshow(cr_channel, cmap='RdYlBu')
    img_cb = ax_cb.imshow(cb_channel, cmap='RdYlBu')

    # Set titles and remove axes
    ax_orig.set_title('Original Image')
    ax_proc.set_title('Processed Image')
    ax_y.set_title('Y Channel')
    ax_cr.set_title('Cr Channel')
    ax_cb.set_title('Cb Channel')

    for ax in [ax_orig, ax_proc, ax_y, ax_cr, ax_cb]:
        ax.axis('off')

    # Initialize metrics display with compression info
    ax_metrics.axis('off')
    metrics_text = ax_metrics.text(0.5, 0.5,
                                   f'PSNR: {psnr:.2f} dB\n'
                                   f'MS-SSIM: {msssim:.4f}\n'
                                   f'Original Size: {orig_size / 1024:.2f} KB\n'
                                   f'Compressed Size: {comp_size / 1024:.2f} KB\n'
                                   f'Compression Ratio: {comp_ratio:.2f}%',
                                   horizontalalignment='center',
                                   verticalalignment='center',
                                   fontsize=12)

    # Remove axes from text box area but keep the space
    ax_text.axis('off')

    plt.tight_layout()
    plt.show()


if __name__ == "__main__":
    usb = USB_FTX232H_FT60X_sync245mode(device_to_open_list=
                                        (('FTX232H', 'USB <-> Serial Converter'),
                                         # firstly try to open FTX232H (FT232H or FT2232H) device named 'USB <-> Serial Converter'. Note that 'USB <-> Serial Converter' is the default name of FT232H or FT2232H chip unless the user has modified it. If the chip's name has been modified, you can use FT_Prog software to look up it.
                                         ('FT60X', 'FTDI SuperSpeed-FIFO Bridge'))
                                        # secondly try to open FT60X (FT600 or FT601) device named 'FTDI SuperSpeed-FIFO Bridge'. Note that 'FTDI SuperSpeed-FIFO Bridge' is the default name of FT600 or FT601 chip unless the user has modified it.
                                        )

    create_interactive_display(image_path, usb)


    #process_color_image(usb, image_path)

    #data_test(usb)


    usb.close()