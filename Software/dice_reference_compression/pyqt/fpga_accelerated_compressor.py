from cv2.typing import MatLike
import numpy as np
import cv2
from dataclasses import dataclass

# import matplotlib.pyplot as plt
# import matplotlib.gridspec as gridspec

# Local Libraries
from USB_FTX232H_FT60X import USB_FTX232H_FT60X_sync245mode
import time
import tile_compressor
import quality_statistics
import image_codec

DEBUG = False
DISP_STATS = False
EN_TILE_REPLACEMENT = False
EN_COMPRESSOR = True
IMG_SIZE = 1024  # Size of image
TILE_SIZE = 16  # Size of the tiles that input 2048x2048 image will be split into
BLOCK_SIZE = 8  # Size of 8x8 DCT Blocks
N_BLOCKS = int(TILE_SIZE / BLOCK_SIZE)

# image_path = "img5.jpg"  # Replace with your image path
np.set_printoptions(threshold=np.inf)


@dataclass
class SizeStats:
    total_size: float
    compressed_size: float
    uncompressed_size: int
    compressed_blocks: int
    uncompressed_blocks: int


@dataclass
class ImageChannels:
    Y_output: np.ndarray
    Cr_output: np.ndarray
    Cb_output: np.ndarray
    size_stats: SizeStats
    tid: np.ndarray


@dataclass
class ProcessedImageData:
    Y_processed: np.ndarray
    Cr_processed: np.ndarray
    Cb_processed: np.ndarray
    size_stats: SizeStats 
    tile_id: np.ndarray
    PSNR: float
    MSSSIM: float
    original_size: float
    compression_ratio: float
    img_array: np.ndarray
    imgRGB: np.ndarray


