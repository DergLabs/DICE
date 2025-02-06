import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
from matplotlib.widgets import TextBox
import matplotlib.gridspec as gridspec
import cv2
from USB_FTX232H_FT60X import USB_FTX232H_FT60X_sync245mode
import time

DEBUG = True
IMG_DIM = 64
LG_IMG_DIM = 2048
TILE_SIZE = 64
BLOCK_SIZE = 8

y_test = [
    0xA5, 0xC3, 0xFE, 0xBA, 0xAA, 0xCC, 0x45, 0x89,
    0x12, 0x56, 0x98, 0x54, 0xDD, 0xFF, 0xAB, 0xEF,
    0x78, 0xBC, 0x32, 0x98, 0x11, 0x33, 0x12, 0x56,
    0xDE, 0x12, 0x76, 0x32, 0x44, 0x66, 0x78, 0xBC,
    0x34, 0x78, 0x10, 0x76, 0x77, 0x99, 0xDE, 0x12,
    0x9A, 0xDE, 0x54, 0x10, 0xAA, 0xCC, 0x34, 0x78,
    0xF0, 0x34, 0x98, 0x54, 0xDD, 0xFF, 0x9A, 0xDE,
    0x56, 0x90, 0x32, 0x98, 0x11, 0x33, 0xF0, 0x34
]

cr_test = [
    0xB4, 0x56, 0xDC, 0x54, 0xBB, 0xFF, 0x67, 0xEF,
    0x34, 0x78, 0x76, 0x32, 0xEE, 0x33, 0xCD, 0x56,
    0x9A, 0x12, 0x10, 0x76, 0x22, 0x66, 0x34, 0xBC,
    0xF0, 0x34, 0x54, 0x10, 0x55, 0x99, 0x9A, 0x12,
    0x56, 0x90, 0x98, 0x54, 0x88, 0xCC, 0xF0, 0x78,
    0xBC, 0xAB, 0x32, 0x98, 0xBB, 0xFF, 0x56, 0x34,
    0x12, 0x34, 0x76, 0x54, 0xEE, 0x33, 0xBC, 0xCD,
    0x78, 0x90, 0x10, 0x98, 0x22, 0x33, 0x12, 0x34
]

cb_test = [
    0xA7, 0xB9, 0xC3, 0xD1, 0xE5, 0xF8, 0x84, 0x92,
    0xA1, 0xB4, 0xC7, 0xD2, 0xE6, 0xF9, 0x85, 0x93,
    0xA2, 0xB5, 0xC8, 0xD3, 0xE7, 0xFA, 0x86, 0x94,
    0xA3, 0xB6, 0xC9, 0xD4, 0xE8, 0xFB, 0x87, 0x95,
    0xA4, 0xB7, 0xCA, 0xD5, 0xE9, 0xFC, 0x88, 0x96,
    0xA5, 0xB8, 0xCB, 0xD6, 0xEA, 0xFD, 0x89, 0x97,
    0xA6, 0xB9, 0xCC, 0xD7, 0xEB, 0xFE, 0x8A, 0x98,
    0xA7, 0xBA, 0xCD, 0xD8, 0xEC, 0xFF, 0x8B, 0x99
]

def idct(dct_input, k):
    # Calculate combined transform matrix T
    # Magic Matrix - DONT FUCKIN TOUCH!
    T = np.array([
        [1, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 0, 0, 0, 0,-1,-1],
        [1, 1,-1,-1,-1,-1, 1, 1],
        [0, 0,-1, 0, 0, 1, 0, 0],
        [1,-1,-1, 1, 1,-1,-1, 1],
        [1,-1, 0, 0, 0, 0, 1,-1],
        [1,-1, 1,-1,-1, 1,-1, 1],
        [0, 0, 0,-1, 1, 0, 0, 0]
    ])
    D_values = np.array([0.3536, 0.5, 0.3536, 0.7071, 0.3536, 0.5, 0.3536, 0.7071])
    D = np.diag(D_values)

    # How about one more Magic Matrix - DONT FUCKIN TOUCH!
    Qd = np.array([
        [2, 2, 1, 4, 4, 8, 16, 32],
        [2, 4, 2, 8, 4, 16, 8, 16],
        [2, 2, 2, 8, 4, 8, 8, 16],
        [4, 8, 4, 16, 16, 32, 16, 32],
        [2, 4, 4, 16, 32, 16, 16, 16],
        [4, 8, 16, 16, 16, 32, 16, 32],
        [8, 8, 16, 32, 32, 32, 16, 32],
        [16, 32, 32, 32, 32, 32, 32, 32]
    ])

    Qdnew = Qd * k

    Mdequantized = np.rint(dct_input * Qdnew)  # Element-wise multiplication
    #print("After de-quantization")
    #print(Mdequantized)
    #B = np.rint((D.T @ Mdequantized @ D))
    B = Mdequantized
    #print("B value")
    #print(B)

    # Calculate final output (equivalent to MATLAB: Xout = clip(round(T' * B * T), 0, 255))
    final_out = T.T @ B @ T
    Xout = np.clip(np.round(final_out), 0, 255)

    return Xout


