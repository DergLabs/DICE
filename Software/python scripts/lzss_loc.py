from typing import Final, Optional, Tuple

from bitarray import bitarray


MATCH_LENGTH_MASK: Final[int] = 0xF
WINDOW_SIZE: Final[int] = 0x400
IS_MATCH_BIT: Final[bool] = True

# We only consider substrings of length 2 and greater, and just
# output any substring of length 1 (9 bits uncompressed is better than a 17-bit
# reference for the flag, distance, and length)
# Since lengths 0 and 1 are unused, we can encode lengths 2-17 in only 4 bits.
LENGTH_OFFSET: Final[int] = 2

def compress(data: bytes) -> bytes:
    output_buffer = bitarray(endian="big")

    i = 0
    while i < len(data):
        if match := find_longest_match(data, i):
            match_distance, match_length = match
            output_buffer.append(IS_MATCH_BIT)
            dist_hi, dist_lo = match_distance >> 4, match_distance & 0xF
            output_buffer.frombytes(bytes([dist_hi, (dist_lo << 4) | (match_length - LENGTH_OFFSET)]))
            i += match_length
        else:
            output_buffer.append(not IS_MATCH_BIT)
            output_buffer.frombytes(bytes([data[i]]))
            i += 1

    output_buffer.fill()  # Pad to complete last byte
    return output_buffer.tobytes()


def decompress(compressed_bytes: bytes) -> bytes:
    data = bitarray(endian="big")
    data.frombytes(compressed_bytes)
    assert data, f"Cannot decompress {compressed_bytes}"

    output_buffer = []

    while len(data) >= 9:  # Anything less than 9 bits is padding
        if data.pop(0) != IS_MATCH_BIT:
            byte = data[:8].tobytes()
            del data[:8]
            output_buffer.append(byte)
        else:
            hi, lo = data[:16].tobytes()
            del data[:16]
            distance = (hi << 4) | (lo >> 4)
            length = (lo & MATCH_LENGTH_MASK) + LENGTH_OFFSET
            for _ in range(length):
                output_buffer.append(output_buffer[-distance])

    return b"".join(output_buffer)


def find_longest_match(data: bytes, current_position: int) -> Optional[Tuple[int, int]]:
    # Early exit if we don't have enough data to make a match worthwhile
    if current_position < 2 or current_position >= len(data) - 1:
        return None

    end_of_buffer = min(current_position + MATCH_LENGTH_MASK + LENGTH_OFFSET, len(data))
    search_start = max(0, current_position - WINDOW_SIZE)

    # Get the first two bytes of what we're trying to match
    # This acts as a quick filter before doing more expensive comparisons
    target_start = data[current_position:current_position + 2]

    best_match_distance = 0
    best_match_length = 0

    # Create a sliding window view of the search space
    window = data[search_start:current_position]

    # Use two-byte matching as an initial filter
    pos = -1
    while True:
        pos = window.find(target_start, pos + 1)
        if pos == -1:
            break

        # Calculate the actual position in the buffer
        match_pos = search_start + pos

        # Find how far this match extends
        match_length = 2
        while (current_position + match_length < end_of_buffer and
               data[match_pos + match_length] == data[current_position + match_length]):
            match_length += 1

        if match_length > best_match_length:
            best_match_length = match_length
            best_match_distance = current_position - match_pos

    if best_match_length >= LENGTH_OFFSET:
        return best_match_distance, best_match_length

    return None


def get_wrapped_slice(x: bytes, num_bytes: int) -> bytes:
    """
    Examples:
        f(b"1234567", 5) -> b"12345"
        f(b"123", 5) -> b"12312"
    """
    repetitions = num_bytes // len(x)
    remainder = num_bytes % len(x)
    return x * repetitions + x[:remainder]