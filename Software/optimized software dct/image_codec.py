import numpy as np
from scipy import ndimage
import math
from numba import jit, vectorize, prange
import numba as nb

# Pre-compute constants for rgb2ycrcb
SCALE_FACTOR = 16
Y_COEFF_R = np.uint16(0.299 * 2 ** SCALE_FACTOR)
Y_COEFF_G = np.uint16(0.587 * 2 ** SCALE_FACTOR)
Y_COEFF_B = np.uint16(0.114 * 2 ** SCALE_FACTOR)
CR_COEFF = np.uint16(0.713 * 2 ** SCALE_FACTOR)
CB_COEFF = np.uint16(0.564 * 2 ** SCALE_FACTOR)


def adjust_qd(Q_shift_new):
    Q_shift_base = np.array([
        [0, 0, 0, 0, 0, 0, 1, 1],
        [0, 0, 0, 0, 0, 1, 1, 1],
        [0, 0, 0, 0, 1, 1, 1, 1],
        [0, 0, 0, 1, 1, 6, 3, 2],
        [0, 0, 1, 1, 6, 3, 3, 3],
        [0, 1, 1, 6, 3, 3, 3, 3],
        [1, 1, 1, 3, 3, 3, 3, 3],
        [1, 1, 3, 3, 3, 3, 3, 3],
    ], dtype=np.int16)

    Qd_base = np.array([
        [1, 2, 1, 4, 1, 2, 4, 16],
        [2, 4, 2, 8, 2, 8, 2, 16],
        [1, 2, 1, 4, 1, 2, 2, 8],
        [4, 8, 2, 16, 8, 512, 16, 64],
        [1, 2, 2, 8, 256, 16, 8, 32],
        [2, 8, 8, 512, 16, 32, 8, 64],
        [2, 2, 2, 32, 16, 16, 8, 32],
        [8, 16, 32, 64, 32, 64, 32, 64]
    ], dtype=np.int16)
    # Create a copy of Qd to modify
    new_Qd = Qd_base.copy()

    # Calculate the difference between new and old Q_shift values
    diff = Q_shift_new - Q_shift_base

    # For each position in the difference matrix
    for i in range(diff.shape[0]):
        for j in range(diff.shape[1]):
            # Get the difference at this position
            shift_diff = diff[i, j]

            # If difference is positive, multiply by 2 that many times
            if shift_diff > 0:
                new_Qd[i, j] *= (2 ** shift_diff)
            # If difference is negative, divide by 2 that many times
            elif shift_diff < 0:
                new_Qd[i, j] /= (2 ** abs(shift_diff))

    return new_Qd


def dct_1d_vectorized(x):
    # First stage operations - operate on rows (axis 3)
    x1n = np.zeros_like(x, dtype=np.int32)
    x1n[..., 0] = x[..., 0] + x[..., 7]
    x1n[..., 1] = x[..., 1] + x[..., 6]
    x1n[..., 2] = x[..., 2] + x[..., 5]
    x1n[..., 3] = x[..., 3] + x[..., 4]
    x1n[..., 4] = -x[..., 4] + x[..., 3]
    x1n[..., 5] = -x[..., 5] + x[..., 2]
    x1n[..., 6] = -x[..., 6] + x[..., 1]
    x1n[..., 7] = -x[..., 7] + x[..., 0]

    # Second stage operations
    x2n = np.zeros_like(x, dtype=np.int32)
    x2n[..., 0] = x1n[..., 0] + x1n[..., 3]
    x2n[..., 1] = x1n[..., 1] + x1n[..., 2]
    x2n[..., 2] = -x1n[..., 2] + x1n[..., 1]
    x2n[..., 3] = -x1n[..., 3] + x1n[..., 0]
    x2n[..., 4] = -x1n[..., 4]
    x2n[..., 5] = -x1n[..., 5]
    x2n[..., 6] = x1n[..., 6] + x1n[..., 7]
    x2n[..., 7] = x1n[..., 7] - x1n[..., 6]

    # Third stage operations
    x3n = np.zeros_like(x, dtype=np.int32)
    x3n[..., 0] = x2n[..., 0] + x2n[..., 1]
    x3n[..., 1] = -x2n[..., 1] + x2n[..., 0]
    x3n[..., 2] = x2n[..., 2] + x2n[..., 3]
    x3n[..., 3] = x2n[..., 3] - x2n[..., 2]
    x3n[..., 4] = x2n[..., 4]
    x3n[..., 5] = x2n[..., 5]
    x3n[..., 6] = x2n[..., 6]
    x3n[..., 7] = x2n[..., 7]

    # Final reordering
    x4n = np.zeros_like(x, dtype=np.int32)
    x4n[..., 0] = x3n[..., 0]
    x4n[..., 1] = x3n[..., 6]
    x4n[..., 2] = x3n[..., 2]
    x4n[..., 3] = x3n[..., 5]
    x4n[..., 4] = x3n[..., 1]
    x4n[..., 5] = x3n[..., 7]
    x4n[..., 6] = x3n[..., 3]
    x4n[..., 7] = x3n[..., 4]

    return x4n


