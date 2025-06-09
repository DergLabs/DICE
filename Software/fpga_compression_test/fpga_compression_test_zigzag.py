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
IMG_SIZE = 32 # Size of image
TILE_SIZE = 32 # Size of the tiles that input 2048x2048 image will be split into
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


def print_array_as_block(array, name, row, col, format_type='decimal'):
    """Print array as a neat 32x32 block or 4D array as 2D grid of 2D blocks with proper alignment"""
    print(f"\n{name} Values Row: {row}, Col: {col}")
    print(f"Shape: {array.shape}, Max: {np.max(array)}, Min: {np.min(array)}")
    
    # Handle 1D arrays with 1024 elements - reshape to 32x32
    if array.ndim == 1 and array.size == 1024:
        block = array.reshape(32, 32)
        _print_single_block(block, format_type)
    
    # Handle 4D arrays - display as 2D grid of 2D blocks
    elif array.ndim == 4:
        _print_4d_as_2d_grid(array, format_type)
    
    # Handle 2D arrays directly
    elif array.ndim == 2:
        _print_single_block(array, format_type)
    
    else:
        print(f"Warning: Cannot display array with shape {array.shape}")
        print(f"Supported: 1D (1024 elements), 2D, or 4D arrays")
        print(f"First few values: {array.flatten()[:16]}")

def _print_single_block(block, format_type='decimal'):
    """Helper function to print a single 2D block"""
    # Determine the width needed for the largest number
    if format_type == 'hex':
        max_val = max(abs(np.max(block)), abs(np.min(block)))
        if max_val <= 0xF:
            width = 2
        elif max_val <= 0xFF:
            width = 3
        else:
            width = 4
    else:  # decimal
        max_width = max(len(str(np.max(block))), len(str(np.min(block))))
        width = max_width
    
    rows, cols = block.shape
    
    # Print column headers (every 4th column for readability)
    print("     ", end="")
    for c in range(0, min(cols, 32), 4):
        print(f"{c:>{width}}", end=" " * (width * 3 + 3))
    print()
    
    # Print the block with consistent spacing
    for r in range(min(rows, 32)):  # Limit to 32 rows for readability
        print(f"{r:2d}: ", end="")
        for c in range(min(cols, 32)):  # Limit to 32 cols for readability
            if format_type == 'hex':
                print(f"{block[r, c]:>{width}x}", end=" ")
            else:  # decimal
                print(f"{block[r, c]:>{width}d}", end=" ")
        print()  # New line after each row

def _print_4d_as_2d_grid(array_4d, format_type='decimal'):
    """Helper function to print 4D array as a 2D grid layout (4 blocks per row)"""
    dim0, dim1, dim2, dim3 = array_4d.shape
    print(f"Displaying as {dim0}x{dim1} grid of {dim2}x{dim3} blocks:")
    
    # Calculate width needed across all blocks
    if format_type == 'hex':
        max_val = max(abs(np.max(array_4d)), abs(np.min(array_4d)))
        if max_val <= 0xF:
            width = 2
        elif max_val <= 0xFF:
            width = 3
        else:
            width = 4
    else:  # decimal
        max_width = max(len(str(np.max(array_4d))), len(str(np.min(array_4d))))
        width = max_width
    
    # Print each row of blocks
    for i in range(dim0):  # For each row of blocks (0 to 3)
        print(f"\n=== Block Row {i} ===")
        
        # Print column headers for all 4 blocks in this row
        print("     ", end="")
        for j in range(dim1):  # For each block in this row (0 to 3)
            print(f"Block[{i}][{j}]", end=" " * (width * dim3 - 8))
            if j < dim1 - 1:  # Add separator between blocks
                print(" | ", end="")
        print()
        
        # Print column numbers for all blocks
        print("     ", end="")
        for j in range(dim1):
            for c in range(0, dim3, 4):
                print(f"{c:>{width}}", end=" " * (width * 3 + 3))
            if j < dim1 - 1:
                print(" | ", end="")
        print()
        
        # Print each row of data across all blocks
        for r in range(dim2):  # For each row within the 8x8 blocks
            print(f"{r:2d}: ", end="")
            
            for j in range(dim1):  # For each block in this row
                block = array_4d[i, j]
                
                # Print this row of the current block
                for c in range(dim3):
                    if format_type == 'hex':
                        print(f"{block[r, c]:>{width}x}", end=" ")
                    else:  # decimal
                        print(f"{block[r, c]:>{width}d}", end=" ")
                
                # Add separator between blocks (except for the last block)
                if j < dim1 - 1:
                    print(" | ", end="")
            
            print()  # New line after each row

