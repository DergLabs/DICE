#include <pico/error.h>
#include <pico/types.h>
#include <stdbool.h>
#include "hardware/i2c.h"

float avg_float_arr(float *arr, int len) {
    float sum = 0.f;
    float avg = 0.f;

    for(int i = 0; i < len; i++) {
        sum += arr[i];
    }

    avg = sum / len;
    return avg;
}

bool device_i2c_read_u16(i2c_inst_t *i2c_port, uint8_t addr, const uint8_t *src,
                         size_t src_len, uint16_t *dest, size_t dest_len) {
    unsigned char buf[2];

    int wrote = i2c_write_blocking(i2c_port, addr, src, src_len, false);
    if(wrote == PICO_ERROR_GENERIC) {
        printf("device_i2c_read_u16: Address not acknowledged or no device "
               "present:\n");
        printf("device_i2c_read_u16: Address: %x\n", addr);
        return false;
    }
    if(wrote != src_len) {
        printf("device_i2c_read_u16: did not write %d, instead wrote %d\n",
               src_len, wrote);
        return false;
    }
    int read = i2c_read_blocking(i2c_port, addr, buf, dest_len, true);
    if(read != dest_len) {
        printf("device_i2c_read_u16: did not read %d, instead read %d\n",
               dest_len, read);
        return false;
    }

    // printf("Raw Bytes: %x | %x |\n", buf[0], buf[1]);
    *dest = (buf[0] << 8) | (buf[1]);
    return true;
}

bool device_i2c_read_i16(i2c_inst_t *i2c_port, uint8_t addr, const uint8_t *src,
                         size_t src_len, int16_t *dest, size_t dest_len) {
    unsigned char buf[2];

    if(i2c_write_blocking(i2c_port, addr, src, src_len, false) != src_len) {
        return false;
    }
    if(i2c_read_blocking(i2c_port, addr, buf, dest_len, true) != dest_len) {
        return false;
    }

    // printf("Raw Bytes: %x | %x |\n", buf[0], buf[1]);
    *dest = (buf[0] << 8) | (buf[1]);
    return true;
}

bool device_i2c_read_u32(i2c_inst_t *i2c_port, uint8_t addr, const uint8_t *src,
                         size_t src_len, uint32_t *dest, size_t dest_len) {
    unsigned char buf[4];

    if(i2c_write_blocking(i2c_port, addr, src, src_len, false) != src_len) {
        return false;
    }
    if(i2c_read_blocking(i2c_port, addr, buf, dest_len, true) != dest_len) {
        return false;
    }

    // printf("Raw Bytes: %x | %x | %x\n", buf[0], buf[1], buf[2]);
    *dest = (buf[0] << 16 | buf[1] << 8 | buf[2]);
    return true;
}

// Might Need Later
// Example function to write/read SPI
// void spi_transfer_example() {
//     uint8_t send_buf[3] = {0x01, 0x02, 0x03};
//     uint8_t read_buf[3];
//
//     // Select the device by pulling CS low
//     gpio_put(PIN_CS, 0);
//
//     // Perform SPI transfer
//     spi_write_read_blocking(SPI_PORT, send_buf, read_buf, 3);
//
//     // Deselect the device
//     gpio_put(PIN_CS, 1);
// }
