import numpy as np
import matplotlib.pyplot as plt
import matplotlib.gridspec as gridspec
import cv2

# Local Libraries
from USB_FTX232H_FT60X import USB_FTX232H_FT60X_sync245mode
import time
import huffman_encoder
import quality_statistics
import image_codec

DEBUG = False
DISP_STATS = False
IMG_SIZE = 2048 # Size of image
TILE_SIZE = 16 # Size of the tiles that input 2048x2048 image will be split into
BLOCK_SIZE = 8 # Size of 8x8 DCT Blocks
N_BLOCKS = int(TILE_SIZE/BLOCK_SIZE)

image_path = "img10.jpg"  # Replace with your image path
np.set_printoptions(threshold=np.inf)


def process_image_channels(usb, R, G, B, Y, Cr, Cb):
    # Convert Global variables to local scope, slightly improves loop performance
    IMG_SIZE_LOC = IMG_SIZE # Total 2d Image size (eg 2048 for 2048x2048)
    TILE_SIZE_LOC = TILE_SIZE # Tile size in px (eg 16 for 16x16)
    BLOCK_SIZE_LOC = BLOCK_SIZE # DCT Block size (8 for 8x8)
    N_BLOCKS_LOC = N_BLOCKS # Number of Blocks in a tile (eg 2 for 16x16 tile with 8x8 blocks)

    # Convert 2048x2048 channel arrays to 32x32 array of 64x64 pixel blocks
    R_tiles = image_codec.generate_tiles(R, TILE_SIZE_LOC)
    G_tiles = image_codec.generate_tiles(G, TILE_SIZE_LOC)
    B_tiles = image_codec.generate_tiles(B, TILE_SIZE_LOC)

    Y_ref = image_codec.generate_tiles(Y, TILE_SIZE_LOC)
    Cr_ref = image_codec.generate_tiles(Cr, TILE_SIZE_LOC)
    Cb_ref = image_codec.generate_tiles(Cb, TILE_SIZE_LOC)

    # For each tile, encode into 32x32 array of 1x4096 hex strings
    Y_output = np.zeros_like(R_tiles, dtype=np.uint8)
    Cr_output = np.zeros_like(G_tiles, dtype=np.uint8)
    Cb_output = np.zeros_like(B_tiles, dtype=np.uint8)

    Y_returned = np.zeros((IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC,
                           TILE_SIZE_LOC * TILE_SIZE_LOC), dtype=np.int8)
    Cr_returned = np.zeros((IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC,
                            TILE_SIZE_LOC * TILE_SIZE_LOC), dtype=np.int8)
    Cb_returned = np.zeros((IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC,
                            TILE_SIZE_LOC * TILE_SIZE_LOC), dtype=np.int8)
    tile_id = np.zeros((IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC,
                        TILE_SIZE_LOC * TILE_SIZE_LOC), dtype=np.int32)

    print("Formatting...")
    R_formatted = image_codec.format_image_array(R_tiles, BLOCK_SIZE_LOC)
    G_formatted = image_codec.format_image_array(G_tiles, BLOCK_SIZE_LOC)
    B_formatted = image_codec.format_image_array(B_tiles, BLOCK_SIZE_LOC)


    # Calculate dimensions
    tile_size_sq = TILE_SIZE_LOC * TILE_SIZE_LOC
    n_tiles_y, n_tiles_x = Y_output.shape[0:2]

    print("Encoding...")
    img_byte_array = np.zeros((IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC,
                               TILE_SIZE_LOC * TILE_SIZE_LOC * 4), dtype=np.uint8)
    # Encode tiles as byte arrays
    img_byte_array[:, :, 0::4] = G_formatted.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1)
    img_byte_array[:, :, 1::4] = R_formatted.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1)
    img_byte_array[:, :, 2::4] = B_formatted.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1)


    print("Sending...")
    start_time = time.time()
    total_bytes_sent = 0

    for row in range(R_tiles.shape[0]):
        current_time = time.time()
        elapsed_time = current_time - start_time
        data_rate = (total_bytes_sent / (1024)) / elapsed_time if elapsed_time > 0 else 0
        print(f"\rProcessing Row {row}/{len(R_tiles)} | Data Rate: {data_rate:.2f}KB/s", end="", flush=True)
        for col in range(R_tiles.shape[1]):
            # send data
            txlen = usb.send(bytes(bytearray(img_byte_array[row][col])))
            total_bytes_sent += txlen

            # receive data
            received_data_array = np.frombuffer(usb.recv(txlen), dtype=np.uint8)

            # Extract bytes from received byte array
            Y_returned[row][col] = received_data_array.astype(np.int8)[::4][:tile_size_sq]
            Cr_returned[row][col] = received_data_array.astype(np.int8)[3::4][:tile_size_sq]
            Cb_returned[row][col] = received_data_array.astype(np.int8)[1::4][:tile_size_sq]
            tile_id[row][col] = received_data_array.astype(np.int8)[2::4][:tile_size_sq]


    print("\nDecoding...")
    # Reshape flat byte arrays to 2d arrays
    Y_all = Y_returned.reshape(-1, TILE_SIZE_LOC * TILE_SIZE_LOC)
    Cr_all = Cr_returned.reshape(-1, TILE_SIZE_LOC * TILE_SIZE_LOC)
    Cb_all = Cb_returned.reshape(-1, TILE_SIZE_LOC * TILE_SIZE_LOC)

    # Initialize arrays to store size (in bytes) for each tile
    tile_size_bytes = np.zeros((IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC))

    # Decode returned image tiles
    Y_output = np.array([image_codec.decode_image_array(tile, BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC) for tile in Y_all])
    Cr_output = np.array([image_codec.decode_image_array(tile, BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC) for tile in Cr_all])
    Cb_output = np.array([image_codec.decode_image_array(tile, BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC) for tile in Cb_all])

    # Reshape back to original 4d tile structure
    Y_output = Y_output.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, TILE_SIZE_LOC,
                                TILE_SIZE_LOC)
    Cr_output = Cr_output.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, TILE_SIZE_LOC,
                                  TILE_SIZE_LOC)
    Cb_output = Cb_output.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, TILE_SIZE_LOC,
                                  TILE_SIZE_LOC)

    # Modify final output image based on tile statistics
    # Replace tiles that meet statistics threshold with original input data for "lossless"
    total_size = 0
    compressed_blocks_size = 0
    uncompressed_blocks_size = 0
    compressed_block_count = 0
    uncompressed_block_count = 0

    MAX_BLUR_THRESHOLD = 15000
    MAX_GRADIENT_THRESHOLD = 2000
    MAX_GRADIENT_VAR_THRESHOLD = 9000

    for row in range(R_tiles.shape[0]):
        for col in range(R_tiles.shape[1]):
            # Get current tile ID data
            current_tile = tile_id[row][col]

            # Extract
            grad_var_lsb = current_tile[1]
            grad_var_msb = current_tile[2]

            grad_dev_lsb = current_tile[3]
            grad_dev_msb = current_tile[4]

            laplacian_var_lsb = current_tile[5]
            laplacian_var_msb = current_tile[6]

            # Combine LSB's and MSB's to create full 16b stats values
            gradient_variance = ((grad_var_msb & 0xFF) << 8) | (grad_var_lsb & 0xFF)
            gradient_std_dev = ((grad_dev_msb & 0xFF) << 8) | (grad_var_lsb & 0xFF)
            laplacian_variance = ((laplacian_var_msb & 0xFF) << 8) | (laplacian_var_lsb & 0xFF)

            if DISP_STATS:
                print(f"Laplacian Variance: {laplacian_variance} | "
                      f"Gradient Std Dev: {gradient_std_dev} | Gradient Variance: {gradient_variance}")


            if (laplacian_variance > MAX_BLUR_THRESHOLD or gradient_std_dev > MAX_GRADIENT_THRESHOLD or
                    gradient_variance > MAX_GRADIENT_VAR_THRESHOLD):

                # Replace pixel tile with original input pixels
                Y_output[row][col] = Y_ref[row][col]
                Cr_output[row][col] = Cr_ref[row][col]
                Cb_output[row][col] = Cb_ref[row][col]

                # Set all values for that tile ID to 1, used to indicate the tile is lossless
                tile_id[row][col].fill(1)

                # For replaced blocks, size is number of pixels * 3 bytes
                block_size = TILE_SIZE_LOC * TILE_SIZE_LOC * 3
                uncompressed_blocks_size += block_size
                tile_size_bytes[row][col] = block_size
                uncompressed_block_count += 1
            else:
                # For compressed blocks, calculate size using Huffman encoding
                _, y_block_size = huffman_encoder.huffman_encode(Y_returned[row:row + 1, col:col + 1])
                _, cr_block_size = huffman_encoder.huffman_encode(Cr_returned[row:row + 1, col:col + 1])
                _, cb_block_size = huffman_encoder.huffman_encode(Cb_returned[row:row + 1, col:col + 1])

                # Add the size for each channel
                block_size = y_block_size + cr_block_size + cb_block_size
                compressed_blocks_size += block_size
                tile_size_bytes[row][col] = block_size
                compressed_block_count += 1
                tile_id[row][col].fill(0)

            total_size += block_size

    end_time = time.time()

    print("Packaging Tiles...")
    # Reshape output arrays from 4d to 2d image arrays
    Y_final = Y_output.transpose(0, 2, 1, 3).reshape(n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC)
    Cr_final = Cr_output.transpose(0, 2, 1, 3).reshape(n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC)
    Cb_final = Cb_output.transpose(0, 2, 1, 3).reshape(n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC)

    print("\nDone...")
    print(f"\nTotal Time Taken: {end_time - start_time:.2f}s")

    size_stats = {
        'total_size': total_size,
        'compressed_size': compressed_blocks_size,
        'uncompressed_size': uncompressed_blocks_size,
        'compressed_blocks': compressed_block_count,
        'uncompressed_blocks': uncompressed_block_count
    }

    return Y_final, Cr_final, Cb_final, size_stats, tile_id