def quantize(data, k):
    # Magic Matrix
    Q = np.array([
        [16, 8, 8, 8, 32, 32, 64, 32],
        [8, 8, 8, 8, 16, 32, 64, 16],
        [16, 8, 16, 16, 64, 64, 64, 32],
        [8, 8, 16, 16, 32, 32, 64, 16],
        [16, 16, 32, 32, 64, 64, 128, 32],
        [16, 16, 32, 16, 64, 64, 128, 32],
        [64, 64, 128, 64, 128, 128, 128, 64],
        [32, 32, 64, 32, 64, 32, 64, 32]
    ])

    Q = Q * k # Multiply by k

    output = np.round(np.array(data) / Q) # Element-wise division
    return output


def format_data(original_data_array):
    # Reverse array order
    #data_array = original_data_array[::-1]
    '''data_array = original_data_array.copy()
    data = ""
    # Reverse byte order within each word
    for i in range(len(data_array)):
        data_array[i] = "".join(map(str.__add__, data_array[i][-2::-2], data_array[i][-1::-2]))

    #print("Reversed data array:")
    #print(data_array)

    # Create continuous data string
    for i in range(len(data_array)):
        data += data_array[i]

    return data'''
    # Convert to numpy array if not already
    data_array = np.array(original_data_array)

    # Vectorized reversal of byte pairs within each string
    char_arrays = np.array([list(s) for s in data_array])
    reversed_pairs = char_arrays.reshape(len(data_array), -1, 2)[:, :, ::-1]
    data_array = np.array([''.join(row.flatten()) for row in reversed_pairs])

    # Join all strings together
    data = ''.join(data_array)

    return data


def int16_to_hex_strings(arr):
    return np.vectorize(lambda x: f'{x:02x}')(arr)


def convert_to_hex_values(data):
    # Convert bytes to numpy array
    data = np.frombuffer(data, dtype=np.uint8)

    # Ensure even length by truncating if necessary
    data_length = len(data) - (len(data) % 2)
    data = data[:data_length]

    # Reshape into pairs of bytes
    pairs = data.reshape(-1, 2)

    # Perform bit operations on whole array
    # Left shift second byte and combine with first byte
    values = (pairs[:, 1].astype(np.uint16) << 8) | pairs[:, 0].astype(np.uint16)

    # Convert to hex strings
    hex_values = np.array([format(v & 0xFFFF, '04X') for v in values])

    return hex_values


def process_hex_array(hex_array, output_rows, output_cols):
    # Convert hex strings to array of characters (2 chars per byte)
    hex_chars = np.array([list(s) for s in hex_array.flatten()])
    hex_chars = hex_chars.reshape(-1, 4)  # reshape to group 4 chars together (2 bytes)

    # Convert pairs of hex chars to integers
    high_bytes = np.array([int(h, 16) for h in [''.join(pair) for pair in hex_chars[:, :2]]])
    low_bytes = np.array([int(h, 16) for h in [''.join(pair) for pair in hex_chars[:, 2:]]])

    # Convert to signed bytes
    high_bytes = np.where(high_bytes > 127, high_bytes - 256, high_bytes)
    low_bytes = np.where(low_bytes > 127, low_bytes - 256, low_bytes)

    # Interleave high and low bytes
    result = np.empty(len(high_bytes) * 2, dtype=np.int8)
    result[::2] = high_bytes
    result[1::2] = low_bytes

    return result.reshape(output_rows, output_cols)