def process_image_channels(usb, R, G, B, Y, Cr, Cb) -> ImageChannels:
    # Convert Global variables to local scope, slightly improves loop performance
    IMG_SIZE_LOC = IMG_SIZE  # Total 2d Image size (eg 2048 for 2048x2048)
    TILE_SIZE_LOC = TILE_SIZE  # Tile size in px (eg 16 for 16x16)
    BLOCK_SIZE_LOC = BLOCK_SIZE  # DCT Block size (8 for 8x8)
    N_BLOCKS_LOC = (
        N_BLOCKS  # Number of Blocks in a tile (eg 2 for 16x16 tile with 8x8 blocks)
    )
    tile_size_sq = TILE_SIZE_LOC * TILE_SIZE_LOC
    n_tiles_y = IMG_SIZE_LOC // TILE_SIZE_LOC
    n_tiles_x = IMG_SIZE_LOC // TILE_SIZE_LOC
    channel_data = []

    # Reference tiles for lossless replacement
    Y_ref = image_codec.generate_tiles(Y, TILE_SIZE_LOC, n_tiles_x, n_tiles_y)
    Cr_ref = image_codec.generate_tiles(Cr, TILE_SIZE_LOC, n_tiles_x, n_tiles_y)
    Cb_ref = image_codec.generate_tiles(Cb, TILE_SIZE_LOC, n_tiles_x, n_tiles_y)

    Y_returned = np.zeros(
        (
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            TILE_SIZE_LOC * TILE_SIZE_LOC,
        ),
        dtype=np.int16,
    )
    Cr_returned = np.zeros(
        (
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            TILE_SIZE_LOC * TILE_SIZE_LOC,
        ),
        dtype=np.int16,
    )
    Cb_returned = np.zeros(
        (
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            TILE_SIZE_LOC * TILE_SIZE_LOC,
        ),
        dtype=np.int16,
    )

    tile_id = np.zeros(
        (
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            TILE_SIZE_LOC * TILE_SIZE_LOC,
        ),
        dtype=np.int16,
    )

    print("Formatting Image...")
    R_formatted = image_codec.format_image_array(
        image_codec.generate_tiles(R, TILE_SIZE_LOC, n_tiles_x, n_tiles_y),
        BLOCK_SIZE_LOC,
    )
    G_formatted = image_codec.format_image_array(
        image_codec.generate_tiles(G, TILE_SIZE_LOC, n_tiles_x, n_tiles_y),
        BLOCK_SIZE_LOC,
    )
    B_formatted = image_codec.format_image_array(
        image_codec.generate_tiles(B, TILE_SIZE_LOC, n_tiles_x, n_tiles_y),
        BLOCK_SIZE_LOC,
    )

    print("Encoding...")
    img_byte_array = np.zeros(
        (
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            TILE_SIZE_LOC * TILE_SIZE_LOC * 4,
        ),
        dtype=np.uint8,
    )
    # Encode tiles as byte arrays
    # Insert G every 4th byte startnig at index 0 (ie 0, 3, 7, 11 ...)
    img_byte_array[:, :, 0::4] = G_formatted.reshape(
        IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1
    )
    # Insert R every 4th byte starting at index 1 (ie 1, 5, 9, 13 ...)
    img_byte_array[:, :, 1::4] = R_formatted.reshape(
        IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1
    )
    # Insert B every 4th byte starting at index 2 (ie 2, 6, 10, 14 ...)
    img_byte_array[:, :, 2::4] = B_formatted.reshape(
        IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1
    )
    # Every 4th byte starting at index 3 (ie 3, 7, 11, 15 ...) is 0
    # Final Byte order: G, R, B, 0, G, R, B, 0
    # Sent as 16b chunks: RG, 0B, RG, 0B...

    print(f"Sending {len(img_byte_array[0][1])} bytes...")
    start_time = time.time()
    total_bytes_sent = 0

    for row in range(n_tiles_x):
        current_time = time.time()
        elapsed_time = current_time - start_time
        data_rate = (
            (total_bytes_sent / (1024)) / elapsed_time if elapsed_time > 0 else 0
        )
        print(
            f"\rProcessing Row {row}/{n_tiles_x} | Data Rate: {data_rate:.2f}KB/s | Bytes sent: {(total_bytes_sent) / 1024}KB",
            end="",
            flush=True,
        )

        for col in range(n_tiles_y):
            # send data
            txlen = usb.send(bytes(bytearray(img_byte_array[row][col])))
            total_bytes_sent += txlen
            # receive data
            # print(f"\nReceiving {txlen} bytes...")
            received_data_array = np.frombuffer(usb.recv(txlen), dtype=np.uint8)
            # Data recieved as 16bit chunks, bytes within the 16bit chunks are swapped

            # combine into 32-bit values with correct ordering:
            # - Swap each 16-bit chunk internally (byteswap)
            # - Place second chunk first, first chunk second
            combined_data = (
                received_data_array.view(np.uint16)[1::2].astype(np.uint32) << 16
            ) | received_data_array.view(np.uint16)[::2].astype(np.uint32)

            # Extract components and sign extend
            Cb_values = ((combined_data >> 22) & 0x3FF).astype(np.int16)
            Cb_values = np.where(Cb_values & 0x200, Cb_values | ~0x3FF, Cb_values)

            Cr_values = ((combined_data >> 12) & 0x3FF).astype(np.int16)
            Cr_values = np.where(Cr_values & 0x200, Cr_values | ~0x3FF, Cr_values)

            Y_values = (combined_data & 0xFFF).astype(np.int16)
            Y_values = np.where(Y_values & 0x800, Y_values | ~0xFFF, Y_values)

            # Assign the extracted values
            Y_returned[row][col] = Y_values[:tile_size_sq]
            Cr_returned[row][col] = Cr_values[:tile_size_sq]
            Cb_returned[row][col] = Cb_values[:tile_size_sq]

    print("\nDecoding...")
    # Reshape flat byte arrays to 2d arrays
    Y_all = Y_returned.reshape(-1, TILE_SIZE_LOC * TILE_SIZE_LOC)
    Cr_all = Cr_returned.reshape(-1, TILE_SIZE_LOC * TILE_SIZE_LOC)
    Cb_all = Cb_returned.reshape(-1, TILE_SIZE_LOC * TILE_SIZE_LOC)

    # create 4d arrays of quantization values for encoding
    Y4d = Y_all.reshape(n_tiles_y, n_tiles_x, TILE_SIZE_LOC, TILE_SIZE_LOC)
    Cr4d = Cr_all.reshape(n_tiles_y, n_tiles_x, TILE_SIZE_LOC, TILE_SIZE_LOC)
    Cb4d = Cb_all.reshape(n_tiles_y, n_tiles_x, TILE_SIZE_LOC, TILE_SIZE_LOC)

    # Decode returned image tiles
    Y_output = np.array(
        [
            image_codec.decode_image_array(
                tile, BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC, k=0.125
            )
            for tile in Y_all
        ]
    )
    Cr_output = np.array(
        [
            image_codec.decode_image_array(
                tile, BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC, k=0.5
            )
            for tile in Cr_all
        ]
    )
    Cb_output = np.array(
        [
            image_codec.decode_image_array(
                tile, BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC, k=0.5
            )
            for tile in Cb_all
        ]
    )

    # Reshape back to original 4d tile structure
    Y_output = Y_output.reshape(
        IMG_SIZE_LOC // TILE_SIZE_LOC,
        IMG_SIZE_LOC // TILE_SIZE_LOC,
        TILE_SIZE_LOC,
        TILE_SIZE_LOC,
    )
    Cr_output = Cr_output.reshape(
        IMG_SIZE_LOC // TILE_SIZE_LOC,
        IMG_SIZE_LOC // TILE_SIZE_LOC,
        TILE_SIZE_LOC,
        TILE_SIZE_LOC,
    )
    Cb_output = Cb_output.reshape(
        IMG_SIZE_LOC // TILE_SIZE_LOC,
        IMG_SIZE_LOC // TILE_SIZE_LOC,
        TILE_SIZE_LOC,
        TILE_SIZE_LOC,
    )

    # Modify final output image based on tile statistics
    # Replace tiles that meet statistics threshold with original input data for "lossless"
    total_size = 0
    compressed_blocks_size = 0
    uncompressed_blocks_size = 0
    compressed_block_count = 0
    uncompressed_block_count = 0

    MAX_BLUR_THRESHOLD = 14500
    MAX_GRADIENT_THRESHOLD = 1000
    MAX_GRADIENT_VAR_THRESHOLD = 7000

    avg_laplace = 0
    avg_gradient = 0
    avg_gradient_var = 0
    if EN_TILE_REPLACEMENT:
        for row in range(n_tiles_x):
            for col in range(n_tiles_y):
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
                laplacian_variance = ((laplacian_var_msb & 0xFF) << 8) | (
                    laplacian_var_lsb & 0xFF
                )

                avg_laplace += laplacian_variance
                avg_gradient += gradient_std_dev
                avg_gradient_var += gradient_variance

                if DISP_STATS:
                    print(
                        f"Tile Row/Col: {row}/{col} | Laplacian Variance: {laplacian_variance} | "
                        f"Gradient Std Dev: {gradient_std_dev} | Gradient Variance: {gradient_variance}"
                    )

                if (
                    laplacian_variance > MAX_BLUR_THRESHOLD
                    or gradient_std_dev > MAX_GRADIENT_THRESHOLD
                    or gradient_variance > MAX_GRADIENT_VAR_THRESHOLD
                ):

                    # Replace pixel tile with original input pixels
                    Y_output[row][col] = Y_ref[row][col]
                    Cr_output[row][col] = Cr_ref[row][col]
                    Cb_output[row][col] = Cb_ref[row][col]

                    Y4d[row][col] = Y_ref[row][col]
                    Cr4d[row][col] = Cr_ref[row][col]
                    Cb4d[row][col] = Cb_ref[row][col]

                    # Set all values for that tile ID to 1, used to indicate the tile is lossless
                    tile_id[row][col].fill(1)

                    # For replaced blocks, size is number of pixels * 3 bytes
                    # block_size = TILE_SIZE_LOC * TILE_SIZE_LOC * 3
                    # uncompressed_blocks_size += block_size
                    # tile_size_bytes[row][col] = block_size
                    uncompressed_block_count += 1

        print(f"\nAverage Laplacian Variance: {avg_laplace / (n_tiles_x * n_tiles_y)}")
        print(f"\nAverage Gradient Std. Dev: {avg_gradient / (n_tiles_x * n_tiles_y)}")
        print(
            f"\nAverage Gradient Variance: {avg_gradient_var / (n_tiles_x * n_tiles_y)}"
        )

    end_time = time.time()

    print("Packaging Tiles...")

    # Compress Tiles and calculate size
    if EN_COMPRESSOR:
        print(f"Shape of Y4d: {Y4d.shape}")
        print(f"Shape of Cr4d: {Cr4d.shape}")
        print(f"Shape of Cb4d: {Cb4d.shape}")
        """Y_size, _, _ = tile_compressor.process_array(Y4d)
        Cr_size, _, _ = tile_compressor.process_array(Cr4d)
        Cb_size, _, _ = tile_compressor.process_array(Cb4d)"""
        Y_size, _ = tile_compressor.verify_compression(Y4d, channel_data)
        Cr_size, _ = tile_compressor.verify_compression(Cr4d, channel_data)
        Cb_size, _ = tile_compressor.verify_compression(Cb4d, channel_data)
        compressed_size = tile_compressor.write_compressed_channels(
            channel_data, "compressed_image.hex"
        )

        compressed_blocks_size = Y_size + Cr_size + Cb_size
        total_size = compressed_blocks_size
        compressed_block_count = n_tiles_x * n_tiles_y
    else:
        compressed_blocks_size = 0
        total_size = 0
        compressed_block_count = 0

    print("\nDone...")
    print(f"\nTotal Time Taken: {end_time - start_time:.2f}s")

    size_stats = SizeStats(
        total_size=total_size,
        compressed_size=compressed_blocks_size,
        uncompressed_size=uncompressed_blocks_size,
        compressed_blocks=compressed_block_count,
        uncompressed_blocks=uncompressed_block_count,
    )

    image_channels = ImageChannels(
        Y_output=Y_output.transpose(0, 2, 1, 3).reshape(
            n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC
        ),
        Cr_output=Cr_output.transpose(0, 2, 1, 3).reshape(
            n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC
        ),
        Cb_output=Cb_output.transpose(0, 2, 1, 3).reshape(
            n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC
        ),
        size_stats=size_stats,
        tid=tile_id,
    )

    return image_channels
    # return (
    #     Y_output.transpose(0, 2, 1, 3).reshape(
    #         n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC
    #     ),
    #     Cr_output.transpose(0, 2, 1, 3).reshape(
    #         n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC
    #     ),
    #     Cb_output.transpose(0, 2, 1, 3).reshape(
    #         n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC
    #     ),
    #     size_stats,
    #     tile_id,
    # )


