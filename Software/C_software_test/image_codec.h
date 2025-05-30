//
// Created by John Hofmeyr on 3/11/25.
//

#ifndef C_SOFTWARE_TEST_IMAGE_CODEC_H
#define C_SOFTWARE_TEST_IMAGE_CODEC_H

#include <cmath>
#include <cstdint>
#include <vector>
#include <array>

std::vector<int16_t> dct(const std::vector<int16_t> &input);
std::vector<std::vector<int16_t>> quantize(const std::vector<std::vector<int16_t>>& dct_blocks, int16_t qs);

#endif //C_SOFTWARE_TEST_IMAGE_CODEC_H