def process_color_image(image_path):
    # Read in image
    img = cv2.cvtColor(cv2.imread(image_path), cv2.COLOR_BGR2RGB)

    # Convert to 2d array
    img_array = np.array(img)

    # Resize image
    img_array = resize_image(img_array)

    # Generate 2d arrays for each color channel
    R = img_array[:, :, 0]
    G = img_array[:, :, 1]
    B = img_array[:, :, 2]
    img_array = cv2.merge((R, G, B))

    # Generate 2d arrays for each channel in Y Cr Cb, used for replacement when doing lossy/lossless check
    imgYCC = cv2.cvtColor(img_array, cv2.COLOR_RGB2YCrCb)
    Y = imgYCC[:, :, 0]
    Cr = imgYCC[:, :, 1]
    Cb = imgYCC[:, :, 2]

    # Create USB connection
    usb = USB_FTX232H_FT60X_sync245mode(device_to_open_list=
                                        (('FTX232H', 'USB <-> Serial Converter'),
                                         # firstly try to open FTX232H (FT232H or FT2232H) device named 'USB <-> Serial Converter'. Note that 'USB <-> Serial Converter' is the default name of FT232H or FT2232H chip unless the user has modified it. If the chip's name has been modified, you can use FT_Prog software to look up it.
                                         ('FT60X', 'FTDI SuperSpeed-FIFO Bridge'))
                                        # secondly try to open FT60X (FT600 or FT601) device named 'FTDI SuperSpeed-FIFO Bridge'. Note that 'FTDI SuperSpeed-FIFO Bridge' is the default name of FT600 or FT601 chip unless the user has modified it.
                                        )

    # Process channels
    Y_processed, Cr_processed, Cb_processed, size_stats, tile_id = process_image_channels(usb, R, G, B, Y, Cr, Cb)

    # Close USB connection
    usb.close()

    # Get input image size stats
    original_size = img_array.nbytes # ignores file format data, just gets raw size of pixel array
    compressed_size = size_stats['total_size']  # Use total_size from stats
    compression_ratio = 100 * (1 - (compressed_size / original_size))

    # Combine processed channels and convert to RGB
    imgProcessed = cv2.merge([Y_processed, Cr_processed, Cb_processed])
    imgRGB = cv2.cvtColor(imgProcessed, cv2.COLOR_YCrCb2RGB)

    # Get PSNR and MS-SSIM from reconstructed Image
    PSNR = quality_statistics.calculate_psnr(img_array, imgRGB)
    MSSSIM = quality_statistics.calculate_msssim(img_array, imgRGB)

    return (img_array, imgRGB, Y_processed, Cr_processed, Cb_processed,
            PSNR, MSSSIM, original_size, size_stats, compression_ratio, tile_id)


