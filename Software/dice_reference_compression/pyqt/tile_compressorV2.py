import constriction
import numpy as np
import os
import struct


def int16_to_bytes(values):
    """Convert array of int16 values to bytes."""
    return bytearray(np.array(values).tobytes())
    #return struct.pack(f'<{len(values)}h', *values)


def bytes_to_int16(data):
    """Convert bytes back to int16 values."""
    return np.array(struct.unpack(f'<{len(data) // 2}h', data), dtype=np.int16)


def rle_encode_int16(data):
    """RLE encoding for int16 values."""
    if not isinstance(data, np.ndarray):
        data = np.array(data, dtype=np.int16)

    encoded = bytearray()
    i = 0
    while i < len(data):
        # Count repeating values
        run_length = 1
        while (i + run_length < len(data) and
               data[i] == data[i + run_length] and
               run_length < 255):
            run_length += 1

        if run_length > 3:  # Run of 4 or more same values
            encoded.append(0xFE)  # Run marker
            encoded.extend(int16_to_bytes([data[i]]))  # Value
            encoded.append(run_length)  # Length
            i += run_length
        else:  # Handle non-repeating or short repeating sequences
            # Look ahead for next potential run
            non_run_length = 1
            while (i + non_run_length < len(data) and
                   (i + non_run_length + 1 >= len(data) or
                    data[i + non_run_length] != data[i + non_run_length + 1] or
                    non_run_length >= 255)):
                non_run_length += 1

            # Write literal sequence
            encoded.append(0xFF)  # Literal marker
            encoded.append(non_run_length)  # Length
            encoded.extend(int16_to_bytes(data[i:i + non_run_length]))  # Values
            i += non_run_length

    return bytes(encoded)


