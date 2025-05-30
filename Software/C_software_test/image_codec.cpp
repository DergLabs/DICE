//
// Created by John Hofmeyr on 3/11/25.
//

#include "image_codec.h"

std::vector<int16_t> dct(const std::vector<int16_t> &input) {
    std::vector<int16_t> x1n(8);
    x1n[0] = input[0] + input[7];
    x1n[1] = input[1] + input[6];
    x1n[2] = input[2] + input[5];
    x1n[3] = input[3] + input[4];
    x1n[4] = -input[4] + input[3];
    x1n[5] = -input[5] + input[2];
    x1n[6] = -input[6] + input[1];
    x1n[7] = -input[7] + input[0];

    std::vector<int16_t> x2n(8);
    x2n[0] = x1n[0] + x1n[3];
    x2n[1] = x1n[1] + x1n[2];
    x2n[2] = -x1n[2] + x1n[1];
    x2n[3] = -x1n[3] + x1n[0];
    x2n[4] = -x1n[4];
    x2n[5] = -x1n[5];
    x2n[6] = x1n[6] + x1n[7];
    x2n[7] = x1n[7] - x1n[6];

    std::vector<int16_t> x3n(8);
    x3n[0] = x2n[0] + x2n[1];
    x3n[1] = -x2n[1] + x2n[0];
    x3n[2] = x2n[2] + x2n[3];
    x3n[3] = x2n[3] - x2n[2];
    x3n[4] = x2n[4];
    x3n[5] = x2n[5];
    x3n[6] = x2n[6];
    x3n[7] = x2n[7];

    // Output Reordering
    std::vector<int16_t> output(8);
    output[0] = x3n[0];
    output[1] = x3n[6];
    output[2] = x3n[2];
    output[3] = x3n[5];
    output[4] = x3n[1];
    output[5] = x3n[7];
    output[6] = x3n[3];
    output[7] = x3n[4];

    return output;
}

std::vector<std::vector<int16_t>> quantize(const std::vector<std::vector<int16_t>>& dct_blocks, int16_t qs){
    // Baseline Quatnization Matrix
    std::vector<std::vector<int16_t>> Q_shift;
    Q_shift = {
            {0, 0, 0, 0, 0, 1, 1, 2},
            {0, 0, 0, 0, 1, 1, 2, 2},
            {0, 0, 0, 1, 1, 2, 2, 2},
            {0, 0, 1, 1, 2, 2, 2, 3},
            {0, 1, 1, 2, 7, 2, 3, 3},
            {1, 1, 2, 2, 2, 3, 3, 3},
            {1, 2, 2, 2, 3, 3, 3, 3},
            {2, 2, 2, 3, 3, 3, 3, 3}
    };

    std::vector<std::vector<int16_t>> result(8, std::vector<int16_t>(8, 0));

    // Perform quantization
    for (int i = 0; i < 8; i++) {
        for (int j = 0; j < 8; j++) {
            // Get sign of the original value
            int16_t sign = (dct_blocks[i][j] < 0) ? -1 : 1;

            // Calculate absolute value
            int16_t abs_val = std::abs(dct_blocks[i][j]);

            // Calculate the divisor (2^(Q_shift + qs))
            int16_t shift_amount = Q_shift[i][j] + qs;

            // Add half the divisor for proper rounding (equivalent to (Q_shift+qs)//2)
            int16_t rounding = shift_amount / 2;

            // Quantize: (abs_val + rounding) >> shift_amount
            int16_t quantized = (abs_val + rounding) >> shift_amount;

            // Apply sign to get final result
            result[i][j] = quantized * sign;
        }
    }

    return result;
}