def quantize(dct_blocks, qs, Q_shift_in=None):
    if Q_shift_in is None:
        Q_shift = np.array(
            [
                [0, 0, 0, 1, 1, 1, 1, 1],
                [0, 0, 1, 1, 1, 1, 1, 1],
                [0, 1, 1, 1, 1, 1, 1, 1],
                [1, 1, 1, 1, 1, 3, 2, 2],
                [1, 1, 1, 1, 7, 3, 3, 3],
                [1, 1, 1, 3, 3, 3, 3, 3],
                [1, 1, 1, 2, 3, 3, 3, 3],
                [1, 1, 2, 3, 3, 3, 3, 3]
            ], dtype=np.int16)
    else:
        Q_shift = Q_shift_in

    return np.int16((np.abs(dct_blocks) + ((Q_shift+qs)//2)) >> (Q_shift + qs)) * np.sign(dct_blocks)


def idct_vectorized(dct_blocks, k, Qd_in=None):
    if Qd_in is None:
        Qd = np.array(
            [
                [1, 2, 1, 8, 2, 4, 4, 16],
                [2, 4, 4, 16, 4, 8, 2, 16],
                [1, 4, 2, 8, 1, 2, 2, 8],
                [8, 16, 4, 16, 8, 64, 8, 64],
                [2, 4, 2, 8, 256, 16, 8, 32],
                [4, 8, 8, 64, 16, 32, 8, 64],
                [2, 2, 2, 16, 16, 16, 8, 32],
                [8, 16, 16, 64, 32, 64, 32, 64]
            ], dtype=np.int16)
    else:
        Qd = Qd_in

    T = np.array([
        [1, 1, 1, 1, 1, 1, 1, 1],
        [1, 1, 0, 0, 0, 0, -1, -1],
        [1, 1, -1, -1, -1, -1, 1, 1],
        [0, 0, -1, 0, 0, 1, 0, 0],
        [1, -1, -1, 1, 1, -1, -1, 1],
        [1, -1, 0, 0, 0, 0, 1, -1],
        [1, -1, 1, -1, -1, 1, -1, 1],
        [0, 0, 0, -1, 1, 0, 0, 0]
    ], dtype=np.int16)

    #print(f"Dequantization Matrix: {np.float32(Qd * k)}")

    # Dequantization
    Mdequantized = (dct_blocks * (Qd * k))

    # Get original shape (n_blocks_row, n_blocks_col, 8, 8)
    original_shape = Mdequantized.shape

    # Perform IDCT on all blocks at once
    temp = (T.T @ (Mdequantized.reshape(-1, original_shape[2], original_shape[3]).transpose(0, 2, 1)) @ T)

    # Clip values
    return np.maximum(np.minimum(temp.transpose(0, 2, 1).reshape(original_shape), 255), 0)
    #return np.clip(np.round(result), 0, 255)


def deringing_filter(blocks, block_size=8, sigma=0.5):
    # Input is already a 2D array, no need to reshape
    image = blocks

    # Ensure image is float type for filtering
    image = image.astype(np.float32)

    # Apply light Gaussian blur
    blurred = ndimage.gaussian_filter(image, sigma=sigma)

    # Detect edges using Sobel operators
    dx = ndimage.sobel(image, axis=1)
    dy = ndimage.sobel(image, axis=0)
    edge_strength = np.sqrt(dx ** 2 + dy ** 2)

    # Create edge mask with more robust thresholding
    threshold = np.percentile(edge_strength, 90)
    edge_mask = edge_strength > threshold

    # Combine original and blurred based on edge mask
    result = np.where(edge_mask, image, blurred)

    # Ensure output is in valid range
    result = np.clip(result, 0, 255)

    # Convert back to original dtype
    result = result.astype(np.uint8)

    return result


def shift_by_3(data):
    return (data + 4) >> 3


def generate_tiles(image, TILE_SIZE, W, H):
    return image.reshape(H, TILE_SIZE, W, TILE_SIZE).transpose(0, 2, 1, 3)


def rgb2ycrcb(R, G, B):
    # Calculate Y channel
    Y = np.right_shift((Y_COEFF_R * R) + (Y_COEFF_G * G) + (Y_COEFF_B * B), SCALE_FACTOR)

    Cr = np.right_shift((R - Y) * CR_COEFF, SCALE_FACTOR) + 128
    Cb = np.right_shift((B - Y) * CB_COEFF, SCALE_FACTOR) + 128

    # Convert back to uint8
    return np.uint8(Y), np.uint8(Cr), np.uint8(Cb)