def process_color_image(image: MatLike) -> ProcessedImageData:
    # # Read in image
    # img = cv2.cvtColor(cv2.imread(image_path), cv2.COLOR_BGR2RGB)
    #
    # # Convert to 2d array
    # img_array = np.array(img)

    # Resize image
    img_array = resize_image(image)

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
    usb = USB_FTX232H_FT60X_sync245mode(
        device_to_open_list=(
            ("FTX232H", "USB <-> Serial Converter"),
            # firstly try to open FTX232H (FT232H or FT2232H) device named 'USB <-> Serial Converter'. Note that 'USB <-> Serial Converter' is the default name of FT232H or FT2232H chip unless the user has modified it. If the chip's name has been modified, you can use FT_Prog software to look up it.
            ("FT60X", "FTDI SuperSpeed-FIFO Bridge"),
        )
        # secondly try to open FT60X (FT600 or FT601) device named 'FTDI SuperSpeed-FIFO Bridge'. Note that 'FTDI SuperSpeed-FIFO Bridge' is the default name of FT600 or FT601 chip unless the user has modified it.
    )

    print(
        "device opened: device_type=%s, device_name=%s"
        % (usb.device_type, usb.device_name)
    )

    # Process channels
    # Y_processed, Cr_processed, Cb_processed, size_stats, tile_id = (
    #     process_image_channels(usb, R, G, B, Y, Cr, Cb)
    # )
    res = (
        process_image_channels(usb, R, G, B, Y, Cr, Cb)
    )
    Y_processed = res.Y_output
    Cr_processed = res.Cr_output
    Cb_processed = res.Cb_output
    size_stats = res.size_stats
    tile_id = res.tid

    # Close USB connection
    usb.close()

    # Get input image size stats
    original_size = (
        img_array.nbytes / 1024
    )  # ignores file format data, just gets raw size of pixel array
    # compressed_size = size_stats["total_size"]  # Use total_size from stats
    compressed_size = size_stats.total_size # Use total_size from stats
    compression_ratio = 100 * (1 - (compressed_size / original_size))

    # Combine processed channels and convert to RGB
    imgProcessed = cv2.merge([Y_processed, Cr_processed, Cb_processed])
    imgRGB = cv2.cvtColor(imgProcessed, cv2.COLOR_YCrCb2RGB)

    # Get PSNR and MS-SSIM from reconstructed Image
    PSNR = quality_statistics.calculate_psnr(img_array, imgRGB)
    MSSSIM = quality_statistics.calculate_msssim(img_array, imgRGB)

    processed_image_data = ProcessedImageData(
        Y_processed=Y_processed,
        Cr_processed=Cr_processed,
        Cb_processed=Cb_processed,
        size_stats=size_stats,
        tile_id=tile_id,
        PSNR=PSNR,
        MSSSIM=MSSSIM,
        original_size=original_size,
        compression_ratio=compression_ratio,
        img_array=img_array,
        imgRGB=imgRGB,
    )
    return processed_image_data
    # return (img_array, imgRGB, Y_processed, Cr_processed, Cb_processed,
    #         PSNR, MSSSIM, original_size, size_stats, compression_ratio, tile_id)


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
    cropped = image[start_h : start_h + size, start_w : start_w + size]

    # Resize square image to target size
    return cv2.resize(cropped, (IMG_SIZE, IMG_SIZE))


