import sys
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

# Magic Matrix - DONT FUCKIN TOUCH!
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

# Another Magic Matrix - DONT FUCKIN TOUCH!
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
], dtype=np.float32)


@jit(nopython=True)
def dct_1d(x):

    # Layer 1
    x1n = np.array([x[0]+x[7], x[1]+x[6], x[2]+x[5], x[3]+x[4], -x[4]+x[3], -x[5]+x[2], -x[6]+x[1], -x[7]+x[0]])

    # Layer 2
    x2n = np.array([x1n[0]+x1n[3], x1n[1]+x1n[2], -x1n[2]+x1n[1], -x1n[3]+x1n[0], -x1n[4], -x1n[5], x1n[6]+x1n[7], x1n[7]-x1n[6]])

    # Layer 3
    x3n = np.array([x2n[0]+x2n[1], -x2n[1]+x2n[0], x2n[2]+x2n[3], x2n[3]-x2n[2], x2n[4], x2n[5], x2n[6], x2n[7]])

    # reorder x3n
    x4n = [x3n[0], x3n[6], x3n[2], x3n[5], x3n[1], x3n[7], x3n[3], x3n[4]]

    return x4n


def idct(dct_input, k):
    Qdnew = Qd * k

    Mdequantized = np.rint(dct_input * Qdnew)  # Element-wise multiplication

    B = Mdequantized

    # Calculate final output (equivalent to MATLAB: Xout = clip(round(T' * B * T), 0, 255))
    final_out = T.T @ B @ T
    Xout = np.clip(np.round(final_out), 0, 255)

    return Xout


@jit(nopython=True)
def right_shift_3(data):
    return np.array(data) / 8


def quantize(data, k):
    output = np.array(data) / (Q * k) # Element-wise division
    return output


def process_channel(channel_data):
    channel_array, k, channel_name = channel_data
    processed = process_channel_core(np.array(channel_array, dtype=np.float32), k)
    return (processed, channel_name)


def process_channel_core(channel_array, k=1):
    """Core processing logic moved to separate function"""
    h, w = channel_array.shape

    roi = []
    tiles = []
    dct_kernel_size = 8
    x_size = int(h / dct_kernel_size)
    y_size = int(w / dct_kernel_size)

    for i in range(x_size):
        row = []
        for j in range(y_size):
            roi = channel_array[i * 8:(i + 1) * 8, j * 8:(j + 1) * 8]
            row.append(roi)
        tiles.append(row)

    tiles = np.array(tiles)

    for tile_row in range(len(tiles)):
        for tile_col in range(len(tiles[0])):
            tile = tiles[tile_row][tile_col]

            # Forward DCT
            for col in range(dct_kernel_size):
                column = [tile[row][col] for row in range(8)]
                column = dct_1d(column)
                column = right_shift_3(column)
                for row in range(8):
                    tile[row][col] = column[row]

            for row in range(dct_kernel_size):
                row_list = tile[row]
                row_list = dct_1d(row_list)
                tile[row] = row_list

            tile = np.array(tile)
            tile = quantize(tile, k)
            tile = np.round(tile, 1)
            tile = idct(tile, k)
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
    return output


def process_color_image(image_path, k=1):
    # Read color image
    img = Image.open(image_path)
    img_array = np.array(img)

    # RGB to YCrCb
    imgYCC = cv2.cvtColor(img_array, cv2.COLOR_RGB2YCrCb)
    Y = imgYCC[:, :, 0]
    Cr = imgYCC[:, :, 1]
    Cb = imgYCC[:, :, 2]

    # Prepare channel data for parallel processing
    channel_data = [
        (Y, k, 'Y'),
        (Cr, k * 2, 'Cr'),
        (Cb, k * 2, 'Cb')
    ]

    # Process channels in parallel using Pool
    with Pool(processes=3) as pool:
        results = pool.map(process_channel, channel_data)

    # Collect results
    processed_channels = {name: channel for channel, name in results}

    # Merge channels
    imgprocessed = cv2.merge([
        processed_channels['Y'],
        processed_channels['Cr'],
        processed_channels['Cb']
    ])

    # Convert back to RGB
    imgRGB = cv2.cvtColor(imgprocessed, cv2.COLOR_YCrCb2RGB)
    processed_r = imgRGB[:, :, 0]
    processed_g = imgRGB[:, :, 1]
    processed_b = imgRGB[:, :, 2]

    # Calculate metrics
    psnr_value = calculate_psnr(img_array, imgRGB)
    msssim_value = calculate_msssim(img_array, imgRGB)

    return img_array, imgRGB, processed_r, processed_g, processed_b, psnr_value, msssim_value


