#ifndef FUNCTIONS_H
#define FUNCTIONS_H

#include "constants.h"
#include <stdbool.h>
#include <ctype.h>
#include <stdio.h>

bool ina700_read_32_reg(uint8_t reg, uint32_t *data) {
    uint8_t buf[4];
    if(i2c_write_blocking(I2C_PORT0, INA700_ADDR, &reg, 2, false) != 2) {
        return false;
    }
    if(i2c_read_blocking(I2C_PORT0, INA700_ADDR, buf, 4, true) != 4) {
        return false;
    }
    // printf("Raw Bytes: %x | %x | %x\n", buf[0], buf[1], buf[2]);
    *data = (buf[0] << 16 | buf[1] << 8 | buf[2]);
    return true;
}

bool ina700_read_16_reg(uint8_t reg, int16_t *data) {
    uint8_t buf[2];
    if(i2c_write_blocking(I2C_PORT0, INA700_ADDR, &reg, 2, false) != 2) {
        return false;
    }
    if(i2c_read_blocking(I2C_PORT0, INA700_ADDR, buf, 2, true) != 2) {
        return false;
    }
    // printf("Raw Bytes: %x | %x |\n", buf[0], buf[1]);
    *data = (buf[0] << 8) | buf[1];
    return true;
}

void readInput(char *buffer) {
    int i = 0;
    int ch;

    // Read characters until we fill the buffer, reach EOF, or encounter a
    // newline
    while(i < BUFFER_SIZE - 1 && (ch = getchar()) != EOF && ch != '\n') {
        buffer[i++] = tolower((char)ch); // convert all characters to lowercase
    }

    // Null-terminate the string
    buffer[i] = '\0';
    printf("Buffer: %s\n", buffer); // debug only
}

#endif //!FUNCTIONS_H
