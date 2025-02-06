import numpy as np
import time

DEBUG = False
IMG_DIM = 64
LG_IMG_DIM = 2048
TILE_SIZE = 64
BLOCK_SIZE = 8
np.set_printoptions(threshold=np.inf)


def format_data(data):
    x,y = data.shape
    hex_data = np.array(data.astype(np.uint8).data.hex(), dtype=str)
    hex_data = hex_data.reshape(x,y)
    print(f"Hex Data Dtype: {hex_data.dtype}")
    print(f"Hex Data: {hex_data}")
    #x, y = data.shape
    #data_array = bytes(original_data_array).hex()
    #print(f"Data Array: {data_array}")
    #data_array = np.array([bytes(data).hex() for x in data.flatten()])
    #data_array = np.array(data_array, dtype=str)
    #data_array = data_array.reshape(x, y)
    return hex_data


def encode_image_array(image, BLOCK_SIZE):
    # Split into 2D Array of 8x8 blocks
    x_size, y_size = image.shape
    x_size = int(x_size / 8)
    y_size = int(y_size / 8)
    if DEBUG:
        print(f"X Size: {x_size}")
        print(f"Y Size: {y_size}")

    strips = np.split(image, image.shape[0] // BLOCK_SIZE, axis=0)

    # For each strip, split along columns
    blocks = [np.split(strip, image.shape[1] // BLOCK_SIZE, axis=1) for strip in strips]

    # Convert to numpy array
    tiled_image = np.array(blocks)

    #tiled_image = np.array(tiled_image)

    if DEBUG:
        print(f"Tiled Image shape: {tiled_image.shape}")
        print(f"Tiled Image row length: {tiled_image.shape[0]}")
        print(f"Tiled Image column length: {tiled_image.shape[1]}")
        print(f"Tile Shape: {tiled_image[0][0].shape}")
        save_4d_matrix(tiled_image, 'tiled_image.txt')

    # transpose each 8x8 block
    transposed_image = np.transpose(tiled_image, (0, 1, 3, 2))
    if DEBUG:
        save_4d_matrix(transposed_image, 'transposed_image.txt')

    # flatten each 8x8 block, new matrix should be 4d with shape (8, 8, 1, 64
    flattened_block_image = transposed_image.reshape((x_size, y_size, 1, -1))
    if DEBUG:
        print(f"Flattened Block Image shape: {flattened_block_image.shape}")
        save_4d_matrix(flattened_block_image, 'flattened_block_image.txt')

    # Concatenate the matrices in each row (combines the 1x64 vectors into 1x128)
    concatenated_image = flattened_block_image.reshape(x_size, -1)
    # Reshape to get the desired # Rowsx1x1x128 shape
    final_image = concatenated_image.reshape(y_size, 1, 1, -1)
    if DEBUG:
        print(f"Final Image shape: {final_image.shape}")
        save_4d_matrix(final_image, 'flattened_image.txt')

    # convert final 4d matrix into 1d array, concatenate each row
    final_1d = concatenated_image.flatten()
    if DEBUG:
        print(f"Final 1D array shape: {final_1d.shape}")
        #print(f"Final 1D array:\n {final_1d}")

    return final_1d


def decode_image_array(image, BLOCK_SIZE):
    # convert 1x4096 array into 8x1x1x512 shape
    reshaped_image = image.reshape(8, 1, 1, -1)
    if DEBUG:
        print(f"Reshaped Image shape: {reshaped_image.shape}")
        save_4d_matrix(reshaped_image, 'decode_reshaped_image.txt')

    # convert 8x1x1x512 into 8x8x1x64 shape
    block_image = reshaped_image.reshape(8, 8, 1, -1)
    if DEBUG:
        print(f"Block Image shape: {block_image.shape}")
        save_4d_matrix(block_image, 'decode_block_image.txt')

    # convert 8x8x1x64 into 8x8x8x8 shape
    transposed_image = block_image.reshape(8, 8, 8, 8)
    if DEBUG:
        print(f"Transposed Image shape: {transposed_image.shape}")
        save_4d_matrix(transposed_image, 'decode_transposed_image.txt')



    # Untranspose each 8x8 block
    untransposed_image = np.transpose(transposed_image, (0, 1, 3, 2))
    if DEBUG:
        print(f"Untransposed Image shape: {untransposed_image.shape}")
        save_4d_matrix(untransposed_image, 'decode_untransposed_image.txt')

    # Convert to 64x64 image
    final_image = np.zeros((64, 64), dtype=np.uint8)
    for i in range(8):
        for j in range(8):
            final_image[i * 8:(i + 1) * 8, j * 8:(j + 1) * 8] = untransposed_image[i, j]
    if DEBUG:
        print(f"Final Image shape: {final_image.shape}")
        #print(f"Final Image:\n {final_image}")

    return final_image


def save_4d_matrix(matrix, filename):
    with open(filename, 'w') as f:
        d1, d2, d3, d4 = matrix.shape

        # Calculate the maximum width needed for numbers
        max_width = len(str(int(np.max(abs(matrix)))))
        num_format = f'{{:{max_width}d}}'  # Dynamic width format string

        # For each row of matrices
        for i in range(d1):
            # For each row within the 2D matrices
            for k in range(d3):
                # For each matrix in this row
                for j in range(d2):
                    # If this is the first row of a matrix, add opening bracket
                    if k == 0:
                        if j == 0:
                            f.write('[[')
                        else:
                            f.write(' [')
                    # Otherwise add proper indentation
                    else:
                        if j == 0:
                            f.write('  ')
                        else:
                            f.write('   ')

                    # Write the row data with fixed-width formatting
                    numbers = [num_format.format(int(x)) for x in matrix[i, j, k, :]]
                    row_str = '[' + ', '.join(numbers) + ']'
                    f.write(row_str)

                    # Add proper separator
                    if j < d2 - 1:
                        f.write('  ')
                    elif k < d3 - 1:
                        f.write(',\n')
                    else:
                        if i < d1 - 1:
                            f.write(']],\n\n')
                        else:
                            f.write(']]')


def generate_tiles(image):
    # Split image into 4d array of 64x64 blocks
    strips = np.split(image, image.shape[0] // TILE_SIZE, axis=0)

    # For each strip, split along columns
    blocks = [np.split(strip, image.shape[1] // TILE_SIZE, axis=1) for strip in strips]

    # Convert to numpy array
    tiled_image = np.array(blocks)

    return tiled_image


def single_test():
    # Create example 64x64 image, 8b
    image = np.random.randint(0, 255, (IMG_DIM, IMG_DIM), dtype=np.uint8)
    print(f"Image shape: {image.shape}")
    print(f"Image dtype: {image.dtype}")
    if DEBUG:
        print(f"Image Array:\n {image}")

    # Generate 1D array from 2D image
    start_time = time.time()
    encoded_image = encode_image_array(image, BLOCK_SIZE)
    end_time = time.time()
    print(f"Image 1D shape: {encoded_image.shape}")
    print(f"Processing Time (us): {(end_time - start_time) * 1e6}")
    return encoded_image, image


def mutli_test():
    # Create new 2048x2048 image
    imageY = np.random.randint(0, 255, (LG_IMG_DIM, LG_IMG_DIM), dtype=np.uint8)
    imageCr = np.random.randint(0, 255, (LG_IMG_DIM, LG_IMG_DIM), dtype=np.uint8)
    imageCb = np.random.randint(0, 255, (LG_IMG_DIM, LG_IMG_DIM), dtype=np.uint8)

    start_time = time.time()
    imageY_hex = format_data(imageY)
    imageCr_hex = format_data(imageCr)
    imageCb_hex = format_data(imageCb)

    # concatenate each element in the 3 arrays, add "00" to the start of each element in the final array
    image_hex = ["00" + imageY_hex[i] + imageCr_hex[i] + imageCb_hex[i] for i in range(len(imageY_hex))]
    image = np.array(image_hex).reshape(LG_IMG_DIM, LG_IMG_DIM)
    end_time = time.time()
    print(f"Image shape: {image.shape}")
    print(f"Processing Time (ms): {(end_time - start_time) * 1e3}")

    print(f"Large Image shape: {image.shape}")

    image_tiled = generate_tiles(image)
    print(f"Large Image shape after tiling: {image_tiled.shape}")

    # Process each tile in the image
    start_time = time.time()
    # Create empty 4d array that is 32x32x1x4096
    processed_image = np.zeros((LG_IMG_DIM // TILE_SIZE, LG_IMG_DIM // TILE_SIZE, 1, TILE_SIZE * TILE_SIZE), dtype=np.uint8)
    decoded_processed_image = np.zeros((LG_IMG_DIM // TILE_SIZE, LG_IMG_DIM // TILE_SIZE, TILE_SIZE, TILE_SIZE))
    for i in range(image_tiled.shape[0]):
        for j in range(image_tiled.shape[1]):
            if DEBUG: print(f"Input Image shape: {image_tiled[i][j].shape}")
            tile = encode_image_array(image_tiled[i][j], BLOCK_SIZE)
            if DEBUG: print(f"Tile shape: {tile.shape}")
            decoded_tile = decode_image_array(tile, BLOCK_SIZE)
            if DEBUG: print(f"Decoded Tile shape: {decoded_tile.shape}")
            # Add row to processed image
            processed_image[i][j] = tile
            decoded_processed_image[i][j] = decoded_tile

    print(f"Encoded Image Shape after running loop: {processed_image.shape}")
    save_4d_matrix(processed_image, 'encoded_image.txt')

    print(f"Decoded Image shape after running loop: {decoded_processed_image.shape}")
    save_4d_matrix(decoded_processed_image, 'decoded_image.txt')

    end_time = time.time()
    print(f"Processed Image shape: {decoded_processed_image.shape}")
    print(f"Processing Time for {LG_IMG_DIM}x{LG_IMG_DIM} image (ms): {(end_time - start_time) * 1e3}")
    print(f"Images are equal: {np.array_equal(decoded_processed_image, image_tiled)}")


if __name__ == "__main__":
    '''encoded_output, original = single_test()
    decoded_output = decode_image_array(encoded_output, BLOCK_SIZE)
    print(f"Decoded Image shape: {decoded_output.shape}")
    print(f"Decoded Image: {decoded_output}")
    # check if each element in the decoded image is equal to the original image
    print(f"Images are equal: {np.array_equal(decoded_output, original)}")'''
    #mutli_test()

    data = np.array([  6,   0,   1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 0,   0,   0,   0,   0,   1,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   7, 55,   0,   0,   0,   0,   0,   0,   0,   0,   1,   0,   0,   0,  0,   0,   1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  11, 255,  0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   1,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  11,   1, 255,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0,   1,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   8,   1,   0,   0,  0,   0,   0,   0,   0,   0,   1,   0,   0,   0,   0,   0,   0, 55,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   1,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   7,   1, 255,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   4,   1, 255,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   4,   0, 255,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   5, 255,   0,   1,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   7, 255,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   1,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,  10, 255, 255,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,  11,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0, 255,   1,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   1,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   9,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  8,   1, 255,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   5,  1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   4,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   6,   0,   1,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   7, 255,   0,   0,  0,   0,   0,   0,   0,   0,   1,   0,   0,   0,   0,   0,   1,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,  11, 255,   0,   0,   0,  0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,  11,   1, 255,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 55,   0,   0,   0,   0,   0,   0,   0,   1,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   8,   1,   0,   0,   0,   0,   0,  0,   0,   0,   1,   0,   0,   0,   0,   0,   0, 255,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   7,   1, 255,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   4,   1, 255,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   4,   0, 255,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   5, 255,   0,   1,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   7, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   1,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 10, 255, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  11,  0, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0, 255,   1,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   1,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   9,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   8,   1, 255,  0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   5,   1,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   4,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   6,   0,   1,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   1,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   7, 255,   0,   0,   0,   0,   0,  0,   0,   0,   1,   0,   0,   0,   0,   0,   1,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,  11, 255,   0,   0,   0,   0,   0,   0, 55,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   1,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,  11,   1, 255,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   0,   0,  0,   0,   0,   0,   0,   1,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   8,   1,   0,   0,   0,   0,   0,   0,   0,   0,  1,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   1,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   7,   1, 255,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   4,   1, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  4,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   5, 55,   0,   1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   7, 255,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  10, 255, 255,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,  11,   0, 255,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 55,   1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   9,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   8,   1, 255,   0,   0,   0,  0,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   5,   1,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   4,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   6,   0,   1,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   1,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   7, 255,   0,   0,   0,   0,   0,   0,   0,   0,  1,   0,   0,   0,   0,   0,   1,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,  11, 255,   0,   0,   0,   0,   0,   0, 255,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   1,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,  11,   1, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0, 255,   0,   0,   0,   0,   0,  0,   0,   1,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  8,   1,   0,   0,   0,   0,   0,   0,   0,   0,   1,   0,   0,  0,   0,   0,   0, 255,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   1,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   7,  1, 255,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   4,   1, 55,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   4,   0, 255,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   5, 255,   0,   1,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   7, 255,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   1,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,  10, 255, 255,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,  11,   0, 255,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0, 255,   1,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   1,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   9,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   8,   1, 255,   0,   0,   0,   0,   0, 255,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   5,   1,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   4,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,  0], dtype=np.uint8)

    data_o = decode_image_array(data, BLOCK_SIZE)

    breakpoint()