def decode_data(original_data_array):
    # Reverse byte order within each word
    for i in range(len(original_data_array)):
        original_data_array[i] = "".join(map(str.__add__, original_data_array[i][-2::-2], original_data_array[i][-1::-2]))

    # Split into left and right arrays and reshape to 16x4
    left_temp = []
    right_temp = []
    for row in range(16):  # Changed from 8 to 16
        start_idx = row * 8
        left_temp.extend(original_data_array[start_idx:start_idx + 4])
        right_temp.extend(original_data_array[start_idx + 4:start_idx + 8])

    # Convert to 2D arrays
    left_array = np.array(left_temp).reshape(16, 4)  # Changed from 8x4 to 16x4
    right_array = np.array(right_temp).reshape(16, 4)  # Changed from 8x4 to 16x4

    # Split left array into even and odd rows
    left_even = left_array[0::2]  # Select even rows
    left_odd = left_array[1::2]   # Select odd rows

    # Split right array into even and odd rows
    right_even = right_array[0::2]  # Select even rows
    right_odd = right_array[1::2]   # Select odd rows


    # Process even rows of left array
    result_left_even = np.zeros((8, 8), dtype=np.int8)
    for i in range(8):
        for j in range(4):
            hex_val = left_even[i][j]
            high_byte = int(hex_val[:2], 16)
            low_byte = int(hex_val[2:], 16)

            if high_byte > 127:
                high_byte -= 256
            if low_byte > 127:
                low_byte -= 256

            result_left_even[i][j * 2] = high_byte
            result_left_even[i][j * 2 + 1] = low_byte

    # Process odd rows of left array
    result_left_odd = np.zeros((8, 8), dtype=np.int8)
    for i in range(8):
        for j in range(4):
            hex_val = left_odd[i][j]
            high_byte = int(hex_val[:2], 16)
            low_byte = int(hex_val[2:], 16)

            if high_byte > 127:
                high_byte -= 256
            if low_byte > 127:
                low_byte -= 256

            result_left_odd[i][j * 2] = high_byte
            result_left_odd[i][j * 2 + 1] = low_byte

    # Process even rows of right array
    result_right_even = np.zeros((8, 8), dtype=np.int8)
    for i in range(8):
        for j in range(4):
            hex_val = right_even[i][j]
            high_byte = int(hex_val[:2], 16)
            low_byte = int(hex_val[2:], 16)

            if high_byte > 127:
                high_byte -= 256
            if low_byte > 127:
                low_byte -= 256

            result_right_even[i][j * 2] = high_byte
            result_right_even[i][j * 2 + 1] = low_byte

    # return all arrays
    return result_left_even, result_left_odd, result_right_even


def combine_channels(Y, Cr, Cb, block_size=8):
    """
    Combines 8x8 Y, Cr, Cb arrays into hex strings with format: 00|Y|Cr|Cb
    """
    # Create empty 8x8 array to store hex strings
    combined = np.empty((block_size, block_size), dtype='<U8')

    # Convert arrays to integers and ensure they're within 0-255 range
    Y = np.clip(Y, 0, 255).astype(np.uint8)
    Cr = np.clip(Cr, 0, 255).astype(np.uint8)
    Cb = np.clip(Cb, 0, 255).astype(np.uint8)

    # Convert to hex strings
    y_hex = int16_to_hex_strings(Y.flatten()).reshape(block_size, block_size)
    cr_hex = int16_to_hex_strings(Cr.flatten()).reshape(block_size, block_size)
    cb_hex = int16_to_hex_strings(Cb.flatten()).reshape(block_size, block_size)

    # Vectorized string concatenation
    combined = np.core.defchararray.add('00', np.core.defchararray.add(y_hex, np.core.defchararray.add(cr_hex, cb_hex)))
    return combined


def separate_channels(decoded_arrays):
    """Separates decoded arrays back into Y, Cr, Cb channels"""
    left_even, left_odd, right_even, _ = decoded_arrays

    # These are our Y, Cr, and Cb values respectively
    Y = left_even
    Cr = left_odd
    Cb = right_even

    return Y, Cr, Cb