def create_interactive_display(image_path):
    # Create figure with GridSpec - adjust to make room for metrics
    fig = plt.figure(figsize=(15, 12))
    gs = gridspec.GridSpec(4, 3, height_ratios=[1, 1, 0.2, 0.1])

    # Initial processing with k=1
    original, processed, r_channel, g_channel, b_channel, psnr, msssim = process_color_image(image_path, k=1)

    # Create subplots
    ax_orig = plt.subplot(gs[0, 0])
    ax_proc = plt.subplot(gs[1, 0])
    ax_r = plt.subplot(gs[0, 1])
    ax_g = plt.subplot(gs[0, 2])
    ax_b = plt.subplot(gs[1, 1])
    ax_metrics = plt.subplot(gs[2, :])  # New subplot for metrics
    ax_text = plt.subplot(gs[3, :])

    # Initial plots
    img_orig = ax_orig.imshow(original)
    img_proc = ax_proc.imshow(processed)
    img_r = ax_r.imshow(r_channel, cmap='Reds')
    img_g = ax_g.imshow(g_channel, cmap='Greens')
    img_b = ax_b.imshow(b_channel, cmap='Blues')

    # Set titles and remove axes
    ax_orig.set_title('Original Image')
    ax_proc.set_title('Processed Image')
    ax_r.set_title('Processed R Channel')
    ax_g.set_title('Processed G Channel')
    ax_b.set_title('Processed B Channel')

    for ax in [ax_orig, ax_proc, ax_r, ax_g, ax_b]:
        ax.axis('off')

    # Initialize metrics display
    ax_metrics.axis('off')
    metrics_text = ax_metrics.text(0.5, 0.5,
                                 f'PSNR: {psnr:.2f} dB\nMS-SSIM: {msssim:.4f}',
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
            _, processed_new, r_new, g_new, b_new, psnr_new, msssim_new = process_color_image(image_path, k)
            print("Done")

            # Update images
            img_proc.set_data(processed_new)
            img_r.set_data(r_new)
            img_g.set_data(g_new)
            img_b.set_data(b_new)

            # Update metrics
            metrics_text.set_text(f'PSNR: {psnr_new:.2f} dB\nMS-SSIM: {msssim_new:.4f}')

            # Redraw
            fig.canvas.draw_idle()

        except ValueError:
            print("Please enter a valid number")

    text_box.on_submit(update)

    plt.tight_layout()
    plt.show()


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


def save_4d_matrix_to_csv(matrix, filename):
    d1, d2, d3, d4 = matrix.shape

    # Create a 2D list to store string representations of 8x8 matrices
    csv_data = []
    for i in range(d1):
        row = []
        for j in range(d2):
            # Convert each 8x8 matrix to a string representation
            matrix_str = '['
            for k in range(d3):
                row_str = '[' + ', '.join(f'{int(x)}' for x in matrix[i, j, k, :]) + ']'
                matrix_str += row_str
                if k < d3 - 1:
                    matrix_str += ', '
            matrix_str += ']'
            row.append(matrix_str)
        csv_data.append(row)

    # Save as CSV
    with open(filename, 'w') as f:
        for row in csv_data:
            f.write(','.join(row) + '\n')


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
    # Convert to grayscale if RGB
    if len(original.shape) == 3:
        original_gray = cv2.cvtColor(original, cv2.COLOR_RGB2GRAY)
        processed_gray = cv2.cvtColor(processed, cv2.COLOR_RGB2GRAY)
    else:
        original_gray = original
        processed_gray = processed

    return ssim(original_gray, processed_gray, data_range=255, multichannel=False)


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Enter File Path")
        sys.exit(1)
    mp.set_start_method('spawn')
    image_path = sys.argv[1]
    create_interactive_display(image_path)
