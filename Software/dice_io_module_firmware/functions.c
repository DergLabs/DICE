#include "functions.h"
#include "constants.h"
#include "dice_imx477.h"

bool ina700_read_32_reg(uint8_t reg, uint32_t *data) {
    uint8_t buf[4];
    if(i2c_write_blocking(i2c0, INA700_ADDR, &reg, 2, false) != 2) {
        return false;
    }
    if(i2c_read_blocking(i2c0, INA700_ADDR, buf, 4, true) != 4) {
        return false;
    }
    // printf("Raw Bytes: %x | %x | %x\n", buf[0], buf[1], buf[2]);
    *data = (buf[0] << 16 | buf[1] << 8 | buf[2]);
    return true;
}

bool ina700_read_16_reg(uint8_t reg, int16_t *data) {
    uint8_t buf[2];
    if(i2c_write_blocking(i2c0, INA700_ADDR, &reg, 2, false) != 2) {
        return false;
    }
    if(i2c_read_blocking(i2c0, INA700_ADDR, buf, 2, true) != 2) {
        return false;
    }
    // printf("Raw Bytes: %x | %x |\n", buf[0], buf[1]);
    *data = (buf[0] << 8) | buf[1];
    return true;
}

bool imx477_write(uint16_t reg, uint8_t data) {
    uint8_t i2c_src[3] = {(reg >> 8) & 0xFF, // Register Address [15:8]
                          reg & 0xFF,        // Register Address [7:0]
                          data};
    if(i2c_write_blocking(i2c1, (uint8_t)IMX477_SENSOR_ID, i2c_src, 3, false) !=
       3)
        return false;
}

bool imx477_read(uint16_t reg, uint8_t *buf, size_t buflen) {
    uint8_t i2c_src[3] = {(reg >> 8) & 0xFF, // Register Address [15:8]
                          reg & 0xFF,        // Register Address [7:0]
                          (uint8_t)IMX477_SENSOR_ID};
    if(i2c_read_blocking(i2c1, (uint8_t)IMX477_SENSOR_ID, i2c_src, buflen,
                         true) != buflen)
        return false;
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
