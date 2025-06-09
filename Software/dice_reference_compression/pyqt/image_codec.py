import numpy as np
import cv2


def idct_vectorized(dct_blocks, k):
    # Magic matrices - don't touch! Used for IDCT and Dequantization
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

    Qd = np.array(
        [
            [1, 2, 1, 4, 2, 4, 4, 16],
            [2, 4, 4, 16, 4, 8, 2, 16],
            [1, 4, 2, 8, 1, 2, 2, 8],
            [8, 16, 4, 16, 8, 64, 8, 128],
            [2, 4, 2, 8, 128, 16, 8, 32],
            [4, 8, 8, 64, 16, 32, 8, 64],
            [2, 2, 2, 16, 16, 16, 8, 32],
            [8, 16, 16, 64, 32, 64, 32, 64]
        ], dtype=np.float32)
    

    dct_blocks = dct_blocks.astype(np.float32)
    Mdequantized = (dct_blocks * (Qd * k))

    # Get original shape (n_blocks_row, n_blocks_col, 8, 8)
    original_shape = Mdequantized.shape

    # Perform IDCT on all blocks at once
    temp = (T.T @ (Mdequantized.reshape(-1, original_shape[2], original_shape[3]).transpose(0, 2, 1)) @ T)

    # Clip values
    return np.maximum(np.minimum(temp.transpose(0, 2, 1).reshape(original_shape), 255), 0).astype(np.uint8)


def decode_zigzag(zigzag_data):
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

    # Get the original shape
    original_shape = zigzag_data.shape
    
    # Create output array with shape to hold 8x8 blocks
    # If input is (4, 4, 64), output should be (4, 4, 8, 8)
    decoded = np.zeros(original_shape[:-1] + (8, 8), dtype=zigzag_data.dtype)
    rows, cols = ZIGZAG_DECODE_INDICES.T
    
    # Apply zigzag decoding to each 8x8 block
    for i in range(zigzag_data.shape[0]):  # 4
        for j in range(zigzag_data.shape[1]):  # 4
            # Get the flattened 64-element block
            block_flat = zigzag_data[i, j]  # This is (64,) shape
            # Decode the zigzag for this block
            decoded_block = np.zeros((8, 8), dtype=zigzag_data.dtype)
            decoded_block[rows, cols] = block_flat
            decoded[i, j] = decoded_block
    
    return decoded


def decode_image_array(image, BLOCK_SIZE, N_BLOCKS, TILE_SIZE, k):
    # Convert global variables to local for improved loop performance
    BLOCK_SIZE_LOC = BLOCK_SIZE
    X_LOC = N_BLOCKS
    Y_LOC = N_BLOCKS
    TILE_SIZE_LOC = TILE_SIZE

    # Reshape and decode zigzag
    zigzag_decoded = decode_zigzag(image.reshape(X_LOC, Y_LOC, BLOCK_SIZE_LOC * BLOCK_SIZE_LOC))
    
    # Process all blocks at once
    idct_output = idct_vectorized(zigzag_decoded, k)

    return idct_output.transpose(0, 2, 1, 3).reshape(TILE_SIZE_LOC, TILE_SIZE_LOC)


def decode_lossless_tile(tile, BLOCK_SIZE, N_BLOCKS, TILE_SIZE):
    # Convert to local variable for performance
    BLOCK_SIZE_LOC = BLOCK_SIZE
    
    # Get the number of elements in the flattened tile
    #total_elements = tile.shape[1]
    
    # Calculate how many blocks are in this tile
    #blocks_per_channel = total_elements // (BLOCK_SIZE_LOC * BLOCK_SIZE_LOC)
    
    # Reshape the flattened tile to reveal the block structure
    # tile shape: (1, total_elements) -> (blocks_per_channel, BLOCK_SIZE, BLOCK_SIZE)
    blocks = tile.reshape(N_BLOCKS, N_BLOCKS, BLOCK_SIZE_LOC, BLOCK_SIZE_LOC)
    
    # Transpose each block to undo the original transpose
    # Original transpose swapped the last two dimensions, so we swap them back
    blocks_transposed = blocks.transpose(0, 1, 3, 2)
    
    # Reshape back to 2D tile
    return blocks_transposed.transpose(0, 2, 1, 3).reshape(TILE_SIZE, TILE_SIZE).astype(np.uint8)


def format_image_array(image_blocks, BLOCK_SIZE):
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

    return blocks.transpose(0, 1, 2, 4, 5, 3).reshape(n_blocks_x, n_blocks_y, 1, -1)


def generate_tiles(array, TILE_SIZE):
    # Ensure the first two dimensions are divisible by TILE_SIZE
    if array.shape[0] % TILE_SIZE != 0 or array.shape[1] % TILE_SIZE != 0:
        raise ValueError(f"First two dimensions must be divisible by TILE_SIZE ({TILE_SIZE})")
    
    # Calculate the number of tiles in each dimension
    H = array.shape[0] // TILE_SIZE
    W = array.shape[1] // TILE_SIZE
    
    # Reshape the array to (H, TILE_SIZE, W, TILE_SIZE, ...)
    reshaped = array.reshape((H, TILE_SIZE, W, TILE_SIZE) + array.shape[2:])
    
    # Transpose the array to (H, W, TILE_SIZE, TILE_SIZE, ...)
    transpose_indices = (0, 2, 1, 3)
    if len(array.shape) > 2:
        transpose_indices += tuple(range(4, 4 + len(array.shape) - 2))
    
    return reshaped.transpose(transpose_indices)


def resize_image(image, IMG_SIZE):

    # Get original image dimensions
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