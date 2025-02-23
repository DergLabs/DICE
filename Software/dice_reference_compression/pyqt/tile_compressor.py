from collections import defaultdict
import numpy as np
from dahuffman import HuffmanCodec
import struct
import json


def generate_zigzag_pattern(size=8):
    """Generate zigzag pattern indices for square matrix of given size."""
    pattern = np.zeros((size * size, 2), dtype=np.int32)
    pos = 0
    for i in range(2 * size - 1):
        if i % 2 == 0:
            row = min(i, size - 1)
            col = max(0, i - size + 1)
            while row >= 0 and col < size:
                pattern[pos] = [row, col]
                pos += 1
                row -= 1
                col += 1
        else:
            col = min(i, size - 1)
            row = max(0, i - size + 1)
            while col >= 0 and row < size:
                pattern[pos] = [row, col]
                pos += 1
                row += 1
                col -= 1
    return pattern


def zigzag_scan(block, ZIGZAG_PATTERN):
    """Apply zigzag scanning to a block using pre-computed pattern."""
    return block[ZIGZAG_PATTERN[:, 0], ZIGZAG_PATTERN[:, 1]]


def inverse_zigzag_scan(zigzagged, size, ZIGZAG_PATTERN):
    """Convert zigzag scanned array back to 2D block."""
    block = np.zeros((size, size), dtype=zigzagged.dtype)
    block[ZIGZAG_PATTERN[:, 0], ZIGZAG_PATTERN[:, 1]] = zigzagged[:size * size]
    return block


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


def rle_decode_int16(data):
    """Decode RLE-encoded int16 data."""
    if isinstance(data, list):
        data = bytes(data)

    decoded = []
    i = 0
    while i < len(data):
        if data[i] == 0xFE:  # Run of repeated values
            value = struct.unpack('<h', data[i + 1:i + 3])[0]  # Read int16 value
            length = data[i + 3]
            decoded.extend([value] * length)
            i += 4  # marker(1) + value(2) + length(1)
        elif data[i] == 0xFF:  # Literal sequence
            length = data[i + 1]
            values = struct.unpack(f'<{length}h', data[i + 2:i + 2 + length * 2])
            decoded.extend(values)
            i += 2 + length * 2  # marker(1) + length(1) + values(length*2)
        else:
            i += 1

    return np.array(decoded, dtype=np.int16)


def write_compressed_channels(channel_data, filename):
    """Write all three channels to a single compressed file."""
    with open(filename, 'wb') as f:
        total_size = 0
        for huffman_table, encoded_blocks in channel_data:
            # Convert encoded blocks to bytes
            encoded_data = b''.join(encoded_blocks)

            # Serialize Huffman table
            huffman_bytes = serialize_huffman_table(huffman_table)

            # Write sizes
            f.write(struct.pack('<I', len(huffman_bytes)))  # table size
            f.write(struct.pack('<I', len(encoded_data)))  # data size

            # Write data
            f.write(huffman_bytes)
            f.write(encoded_data)

            total_size += 8 + len(huffman_bytes) + len(encoded_data)

        return total_size / 1024  # Return size in KB


def serialize_huffman_table(codec):
    """Convert Huffman table to a more compact serializable format."""
    code_table = codec.get_code_table()

    # Only store values that actually appear in the data
    # Filter out entries with frequency 1 that were artificially added
    compact_table = {
        k: v for k, v in code_table.items()
        if isinstance(k, int) and v[0] > 0  # Only keep byte values with non-zero length codes
    }

    # Convert to a more compact format
    # Instead of storing full table, store:
    # 1. List of values (bytes)
    # 2. List of bit lengths
    # 3. List of codes
    values = []
    bit_lengths = []
    codes = []

    for value, (bits, code) in compact_table.items():
        values.append(value)
        bit_lengths.append(bits)
        codes.append(code)

    # Create compact representation
    compact_data = {
        'values': values,
        'lengths': bit_lengths,
        'codes': codes
    }

    return json.dumps(compact_data).encode('utf-8')


def deserialize_huffman_table(huffman_bytes):
    """Reconstruct Huffman table from compact format."""
    table_data = json.loads(huffman_bytes.decode('utf-8'))

    # Reconstruct the code table
    reconstructed_table = {}
    for value, length, code in zip(
            table_data['values'],
            table_data['lengths'],
            table_data['codes']
    ):
        reconstructed_table[int(value)] = (length, code)

    return HuffmanCodec(reconstructed_table)