def resize_image(image):
    """
    Process image in two steps:
    1. Crop to square from center using the smallest dimension
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


def draw_tile_borders(image, tile_id, tile_size):
    # Create a copy of the image to avoid modifying original
    bordered_image = image.copy()

    # Get dimensions
    n_tiles_y = tile_id.shape[0]
    n_tiles_x = tile_id.shape[1]

    # Border color (red)
    border_color = [0, 0, 255]
    border_thickness = 2

    # Draw borders around modified tiles
    for y in range(n_tiles_y):
        for x in range(n_tiles_x):
            if not tile_id[y, x].all() == 0:
                # Calculate tile coordinates
                y_start = y * tile_size
                y_end = (y + 1) * tile_size
                x_start = x * tile_size
                x_end = (x + 1) * tile_size

                # Draw horizontal lines
                bordered_image[y_start:y_start + border_thickness, x_start:x_end] = border_color
                bordered_image[y_end - border_thickness:y_end, x_start:x_end] = border_color

                # Draw vertical lines
                bordered_image[y_start:y_end, x_start:x_start + border_thickness] = border_color
                bordered_image[y_start:y_end, x_end - border_thickness:x_end] = border_color

    return bordered_image


def create_interactive_display(image_path):
    # Create figure with adjusted size and spacing
    fig = plt.figure(figsize=(15, 12))

    # Adjust GridSpec to reduce vertical spacing and add padding at top
    gs = gridspec.GridSpec(5, 3,
                           height_ratios=[1, 1, 0.1, 0.15, 0.01],
                           hspace=0.3,
                           top=0.95,
                           bottom=0.05,
                           left=0.05,
                           right=0.95)

    # Process Image
    (original, processed, y_channel, cr_channel, cb_channel,
     psnr, msssim, orig_size, size_stats, comp_ratio, tile_id) = process_color_image(image_path)

    highlighted_image = draw_tile_borders(original, tile_id, TILE_SIZE)

    # Create subplots
    ax_orig = plt.subplot(gs[0, 0])
    ax_proc = plt.subplot(gs[1, 0])
    ax_y = plt.subplot(gs[0, 1])
    ax_highlighted = plt.subplot(gs[1, 1])
    ax_cr = plt.subplot(gs[0, 2])
    ax_cb = plt.subplot(gs[1, 2])
    ax_metrics = plt.subplot(gs[3, :])
    ax_text = plt.subplot(gs[4, :])

    # Initial plots
    img_orig = ax_orig.imshow(original)
    img_proc = ax_proc.imshow(processed)
    img_highlighted = ax_highlighted.imshow(highlighted_image)
    img_y = ax_y.imshow(y_channel, cmap='gray')
    img_cr = ax_cr.imshow(cr_channel, cmap='RdYlBu')
    img_cb = ax_cb.imshow(cb_channel, cmap='RdYlBu')

    # Set titles with padding
    ax_orig.set_title('Original Image', pad=10)
    ax_proc.set_title('Processed Image', pad=10)
    ax_y.set_title('Y Channel', pad=10)
    ax_highlighted.set_title('Modified Tiles Highlighted', pad=10)
    ax_cr.set_title('Cr Channel', pad=10)
    ax_cb.set_title('Cb Channel', pad=10)

    # Remove axes
    for ax in [ax_orig, ax_proc, ax_highlighted, ax_y, ax_cr, ax_cb]:
        ax.axis('off')

    # Initialize metrics display with additional size information
    ax_metrics.axis('off')
    metrics_text = ax_metrics.text(0.5, 0.5,
                                   f'PSNR: {psnr:.2f} dB\n'
                                   f'MS-SSIM: {msssim:.4f}\n'
                                   f'Original Size: {orig_size / 1024:.2f} KB\n'
                                   f'Total Compressed Size: {size_stats["total_size"] / 1024:.2f} KB\n'
                                   f'Compression Ratio: {comp_ratio:.2f}%\n'
                                   f'Compressed Blocks: {size_stats["compressed_blocks"]} ({size_stats["compressed_size"] / 1024:.2f} KB)\n'
                                   f'Uncompressed Blocks: {size_stats["uncompressed_blocks"]} ({size_stats["uncompressed_size"] / 1024:.2f} KB)',
                                   horizontalalignment='center',
                                   verticalalignment='center',
                                   fontsize=12)

    # Remove axes from text box area
    ax_text.axis('off')

    plt.show()


if __name__ == "__main__":
    create_interactive_display(image_path)

