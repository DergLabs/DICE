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
EN_COMPRESSOR = True
IMG_SIZE = 2048  # Size of image
TILE_SIZE = 32  # Size of the tiles that input 2048x2048 image will be split into
BLOCK_SIZE = 8  # Size of 8x8 DCT Blocks
N_BLOCKS = int(TILE_SIZE / BLOCK_SIZE)
N_TILES = int(IMG_SIZE / TILE_SIZE)  # Number of tiles in the image, 128 for 4096x4096 image with 32x32 tiles

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

fpga_tile_id = np.zeros(
    (N_TILES, N_TILES), dtype=np.uint8,
)

def process_image_channels(
    usb, R, G, B, Y, Cr, Cb, block_ids, gradient_threshold, laplacian_threshold: np.ndarray
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

    # Arrays to hold the raw returned data
    Y_returned = np.zeros((n_tiles_x, n_tiles_y, tile_size_sq), dtype=np.int16)
    Cr_returned = np.zeros((n_tiles_x, n_tiles_y, tile_size_sq), dtype=np.int16)
    Cb_returned = np.zeros((n_tiles_x, n_tiles_y, tile_size_sq), dtype=np.int16)
    tile_id = np.zeros((n_tiles_x, n_tiles_y), dtype=np.int16)

    Cr_half = np.zeros((n_tiles_x, n_tiles_y, tile_size_sq // 2), dtype=np.uint8)
    Cb_half = np.zeros((n_tiles_x, n_tiles_y, tile_size_sq // 2), dtype=np.uint8)

    # Arrays to hold the decoded returned data
    Y_decoded = np.zeros((n_tiles_x, n_tiles_y, TILE_SIZE_LOC, TILE_SIZE_LOC), dtype=np.uint8)
    Cr_decoded = np.zeros((n_tiles_x, n_tiles_y, TILE_SIZE_LOC, TILE_SIZE_LOC), dtype=np.uint8)
    Cb_decoded = np.zeros((n_tiles_x, n_tiles_y, TILE_SIZE_LOC, TILE_SIZE_LOC), dtype=np.uint8)

    # Arrays to hold the formatted image data to send to FPGA
    print("Formatting Image...")
    R_formatted = image_codec.format_image_array(image_codec.generate_tiles(R, TILE_SIZE_LOC),BLOCK_SIZE_LOC)
    G_formatted = image_codec.format_image_array(image_codec.generate_tiles(G, TILE_SIZE_LOC),BLOCK_SIZE_LOC)
    B_formatted = image_codec.format_image_array(image_codec.generate_tiles(B, TILE_SIZE_LOC),BLOCK_SIZE_LOC)

    # Byte Array to hold the formatted image data for sending to FPGA
    print("Encoding Image Data...")
    img_byte_array = np.zeros((
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            TILE_SIZE_LOC * TILE_SIZE_LOC * 4,
        ),
        dtype=np.uint8,
    )

    # Convert the gradient and laplacian thresholds to 16-bit unsigned integers, then split up into two bytes
    gradient_threshold_u16 = np.uint16(gradient_threshold)
    laplacian_threshold_u16 = np.uint16(laplacian_threshold)

    # Create byte arrays for the thresholds
    gradient_threshold_bytes = np.array([gradient_threshold_u16 >> 8, gradient_threshold_u16 & 0xFF], dtype=np.uint8)
    laplacian_threshold_bytes = np.array([laplacian_threshold_u16 >> 8, laplacian_threshold_u16 & 0xFF], dtype=np.uint8)

    # Encode tiles as byte arrays
    # Insert G every 4th byte startnig at index 0 (ie 0, 3, 7, 11 ...)
    img_byte_array[:, :, 0::4] = G_formatted.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1)
    # Insert R every 4th byte starting at index 1 (ie 1, 5, 9, 13 ...)
    img_byte_array[:, :, 1::4] = R_formatted.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1)
    # Insert B every 4th byte starting at index 2 (ie 2, 6, 10, 14 ...)
    img_byte_array[:, :, 2::4] = B_formatted.reshape(IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1)

    # Insert gradient and laplacian thresholds into the first 4 bytes of ALL tiles
    # Using broadcasting to set the values for all tiles at once
    img_byte_array[:, :, 3] = gradient_threshold_bytes[0]   # First byte of gradient threshold
    img_byte_array[:, :, 7] = gradient_threshold_bytes[1]   # Second byte of gradient threshold
    img_byte_array[:, :, 11] = laplacian_threshold_bytes[0] # First byte of laplacian threshold
    img_byte_array[:, :, 15] = laplacian_threshold_bytes[1] # Second byte of laplacian threshold

    print(f"Sending {len(img_byte_array[0][1])} bytes...")
    start_time = time.time()
    total_bytes_sent = 0
    decoded_id = 0
    id_offset = 0

    total_size = 0
    lossy_block_size = 0
    lossless_block_size = 0
    lossy_block_count = 0
    lossless_block_count = 0

    Y_lossless = []
    Cr_lossless = []
    Cb_lossless = []

    converted_tiles = np.zeros((n_tiles_x, n_tiles_y, TILE_SIZE_LOC, TILE_SIZE_LOC, 3), dtype=np.uint8)

    for row in range(n_tiles_x):
        current_time = time.time()
        elapsed_time = current_time - start_time
        data_rate = ((total_bytes_sent / (1024)) / elapsed_time if elapsed_time > 0 else 0)
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
            received_data_array = np.frombuffer(usb.recv(txlen + id_offset), dtype=np.uint8)
            # Data recieved as 16bit chunks, bytes within the 16bit chunks are swapped
            # 1 extra byte is received at the end, which is the tile ID, if the byte is 0xff then it is a lossy tile, if it is 0x00 then it is a lossless tile

            # for debug, print out the last 16 bytes received
            #print(f"\nReceived Data (last 16 bytes): {received_data_array[-16:]}")
            # print first 16 bytes received
            #print(f"Received Data (first 16 bytes): {received_data_array[:16]}")
        
            # Check if the last byte is 0xFF, if so, it is a lossy tile
            if received_data_array[-1] == 0xFF:
                # Lossy tile
                decoded_id = 1
                # replace last two bytes with 0x0000
                modified_data = np.copy(received_data_array)
                modified_data[-2:] = 0x00
            else:
                # Lossless tile
                decoded_id = 0

            fpga_tile_id[row][col] = decoded_id

            # Print out value of last byte
            #print(f"\nLast byte: {decoded_id}")
            
            if decoded_id == 0:
                # Lossless tile, just extract the 8-bit values, order is G, R, B, 0
                # Every 4th byte starting at index 0 (ie 0, 4, 8, 12 ...) is G
                # Every 4th byte starting at index 1 (ie 1, 5, 9, 13 ...) is R
                # Every 4th byte starting at index 2 (ie 2, 6, 10, 14 ...) is B
                Y_returned[row][col] = received_data_array[0::4].astype(np.int16)
                Cr_returned[row][col] = received_data_array[1::4].astype(np.int16)
                Cb_returned[row][col] = received_data_array[2::4].astype(np.int16)
                
                # Formatted as 4D Array: 64x64 array of 1024x1 tiles

                Y_decoded[row][col] = image_codec.decode_lossless_tile(
                    Y_returned[row][col], BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC
                )
                Cr_decoded[row][col] = image_codec.decode_lossless_tile(
                    Cr_returned[row][col], BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC
                )
                Cb_decoded[row][col] = image_codec.decode_lossless_tile(
                    Cb_returned[row][col], BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC
                )

                Y_lossless.append(Y_decoded[row][col])
                Cr_lossless.append(Cr_decoded[row][col])
                Cb_lossless.append(Cb_decoded[row][col])
                lossless_block_count += 1

                G_decoded = Y_decoded[row][col].astype(np.uint8)
                R_decoded = Cr_decoded[row][col].astype(np.uint8)
                B_decoded = Cb_decoded[row][col].astype(np.uint8)
                merged_tile = cv2.merge((R_decoded, G_decoded, B_decoded))

                if EN_COMPRESSOR:
                    _, png_encoded = cv2.imencode('.png', merged_tile)
                    tile_size_bytes = len(png_encoded.tobytes())
                    lossless_block_size += tile_size_bytes / 1024  # Convert to KB
            
                converted_tiles[row][col] = merged_tile

            else:
                # Lossy
                # combine into 32-bit values with correct ordering:
                # - Swap each 16-bit chunk internally (byteswap)
                # - Place second chunk first, first chunk second
                combined_data = (
                    modified_data.view(np.uint16)[1::2].astype(np.uint32) << 16
                ) | modified_data.view(np.uint16)[::2].astype(np.uint32)

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

                # Decode lossy tiles
                Y_decoded[row][col] = image_codec.decode_image_array(
                    Y_returned[row][col], BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC, k=0.125
                )
                Cr_decoded[row][col] = image_codec.decode_image_array(
                    Cr_returned[row][col], BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC, k=0.5
                )
                Cb_decoded[row][col] = image_codec.decode_image_array(
                    Cb_returned[row][col], BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC, k=0.5
                )

                if EN_COMPRESSOR:
                    # Compress for size calculation
                    # remove every 2nd value from Cr and Cb
                    Cr_half[row][col] = Cr_returned[row][col][::2]
                    Cb_half[row][col] = Cb_returned[row][col][::2]

                    Y_asize, _, _ = tile_compressorV2.compress_tile(Y_returned[row][col].astype(np.int32))
                    Cr_asize, _, _ = tile_compressorV2.compress_tile(Cr_half[row][col].astype(np.int32))
                    Cb_asize, _, _ = tile_compressorV2.compress_tile(Cb_half[row][col].astype(np.int32))

                    '''Y_zsize = len(zlib.compress(Y_returned[row][col].tobytes(), level=9))/1024
                    Cr_zsize = len(zlib.compress(Cr_half[row][col].tobytes(), level=9))/1024
                    Cb_zsize = len(zlib.compress(Cb_half[row][col].tobytes(), level=9))/1024

                    Y_size = Y_asize if Y_asize < Y_zsize else Y_zsize
                    Cr_size = Cr_asize if Cr_asize < Cr_zsize else Cr_zsize 
                    Cb_size = Cb_asize if Cb_asize < Cb_zsize else Cb_zsize'''

                    Y_size = Y_asize
                    Cr_size = Cr_asize
                    Cb_size = Cb_asize

                    lossy_block_count += 1
                    lossy_block_size += Y_size + (Cr_size) + (Cb_size)

                # Lossy tile, merge the channels and convert to RGB
                Y_output = Y_decoded[row][col].astype(np.uint8)
                Cr_output = Cr_decoded[row][col].astype(np.uint8)
                Cb_output = Cb_decoded[row][col].astype(np.uint8)
                merged_tile = cv2.merge((Y_output, Cr_output, Cb_output))
                merged_tile = cv2.cvtColor(merged_tile, cv2.COLOR_YCrCb2RGB)
                converted_tiles[row][col] = merged_tile



    print("\nTile ID Array:")
    print(fpga_tile_id)
    block_ids = fpga_tile_id.reshape(-1)

    if lossy_block_count == 0:
        print("No lossy blocks found, all tiles are lossless.")
        lossy_block_size = 0
    else:
        print(f"Lossy Blocks size: {lossy_block_size/lossy_block_count:.2f}KB per Block")

    if lossless_block_count == 0:
        print("No lossless blocks found, all tiles are lossy.")
        lossless_block_size = 0
    else:
        print(f"Lossless Blocks size: {lossless_block_size/lossless_block_count:.2f}KB per Block")

    print(f"Raw Tile Size: {TILE_SIZE_LOC * TILE_SIZE_LOC * 3 / 1024:.2f}KB per Block")

    total_size = lossy_block_size + lossless_block_size
    print(f"Total Size: {total_size:.2f}KB")


    print(f"\nCombining Tiles into a single Image...")
    red_ch = converted_tiles[:, :, :, :, 0].transpose(0, 2, 1, 3).reshape(
        n_tiles_x * TILE_SIZE_LOC, n_tiles_y * TILE_SIZE_LOC
    )
    green_ch = converted_tiles[:, :, :, :, 1].transpose(0, 2, 1, 3).reshape(
        n_tiles_x * TILE_SIZE_LOC, n_tiles_y * TILE_SIZE_LOC
    )
    blue_ch = converted_tiles[:, :, :, :, 2].transpose(0, 2, 1, 3).reshape(
        n_tiles_x * TILE_SIZE_LOC, n_tiles_y * TILE_SIZE_LOC
    )
    end_time = time.time()
    print("\nDone...")
    print(f"\nTotal Time Taken: {end_time - start_time:.2f}s")


    size_stats = SizeStats(
        total_size=total_size,
        compressed_size=lossy_block_size,
        uncompressed_size=lossless_block_size,
        compressed_blocks=lossy_block_count,
        uncompressed_blocks=lossless_block_count,
    )

    image_channels = ImageChannels(red_ch, green_ch, blue_ch, size_stats, block_ids)

    return image_channels


def process_color_image(image: MatLike, blocks_ids, gradient_threshold, laplacian_threshold: np.ndarray) -> ProcessedImageData:
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
    res = process_image_channels(usb, R, G, B, Y, Cr, Cb, blocks_ids, gradient_threshold, laplacian_threshold)

    # Unpack results
    '''Y_processed = res.Y_output
    Cr_processed = res.Cr_output
    Cb_processed = res.Cb_output
    size_stats = res.size_stats
    tile_id = res.tid'''

    # Upack results
    red_ch = res.Y_output
    green_ch = res.Cr_output
    blue_ch = res.Cb_output
    size_stats = res.size_stats
    tile_id = res.tid

    tile_id = fpga_tile_id.reshape(-1)

    # Close USB connection
    usb.close()

    # Get input image size stats
    original_size = (
        img_array.nbytes / 1024
    )  # ignores file format data, just gets raw size of pixel array

    compression_ratio = 100 * (1 - (size_stats.total_size / original_size))

    # Combine processed channels and convert to RGB
    '''imgProcessed = cv2.merge([Y_processed, Cr_processed, Cb_processed])
    imgRGB = cv2.cvtColor(imgProcessed, cv2.COLOR_YCrCb2RGB)'''
    imgRGB = cv2.merge((red_ch, green_ch, blue_ch))

    # Get PSNR and MS-SSIM from reconstructed Image
    PSNR = quality_statistics.calculate_psnr(img_array, imgRGB)
    MSSSIM = quality_statistics.calculate_msssim(img_array, imgRGB)

    processed_image_data = ProcessedImageData(
        Y_processed=red_ch,
        Cr_processed=green_ch,
        Cb_processed=blue_ch,
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