# def draw_tile_borders(image, tile_id, tile_size):
#     # Create a copy of the image to avoid modifying original
#     bordered_image = image.copy()
#
#     # Get dimensions
#     n_tiles_y = tile_id.shape[0]
#     n_tiles_x = tile_id.shape[1]
#
#     # Border color (red)
#     border_color = [0, 0, 255]
#     border_thickness = 2
#
#     # Draw borders around modified tiles
#     for y in range(n_tiles_y):
#         for x in range(n_tiles_x):
#             if not tile_id[y, x].all() == 0:
#                 # Calculate tile coordinates
#                 y_start = y * tile_size
#                 y_end = (y + 1) * tile_size
#                 x_start = x * tile_size
#                 x_end = (x + 1) * tile_size
#
#                 # Draw horizontal lines
#                 bordered_image[y_start:y_start + border_thickness, x_start:x_end] = border_color
#                 bordered_image[y_end - border_thickness:y_end, x_start:x_end] = border_color
#
#                 # Draw vertical lines
#                 bordered_image[y_start:y_end, x_start:x_start + border_thickness] = border_color
#                 bordered_image[y_start:y_end, x_end - border_thickness:x_end] = border_color
#
#     return bordered_image
#

# def create_interactive_display(image_path):
#     # Create figure with adjusted size and spacing
#     fig = plt.figure(figsize=(15, 12))
#
#     # Adjust GridSpec to reduce vertical spacing and add padding at top
#     gs = gridspec.GridSpec(5, 3,
#                            height_ratios=[1, 1, 0.1, 0.15, 0.01],
#                            hspace=0.3,
#                            top=0.95,
#                            bottom=0.05,
#                            left=0.05,
#                            right=0.95)
#
#     # Process Image
#     (original, processed, y_channel, cr_channel, cb_channel,
#      psnr, msssim, orig_size, size_stats, comp_ratio, tile_id) = process_color_image(image_path)
#
#     highlighted_image = draw_tile_borders(original, tile_id, TILE_SIZE)
#
#     # Create subplots
#     ax_orig = plt.subplot(gs[0, 0])
#     ax_proc = plt.subplot(gs[1, 0])
#     ax_y = plt.subplot(gs[0, 1])
#     ax_highlighted = plt.subplot(gs[1, 1])
#     ax_cr = plt.subplot(gs[0, 2])
#     ax_cb = plt.subplot(gs[1, 2])
#     ax_metrics = plt.subplot(gs[3, :])
#     ax_text = plt.subplot(gs[4, :])
#
#     # Initial plots
#     img_orig = ax_orig.imshow(original)
#     img_proc = ax_proc.imshow(processed)
#     img_highlighted = ax_highlighted.imshow(highlighted_image)
#     img_y = ax_y.imshow(y_channel, cmap='gray')
#     img_cr = ax_cr.imshow(cr_channel, cmap='RdYlBu')
#     img_cb = ax_cb.imshow(cb_channel, cmap='RdYlBu')
#
#     # Set titles with padding
#     ax_orig.set_title('Original Image', pad=10)
#     ax_proc.set_title('Processed Image', pad=10)
#     ax_y.set_title('Y Channel', pad=10)
#     ax_highlighted.set_title('Modified Tiles Highlighted', pad=10)
#     ax_cr.set_title('Cr Channel', pad=10)
#     ax_cb.set_title('Cb Channel', pad=10)
#
#     # Remove axes
#     for ax in [ax_orig, ax_proc, ax_highlighted, ax_y, ax_cr, ax_cb]:
#         ax.axis('off')
#
#     # Initialize metrics display with additional size information
#     ax_metrics.axis('off')
#     metrics_text = ax_metrics.text(0.5, 0.5,
#                                    f'PSNR: {psnr:.2f} dB\n'
#                                    f'MS-SSIM: {msssim:.4f}\n'
#                                    f'Original Size: {orig_size:.2f} KB\n'
#                                    f'Total Compressed Size: {size_stats["total_size"]:.2f} KB\n'
#                                    f'Compression Ratio: {comp_ratio:.2f}%\n'
#                                    f'Compressed Blocks: {size_stats["compressed_blocks"]} ({size_stats["compressed_size"]:.2f} KB)\n'
#                                    f'Uncompressed Blocks: {size_stats["uncompressed_blocks"]} ({size_stats["uncompressed_size"]:.2f} KB)',
#                                    horizontalalignment='center',
#                                    verticalalignment='center',
#                                    fontsize=12)
#
#     # Remove axes from text box area
#     ax_text.axis('off')
#
#     plt.show()
#
#
# if __name__ == "__main__":
#     create_interactive_display(image_path)
#
#
