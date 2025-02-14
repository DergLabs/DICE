from collections import defaultdict
import heapq
import numpy as np
from dahuffman import HuffmanCodec
import lzss_loc


def generate_zigzag_pattern(size=16):
    """Generate zigzag pattern indices for square matrix of given size."""
    pattern = np.zeros((size * size, 2), dtype=np.int32)
    pos = 0

    for i in range(2 * size - 1):
        if i % 2 == 0:  # upward diagonal
            row = min(i, size - 1)
            col = max(0, i - size + 1)
            while row >= 0 and col < size:
                pattern[pos] = [row, col]
                pos += 1
                row -= 1
                col += 1
        else:  # downward diagonal
            col = min(i, size - 1)
            row = max(0, i - size + 1)
            while col >= 0 and row < size:
                pattern[pos] = [row, col]
                pos += 1
                row += 1
                col -= 1

    return pattern


def zigzag_scan(block, ZIGZAG_PATTERN):
    """Apply zigzag scanning to a 16x16 block using pre-computed pattern."""
    return block[ZIGZAG_PATTERN[:, 0], ZIGZAG_PATTERN[:, 1]]


def rle_encode(arr):
    """
    Perform Run-Length Encoding on a numpy array.

    Args:
        arr (numpy.ndarray): Input array to encode

    Returns:
        tuple: (values, lengths) where values are the unique elements
               and lengths are their consecutive counts
    """
    # Ensure input is a numpy array
    arr = np.asarray(arr)

    # Find indices where elements change
    diff = np.concatenate(([True], arr[1:] != arr[:-1], [True]))
    change_indices = np.where(diff)[0]

    # Get the values and calculate lengths
    values = arr[change_indices[:-1]]
    lengths = change_indices[1:] - change_indices[:-1]

    return values, lengths


def optimize_lzss_data(compressed_data):
    """Apply RLE on compressed data using numpy arrays"""
    # Convert bytes to numpy array
    data_array = np.frombuffer(compressed_data, dtype=np.uint8)

    # Apply RLE using numpy
    values, lengths = rle_encode(data_array)

    optimized = []
    for v, l in zip(values, lengths):
        if l > 3 and l <= 255:  # Only use RLE for runs between 4 and 255
            optimized.extend([0xFE, v, l])  # Special marker for RLE
        elif l > 255:
            # Break up long runs into multiple chunks of 255
            while l > 0:
                chunk = min(255, l)
                optimized.extend([0xFE, v, chunk])
                l -= chunk
        else:
            # For short runs, just repeat the value
            optimized.extend([v] * l)

    return bytes(optimized)


def optimize_zigzag_data(zigzagged_data):
    """Apply RLE before LZSS to better handle repeated values."""
    values, lengths = rle_encode(np.array(zigzagged_data))
    optimized = []

    for v, l in zip(values, lengths):
        # Ensure value is in valid byte range by offsetting from -127 to 127 into 0 to 255
        v_byte = (int(v) + 127) & 0xFF

        # Handle the length to ensure it stays within byte range
        if l > 3 and l <= 255:  # Only use RLE for runs between 4 and 255
            optimized.extend([0xFE, v_byte, l])  # Special marker for RLE
        elif l > 255:
            # Break up long runs into multiple chunks of 255
            while l > 0:
                chunk = min(255, l)
                optimized.extend([0xFE, v_byte, chunk])
                l -= chunk
        else:
            # For short runs, just repeat the value
            optimized.extend([v_byte] * l)

    return bytes(optimized)  # Ensure we return bytes object

def find_similar_blocks(input_array, threshold=0.9):
    """Group similar blocks to improve compression."""
    block_dict = defaultdict(list)
    for i in range(input_array.shape[0]):
        for j in range(input_array.shape[1]):
            block = input_array[i][j]
            # Create block hash/signature
            signature = hash(block.tobytes())
            block_dict[signature].append((i, j))

    return block_dict


def process_array(input_array):
    """Process a 128x128x16x16 array with values from -127 to 127."""
    total_blocks = input_array.shape[0] * input_array.shape[1]

    # Generate pattern once
    ZIGZAG_PATTERN = generate_zigzag_pattern(input_array.shape[2])

    # Process each block separately
    block_data = []  # Store processed data for each block
    all_optimized_data = []  # Collect all optimized data for Huffman table generation

    # First pass: process all blocks and collect data for Huffman encoding
    for i in range(input_array.shape[0]):
        for j in range(input_array.shape[1]):
            block = input_array[i][j]

            # Step 1: Zigzag scan this block
            zigzagged = zigzag_scan(block, ZIGZAG_PATTERN)

            # Step 2: RLE on this block
            rle_data = optimize_zigzag_data(zigzagged)

            # Step 3: LZSS on this block
            compressed = lzss_loc.compress(bytes(rle_data))

            # Step 4: RLE after LZSS
            optimized = optimize_lzss_data(compressed)

            # Store block's processed data
            block_data.append((zigzagged, rle_data, compressed, optimized))
            all_optimized_data.extend(optimized)

    # Generate Huffman table from all processed blocks
    codec = HuffmanCodec.from_data(all_optimized_data)

    # Second pass: Huffman encode each block
    final_encoded_blocks = []
    total_original_size = 0
    total_rle_size = 0
    total_lzss_size = 0
    total_final_size = 0

    # Process each block with the common Huffman table
    for zigzagged, rle_data, compressed, optimized in block_data:
        encoded_block = codec.encode(optimized)
        final_encoded_blocks.append(encoded_block)

        # Accumulate sizes for statistics
        total_original_size += len(zigzagged)
        total_rle_size += len(rle_data)
        total_lzss_size += len(compressed)
        total_final_size += len(encoded_block)

    # Print statistics
    print(f"Average block sizes:")
    print(f"Original: {total_original_size / len(block_data):.2f}")
    print(f"After first RLE: {total_rle_size / len(block_data):.2f}")
    print(f"After LZSS: {total_lzss_size / len(block_data):.2f}")
    print(f"Final encoded: {total_final_size / len(block_data):.2f}")
    print(f"Huffman Table size: {len(codec.get_code_table())}")

    # Calculate value distribution for first zigzag step
    value_counts = defaultdict(int)
    for zigzagged, _, _, _ in block_data:
        for val in zigzagged:
            value_counts[val] += 1

    # Print most common values
    sorted_counts = sorted(value_counts.items(), key=lambda x: x[1], reverse=True)
    most_common = sorted_counts[:5]
    print("Most common values:", most_common)

    # Return total size (including Huffman table)
    return total_final_size + len(codec.get_code_table())