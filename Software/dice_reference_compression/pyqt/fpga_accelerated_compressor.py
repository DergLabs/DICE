from cv2.typing import MatLike
import numpy as np
import cv2
from dataclasses import dataclass
import zlib

# import matplotlib.pyplot as plt
# import matplotlib.gridspec as gridspec

# Local Libraries
from USB_FTX232H_FT60X import USB_FTX232H_FT60X_sync245mode
import time
import tile_compressor
import tile_compressorV2
import quality_statistics
import image_codec

DEBUG = False
DISP_STATS = False
EN_COMPRESSOR = True
EN_TILE_REPLACEMENT = True
IMG_SIZE = 2048  # Size of image
TILE_SIZE = 32  # Size of the tiles that input 2048x2048 image will be split into
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


def process_image_channels(
    usb, R, G, B, Y, Cr, Cb, block_ids: np.ndarray
) -> ImageChannels:
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
    Y_ref = image_codec.generate_tiles(Y, TILE_SIZE_LOC)
    Cr_ref = image_codec.generate_tiles(Cr, TILE_SIZE_LOC)
    Cb_ref = image_codec.generate_tiles(Cb, TILE_SIZE_LOC)

    Y_returned = np.zeros(
        (n_tiles_x, n_tiles_y, tile_size_sq), dtype=np.int16,
    )
    Cr_returned = np.zeros(
        (n_tiles_x, n_tiles_y, tile_size_sq), dtype=np.int16,
    )
    Cb_returned = np.zeros(
        (n_tiles_x, n_tiles_y, tile_size_sq), dtype=np.int16,
    )

    tile_id = np.zeros(
        (n_tiles_x, n_tiles_y, tile_size_sq), dtype=np.int16,
    )

    print("Formatting Image...")
    R_formatted = image_codec.format_image_array(
        image_codec.generate_tiles(R, TILE_SIZE_LOC),
        BLOCK_SIZE_LOC,
    )
    G_formatted = image_codec.format_image_array(
        image_codec.generate_tiles(G, TILE_SIZE_LOC),
        BLOCK_SIZE_LOC,
    )
    B_formatted = image_codec.format_image_array(
        image_codec.generate_tiles(B, TILE_SIZE_LOC),
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
    Y4d = Y_all.reshape(n_tiles_y, n_tiles_x, TILE_SIZE_LOC, TILE_SIZE_LOC).astype(np.int32)
    Cr4d = Cr_all.reshape(n_tiles_y, n_tiles_x, TILE_SIZE_LOC, TILE_SIZE_LOC).astype(np.int32)
    Cb4d = Cb_all.reshape(n_tiles_y, n_tiles_x, TILE_SIZE_LOC, TILE_SIZE_LOC).astype(np.int32)

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

    Y_lossless = []
    Cr_lossless = []
    Cb_lossless = []
    if EN_TILE_REPLACEMENT:
        for row in range(n_tiles_x):
            for col in range(n_tiles_y):
                # Get current tile ID data
                current_tile = block_ids[row * n_tiles_x + col]
                # current_tile = tile_id[row][col]

                # lossless
                if current_tile == 0:
                    print(f"\rReplacing Tile {row}, {col} with Lossless", end="", flush=True)
                    # Replace pixel tile with original input pixels
                    Y_output[row][col] = Y_ref[row][col]
                    Cr_output[row][col] = Cr_ref[row][col]
                    Cb_output[row][col] = Cb_ref[row][col]

                    '''Y4d[row][col] = Y_ref[row][col]
                    Cr4d[row][col] = Cr_ref[row][col]
                    Cb4d[row][col] = Cb_ref[row][col]'''

                    Y_lossless.append(Y4d[row][col])
                    Cr_lossless.append(Cr4d[row][col])
                    Cb_lossless.append(Cb4d[row][col])

                    uncompressed_block_count += 1
                else:
                    Y_asize, Y_compressed, Y_model = tile_compressorV2.compress_tile(Y4d[row][col])
                    Cr_asize, Cr_compressed, Cr_model = tile_compressorV2.compress_tile(Cr4d[row][col])
                    Cb_asize, Cb_compressed, Cb_model = tile_compressorV2.compress_tile(Cb4d[row][col])

                    Y_len = zlib.compress(Y4d[row][col].tobytes(), level=9)
                    Cr_len = zlib.compress(Cr4d[row][col].tobytes(), level=9)
                    Cb_len = zlib.compress(Cb4d[row][col].tobytes(), level=9)

                    Y_zsize = len(Y_len) / 1024
                    Cr_zsize = len(Cr_len) / 1024
                    Cb_zsize = len(Cb_len) / 1024

                    Y_size = Y_asize if Y_asize < Y_zsize else Y_zsize
                    Cr_size = Cr_asize if Cr_asize < Cr_zsize else Cr_zsize 
                    Cb_size = Cb_asize if Cb_asize < Cb_zsize else Cb_zsize

                    compressed_block_count += 1
                    compressed_blocks_size += Y_size + (Cr_size/2) + (Cb_size/2)
                    
    # Compress the lossless tiles
    print(f"\nCompressing Lossless Tiles using Zlib...\n")
    #_, _, _ = tile_compressor.process_array(np.array(Y_lossless), None, None)
    #_, _, _ = tile_compressor.process_array(np.array(Cr_lossless), None, None)
    #_, _, _ = tile_compressor.process_array(np.array(Cb_lossless), None, None)
    Y_bytes = np.array(Y_lossless).tobytes()
    Cr_bytes = np.array(Cr_lossless).tobytes()
    Cb_bytes = np.array(Cb_lossless).tobytes()

    Y_compressed = zlib.compress(Y_bytes, level=9)  # Level 9 is maximum compression
    Cr_compressed = zlib.compress(Cr_bytes, level=9)
    Cb_compressed = zlib.compress(Cb_bytes, level=9)

    # Calculate compressed sizes in KB
    Y_size = len(Y_compressed) / 1024
    Cr_size = len(Cr_compressed) / 1024
    Cb_size = len(Cb_compressed) / 1024

    uncompressed_blocks_size = Y_size + Cr_size + Cb_size

    if EN_COMPRESSOR:
        compressed_blocks_size += 8
    print(f"Uncompressed Blocks size: {uncompressed_blocks_size:.2f}KB")
    print(f"Compressed Blocks size: {compressed_blocks_size:.2f}KB")
    #compressed_blocks_size += uncompressed_blocks_size

    #Cr4d = Cr4d[:, ::2]
    #Cb4d = Cb4d[:, ::2]
    end_time = time.time()

    print("Packaging Tiles...")


    print("\nDone...")
    print(f"\nTotal Time Taken: {end_time - start_time:.2f}s")

    total_size = compressed_blocks_size + uncompressed_blocks_size
    #compressed_blocks_size += uncompressed_blocks_size

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


def process_color_image(image: MatLike, blocks_ids: np.ndarray) -> ProcessedImageData:
    # Resize image
    img_array = image_codec.resize_image(image, IMG_SIZE)

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
    res = process_image_channels(usb, R, G, B, Y, Cr, Cb, blocks_ids)
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

    compression_ratio = 100 * (1 - (size_stats.total_size / original_size))

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




