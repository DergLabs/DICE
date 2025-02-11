import cv2
import numpy as np


def rgb2ycrcb(r, g, b):
    # Convert input values to int to ensure proper calculation
    r, g, b = int(r), int(g), int(b)

    # Your implementation
    rm1 = r * 1052
    rm2 = r * 1799
    rm3 = r * 607

    gm1 = g * 2065
    gm2 = g * 1507
    gm3 = g * 1192

    bm1 = b * 401
    bm2 = b * 292
    bm3 = b * 1799

    add1 = rm1 + gm1 + bm1 + 65536
    add2 = rm2 - gm2 - bm2 + 524288
    add3 = bm3 - rm3 - gm3 + 524288

    Y = add1 >> 12
    Cr = add2 >> 12
    Cb = add3 >> 12

    # Clip values to valid range [0, 255]
    Y = np.clip(Y, 0, 255)
    Cr = np.clip(Cr, 0, 255)
    Cb = np.clip(Cb, 0, 255)

    return Y, Cr, Cb


def compare_conversions(img_path):
    # Read image
    img = cv2.imread(img_path)
    if img is None:
        raise ValueError(f"Could not read image: {img_path}")

    # Get image dimensions
    height, width = img.shape[:2]

    # Initialize counters for differences
    diff_count = 0
    max_diff = 0

    # Convert using OpenCV
    cv2_ycrcb = cv2.cvtColor(img, cv2.COLOR_BGR2YCrCb)

    print("Comparing conversions...")
    print("Format: RGB Input -> [Your YCrCb] vs [OpenCV YCrCb] (difference)")
    print("-" * 80)

    # Compare pixel by pixel
    for y in range(height):
        for x in range(width):
            # Get BGR values (OpenCV stores as BGR)
            b, g, r = img[y, x]

            # Your implementation
            y_custom, cr_custom, cb_custom = rgb2ycrcb(r, g, b)

            # OpenCV implementation
            y_cv2, cr_cv2, cb_cv2 = cv2_ycrcb[y, x]

            # Calculate differences
            diff_y = abs(int(y_custom) - int(y_cv2))
            diff_cr = abs(int(cr_custom) - int(cr_cv2))
            diff_cb = abs(int(cb_custom) - int(cb_cv2))

            # Track maximum difference
            max_diff = max(max_diff, diff_y, diff_cr, diff_cb)

            # If any difference is significant (e.g., > 1 to account for rounding)
            if diff_y > 1 or diff_cr > 1 or diff_cb > 1:
                diff_count += 1
                print(f"Position ({x},{y}):")
                print(f"RGB({r},{g},{b}) ->")
                print(f"  Your output:  Y:{y_custom:3d} Cr:{cr_custom:3d} Cb:{cb_custom:3d}")
                print(f"  OpenCV:       Y:{y_cv2:3d} Cr:{cr_cv2:3d} Cb:{cb_cv2:3d}")
                print(f"  Difference:   Y:{diff_y:3d} Cr:{diff_cr:3d} Cb:{diff_cb:3d}")
                print()

                # Limit output to first 10 differences to avoid overwhelming output
                if diff_count >= 10:
                    print("... more differences found (showing first 10 only)")
                    break
        if diff_count >= 10:
            break

    total_pixels = height * width
    print(f"\nSummary:")
    print(f"Total pixels processed: {total_pixels}")
    print(f"Number of differences found: {diff_count}")
    print(f"Percentage of different pixels: {(diff_count / total_pixels) * 100:.2f}%")
    print(f"Maximum difference found: {max_diff}")


if __name__ == "__main__":
    try:
        compare_conversions("img1.jpg")
    except Exception as e:
        print(f"Error: {e}")