from dataclasses import dataclass
from typing import Any

from cv2.typing import MatLike
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
IMG_SIZE = 2048  # Size of image
TILE_SIZE = 16  # Size of the tiles that input 2048x2048 image will be split into
BLOCK_SIZE = 8  # Size of 8x8 DCT Blocks
N_BLOCKS = int(TILE_SIZE / BLOCK_SIZE)

image_path = "img9.jpg"  # Replace with your image path
np.set_printoptions(threshold=np.inf)


@dataclass
class ProcessedImageResult:
    img_array: MatLike  # Original image array in RGB format
    img_RGB: MatLike  # Processed image array in RGB format
    Y_processed: MatLike  # Processed Y channel
    Cr_processed: MatLike  # Processed Cr channel
    Cb_processed: MatLike  # Processed Cb channel
    PSNR: float  # Peak Signal-to-Noise Ratio
    MSSSIM: float  # MS-SSIM (Multi-Scale Structural Similarity Index)
    original_size: int  # Size of the original image array in bytes
    # size_stats: dict[str, Any]  # Dictionary containing size statistics
    # compression_ratio: float  # Compression ratio in percentage
    # tile_id: Any  # Identifier for the tile (type could vary based on implementation)


@dataclass
class ProcessedImageChannels:
    Y_final: np.ndarray  # Final Y channel image array
    Cr_final: np.ndarray  # Final Cr channel image array
    Cb_final: np.ndarray  # Final Cb channel image array
    y_block_size: int  # Size of the Y channel after Huffman encoding
    cr_block_size: int  # Size of the Cr channel after Huffman encoding
    cb_block_size: int  # Size of the Cb channel after Huffman encoding


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