def _print_single_2d_block(block, width, format_type='decimal'):
    """Helper function to print a single 2D block with given width"""
    rows, cols = block.shape
    
    # Print column headers (every 4th column for readability)
    print("     ", end="")
    for c in range(0, min(cols, 32), 4):
        print(f"{c:>{width}}", end=" " * (width * 3 + 3))
    print()
    
    # Print the block with consistent spacing
    for r in range(min(rows, 32)):
        print(f"{r:2d}: ", end="")
        for c in range(min(cols, 32)):
            if format_type == 'hex':
                print(f"{block[r, c]:>{width}x}", end=" ")
            else:  # decimal
                print(f"{block[r, c]:>{width}d}", end=" ")
        print()


ZIGZAG_DECODE_INDICES = np.array([
    (0,0), (1,0), (0,1), (0,2), (1,1), (2,0), (3,0), (2,1),
    (1,2), (0,3), (0,4), (1,3), (2,2), (3,1), (4,0), (5,0),
    (4,1), (3,2), (2,3), (1,4), (0,5), (0,6), (1,5), (2,4),
    (3,3), (4,2), (5,1), (6,0), (7,0), (6,1), (5,2), (4,3),
    (3,4), (2,5), (1,6), (0,7), (1,7), (2,6), (3,5), (4,4),
    (5,3), (6,2), (7,1), (7,2), (6,3), (5,4), (4,5), (3,6),
    (2,7), (3,7), (4,6), (5,5), (6,4), (7,3), (7,4), (6,5),
    (5,6), (4,7), (5,7), (6,6), (7,5), (7,6), (6,7), (7,7)
    ])

def decode_zigzag_4d(values_4d, zigzag_indices):
    """Decode zigzag for 4D array (4x4 grid of 8x8 blocks)"""
    decoded = np.zeros_like(values_4d)
    rows, cols = zigzag_indices.T
    
    # Apply zigzag decoding to each 8x8 block
    for i in range(values_4d.shape[0]):  # 4
        for j in range(values_4d.shape[1]):  # 4
            # Get the 8x8 block
            block = values_4d[i, j]
            # Decode the zigzag for this block
            decoded_block = np.zeros((8, 8), dtype=values_4d.dtype)
            decoded_block[rows, cols] = block.flatten()
            decoded[i, j] = decoded_block
    
    return decoded