def process_array(input_array, channel_data=None):
    """Process a NxMx8x8 array of DCT coefficients with optimized Huffman encoding."""
    block_size = input_array.shape[2]
    ZIGZAG_PATTERN = generate_zigzag_pattern(block_size)

    block_data = []
    all_encoded_data = bytearray()

    # First pass: process all blocks
    for i in range(input_array.shape[0]):
        for j in range(input_array.shape[1]):
            block = input_array[i][j].astype(np.int16)
            zigzagged = zigzag_scan(block, ZIGZAG_PATTERN)
            encoded = rle_encode_int16(zigzagged)
            block_data.append(encoded)
            all_encoded_data.extend(encoded)

    # Count actual frequencies
    frequencies = defaultdict(int)
    for b in all_encoded_data:
        frequencies[b] += 1

    # Generate Huffman table only for actually used bytes
    codec = HuffmanCodec.from_frequencies(frequencies)

    # Second pass: Huffman encode
    final_encoded_blocks = []
    for encoded in block_data:
        huffman_encoded = codec.encode(encoded)
        final_encoded_blocks.append(huffman_encoded)

    # If we're collecting channel data, add this channel
    if channel_data is not None:
        channel_data.append((codec, final_encoded_blocks))

    total_size = (8 + len(b''.join(final_encoded_blocks)) +
                  len(serialize_huffman_table(codec))) / 1024
    return total_size, codec, final_encoded_blocks


def read_compressed_channels(filename):
    """Read all three channels from a single compressed file."""
    channels_data = []
    with open(filename, 'rb') as f:
        for _ in range(3):  # Y, Cr, Cb
            # Read sizes
            table_size = struct.unpack('<I', f.read(4))[0]
            data_size = struct.unpack('<I', f.read(4))[0]

            # Read and deserialize Huffman table
            huffman_bytes = f.read(table_size)
            codec = deserialize_huffman_table(huffman_bytes)

            # Read encoded data
            encoded_data = f.read(data_size)
            channels_data.append((codec, [encoded_data]))

    return channels_data


def decompress_array(codec, encoded_blocks, original_shape, ZIGZAG_PATTERN=None):
    """Decompress encoded data back to original array.

    Args:
        codec: HuffmanCodec instance for decoding
        encoded_blocks: List of encoded data blocks or single encoded data block
        original_shape: Shape of the original array (height, width, block_size)
        ZIGZAG_PATTERN: Pre-computed zigzag pattern (optional)
    """
    if ZIGZAG_PATTERN is None:
        ZIGZAG_PATTERN = generate_zigzag_pattern(original_shape[2])

    block_size = original_shape[2]
    result = np.zeros(original_shape, dtype=np.int16)

    # Handle both list of blocks and single block formats
    if len(encoded_blocks) == 1:
        # Single block of data from read_compressed_channels
        huffman_decoded = codec.decode(encoded_blocks[0])
        num_blocks = original_shape[0] * original_shape[1]

        # Process each block's worth of data
        offset = 0
        for block_idx in range(num_blocks):
            i, j = block_idx // original_shape[1], block_idx % original_shape[1]

            try:
                # Extract and process the block from the continuous data
                block_data = huffman_decoded[offset:]

                # RLE decode to int16 values
                decoded = rle_decode_int16(block_data)

                # Track how many bytes were consumed
                offset += len(block_data)

                # Ensure correct size
                if len(decoded) < block_size * block_size:
                    decoded = np.pad(decoded, (0, block_size * block_size - len(decoded)))

                # Undo zigzag
                block = inverse_zigzag_scan(decoded, block_size, ZIGZAG_PATTERN)
                result[i, j] = block

            except Exception as e:
                print(f"Error processing block {block_idx}: {e}")
                continue
    else:
        # Multiple blocks format from original compression
        for block_idx in range(len(encoded_blocks)):
            i, j = block_idx // original_shape[1], block_idx % original_shape[1]

            try:
                # Huffman decode
                huffman_decoded = codec.decode(encoded_blocks[block_idx])


                # RLE decode to int16 values
                decoded = rle_decode_int16(huffman_decoded)

                # Ensure correct size
                if len(decoded) < block_size * block_size:
                    decoded = np.pad(decoded, (0, block_size * block_size - len(decoded)))

                # Undo zigzag
                block = inverse_zigzag_scan(decoded, block_size, ZIGZAG_PATTERN)
                result[i, j] = block

            except Exception as e:
                print(f"Error processing block {block_idx}: {e}")
                continue

    return result


def verify_compression(input_array, channel_data=None):
    """Process array and verify decompression matches input."""
    # Ensure input is int16
    input_array = input_array.astype(np.int16)

    # Compress
    size, codec, encoded_blocks = process_array(input_array, channel_data)

    # Decompress
    decompressed = decompress_array(codec, encoded_blocks, input_array.shape)

    # Verify
    is_equal = np.array_equal(input_array, decompressed)
    max_diff = np.max(np.abs(input_array - decompressed))

    print(f"Compression successful: {is_equal}")
    print(f"Maximum difference: {max_diff}")
    print(f"Compressed size: {size:.2f} KB")

    return size, decompressed
