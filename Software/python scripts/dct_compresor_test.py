import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
from matplotlib.widgets import TextBox
import matplotlib.gridspec as gridspec
import cv2
from numba import jit
from skimage.metrics import structural_similarity as ssim
from multiprocessing import Process, Queue, Pool
import multiprocessing as mp
import heapq
from collections import defaultdict
from USB_FTX232H_FT60X import USB_FTX232H_FT60X_sync245mode

# Magic matrices remain unchanged
Q = np.array([
    [16, 8, 8, 8, 32, 32, 64, 32],
    [8, 8, 8, 8, 16, 32, 64, 16],
    [16, 8, 16, 16, 64, 64, 64, 32],
    [8, 8, 16, 16, 32, 32, 64, 16],
    [16, 16, 32, 32, 64, 64, 128, 32],
    [16, 16, 32, 16, 64, 64, 128, 32],
    [64, 64, 128, 64, 128, 128, 128, 64],
    [32, 32, 64, 32, 64, 32, 64, 32]
], dtype=np.float32)

T = np.array([
    [1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 0, 0, 0, 0, -1, -1],
    [1, 1, -1, -1, -1, -1, 1, 1],
    [0, 0, -1, 0, 0, 1, 0, 0],
    [1, -1, -1, 1, 1, -1, -1, 1],
    [1, -1, 0, 0, 0, 0, 1, -1],
    [1, -1, 1, -1, -1, 1, -1, 1],
    [0, 0, 0, -1, 1, 0, 0, 0]
])

D_values = np.array([0.3536, 0.5, 0.3536, 0.7071, 0.3536, 0.5, 0.3536, 0.7071])
D = np.diag(D_values)

Qd = np.array([
    [2, 2, 1, 4, 4, 8, 16, 32],
    [2, 4, 2, 8, 4, 16, 8, 16],
    [2, 2, 2, 8, 4, 8, 8, 16],
    [4, 8, 4, 16, 16, 32, 16, 32],
    [2, 4, 4, 16, 32, 16, 16, 16],
    [4, 8, 16, 16, 16, 32, 16, 32],
    [8, 8, 16, 32, 32, 32, 16, 32],
    [16, 32, 32, 32, 32, 32, 32, 32]
], dtype=np.float32)


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
    # Count frequencies
    frequencies = defaultdict(int)
    for value in data.flatten():
        frequencies[value] += 1

    # Build Huffman tree and codes
    root = build_huffman_tree(frequencies)
    codes = build_huffman_codes(root)

    # Encode data
    encoded = ""
    for value in data.flatten():
        encoded += codes[value]

    # Calculate size in bytes (including Huffman table)
    huffman_table_size = len(frequencies) * (4 + 1)  # 4 bytes for value, 1 byte for code length
    data_size = len(encoded) // 8 + (1 if len(encoded) % 8 else 0)
    total_size = huffman_table_size + data_size

    return encoded, total_size


@jit(nopython=True)
def dct_1d(x):
    # Ensure input is float32
    x = x.astype(np.float32)

    # DCT implementation with explicit float32 arrays
    x1n = np.array([x[0] + x[7], x[1] + x[6], x[2] + x[5], x[3] + x[4],
                    -x[4] + x[3], -x[5] + x[2], -x[6] + x[1], -x[7] + x[0]], dtype=np.float32)

    x2n = np.array([x1n[0] + x1n[3], x1n[1] + x1n[2], -x1n[2] + x1n[1], -x1n[3] + x1n[0],
                    -x1n[4], -x1n[5], x1n[6] + x1n[7], x1n[7] - x1n[6]], dtype=np.float32)

    x3n = np.array([x2n[0] + x2n[1], -x2n[1] + x2n[0], x2n[2] + x2n[3], x2n[3] - x2n[2],
                    x2n[4], x2n[5], x2n[6], x2n[7]], dtype=np.float32)

    x4n = np.array([x3n[0], x3n[6], x3n[2], x3n[5], x3n[1], x3n[7], x3n[3], x3n[4]], dtype=np.float32)
    return x4n