def process_channels_combined(usb, Y, Cr, Cb, k=1):
    # Convert 2048x2048 channel arrays to 32x32 array of 64x64 pixel blocks
    Y_tiles = generate_tiles(Y)
    Cr_tiles = generate_tiles(Cr)
    Cb_tiles = generate_tiles(Cb)

    #print 32x32 array for each channel

    if DEBUG:
        print("Y Tiles Shape:", Y_tiles.shape)
        print("Cr Tiles Shape:", Cr_tiles.shape)
        print("Cb Tiles Shape:", Cb_tiles.shape)

        # print contents of each tile
        print_array_as_block(Y_tiles, "R", 0, 0, 'decimal')
        print_array_as_block(Cr_tiles, "G", 0, 0, 'decimal')
        print_array_as_block(Cb_tiles, "B", 0, 0, 'decimal')

    # show an imge of the image tile being sent (only one 32x32 tile is sent for debug),
    #  tiles are RGB, not YCrCb, show each channel with R, G or B color overaly
    if DEBUG:
        plt.figure(figsize=(10, 10))
        plt.subplot(1, 3, 1)
        #plt.imshow(Y_tiles[0, 0], cmap='gray')
        plt.imshow(Y_tiles[0, 0], cmap='gray')
        plt.title('R Tile')
        plt.axis('off')

        plt.subplot(1, 3, 2)
        plt.imshow(Cr_tiles[0, 0], cmap='gray')
        plt.title('G Tile')
        plt.axis('off')

        plt.subplot(1, 3, 3)
        plt.imshow(Cb_tiles[0, 0], cmap='gray')
        plt.title('B Tile')
        plt.axis('off')

        # Combined image
        combined_tile = np.zeros((TILE_SIZE, TILE_SIZE, 3), dtype=np.uint8)
        combined_tile[:, :, 0] = Y_tiles[0, 0]  # R channel
        combined_tile[:, :, 1] = Cr_tiles[0, 0]  # G channel
        combined_tile[:, :, 2] = Cb_tiles[0, 0]  # B channel
        plt.figure(figsize=(5, 5))
        plt.imshow(combined_tile)
        plt.title('Combined Tile')
        plt.axis('off')


        plt.show()


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

    img_byte_array = np.zeros((
            32 // 32,
            32 // 32,
            32 * 32 * 4,
        ),
        dtype=np.uint8,
    )

    # Calculate dimensions
    n_tiles_y, n_tiles_x = Y_output.shape[0:2]

    gradient_threshold_u16 = np.uint16(0xFFFF)  # Example threshold, adjust as needed
    laplacian_threshold_u16 = np.uint16(0xFFFF)  # Example threshold, adjust as needed

    # Create byte arrays for the thresholds
    gradient_threshold_bytes = np.array([gradient_threshold_u16 >> 8, gradient_threshold_u16 & 0xFF], dtype=np.uint8)
    laplacian_threshold_bytes = np.array([laplacian_threshold_u16 >> 8, laplacian_threshold_u16 & 0xFF], dtype=np.uint8)

    # Encode tiles as byte arrays
    # Insert G every 4th byte startnig at index 0 (ie 0, 3, 7, 11 ...)
    img_byte_array[:, :, 0::4] = Cr_formatted.reshape(32 // 32, 32 // 32, -1)
    # Insert R every 4th byte starting at index 1 (ie 1, 5, 9, 13 ...)
    img_byte_array[:, :, 1::4] = Y_formatted.reshape(32 // 32, 32 // 32, -1)
    # Insert B every 4th byte starting at index 2 (ie 2, 6, 10, 14 ...)
    img_byte_array[:, :, 2::4] = Cb_formatted.reshape(32 // 32, 32 // 32, -1)

    # Insert gradient and laplacian thresholds into the first 4 bytes of ALL tiles
    # Using broadcasting to set the values for all tiles at once
    img_byte_array[:, :, 3] = gradient_threshold_bytes[0]   # First byte of gradient threshold
    img_byte_array[:, :, 7] = gradient_threshold_bytes[1]   # Second byte of gradient threshold
    img_byte_array[:, :, 11] = laplacian_threshold_bytes[0] # First byte of laplacian threshold
    img_byte_array[:, :, 15] = laplacian_threshold_bytes[1] # Second byte of laplacian threshold

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
            txlen = usb.send(bytes(bytearray(img_byte_array[row][col])))
            total_bytes_sent += txlen

            #data_in_temp = usb.recv(txlen)
            data_array = np.frombuffer(usb.recv(txlen), dtype=np.uint8)
            
            if data_array[-1] == 0xFF:
                print(f"\nGot Lossy Tile")
                # Lossy tile
                decoded_id = 1
                # replace last two bytes with 0x0000
                modified_data = np.copy(data_array)
                modified_data[-2:] = 0x00
            else:
                print(f"\nGot Lossless Tile")
                # Lossless tile
                decoded_id = 0

            if decoded_id == 1:
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
                
                # Reshape to 32x32 blocks
                Y_values = Y_values.reshape(4, 4, 8, 8)
                Cr_values = Cr_values.reshape(4, 4, 8, 8)
                Cb_values = Cb_values.reshape(4, 4, 8, 8)

                if DEBUG:
                    print(f"\nRow: {row}, Col: {col}, Data Length: {len(data_array)}")
                    
                    # Print original data array as a compact block (if it's the right size)
                    if len(data_array) == 2048:  # Assuming this is your expected size
                        print(f"\nOriginal Data Array (first 32 hex values):")
                        for i in range(0, min(32, len(data_array))):
                            print(f"{data_array[i]:02x}", end=" ")
                            if (i + 1) % 16 == 0:
                                print()  # New line every 16 values
                        print("\n...")
                    
                    # Print combined data summary
                    print(f"\nCombined Data Length: {len(combined_data)}")
                    if len(combined_data) <= 32:
                        print(f"Combined Data (Hex): {[f'0x{x:08x}' for x in combined_data]}")
                    else:
                        print(f"Combined Data (first 8, hex): {[f'0x{x:08x}' for x in combined_data[:8]]}")
                    
                    # Print Y, Cr, Cb values as neat blocks
                    print_array_as_block(Y_values, "Y", row, col, 'decimal')
                    print_array_as_block(Cr_values, "Cr", row, col, 'decimal')
                    print_array_as_block(Cb_values, "Cb", row, col, 'decimal')

                    # Print maximum and minimum values of each array
                    print(f"Y Values Max: {np.max(Y_values)}, Min: {np.min(Y_values)}")
                    print(f"Cr Values Max: {np.max(Cr_values)}, Min: {np.min(Cr_values)}")
                    print(f"Cb Values Max: {np.max(Cb_values)}, Min: {np.min(Cb_values)}")

                    # print shape of each array
                    print(f"Y Values Shape: {Y_values.shape}")
                    print(f"Cr Values Shape: {Cr_values.shape}")
                    print(f"Cb Values Shape: {Cb_values.shape}")

                    # decode zigzaged data
                    zigzag_decoded_Y = decode_zigzag_4d(Y_values, ZIGZAG_DECODE_INDICES)
                    zigzag_decoded_Cr = decode_zigzag_4d(Cr_values, ZIGZAG_DECODE_INDICES)
                    zigzag_decoded_Cb = decode_zigzag_4d(Cb_values, ZIGZAG_DECODE_INDICES)

                    # Print zigzag decoded values (now these are 4D arrays)
                    print("\nZigzag Decoded Y Values:")
                    print_array_as_block(zigzag_decoded_Y, "Zigzag Y", row, col, 'decimal')
                    print("\nZigzag Decoded Cr Values:")
                    print_array_as_block(zigzag_decoded_Cr, "Zigzag Cr", row, col, 'decimal')
                    print("\nZigzag Decoded Cb Values:")
                    print_array_as_block(zigzag_decoded_Cb, "Zigzag Cb", row, col, 'decimal')
                    
                else:
                    print(f"\nGot Lossless Tile")


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

    # convert to RGB if not already
    if img_array.ndim == 2:  # Grayscale image
        img_array = cv2.cvtColor(img_array, cv2.COLOR_GRAY2RGB)
    elif img_array.shape[2] == 4:  # RGBA image
        img_array = cv2.cvtColor(img_array, cv2.COLOR_RGBA2RGB)
    elif img_array.shape[2] != 3:  # If not RGB, convert
        img_array = cv2.cvtColor(img_array, cv2.COLOR_BGR2RGB)

    #img_array = cv2.subtract(img_array, 5)
    #print(f"Image Shape: {img_array.shape}")

    # RGB to YCrCb
    '''imgYCC = cv2.cvtColor(img_array, cv2.COLOR_RGB2YCrCb)
    Y = imgYCC[:, :, 0]
    Cr = imgYCC[:, :, 1]
    Cb = imgYCC[:, :, 2]'''

    # Get each R, G and B channel
    R = img_array[:, :, 0].astype(np.uint8)
    G = img_array[:, :, 1].astype(np.uint8)
    B = img_array[:, :, 2].astype(np.uint8)

    # Process channels
    Y_processed, Cr_processed, Cb_processed = process_channels_combined(usb, R, G, B, k)

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
    image_path = "derg.jpg"  # Replace with your image path

    usb = USB_FTX232H_FT60X_sync245mode(device_to_open_list=
                                        (('FTX232H', 'USB <-> Serial Converter'),
                                         # firstly try to open FTX232H (FT232H or FT2232H) device named 'USB <-> Serial Converter'. Note that 'USB <-> Serial Converter' is the default name of FT232H or FT2232H chip unless the user has modified it. If the chip's name has been modified, you can use FT_Prog software to look up it.
                                         ('FT60X', 'FTDI SuperSpeed-FIFO Bridge'))
                                        # secondly try to open FT60X (FT600 or FT601) device named 'FTDI SuperSpeed-FIFO Bridge'. Note that 'FTDI SuperSpeed-FIFO Bridge' is the default name of FT600 or FT601 chip unless the user has modified it.
                                        )

    #create_interactive_display(image_path, usb)

    process_color_image(usb, image_path)

    #data_test(usb)


    usb.close()