def process_image_channels(usb, R, G, B):
    # Convert Global variables to local scope, slightly improves loop performance
    IMG_SIZE_LOC = IMG_SIZE  # Total 2d Image size (eg 2048 for 2048x2048)
    TILE_SIZE_LOC = TILE_SIZE  # Tile size in px (eg 16 for 16x16)
    BLOCK_SIZE_LOC = BLOCK_SIZE  # DCT Block size (8 for 8x8)
    N_BLOCKS_LOC = (
        N_BLOCKS  # Number of Blocks in a tile (eg 2 for 16x16 tile with 8x8 blocks)
    )

    # Convert 2048x2048 channel arrays to 32x32 array of 64x64 pixel blocks
    R_tiles = image_codec.generate_tiles(R, TILE_SIZE_LOC)
    G_tiles = image_codec.generate_tiles(G, TILE_SIZE_LOC)
    B_tiles = image_codec.generate_tiles(B, TILE_SIZE_LOC)

    # For each tile, encode into 32x32 array of 1x4096 hex strings
    Y_output = np.zeros_like(R_tiles, dtype=np.uint8)
    Cr_output = np.zeros_like(G_tiles, dtype=np.uint8)
    Cb_output = np.zeros_like(B_tiles, dtype=np.uint8)

    Y_returned = np.zeros(
        (
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            TILE_SIZE_LOC * TILE_SIZE_LOC,
        ),
        dtype=np.int8,
    )
    Cr_returned = np.zeros(
        (
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            TILE_SIZE_LOC * TILE_SIZE_LOC,
        ),
        dtype=np.int8,
    )
    Cb_returned = np.zeros(
        (
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            TILE_SIZE_LOC * TILE_SIZE_LOC,
        ),
        dtype=np.int8,
    )
    tile_id = np.zeros(
        (
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            IMG_SIZE_LOC // TILE_SIZE_LOC,
            TILE_SIZE_LOC * TILE_SIZE_LOC,
        ),
        dtype=np.int32,
    )

    print("Formatting...")
    R_formatted = image_codec.format_image_array(R_tiles, BLOCK_SIZE_LOC)
    G_formatted = image_codec.format_image_array(G_tiles, BLOCK_SIZE_LOC)
    B_formatted = image_codec.format_image_array(B_tiles, BLOCK_SIZE_LOC)

    # Calculate dimensions
    tile_size_sq = TILE_SIZE_LOC * TILE_SIZE_LOC
    n_tiles_y, n_tiles_x = Y_output.shape[0:2]

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
    img_byte_array[:, :, 0::4] = G_formatted.reshape(
        IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1
    )
    img_byte_array[:, :, 1::4] = R_formatted.reshape(
        IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1
    )
    img_byte_array[:, :, 2::4] = B_formatted.reshape(
        IMG_SIZE_LOC // TILE_SIZE_LOC, IMG_SIZE_LOC // TILE_SIZE_LOC, -1
    )

    print("Sending...")
    start_time = time.time()
    total_bytes_sent = 0

    for row in range(R_tiles.shape[0]):
        current_time = time.time()
        elapsed_time = current_time - start_time
        data_rate = (
            (total_bytes_sent / (1024)) / elapsed_time if elapsed_time > 0 else 0
        )
        print(
            f"\rProcessing Row {row}/{len(R_tiles)} | Data Rate: {data_rate:.2f}KB/s",
            end="",
            flush=True,
        )
        for col in range(R_tiles.shape[1]):
            # send data
            txlen = usb.send(bytes(bytearray(img_byte_array[row][col])))
            total_bytes_sent += txlen

            # receive data
            received_data_array = np.frombuffer(usb.recv(txlen), dtype=np.uint8)

            # Extract bytes from received byte array
            Y_returned[row][col] = received_data_array.astype(np.int8)[::4][
                :tile_size_sq
            ]
            Cr_returned[row][col] = received_data_array.astype(np.int8)[3::4][
                :tile_size_sq
            ]
            Cb_returned[row][col] = received_data_array.astype(np.int8)[1::4][
                :tile_size_sq
            ]
            tile_id[row][col] = received_data_array.astype(np.int8)[2::4][:tile_size_sq]

    print("\nDecoding...")
    # Reshape flat byte arrays to 2d arrays
    Y_all = Y_returned.reshape(-1, TILE_SIZE_LOC * TILE_SIZE_LOC)
    Cr_all = Cr_returned.reshape(-1, TILE_SIZE_LOC * TILE_SIZE_LOC)
    Cb_all = Cb_returned.reshape(-1, TILE_SIZE_LOC * TILE_SIZE_LOC)

    # For compressed blocks, calculate size using Huffman encoding
    _, y_block_size = huffman_encoder.huffman_encode(Y_returned)
    _, cr_block_size = huffman_encoder.huffman_encode(Cr_returned)
    _, cb_block_size = huffman_encoder.huffman_encode(Cb_returned)

    # Decode returned image tiles
    Y_output = np.array(
        [
            image_codec.decode_image_array(
                tile, BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC
            )
            for tile in Y_all
        ]
    )
    Cr_output = np.array(
        [
            image_codec.decode_image_array(
                tile, BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC
            )
            for tile in Cr_all
        ]
    )
    Cb_output = np.array(
        [
            image_codec.decode_image_array(
                tile, BLOCK_SIZE_LOC, N_BLOCKS_LOC, TILE_SIZE_LOC
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

    end_time = time.time()

    print("Packaging Tiles...")
    # Reshape output arrays from 4d to 2d image arrays
    Y_final = Y_output.transpose(0, 2, 1, 3).reshape(
        n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC
    )
    Cr_final = Cr_output.transpose(0, 2, 1, 3).reshape(
        n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC
    )
    Cb_final = Cb_output.transpose(0, 2, 1, 3).reshape(
        n_tiles_y * TILE_SIZE_LOC, n_tiles_x * TILE_SIZE_LOC
    )

    print("\nDone...")
    print(f"\nTotal Time Taken: {end_time - start_time:.2f}s")

    return ProcessedImageChannels(
        Y_final=Y_final,
        Cr_final=Cr_final,
        Cb_final=Cb_final,
        y_block_size=y_block_size,
        cr_block_size=cr_block_size,
        cb_block_size=cb_block_size,
    )


def process_color_image(img_array: MatLike) -> ProcessedImageResult:

    # Generate 2d arrays for each color channel
    R = img_array[:, :, 0]
    G = img_array[:, :, 1]
    B = img_array[:, :, 2]
    img_array = cv2.merge((R, G, B))

    # Create USB connection
    usb = USB_FTX232H_FT60X_sync245mode(
        device_to_open_list=(
            ("FTX232H", "USB <-> Serial Converter"),
            # firstly try to open FTX232H (FT232H or FT2232H) device named 'USB <-> Serial Converter'. Note that 'USB <-> Serial Converter' is the default name of FT232H or FT2232H chip unless the user has modified it. If the chip's name has been modified, you can use FT_Prog software to look up it.
            ("FT60X", "FTDI SuperSpeed-FIFO Bridge"),
        )
        # secondly try to open FT60X (FT600 or FT601) device named 'FTDI SuperSpeed-FIFO Bridge'. Note that 'FTDI SuperSpeed-FIFO Bridge' is the default name of FT600 or FT601 chip unless the user has modified it.
    )

    # Process channels
    processed_channels = process_image_channels(usb, R, G, B)  # , Y, Cr, Cb)
    Y_processed = processed_channels.Y_final
    Cr_processed = processed_channels.Cr_final
    Cb_processed = processed_channels.Cb_final
    Y_processed = processed_channels.Y_final

    # Close USB connection
    usb.close()

    # Get input image size stats
    original_size = (
        img_array.nbytes
    )  # ignores file format data, just gets raw size of pixel array
    # compressed_size = size_stats["total_size"]  # Use total_size from stats
    # compression_ratio = 100 * (1 - (compressed_size / original_size))

    # Combine processed channels and convert to RGB
    img_processed = cv2.merge([Y_processed, Cr_processed, Cb_processed])
    img_RGB = cv2.cvtColor(img_processed, cv2.COLOR_YCrCb2RGB)

    # Get PSNR and MS-SSIM from reconstructed Image
    PSNR = quality_statistics.calculate_psnr(img_array, img_RGB)
    MSSSIM = quality_statistics.calculate_msssim(img_array, img_RGB)

    result = ProcessedImageResult(
        img_array,
        img_RGB,
        Y_processed,
        Cr_processed,
        Cb_processed,
        PSNR,
        MSSSIM,
        original_size,
        # size_stats,
        # compression_ratio,
        # tile_id,
    )
    return result
