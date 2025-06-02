import numpy as np
import cv2
from skimage.metrics import structural_similarity as ssim

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

import os

script_dir = os.path.dirname(os.path.abspath(__file__))

# Load images from the script directory
original = cv2.imread(os.path.join(script_dir, 'tree2048.png'))
processed = cv2.imread(os.path.join(script_dir, 'tree30.jpg'))

print(f"Original image shape: {original.shape}")
print(f"Processed image shape: {processed.shape}")

psnr_value = calculate_psnr(original, processed)
msssim_value = calculate_msssim(original, processed)

print(f"PSNR: {psnr_value:.2f} dB")
print(f"MSSSIM: {msssim_value:.4f}")