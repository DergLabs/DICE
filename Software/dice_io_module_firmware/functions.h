#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#include <hardware/i2c.h>
#include <stdbool.h>
#include <ctype.h>
#include <stdio.h>

bool ina700_read_32_reg(uint8_t reg, uint32_t *data);
bool ina700_read_16_reg(uint8_t reg, int16_t *data);
bool imx477_write(uint16_t reg, uint8_t data);
bool imx477_read(uint16_t reg, uint8_t *buf, size_t buflen);
void readInput(char *buffer);
#endif //! FUNCTIONS_H
