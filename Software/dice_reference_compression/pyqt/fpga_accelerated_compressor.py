from cv2.typing import MatLike
import numpy as np
import cv2
from dataclasses import dataclass
import time

# import matplotlib.pyplot as plt
# import matplotlib.gridspec as gridspec

# Local Libraries
from USB_FTX232H_FT60X import USB_FTX232H_FT60X_sync245mode
import tile_compressor
import quality_statistics
import image_codec

DEBUG = False
DISP_STATS = False
EN_COMPRESSOR = True
IMG_SIZE = 2048  # Size of image
TILE_SIZE = 16  # Size of the tiles that input 2048x2048 image will be split into
BLOCK_SIZE = 8  # Size of 8x8 DCT Blocks
N_BLOCKS = int(TILE_SIZE / BLOCK_SIZE)

# image_path = "img5.jpg"  # Replace with your image path
np.set_printoptions(threshold=np.inf)


@dataclass
class SizeStats:
    compressed_block_size: float
    compressed_image_size: float
    uncompressed_size: float
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


def process_image_channels(usb, R, G, B) -> ImageChannels:
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
    compressed_blocks_size = 0
    uncompressed_blocks_size = 0
    compressed_block_count = 0
    uncompressed_block_count = 0


    end_time = time.time()

    print("Packaging Tiles...")

    # Compress Tiles and calculate size
    if EN_COMPRESSOR:
        print(f"Shape of Y4d: {Y4d.shape}")
        print(f"Shape of Cr4d: {Cr4d.shape}")
        print(f"Shape of Cb4d: {Cb4d.shape}")
        Y_size, _ = tile_compressor.verify_compression(Y4d, channel_data)
        Cr_size, _ = tile_compressor.verify_compression(Cr4d, channel_data)
        Cb_size, _ = tile_compressor.verify_compression(Cb4d, channel_data)
        compressed_image_size = tile_compressor.write_compressed_channels(
            channel_data, "compressed_image.hex"
        )

        compressed_blocks_size = Y_size + Cr_size + Cb_size
        compressed_block_count = n_tiles_x * n_tiles_y
    else:
        compressed_blocks_size = 0
        compressed_block_count = 0
        compressed_image_size = 0

    print("\nDone...")
    print(f"\nTotal Time Taken: {end_time - start_time:.2f}s")

    size_stats = SizeStats(
        compressed_block_size=compressed_blocks_size,
        compressed_image_size=compressed_image_size,
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

def process_color_image(image: MatLike) -> ProcessedImageData:
    # Resize image
    img_array = resize_image(image)
    original_size = img_array.nbytes

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

    res = process_image_channels(usb, R, G, B)
    Y_processed = res.Y_output
    Cr_processed = res.Cr_output
    Cb_processed = res.Cb_output
    size_stats = res.size_stats
    tile_id = res.tid

    # Close USB connection
    usb.close()

    # Get input image size stats
    compressed_size = size_stats.compressed_image_size # Use total_size from stats
    compression_ratio = 100 * (1 - (compressed_size / (original_size/1024)))

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