def generate_tiles(image):
    # Split image into 4d array of 64x64 blocks
    strips = np.split(image, image.shape[0] // TILE_SIZE, axis=0)

    # For each strip, split along columns
    blocks = [np.split(strip, image.shape[1] // TILE_SIZE, axis=1) for strip in strips]

    # Convert to numpy array
    tiled_image = np.array(blocks)

    return tiled_image


def decode_image_array(image, BLOCK_SIZE):
    #breakpoint()
    # convert 1x4096 array into 8x1x1x512 shape
    reshaped_image = image.reshape(8, 1, 1, -1)

    #breakpoint()

    # convert 8x1x1x512 into 8x8x1x64 shape
    block_image = reshaped_image.reshape(8, 8, 1, -1)

    #breakpoint()

    # convert 8x8x1x64 into 8x8x8x8 shape
    transposed_image = block_image.reshape(8, 8, 8, 8)

    #breakpoint()

    idct_image = np.zeros((8, 8, 8, 8), dtype=np.float32)

    for row in range(transposed_image.shape[0]):
        for col in range(transposed_image.shape[1]):
            idct_image[row, col] = idct(transposed_image[row, col], 1)

    #breakpoint()

    # Untranspose each 8x8 block
    #untransposed_image = np.transpose(transposed_image, (0, 1, 3, 2))

    #test = image.reshape(8,8)
    #test_idct = idct(test, 1)

    #return test_idct

    # Convert to 64x64 image
    final_image = np.zeros((64, 64), dtype=np.uint8)
    for i in range(8):
        for j in range(8):
            final_image[i * 8:(i + 1) * 8, j * 8:(j + 1) * 8] = idct_image[i, j]

    #breakpoint()

    return final_image


def encode_image_array(image):
    # Split into 2D Array of 8x8 blocks
    #if DEBUG:
        #print(f"Image Shape: {image.shape}")
    x_size, y_size = image.shape
    x_size = int(x_size / BLOCK_SIZE)
    y_size = int(y_size / BLOCK_SIZE)

    strips = np.split(image, image.shape[0] // BLOCK_SIZE, axis=0)

    # For each strip, split along columns
    blocks = [np.split(strip, image.shape[1] // BLOCK_SIZE, axis=1) for strip in strips]

    # Convert to numpy array
    tiled_image = np.array(blocks)

    # transpose each 8x8 block
    # flatten each 8x8 block, new matrix should be 4d with shape (8, 8, 1, 64
    flattened_block_image = np.transpose(tiled_image, (0, 1, 3, 2)).reshape((x_size, y_size, 1, -1))

    # Concatenate the matrices in each row (combines the 1x64 vectors into 1x128)
    concatenated_image = flattened_block_image.reshape(x_size, -1)

    # Reshape to get the desired # Rowsx1x1x128 shape
    final_image = concatenated_image.reshape(y_size, 1, 1, -1)

    # convert final 4d matrix into 1d array, concatenate each row
    final_1d = concatenated_image.flatten()

    return final_1d


def convert_4d_to_2d(matrix_4d, block_size, h, w):
    """Convert a 4D matrix of blocks back to a 2D matrix"""
    return matrix_4d.transpose(0, 2, 1, 3).reshape(h, w)


def process_channels_combined(usb, Y, Cr, Cb, k=1):

    # Convert 2048x2048 channel arrays to 32x32 array of 64x64 pixel blocks
    Y_tiles = generate_tiles(Y)
    Cr_tiles = generate_tiles(Cr)
    Cb_tiles = generate_tiles(Cb)

    img_w,img_h,tile_w,tile_h = Y_tiles.shape
    if DEBUG:
        print("Generated Tiles")
        print(Y_tiles.shape)
        print(Cr_tiles.shape)
        print(Cb_tiles.shape)
        print(f"Img W: {img_w}, Img H: {img_h}, Tile W: {tile_w}, Tile H: {tile_h}")


    # For each tile, encode into 32x32 array of 1x4096 hex strings
    Y_formatted = np.zeros((img_w,img_h,1,tile_w*tile_h), dtype=np.uint8)
    Cr_formatted = np.zeros((img_w,img_h,1,tile_w*tile_h), dtype=np.uint8)
    Cb_formatted = np.zeros((img_w,img_h,1,tile_w*tile_h), dtype=np.uint8)

    Y_recieved = np.zeros((img_w,img_h,1,tile_w*tile_h), dtype=np.float32)
    Cr_recieved = np.zeros((img_w,img_h,1,tile_w*tile_h), dtype=np.float32)
    Cb_recieved = np.zeros((img_w,img_h,1,tile_w*tile_h), dtype=np.float32)

    # reshape 32x32x64x64 array into 1x1024x64x64 array
    #Y_tiles = Y_tiles.reshape(-1, tile_w, tile_h)
    #Cr_tiles = Cr_tiles.reshape(-1, tile_w, tile_h)
    #Cb_tiles = Cb_tiles.reshape(-1, tile_w, tile_h)

    if DEBUG:
        print("Reshaped Tiles")
        print(Y_tiles.shape)
        print(Cr_tiles.shape)
        print(Cb_tiles.shape)

    print("Encoding...")
    for row in range(img_w):
        for col in range(img_h):
            Y_formatted[row,col] = encode_image_array(Y_tiles[row,col])
            Cr_formatted[row,col] = encode_image_array(Cr_tiles[row,col])
            Cb_formatted[row,col] = encode_image_array(Cb_tiles[row,col])
            

    if DEBUG:
        print("Formatted Y")
        print(Y_formatted.shape)
        print("Formatted Cr")
        print(Cr_formatted.shape)
        print("Formatted Cb")
        print(Cb_formatted.shape)

    data_out = bytearray(4096*4)
    #data_in = np.array((32,32,1,4096), dtype=str)
    #data_in = []
    Y_output = np.zeros((Y_tiles.shape[0], Y_tiles.shape[1], Y_tiles.shape[2], Y_tiles.shape[3]), dtype=np.uint8)
    Cr_output = np.zeros((Cr_tiles.shape[0], Cr_tiles.shape[1], Cr_tiles.shape[2], Cr_tiles.shape[3]), dtype=np.uint8)
    Cb_output = np.zeros((Cb_tiles.shape[0], Cb_tiles.shape[1], Cb_tiles.shape[2], Cb_tiles.shape[3]), dtype=np.uint8)
    print("Sending...")

    for row in range(Y_formatted.shape[0]):
        for col in range(Y_formatted.shape[1]):
            # Convert to hex strings
            Y_values = Y_formatted[row, col]
            Cr_values = Cr_formatted[row, col]
            Cb_values = Cb_formatted[row, col]

            for i in range(Y_values.shape[1]):
                data_out[(i*4)+1] = Y_values[0][i]
                data_out[(i*4)] = Cr_values[0][i]
                data_out[(i*4)+2] = Cb_values[0][i]
                data_out[(i*4)+3] = 0
                
            # send data
            txlen = usb.send(bytes(data_out))
            #data_in[row][col] = usb.recv(txlen)
            data_in_temp = usb.recv(txlen)

            data_in_temp_2 = np.zeros(len(data_in_temp), dtype=np.int8)

            for i in range(len(data_in_temp)):
                hex_str = format(data_in_temp[i] & 0xFF, '02X')
                data_in_temp_2[i] = int.from_bytes(bytes.fromhex(hex_str), signed=True)

            #data_in.append(data_in_temp_2)
            

            for i in range(Y_values.shape[1]):
                Y_recieved[row][col][0][i] = data_in_temp_2[(i*4)]
                Cr_recieved[row][col][0][i] = data_in_temp_2[(i*4)+3]
                Cb_recieved[row][col][0][i] = data_in_temp_2[(i*4)+1]

            #breakpoint()

            Y_decoded = decode_image_array(Y_recieved[row, col][0], BLOCK_SIZE)
            Cr_decoded = decode_image_array(Cr_recieved[row, col][0], BLOCK_SIZE)
            Cb_decoded = decode_image_array(Cb_recieved[row, col][0], BLOCK_SIZE)

            #breakpoint()

            Y_output[row,col] = Y_decoded
            Cr_output[row, col] = Cr_decoded
            Cb_output[row, col] = Cb_decoded


    Y_final = np.zeros((2048, 2048), dtype=np.uint8)
    Cr_final = np.zeros((2048, 2048), dtype=np.uint8)
    Cb_final = np.zeros((2048, 2048), dtype=np.uint8)
    for i in range(32):
        for j in range(32):
            Y_final[i * 64:(i + 1) * 64, j * 64:(j + 1) * 64] = Y_output[i, j]
            Cr_final[i * 64:(i + 1) * 64, j * 64:(j + 1) * 64] = Cr_output[i, j]
            Cb_final[i * 64:(i + 1) * 64, j * 64:(j + 1) * 64] = Cb_output[i, j]

    #Y_final = Y_output.reshape((Y_output.shape[0] * Y_output.shape[2], Y_output.shape[1] * Y_output.shape[3]))
    #Cr_final = Cr_output.reshape((Cr_output.shape[0] * Cr_output.shape[2], Cr_output.shape[1] * Cr_output.shape[3]))
    #Cb_final = Cb_output.reshape((Cb_output.shape[0] * Cb_output.shape[2], Cb_output.shape[1] * Cb_output.shape[3]))

    print("Received...")
    #print(data_in[0])

    #Y_final = 0
    #Cr_final = 0
    #Cb_final = 0
    return Y_final, Cr_final, Cb_final


def resize_image(image):
    """Pad image dimensions to either 1024x1024 or 2048x2048 depending on input size"""
    h, w = image.shape[:2]  # Works for both 2D and 3D arrays

    # Determine target size based on which is closer
    target_1024 = 1024
    target_2048 = 2048

    # Calculate differences from both target sizes
    diff_1024 = abs(h - target_1024) + abs(w - target_1024)
    diff_2048 = abs(h - target_2048) + abs(w - target_2048)

    # Choose target size based on which is closer
    target_size = target_1024 if diff_1024 < diff_2048 else target_2048

    # Resize image
    resized_image = cv2.resize(image, (target_size, target_size))

    return resized_image


def process_color_image(usb, image_path, k=1):
    # Read color image
    img = Image.open(image_path)
    img_array = np.array(img)
    print(f"Image Shape: {img_array.shape}")
    # Pad image to multiple of 64
    img_array = resize_image(img_array)
    print(f"Image Shape: {img_array.shape}")

    # RGB to YCrCb
    imgYCC = cv2.cvtColor(img_array, cv2.COLOR_RGB2YCrCb)
    Y = imgYCC[:, :, 0]
    Cr = imgYCC[:, :, 1]
    Cb = imgYCC[:, :, 2]


    # Process channels
    Y_processed, Cr_processed, Cb_processed = process_channels_combined(usb, Y, Cr, Cb, k)

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

    image_path = "img5_md.jpg"  # Replace with your image path

    usb = USB_FTX232H_FT60X_sync245mode(device_to_open_list =
        (('FTX232H', 'USB <-> Serial Converter'   ),           # firstly try to open FTX232H (FT232H or FT2232H) device named 'USB <-> Serial Converter'. Note that 'USB <-> Serial Converter' is the default name of FT232H or FT2232H chip unless the user has modified it. If the chip's name has been modified, you can use FT_Prog software to look up it.
         ('FT60X'  , 'FTDI SuperSpeed-FIFO Bridge'))           # secondly try to open FT60X (FT600 or FT601) device named 'FTDI SuperSpeed-FIFO Bridge'. Note that 'FTDI SuperSpeed-FIFO Bridge' is the default name of FT600 or FT601 chip unless the user has modified it.
    )

    create_interactive_display(image_path, usb)

    #process_color_image(usb, image_path, k=1)

    #process_channels_combined(usb, y_test, cr_test, cb_test)

    '''data_out = bytearray(64*4)
    for i in range(64):
        data_out[(i*4)+1] = y_test[i]
        data_out[(i*4)] = cr_test[i]
        data_out[(i*4)+2] = cb_test[i]
        data_out[(i*4)+3] = 0
        
    # send data
    txlen = usb.send(bytes(data_out))
    #data_in[row][col] = usb.recv(txlen)
    data_in_temp = usb.recv(txlen)

    data_in_temp_2 = np.zeros(len(data_in_temp), dtype=np.int8)

    for i in range(len(data_in_temp)):
        hex_str = format(data_in_temp[i] & 0xFF, '02X')
        print(hex_str)
        data_in_temp_2[i] = int.from_bytes(bytes.fromhex(hex_str), signed=True)
    
    Y_recieved = np.zeros((1,64), dtype=np.float32)
    Cr_recieved = np.zeros((1,64), dtype=np.float32)
    Cb_recieved = np.zeros((1,64), dtype=np.float32)

    for i in range(64):
        Y_recieved[0][i] = data_in_temp_2[(i*4)]
        Cr_recieved[0][i] = data_in_temp_2[(i*4)+3]
        Cb_recieved[0][i] = data_in_temp_2[(i*4)+1]

    breakpoint()

    Y_decoded = decode_image_array(Y_recieved, BLOCK_SIZE)
    Cr_decoded = decode_image_array(Cr_recieved, BLOCK_SIZE)
    Cb_decoded = decode_image_array(Cb_recieved, BLOCK_SIZE)

    breakpoint()'''

    '''Y_output[row,col] = Y_decoded
    Cr_output[row, col] = Cr_decoded
    Cb_output[row, col] = Cb_decoded


    Y_final = Y_output.reshape((Y_output.shape[0] * Y_output.shape[2], Y_output.shape[1] * Y_output.shape[3]))
    Cr_final = Cr_output.reshape((Cr_output.shape[0] * Cr_output.shape[2], Cr_output.shape[1] * Cr_output.shape[3]))
    Cb_final = Cb_output.reshape((Cb_output.shape[0] * Cb_output.shape[2], Cb_output.shape[1] * Cb_output.shape[3]))'''

    usb.close()