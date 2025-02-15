import numpy as np

# Magic matrices - don't touch! Used for IDCT and Dequantization
T = np.array(
    [
        [1, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 0, 0, 0, 0, -1, -1],
        [1, 1, -1, -1, -1, -1, 1, 1],
        [0, 0, -1, 0, 0, 1, 0, 0],
        [1, -1, -1, 1, 1, -1, -1, 1],
        [1, -1, 0, 0, 0, 0, 1, -1],
        [1, -1, 1, -1, -1, 1, -1, 1],
        [0, 0, 0, -1, 1, 0, 0, 0],
    ],
    dtype=np.int16,
)

Qd = np.array(
    [
        [2, 2, 1, 4, 4, 8, 16, 32],
        [2, 4, 2, 8, 4, 16, 8, 16],
        [2, 2, 2, 8, 4, 8, 8, 16],
        [4, 8, 4, 16, 16, 32, 16, 32],
        [2, 4, 4, 16, 32, 16, 16, 16],
        [4, 8, 16, 16, 16, 32, 16, 32],
        [8, 8, 16, 32, 32, 32, 16, 32],
        [16, 32, 32, 32, 32, 32, 32, 32],
    ],
    dtype=np.int16,
)

# Qd = Qd * 0.125


def idct_vectorized(dct_blocks):
    # Dequantization - broadcasting handles multiple blocks
    Mdequantized = dct_blocks * (Qd * 1)

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


def generate_tiles(image, TILE_SIZE):
    # Calculate dimensions
    h, w = image.shape
    TILE_SIZE_LOC = TILE_SIZE
    n_tiles_h = h // TILE_SIZE_LOC
    n_tiles_w = w // TILE_SIZE_LOC

    # Reshape directly to tiles using a single operation
    # Reshape to (n_tiles_h, TILE_SIZE, n_tiles_w, TILE_SIZE) then transpose to get desired order
    tiled_image = image.reshape(
        n_tiles_h, TILE_SIZE_LOC, n_tiles_w, TILE_SIZE_LOC
    ).transpose(0, 2, 1, 3)

    return tiled_image


def decode_image_array(image, BLOCK_SIZE, N_BLOCKS, TILE_SIZE):
    # Convert global variables to local for improved loop performance
    BLOCK_SIZE_LOC = BLOCK_SIZE
    X_LOC = N_BLOCKS
    Y_LOC = N_BLOCKS
    TILE_SIZE_LOC = TILE_SIZE

    # Reshape input to blocks
    tile_blocks = image.reshape(X_LOC, Y_LOC, BLOCK_SIZE_LOC, BLOCK_SIZE_LOC)

    # Process all blocks at once
    idct_output = idct_vectorized(tile_blocks)

    # Reshape to final image
    final_image = (
        idct_output.transpose(0, 2, 1, 3)
        .reshape(TILE_SIZE_LOC, TILE_SIZE_LOC)
        .astype(np.uint8)
    )

    return final_image


def format_image_array(image_blocks, BLOCK_SIZE):
    # Convert global variables to local for improved loop performance
    BLOCK_SIZE_LOC = BLOCK_SIZE
    # Calculate dimensions
    n_blocks_x, n_blocks_y = image_blocks.shape[0:2]

    # Reshape directly to blocks
    blocks = image_blocks.reshape(
        n_blocks_x,
        n_blocks_y,
        image_blocks.shape[2] // BLOCK_SIZE_LOC,
        BLOCK_SIZE_LOC,
        image_blocks.shape[3] // BLOCK_SIZE_LOC,
        BLOCK_SIZE_LOC,
    )

    # Rearrange dimensions to get blocks in correct order and transpose each 8x8 block
    # The last two dimensions (3, 5) represent the rows and columns of each 8x8 block
    # By swapping them in the transpose operation, we transpose each 8x8 block
    blocks = blocks.transpose(0, 1, 2, 4, 5, 3)

    # Flatten the block dimensions
    flattened = blocks.reshape(n_blocks_x, n_blocks_y, 1, -1)

    return flattened