def zigzag_order_matrix(matrix):
    """
    Takes an 8x8 2D NumPy matrix and returns an 8x8 matrix with elements
    reordered in a zigzag pattern from top left to bottom right.
    
    Args:
        matrix: An 8x8 NumPy array
        
    Returns:
        An 8x8 NumPy array with elements ordered in zigzag pattern
    """
    # Check if input matrix is 8x8
    if matrix.shape != (8, 8):
        raise ValueError("Input matrix must be 8x8")
    
    # Create a new matrix to store the zigzag ordered elements
    result = np.zeros((8, 8), dtype=matrix.dtype)
    
    # Zigzag pattern coordinates generator
    def zigzag_indices():
        # Start at top-left corner
        row, col = 0, 0
        yield row, col
        
        # Move through all diagonals
        for diagonal in range(1, 2 * 8 - 1):
            # Moving up-right on even diagonals, down-left on odd diagonals
            if diagonal % 2 == 1:
                # Start at the left edge or top edge
                if diagonal < 8:
                    row, col = diagonal, 0
                else:
                    row, col = 7, diagonal - 7
                
                # Move up and right until we hit an edge
                while row >= 0 and col < 8:
                    yield row, col
                    row -= 1
                    col += 1
            else:
                # Start at the top edge or right edge
                if diagonal < 8:
                    row, col = 0, diagonal
                else:
                    row, col = diagonal - 7, 7
                
                # Move down and left until we hit an edge
                while row < 8 and col >= 0:
                    yield row, col
                    row += 1
                    col -= 1
    
    # Fill the result matrix using the zigzag pattern
    for idx, (r, c) in enumerate(zigzag_indices()):
        result[idx // 8, idx % 8] = matrix[r, c]
    
    return result


# Compressed 4D Tile array using ANS encoding from constrition library, returns size in KB of compressed file, compressed data
def compress_tile(tile_array, tile_type=None):

    #print(f"Tile Array before ZigZag:\n {tile_array[0][0]}")
    '''rle = []
    # Apply ZigZag to each 8x8 block
    for i in range(tile_array.shape[0]):
        for j in range(tile_array.shape[1]):
            tile_array[i][j] = zigzag_order_matrix(tile_array[i][j])
            rle.append(rle_encode_int16(tile_array[i][j].flatten()))
    
    print(f"Tile Array after ZigZag:\n {tile_array[0][0]}")

    # RLE each 8x8 block


    print(f"Tile Array after ZigZag:\n {tile_array[0][0]}")'''


    #print(f"Tile Array Shape: {tile_array.shape}")

    # Convert 32x32 tile to 4x4x8x8 
    tile_array = np.reshape(tile_array, (4, 4, 8, 8))

    # Zigzag order each 8x8 block
    for row in range(tile_array.shape[0]):
        for col in range(tile_array.shape[1]):
            tile_array[row][col] = zigzag_order_matrix(tile_array[row][col])

    image_array = tile_array.flatten()
    
    #print(f"Image Array Dtype: {image_array.dtype}")
    #print(f"Image Array Shape: {image_array.shape}")

    # Get min and max values of tile
    M_min = np.min(image_array)
    M_max = np.max(image_array)

    if M_min == M_max:
        # Add a small delta to max to ensure a valid range
        M_max = M_min + 1

    #print(f"Min: {M_min}, Max: {M_max}")

    image_arrayL = image_array.tolist()
    # create a new ANS model
    entropy_model = constriction.stream.model.QuantizedGaussian(M_min, M_max, 0, 1) # Min, Max, Mean, Std. Dev
    encoder = constriction.stream.stack.AnsCoder()
    encoder.encode_reverse(image_array, entropy_model)
    compressed_data = encoder.get_compressed().tobytes()
    data_size = len(compressed_data) / 1024
    model_params = np.array([M_min, M_max, 0, 1], dtype=np.int16).tobytes()
    model_size = len(model_params)

    #print("Compressed data size: ", data_size, "KB")
    #print("Model size: ", model_size, "Bytes")


    #return data_size, compressed_data, entropy_model
    return data_size, compressed_data, model_params


# Saves compressed data to a file, return true if successful, false otherwise
def save_compressed_data(data, model, filename):
    try:
        #print(f"Current working directory: {os.getcwd()}")
        filepath = os.path.abspath(filename)
        #print(f"Attempting to save to: {filepath}")
        
        # Check if model is a NumPy array and convert it to bytes
        if isinstance(model, np.ndarray):
            model_bytes = model.tobytes()
        else:
            model_bytes = model
            
        # Ensure data is also in bytes format
        if isinstance(data, np.ndarray):
            data_bytes = data.tobytes()
        else:
            data_bytes = data
            
        # Now concatenate the bytes objects
        combined_data = b'\x01' + model_bytes + b'\x02' + data_bytes
        
        # Write to file
        with open(filepath, 'wb') as f:
            f.write(combined_data)
            
        print(f"Successfully saved to: {filepath}")
        return True
        
    except Exception as e:
        print(f"Error saving file {filename}: {e}")
        import traceback
        traceback.print_exc()
        return False

    
# read compressed data from file, return compressed data, else return None
def read_compressed_data(filename):
    try:
        # First check if the file exists
        if not os.path.exists(filename):
            print(f"Error: File {filename} does not exist")
            return None
        
        with open(filename, 'rb') as f:
            data = f.read()
            
        # Check if data is empty
        if not data:
            print(f"Warning: File {filename} is empty")
            return None
            
        return data
    except Exception as e:
        print(f"Error reading file {filename}: {e}")
        return None
    

# Decode compressed data, return 4D tile array
def decompress_tile(data):
    if data is None:
        print("Error: No data to decompress")
        return None
        
    # Find model and data start
    model_start = data.find(b'\x01')
    if model_start == -1:
        print("Error: Invalid data format - cannot find model start marker")
        return None
        
    model_start += 1
    model_end = data.find(b'\x02')
    if model_end == -1:
        print("Error: Invalid data format - cannot find model end marker")
        return None
        
    model = data[model_start:model_end]
    compressed_data = data[model_end + 1:]

    # Get min and max values of tile
    try:
        # Convert the model bytes back to a NumPy array
        model_array = np.frombuffer(model, dtype=np.int16)
        M_min = model_array[0]
        M_max = model_array[1]
        M_mean = model_array[2]
        M_std = model_array[3]
    except IndexError:
        print("Error: Model data is incomplete or corrupted")
        return None

    # Create a new ANS model
    try:
        entropy_model = constriction.stream.model.QuantizedGaussian(M_min, M_max, M_mean, M_std)
        decoder = constriction.stream.stack.AnsCoder(compressed_data)
        image_array = decoder.decoder.decode(entropy_model)    
        # Reshape 1D array to 4D tile array
        tile = np.reshape(image_array, (64, 64, 32, 32))
        return tile
    except Exception as e:
        print(f"Error during decompression: {e}")
        return None


# Saves all 3 channels as 1 file, inserts identifier to indicate start of each channel
def save_channels(Y_compressed, Y_model, Cr_compressed, Cr_model, Cb_compressed, Cb_model, filename):
    try:
        #print(f"Current working directory: {os.getcwd()}")
        filepath = os.path.abspath(filename)
        #print(f"Attempting to save to: {filepath}")
        
        # Convert all inputs to bytes if they are NumPy arrays
        def ensure_bytes(data):
            if isinstance(data, np.ndarray):
                return data.tobytes()
            return data
            
        Y_model_bytes = ensure_bytes(Y_model)
        Y_compressed_bytes = ensure_bytes(Y_compressed)
        Cr_model_bytes = ensure_bytes(Cr_model)
        Cr_compressed_bytes = ensure_bytes(Cr_compressed)
        Cb_model_bytes = ensure_bytes(Cb_model)
        Cb_compressed_bytes = ensure_bytes(Cb_compressed)
        
        # Concatenate all bytes objects
        combined_data = (b'\x01' + Y_model_bytes + b'\x02' + Y_compressed_bytes + 
                         b'\x03' + Cr_model_bytes + b'\x04' + Cr_compressed_bytes + 
                         b'\x05' + Cb_model_bytes + b'\x06' + Cb_compressed_bytes)
        
        # Write to file
        with open(filepath, 'wb') as f:
            f.write(combined_data)
            
        print(f"Successfully saved to: {filepath}")
        return combined_data, len(combined_data) / 1024
        
    except Exception as e:
        print(f"Error saving file {filename}: {e}")
        import traceback
        traceback.print_exc()
        return None, 0
    

# read compressed data from file, return compressed data, else return None
def read_channels(filename):
    try:
        # First check if the file exists
        if not os.path.exists(filename):
            print(f"Error: File {filename} does not exist")
            return None
        
        with open(filename, 'rb') as f:
            data = f.read()
            
        # Check if data is empty
        if not data:
            print(f"Warning: File {filename} is empty")
            return None
            
        return data
    except Exception as e:
        print(f"Error reading file {filename}: {e}")
        return None

       
# Decode compressed data, return 4D tile array
def decode_channels(data):
    if data is None:
        print("Error: No data to decode")
        return None, None, None
        
    # Check all markers are present
    required_markers = [b'\x01', b'\x02', b'\x03', b'\x04', b'\x05', b'\x06']
    for marker in required_markers:
        if data.find(marker) == -1:
            print(f"Error: Missing required marker {marker}")
            return None, None, None
    
    # Find model and data start
    Y_model_start = data.find(b'\x01') + 1
    Y_model_end = data.find(b'\x02')
    Y_model = data[Y_model_start:Y_model_end]
    Y_compressed = data[Y_model_end + 1:data.find(b'\x03')]
    
    Cr_model_start = data.find(b'\x03') + 1
    Cr_model_end = data.find(b'\x04')
    Cr_model = data[Cr_model_start:Cr_model_end]
    Cr_compressed = data[Cr_model_end + 1:data.find(b'\x05')]
    
    Cb_model_start = data.find(b'\x05') + 1
    Cb_model_end = data.find(b'\x06')
    Cb_model = data[Cb_model_start:Cb_model_end]
    Cb_compressed = data[Cb_model_end + 1:]
    
    try:
        # Create and decode Y channel
        Y_entropy_model = constriction.stream.model.QuantizedGaussian()
        Y_entropy_model.set_from_bytes(Y_model)
        Y_decoder = constriction.stream.stack.AnsCoder(Y_compressed)
        Y_image_array = Y_decoder.decoder.decode(Y_entropy_model)    
        Y_tile = np.reshape(Y_image_array, (64, 64, 32, 32))
        
        # Create and decode Cr channel
        Cr_entropy_model = constriction.stream.model.QuantizedGaussian()
        Cr_entropy_model.set_from_bytes(Cr_model)
        Cr_decoder = constriction.stream.stack.AnsCoder(Cr_compressed)
        Cr_image_array = Cr_decoder.decoder.decode(Cr_entropy_model)    
        Cr_tile = np.reshape(Cr_image_array, (64, 64, 32, 32))
        
        # Create and decode Cb channel
        Cb_entropy_model = constriction.stream.model.QuantizedGaussian()
        Cb_entropy_model.set_from_bytes(Cb_model)
        Cb_decoder = constriction.stream.stack.AnsCoder(Cb_compressed)
        Cb_image_array = Cb_decoder.decoder.decode(Cb_entropy_model)    
        Cb_tile = np.reshape(Cb_image_array, (64, 64, 32, 32))
        
        return Y_tile, Cr_tile, Cb_tile
    except Exception as e:
        print(f"Error during channel decoding: {e}")
        return None, None, None

