from app_libraries import *
from app_constants import *

# Pre-compute constants for rgb2ycrcb
SCALE_FACTOR = 16
Y_COEFF_R = ycrcb_datatype(0.299 * 2 ** SCALE_FACTOR)
Y_COEFF_G = ycrcb_datatype(0.587 * 2 ** SCALE_FACTOR)
Y_COEFF_B = ycrcb_datatype(0.114 * 2 ** SCALE_FACTOR)
CR_COEFF = ycrcb_datatype(0.713 * 2 ** SCALE_FACTOR)
CB_COEFF = ycrcb_datatype(0.564 * 2 ** SCALE_FACTOR)


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
    ], dtype=dct_datatype)

    Qd_base = np.array([
        [1, 2, 1, 4, 1, 2, 4, 16],
        [2, 4, 2, 8, 2, 8, 2, 16],
        [1, 2, 1, 4, 1, 2, 2, 8],
        [4, 8, 2, 16, 8, 512, 16, 64],
        [1, 2, 2, 8, 256, 16, 8, 32],
        [2, 8, 8, 512, 16, 32, 8, 64],
        [2, 2, 2, 32, 16, 16, 8, 32],
        [8, 16, 32, 64, 32, 64, 32, 64]
    ], dtype=dct_datatype)
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
    x1n = np.zeros_like(x, dtype=dct_datatype)
    x1n[..., 0] = x[..., 0] + x[..., 7]
    x1n[..., 1] = x[..., 1] + x[..., 6]
    x1n[..., 2] = x[..., 2] + x[..., 5]
    x1n[..., 3] = x[..., 3] + x[..., 4]
    x1n[..., 4] = -x[..., 4] + x[..., 3]
    x1n[..., 5] = -x[..., 5] + x[..., 2]
    x1n[..., 6] = -x[..., 6] + x[..., 1]
    x1n[..., 7] = -x[..., 7] + x[..., 0]

    # Second stage operations
    x2n = np.zeros_like(x, dtype=dct_datatype)
    x2n[..., 0] = x1n[..., 0] + x1n[..., 3]
    x2n[..., 1] = x1n[..., 1] + x1n[..., 2]
    x2n[..., 2] = -x1n[..., 2] + x1n[..., 1]
    x2n[..., 3] = -x1n[..., 3] + x1n[..., 0]
    x2n[..., 4] = -x1n[..., 4]
    x2n[..., 5] = -x1n[..., 5]
    x2n[..., 6] = x1n[..., 6] + x1n[..., 7]
    x2n[..., 7] = x1n[..., 7] - x1n[..., 6]

    # Third stage operations
    x3n = np.zeros_like(x, dtype=dct_datatype)
    x3n[..., 0] = x2n[..., 0] + x2n[..., 1]
    x3n[..., 1] = -x2n[..., 1] + x2n[..., 0]
    x3n[..., 2] = x2n[..., 2] + x2n[..., 3]
    x3n[..., 3] = x2n[..., 3] - x2n[..., 2]
    x3n[..., 4] = x2n[..., 4]
    x3n[..., 5] = x2n[..., 5]
    x3n[..., 6] = x2n[..., 6]
    x3n[..., 7] = x2n[..., 7]

    # Final reordering
    x4n = np.zeros_like(x, dtype=dct_datatype)
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
        Q_shift = np.array([
        [0, 0, 0, 0, 0, 1, 1, 2],
        [0, 0, 0, 0, 1, 1, 2, 2],
        [0, 0, 0, 1, 1, 2, 2, 2],
        [0, 0, 1, 1, 2, 2, 2, 3],
        [0, 1, 1, 2, 7, 2, 3, 3],
        [1, 1, 2, 2, 2, 3, 3, 3],
        [1, 2, 2, 2, 3, 3, 3, 3],
        [2, 2, 2, 3, 3, 3, 3, 3],
    ], dtype=dct_datatype)
    else:
        Q_shift = Q_shift_in

    return dct_datatype((np.abs(dct_blocks) + ((Q_shift+qs)//2)) >> (Q_shift + qs)) * np.sign(dct_blocks)


def idct_vectorized(dct_blocks, k, Qd_in=None):
    if Qd_in is None:
        Qd = np.array(
[
    [  1,   2,   1,   4,   1,   4,   4,  32],
    [  2,   4,   2,   8,   4,   8,   4,  32],
    [  1,   2,   1,   8,   1,   4,   4,  16],
    [  4,   8,   4,  16,  16,  32,   8, 128],
    [  1,   4,   2,  16,  512,   8,   8,  32],
    [  4,   8,  16,  32,   8,  32,   8,  64],
    [  2,   4,   4,  16,  16,  16,   8,  32],
    [ 16,  32,  16,  64,  32,  64,  32,  64]
], dtype=idct_datatype)
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
    ], dtype=idct_datatype)

    #print(f"Dequantization Matrix: {np.float32(Qd * k)}")
    # Dequantization
    dct_blocks = dct_blocks.astype(idct_datatype)
    Mdequantized = (dct_blocks * (Qd * k))

    # Get original shape (n_blocks_row, n_blocks_col, 8, 8)
    original_shape = Mdequantized.shape

    # Perform IDCT on all blocks at once
    temp = (T.T @ (Mdequantized.reshape(-1, original_shape[2], original_shape[3]).transpose(0, 2, 1)) @ T)

    # Clip values
    return np.maximum(np.minimum(temp.transpose(0, 2, 1).reshape(original_shape), 255), 0).astype(np.uint8) 
    #return np.clip(np.round(result), 0, 255)


def shift_by_3(data):
    return (data + 4) >> 3


def generate_tiles(image, TILE_SIZE, W, H):
    return image.reshape(H, TILE_SIZE, W, TILE_SIZE).transpose(0, 2, 1, 3)


def rgb2ycrcb(R, G, B):
    # Ensure inputs are contiguous and the right type
    R = np.ascontiguousarray(R, dtype=ycrcb_datatype)
    G = np.ascontiguousarray(G, dtype=ycrcb_datatype)
    B = np.ascontiguousarray(B, dtype=ycrcb_datatype)
    
    # Calculate Y channel
    Y = np.right_shift((Y_COEFF_R * R) + (Y_COEFF_G * G) + (Y_COEFF_B * B), SCALE_FACTOR)
    Y = np.ascontiguousarray(Y, dtype=ycrcb_datatype)
    
    # Calculate Cr and Cb channels
    Cr = np.right_shift((R - Y) * CR_COEFF, SCALE_FACTOR) + 128
    Cb = np.right_shift((B - Y) * CB_COEFF, SCALE_FACTOR) + 128
    
    # Convert back to uint8 and ensure arrays are contiguous
    return np.ascontiguousarray(Y, dtype=np.uint8), \
           np.ascontiguousarray(Cr, dtype=np.uint8), \
           np.ascontiguousarray(Cb, dtype=np.uint8)


def deringing_filter(blocks, block_size=8, sigma_spatial=1.5, sigma_intensity=25, edge_threshold=30, border_width=1):
    # Get image dimensions
    height, width = blocks.shape
    
    # Create a mask for block boundaries (more efficiently)
    block_boundary_mask = np.zeros((height, width), dtype=bool)
    
    # Pre-compute boundary indices
    h_boundary_indices = np.arange(block_size, height, block_size)
    v_boundary_indices = np.arange(block_size, width, block_size)
    
    # Mark horizontal block boundaries (vectorized)
    for y in h_boundary_indices:
        y_start = max(0, y - border_width)
        y_end = min(height, y + border_width)
        block_boundary_mask[y_start:y_end, :] = True
    
    # Mark vertical block boundaries (vectorized)
    for x in v_boundary_indices:
        x_start = max(0, x - border_width)
        x_end = min(width, x + border_width)
        block_boundary_mask[:, x_start:x_end] = True
    
    # Detect edges using Sobel operators (already vectorized)
    dx = ndimage.sobel(blocks, axis=1)
    dy = ndimage.sobel(blocks, axis=0)
    edge_strength = np.sqrt(dx**2 + dy**2)
    
    # Only process areas where we need to apply filtering
    hard_edge_mask = (edge_strength > edge_threshold) & block_boundary_mask
    
    # Quick check - if no pixels need filtering, return original
    if not np.any(hard_edge_mask):
        return blocks.astype(np.uint8)
    
    # Convert to uint8 for OpenCV bilateral filter (only once)
    img_uint8 = blocks.astype(np.uint8)
    
    # Get dimensions of hard edge regions to potentially limit bilateral filtering
    if np.sum(hard_edge_mask) < (height * width * 0.1):  # Less than 10% of pixels need filtering
        # Find bounding boxes of regions that need filtering
        # This is a potential optimization but may not be worth it depending on the image
        # Would need to implement logic to split the image into regions and only filter those
        # For simplicity and to ensure correctness, we'll filter the entire image for now
        pass
    
    # Apply bilateral filter to the entire image (already optimized)
    bilateral_filtered = cv2.bilateralFilter(img_uint8, d=-1, 
                                           sigmaColor=sigma_intensity,
                                           sigmaSpace=sigma_spatial)
    
    # Apply filtering only where needed (vectorized operation)
    # This creates a new array which is more efficient than in-place modification
    # when a relatively small percentage of pixels need to be modified
    result = np.where(hard_edge_mask, bilateral_filtered, blocks)
    
    return result.astype(np.uint8)


def deblocking_filter(img, block_size=8, strength=4, threshold=8):
    """
    Apply a deblocking filter to reduce blocking artifacts in compressed images.
    This implementation is inspired by H.264/AVC deblocking approaches.
    
    Parameters:
    -----------
    img : ndarray
        Input image (grayscale)
    block_size : int
        Size of DCT blocks (default: 8)
    strength : int
        Deblocking filter strength (1-5, higher = stronger filtering)
    threshold : int
        Threshold for filtering decision (higher = less filtering)
        
    Returns:
    --------
    ndarray
        Filtered image with reduced blocking artifacts
    """
  # Ensure correct data type and make a copy
    img = img.astype(np.float32)
    img_filtered = img.copy()
    height, width = img.shape
    
    # Normalize strength to 0.2-1.0
    alpha = strength / 10.0
    beta = threshold
    
    # Process vertical block boundaries
    for x in range(block_size, width, block_size):
        if x < 2 or x >= width - 2:
            continue
            
        # Get columns of pixels around the boundary
        p1 = img[:, x-2].astype(np.int32)
        p0 = img[:, x-1].astype(np.int32)
        q0 = img[:, x].astype(np.int32)
        q1 = img[:, x+1].astype(np.int32)
        
        # Calculate differences
        diff_p0_q0 = np.abs(p0 - q0)
        
        # Mask for pixels that need filtering
        mask = diff_p0_q0 < beta
        
        if not np.any(mask):
            continue
        
        # Calculate delta for adjustments
        delta = np.clip(((q0 - p0) * alpha) / 4.0, -threshold, threshold)
        
        # Apply filter only where needed
        img_filtered[:, x-1][mask] = np.clip(p0[mask] + delta[mask], 0, 255)
        img_filtered[:, x][mask] = np.clip(q0[mask] - delta[mask], 0, 255)
        
        # Stronger filtering for smoother areas
        smooth_mask = mask & (np.abs(p1 - p0) < beta/2) & (np.abs(q1 - q0) < beta/2)
        
        if np.any(smooth_mask):
            delta_p = np.clip(((p1 - p0) * alpha) / 8.0, -threshold/2, threshold/2)
            delta_q = np.clip(((q1 - q0) * alpha) / 8.0, -threshold/2, threshold/2)
            
            img_filtered[:, x-2][smooth_mask] = np.clip(p1[smooth_mask] + delta_p[smooth_mask], 0, 255)
            img_filtered[:, x+1][smooth_mask] = np.clip(q1[smooth_mask] - delta_q[smooth_mask], 0, 255)
    
    # Process horizontal block boundaries
    for y in range(block_size, height, block_size):
        if y < 2 or y >= height - 2:
            continue
            
        # Get rows of pixels around the boundary
        p1 = img[y-2, :].astype(np.int32)
        p0 = img[y-1, :].astype(np.int32)
        q0 = img[y, :].astype(np.int32)
        q1 = img[y+1, :].astype(np.int32)
        
        # Calculate differences
        diff_p0_q0 = np.abs(p0 - q0)
        
        # Mask for pixels that need filtering
        mask = diff_p0_q0 < beta
        
        if not np.any(mask):
            continue
        
        # Calculate delta for adjustments
        delta = np.clip(((q0 - p0) * alpha) / 4.0, -threshold, threshold)
        
        # Apply filter only where needed
        img_filtered[y-1, :][mask] = np.clip(p0[mask] + delta[mask], 0, 255)
        img_filtered[y, :][mask] = np.clip(q0[mask] - delta[mask], 0, 255)
        
        # Stronger filtering for smoother areas
        smooth_mask = mask & (np.abs(p1 - p0) < beta/2) & (np.abs(q1 - q0) < beta/2)
        
        if np.any(smooth_mask):
            delta_p = np.clip(((p1 - p0) * alpha) / 8.0, -threshold/2, threshold/2)
            delta_q = np.clip(((q1 - q0) * alpha) / 8.0, -threshold/2, threshold/2)
            
            img_filtered[y-2, :][smooth_mask] = np.clip(p1[smooth_mask] + delta_p[smooth_mask], 0, 255)
            img_filtered[y+1, :][smooth_mask] = np.clip(q1[smooth_mask] - delta_q[smooth_mask], 0, 255)
    
    return img_filtered.astype(np.uint8)


def combined_deringing_deblocking(blocks, block_size=8, 
                                  sigma_spatial=1.5, sigma_intensity=25, 
                                  edge_threshold=30, border_width=1, 
                                  deblock_strength=4, deblock_threshold=8):
    """
    Apply combined deringing (bilateral filter) and deblocking filters to reduce compression artifacts.
    Applies deringing first, then deblocking.
    
    Parameters:
    -----------
    blocks : ndarray
        The image data in blocks format
    block_size : int
        Size of DCT blocks (default: 8)
    sigma_spatial : float
        Spatial sigma for bilateral filter (controls blur radius)
    sigma_intensity : float
        Intensity sigma for bilateral filter (controls edge preservation)
    edge_threshold : float
        Threshold for edge detection (higher = fewer edges detected)
    border_width : int
        Width of the border to smooth (default: 1)
    deblock_strength : int
        Strength of deblocking filter (1-5)
    deblock_threshold : int
        Threshold for deblocking filter
        
    Returns:
    --------
    ndarray
        Filtered image with reduced compression artifacts
    """
    # Step 1: Apply bilateral deringing filter
    # Create a copy of the input blocks and ensure it's the right type
    filtered_blocks = blocks.copy()
    
    # Get image dimensions
    height, width = blocks.shape
    
    # Create a mask for block boundaries
    block_boundary_mask = np.zeros_like(blocks, dtype=bool)
    
    # Mark horizontal block boundaries more efficiently
    for y in range(block_size, height, block_size):
        y_start = max(0, y - border_width)
        y_end = min(height, y + border_width)
        block_boundary_mask[y_start:y_end, :] = True
    
    # Mark vertical block boundaries more efficiently
    for x in range(block_size, width, block_size):
        x_start = max(0, x - border_width)
        x_end = min(width, x + border_width)
        block_boundary_mask[:, x_start:x_end] = True
    
    # Detect edges using Sobel operators
    dx = ndimage.sobel(blocks, axis=1)
    dy = ndimage.sobel(blocks, axis=0)
    edge_strength = np.sqrt(dx**2 + dy**2)
    
    # Create edge mask where the edge strength exceeds the threshold
    # and only at block boundaries
    hard_edge_mask = (edge_strength > edge_threshold) & block_boundary_mask
    
    # Convert to uint8 for OpenCV bilateral filter
    img_uint8 = blocks.astype(np.uint8)
    
    # Apply bilateral filter to the entire image
    # d=-1 means automatic diameter based on sigmaSpace
    bilateral_filtered = cv2.bilateralFilter(img_uint8, d=-1, 
                                            sigmaColor=sigma_intensity,
                                            sigmaSpace=sigma_spatial)
    
    # Apply bilateral filtering only where needed (vectorized operation)
    filtered_blocks = np.where(hard_edge_mask, bilateral_filtered, filtered_blocks)
    
    # Step 2: Apply vectorized deblocking filter to the bilateral filtered result
    deblocked_result = deblocking_filter(
        filtered_blocks.astype(np.uint8), 
        block_size=block_size, 
        strength=deblock_strength, 
        threshold=deblock_threshold
    )
    
    # Return the final filtered result
    return deblocked_result


def chroma_subsample(matrix):
    # Ensure input is contiguous and correct type
    matrix = np.ascontiguousarray(matrix, dtype=np.uint8)
    
    # Ensure even width (horizontal dimension)
    if matrix.shape[1] % 2 != 0:
        matrix = matrix[:, :-1]
    
    # For 4:2:2, we only subsample horizontally, keeping full vertical resolution
    # We take the average of each pair of horizontally adjacent pixels
    result = np.mean(matrix.reshape(matrix.shape[0], matrix.shape[1] // 2, 2), axis=2)
    
    # Return result as contiguous uint8 array
    return np.ascontiguousarray(result, dtype=np.uint8)


def chroma_upsample(subsampled_matrix, target_height, target_width):
    # Ensure input is contiguous and correct type
    subsampled_matrix = np.ascontiguousarray(subsampled_matrix, dtype=np.uint8)
    
    # For 4:2:2, we only need to repeat in the horizontal dimension
    # The vertical dimension is already at full resolution
    upsampled = np.repeat(subsampled_matrix, 2, axis=1)
    
    # Ensure we match the target dimensions (in case of odd width)
    if upsampled.shape[1] > target_width:
        upsampled = upsampled[:, :target_width]
    
    # Make sure the height matches the target height
    # (No subsampling was done vertically, but the original might have been trimmed)
    if upsampled.shape[0] > target_height:
        # Trim if needed
        upsampled = upsampled[:target_height, :]
    elif upsampled.shape[0] < target_height:
        # Pad if needed (this would be unusual in typical cases)
        padding = np.zeros((target_height - upsampled.shape[0], upsampled.shape[1]), dtype=np.uint8)
        upsampled = np.vstack((upsampled, padding))
    
    # Return result as contiguous uint8 array
    return np.ascontiguousarray(upsampled, dtype=np.uint8)


def resize_image(image, target_size):
    """
    Process image in two steps:
    1. Crop to square from center using the smallest dimension
    2. Resize square image to target_size x target_size
    """
    h, w = image.shape[:2]

    # Find smallest dimension
    size = min(h, w)

    # Calculate center crop coordinates
    mid_h = h // 2
    mid_w = w // 2
    start_h = mid_h - (size // 2)
    start_w = mid_w - (size // 2)

    # Crop to square
    cropped = image[start_h:start_h + size, start_w:start_w + size]

    # Resize square image to target size
    return cv2.resize(cropped, (target_size, target_size))