def process_channel_core(channel_array, k=1):
    h, w = channel_array.shape
    dct_matrices = np.zeros((h // 8, w // 8, 8, 8), dtype=np.float32)

    # Convert input to float32
    channel_array = channel_array.astype(np.float32)

    roi = []
    tiles = []
    dct_kernel_size = 8
    x_size = int(h / dct_kernel_size)
    y_size = int(w / dct_kernel_size)

    for i in range(x_size):
        row = []
        for j in range(y_size):
            roi = channel_array[i * 8:(i + 1) * 8, j * 8:(j + 1) * 8].copy()
            row.append(roi)
        tiles.append(row)

    tiles = np.array(tiles, dtype=np.float32)

    for tile_row in range(len(tiles)):
        for tile_col in range(len(tiles[0])):
            tile = tiles[tile_row][tile_col].copy()
            tile_float = np.zeros((8, 8), dtype=np.float32)

            # Forward DCT
            for col in range(dct_kernel_size):
                column = np.array([tile[row][col] for row in range(8)], dtype=np.float32)
                column = dct_1d(column)
                column = right_shift_3(column)
                for row in range(8):
                    tile_float[row][col] = column[row]

            for row in range(dct_kernel_size):
                row_list = tile_float[row].copy()
                row_list = dct_1d(row_list)
                tile_float[row] = row_list

            # Quantize and store DCT coefficients
            quantized_tile = quantize(tile_float, k)
            quantized_tile = np.round(quantized_tile, 1)
            dct_matrices[tile_row, tile_col] = quantized_tile

            # Continue with IDCT
            tile = idct(quantized_tile, k)
            tiles[tile_row][tile_col] = tile

    output = np.zeros((h, w))
    for i in range(tiles.shape[0]):
        for j in range(tiles.shape[1]):
            value = tiles[i][j]
            y_start = i * dct_kernel_size
            y_end = y_start + dct_kernel_size
            x_start = j * dct_kernel_size
            x_end = x_start + dct_kernel_size
            output[y_start:y_end, x_start:x_end] = value

    output = np.clip(output, 0, 255)
    output = output.astype(np.uint8)
    return output, dct_matrices


def process_channel_parallel(args):
    """Wrapper function for parallel processing"""
    channel, k = args
    return process_channel_core(channel, k)


def process_color_image(image_path, k=1):
    # Read color image
    img = Image.open(image_path)
    img_array = np.array(img)
    original_size = img_array.nbytes


    # RGB to YCrCb
    imgYCC = cv2.cvtColor(img_array, cv2.COLOR_RGB2YCrCb)
    Y = imgYCC[:, :, 0]
    Cr = imgYCC[:, :, 1]
    Cb = imgYCC[:, :, 2]

    # Create process pool for parallel processing
    with Pool(processes=3) as pool:
        # Process channels in parallel
        channel_args = [
            (Y, k),
            (Cr, k * 4),
            (Cb, k * 4)
        ]
        results = pool.map(process_channel_parallel, channel_args)

    # Unpack results
    Y_processed, Y_dct = results[0]
    Cr_processed, Cr_dct = results[1]
    Cb_processed, Cb_dct = results[2]


    imgprocessed = cv2.merge([Y_processed, Cr_processed, Cb_processed])
    imgRGB = cv2.cvtColor(imgprocessed, cv2.COLOR_YCrCb2RGB)

    # Huffman encode DCT coefficients
    _, Y_size = huffman_encode(Y_dct)
    _, Cr_size = huffman_encode(Cr_dct)
    _, Cb_size = huffman_encode(Cb_dct)

    compressed_size = Y_size + Cr_size + Cb_size
    compression_ratio = 100 * (1 - (compressed_size / original_size))

    return (img_array, imgRGB, Y_processed, Cr_processed, Cb_processed,
            calculate_psnr(img_array, imgRGB),
            calculate_msssim(img_array, imgRGB),
            original_size, compressed_size, compression_ratio)


def create_interactive_display(image_path):
    mp.set_start_method('spawn', force=True)

    fig = plt.figure(figsize=(15, 12))
    gs = gridspec.GridSpec(4, 3, height_ratios=[1, 1, 0.2, 0.1])

    # Initial processing with k=1
    (original, processed, y_channel, cr_channel, cb_channel,
     psnr, msssim, orig_size, comp_size, comp_ratio) = process_color_image(image_path, k=1)

    # Create subplots
    ax_orig = plt.subplot(gs[0, 0])
    ax_proc = plt.subplot(gs[1, 0])
    ax_y = plt.subplot(gs[0, 1])
    ax_cr = plt.subplot(gs[0, 2])
    ax_cb = plt.subplot(gs[1, 1])
    ax_metrics = plt.subplot(gs[2, :])
    ax_text = plt.subplot(gs[3, :])

    # Initial plots
    img_orig = ax_orig.imshow(original)
    img_proc = ax_proc.imshow(processed)
    img_y = ax_y.imshow(y_channel, cmap='gray')
    img_cr = ax_cr.imshow(cr_channel, cmap='RdYlBu')
    img_cb = ax_cb.imshow(cb_channel, cmap='RdYlBu')

    # Set titles and remove axes
    ax_orig.set_title('Original Image')
    ax_proc.set_title('Processed Image')
    ax_y.set_title('Y Channel')
    ax_cr.set_title('Cr Channel')
    ax_cb.set_title('Cb Channel')

    for ax in [ax_orig, ax_proc, ax_y, ax_cr, ax_cb]:
        ax.axis('off')

    # Initialize metrics display with compression info
    ax_metrics.axis('off')
    metrics_text = ax_metrics.text(0.5, 0.5,
                                   f'PSNR: {psnr:.2f} dB\n'
                                   f'MS-SSIM: {msssim:.4f}\n'
                                   f'Original Size: {orig_size / 1024:.2f} KB\n'
                                   f'Compressed Size: {comp_size / 1024:.2f} KB\n'
                                   f'Compression Ratio: {comp_ratio:.2f}%',
                                   horizontalalignment='center',
                                   verticalalignment='center',
                                   fontsize=12)

    # Remove axes from text box area but keep the space
    ax_text.axis('off')

    # Create text box
    text_box_ax = plt.axes([0.3, 0.05, 0.2, 0.03])
    text_box = TextBox(text_box_ax, 'Quantization factor (k): ', initial='1')

    def update(text):
        try:
            k = float(text)
            if k <= 0:
                print("k must be positive")
                return

            # Process image with new k value
            print("Processing image with k =", k)
            (_, processed_new, y_new, cr_new, cb_new,
             psnr_new, msssim_new,
             orig_size_new, comp_size_new, comp_ratio_new) = process_color_image(image_path, k)
            print("Done")

            # Update images
            img_proc.set_data(processed_new)
            img_y.set_data(y_new)
            img_cr.set_data(cr_new)
            img_cb.set_data(cb_new)

            # Update metrics
            metrics_text.set_text(
                f'PSNR: {psnr_new:.2f} dB\n'
                f'MS-SSIM: {msssim_new:.4f}\n'
                f'Original Size: {orig_size_new / 1024:.2f} KB\n'
                f'Compressed Size: {comp_size_new / 1024:.2f} KB\n'
                f'Compression Ratio: {comp_ratio_new:.2f}%'
            )

            # Redraw
            fig.canvas.draw_idle()

        except ValueError:
            print("Please enter a valid number")

    text_box.on_submit(update)

    plt.tight_layout()
    plt.show()


#@jit(nopython=True)
def right_shift_3(data):
    return np.array(data) / 8


def quantize(data, k):
    output = np.array(data) / (Q * k)  # Element-wise division
    return output


def idct(dct_input, k):
    Qdnew = Qd * k
    Mdequantized = np.rint(dct_input * Qdnew)  # Element-wise multiplication
    B = Mdequantized
    final_out = T.T @ B @ T
    Xout = np.clip(np.round(final_out), 0, 255)
    return Xout


def calculate_psnr(original, processed):
    """Calculate Peak Signal-to-Noise Ratio between two images"""
    mse = np.mean((original - processed) ** 2)
    if mse == 0:
        return float('inf')
    max_pixel = 255.0
    psnr = 20 * np.log10(max_pixel / np.sqrt(mse))
    return psnr


def calculate_msssim(original, processed):
    """Calculate Multi-Scale Structural Similarity Index"""
    if len(original.shape) == 3:
        original_gray = cv2.cvtColor(original, cv2.COLOR_RGB2GRAY)
        processed_gray = cv2.cvtColor(processed, cv2.COLOR_RGB2GRAY)
    else:
        original_gray = original
        processed_gray = processed
    return ssim(original_gray, processed_gray, data_range=255, multichannel=False)


if __name__ == "__main__":
    mp.set_start_method('spawn')
    image_path = "img3.jpg"  # Replace with your image path
    create_interactive_display(image_path)