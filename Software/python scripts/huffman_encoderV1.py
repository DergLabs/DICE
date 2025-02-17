from collections import defaultdict
import heapq

class HuffmanNode:
    def __init__(self, value=None, freq=0):
        self.value = value
        self.freq = freq
        self.left = None
        self.right = None

    def __lt__(self, other):
        return self.freq < other.freq


def build_huffman_tree(frequencies):
    heap = []
    for value, freq in frequencies.items():
        heapq.heappush(heap, HuffmanNode(value, freq))

    while len(heap) > 1:
        left = heapq.heappop(heap)
        right = heapq.heappop(heap)
        internal = HuffmanNode(freq=left.freq + right.freq)
        internal.left = left
        internal.right = right
        heapq.heappush(heap, internal)

    return heap[0]


def build_huffman_codes(root):
    codes = {}

    def traverse(node, code=""):
        if node.value is not None:
            codes[node.value] = code
            return
        traverse(node.left, code + "0")
        traverse(node.right, code + "1")

    traverse(root)
    return codes


def huffman_encode(data):
    # Count frequencies across all 16x16 blocks
    frequencies = defaultdict(int)
    for i in range(data.shape[0]):
        for j in range(data.shape[1]):
            block = data[i, j]  # This is a 16x16 block
            for value in block.flatten():
                frequencies[value] += 1

    # Build single Huffman tree and codes
    root = build_huffman_tree(frequencies)
    codes = build_huffman_codes(root)

    # Encode each 16x16 block using the same Huffman codes
    encoded = ""
    for i in range(data.shape[0]):
        for j in range(data.shape[1]):
            block = data[i, j]  # This is a 16x16 block
            for value in block.flatten():
                encoded += codes[value]

    # Calculate size in bytes (including single Huffman table)
    huffman_table_size = len(frequencies) * (4 + 1)  # 4 bytes for value, 1 byte for code length
    data_size = len(encoded) // 8 + (1 if len(encoded) % 8 else 0)
    total_size = huffman_table_size + data_size

    return encoded, total_size