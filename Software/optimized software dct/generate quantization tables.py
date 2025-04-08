import numpy as np

# Baseline Quantization matrix, represents the number of bits to right shift (divide) each DCT coefficient
# To find actual quantization value, simply do 1 << Q_shift
Q_shift_base = np.array([
    [0, 0, 0, 0, 0, 1, 1, 2],
    [0, 0, 0, 0, 1, 1, 2, 2],
    [0, 0, 0, 1, 1, 2, 2, 2],
    [0, 0, 1, 1, 2, 2, 2, 3],
    [0, 1, 1, 2, 7, 2, 3, 3],
    [1, 1, 2, 2, 2, 3, 3, 3],
    [1, 2, 2, 2, 3, 3, 3, 3],
    [2, 2, 2, 3, 3, 3, 3, 3],
], dtype=np.int16)
# Baseline Dequantization Matrix, represents the amount to divide each DCT coefficient by
# Matrix is not in bit shift form because it is
Qd_base = np.array(
[
    [  1,   2,   1,   4,   1,   4,   4,  32],
    [  2,   4,   2,   8,   4,   8,   4,  32],
    [  1,   2,   1,   8,   1,   4,   4,  16],
    [  4,   8,   4,  16,  16,  32,   8, 128],
    [  1,   4,   2,  16,  512,   8,   8,  32],
    [  4,   8,  16,  32,   8,  32,   8,  64],
    [  2,   4,   4,  16,  16,  16,   8,  32],
    [ 16,  32,  16,  64,  32,  64,  32,  64]
], dtype=np.int16)

# Baseline DeQuantization Matrix, represents the amount to left shift (multiply) each DCT coefficient by
# Negative numbers indicate a right shift (divide), positive numbers indicate a left shift (multiply)
Qd_shift_base = np.array([
    [-3, -2, -3, -1, -3, -2, -1, 1],
    [-2, -1, -2, 0, -2, 0, -2, 1],
    [-3, -2, -3, -1, -3, -2, -2, 0],
    [-1, 0, -2, 1, 0, 6, 1, 3],
    [-3, -2, -2, 0, 5, 1, 0, 2],
    [-2, 0, 0, 6, 1, 2, 0, 3],
    [-2, -2, -2, 2, 1, 1, 0, 2],
    [0, 1, 2, 3, 2, 3, 2, 3]
], dtype=np.int16)


def adjust_qd(Q_shift_old, Q_shift_new, Qd, Qd_shift):
    # Create copies of matrices to modify
    new_Qd = Qd.copy()
    new_Qd_shift = Qd_shift.copy()

    # Calculate the difference between new and old Q_shift values
    diff = Q_shift_new - Q_shift_old

    # For each position in the difference matrix
    for i in range(diff.shape[0]):
        for j in range(diff.shape[1]):
            # Get the difference at this position
            shift_diff = diff[i, j]

            # If difference is positive, multiply by 2 that many times
            if shift_diff > 0:
                new_Qd[i, j] *= (2 ** shift_diff)
                new_Qd_shift[i, j] += shift_diff  # Add to shift value when multiplying
            # If difference is negative, divide by 2 that many times
            elif shift_diff < 0:
                new_Qd[i, j] /= (2 ** abs(shift_diff))
                new_Qd_shift[i, j] -= abs(shift_diff)  # Subtract from shift value when dividing

    return new_Qd, new_Qd_shift


def format_matrix(matrix):
    # Convert matrix to string with specific formatting
    matrix_str = np.array2string(
        matrix,
        separator=', ',
        prefix='',
        suffix='',
        max_line_width=1000
    )

    # Clean up the string formatting
    matrix_str = matrix_str.replace('[[', '[\n    [')  # Add newline after first bracket
    matrix_str = matrix_str.replace('],\n ', '],\n    ')  # Fix spacing for middle rows
    matrix_str = matrix_str.replace(']]', ']\n]')  # Add newline before last bracket

    return matrix_str

if __name__ == "__main__":

    # Replace Me with new quantization values
    # Values represent amount to bif shift rigth (divide) each DCT coefficient
    Q_shift_new = np.array([
        [0, 0, 0, 0, 0, 1, 1, 2],
        [0, 0, 0, 0, 1, 1, 2, 2],
        [0, 0, 0, 1, 1, 2, 2, 2],
        [0, 0, 1, 1, 2, 2, 2, 3],
        [0, 1, 1, 2, 2, 2, 3, 3],
        [1, 1, 2, 2, 2, 3, 3, 3],
        [1, 2, 2, 2, 3, 3, 3, 3],
        [2, 2, 2, 3, 3, 3, 3, 3],
    ], dtype=np.int16)

    

    Qd_new, Qd_shift_new = adjust_qd(Q_shift_base, Q_shift_new, Qd_base, Qd_shift_base)

    print(f"Q Base: {1 << Q_shift_base}")


    # Then modify your print statements:
    print("Q_shift_base = np.array(")
    print(format_matrix(Q_shift_base) + ", dtype=np.int16)")
    print("\nQ_shift_new = np.array(")
    print(format_matrix(Q_shift_new) + ", dtype=np.int16)")
    print("\nQd_base = np.array(")
    print(format_matrix(Qd_base) + ", dtype=np.int16)")
    print("\nQd_new = np.array(")
    print(format_matrix(Qd_new) + ", dtype=np.int16)")
    print("\nQd_shift_base = np.array(")
    print(format_matrix(Qd_shift_base) + ", dtype=np.int16)")
    print("\nQd_shift_new = np.array(")
    print(format_matrix(Qd_shift_new) + ", dtype=np.int16)")
    print(f"-----------------------------------------------------------\n")
    print(f"Difference in Quantization Matrices: \n{Q_shift_new - Q_shift_base}")
    print(f"Difference in Dequantization Matrices: \n{Qd_new - Qd_base}")
    print(f"Difference in Dequantization Shift Matrices: \n{Qd_shift_new - Qd_shift_base}")