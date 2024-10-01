#include "pico/stdio.h"
#include "pico/stdlib.h"
#include "hardware/spi.h"
#include "hardware/i2c.h"
#include "hardware/timer.h"
#include "hardware/clocks.h"
#include "hardware/gpio.h"
#include "hardware/uart.h"
#include <boards/pico.h>
#include <pico/time.h>
#include <stdint.h>

// Will Be multiplied by 1000 when used, in a call that takes in kHz
// making the result 250MHz
static const int CLK_SPEED = 250;

// TODO: explain thsi
static const int SPI_SPEED = 40;
static const int I2C_SPEED = 400;

// GPIO Pins
static const int _3V3_EN = 22;
static const int _2V5_EN = 21;
static const int _1V8_EN = 12;
static const int _1V2_EN = 10;
static const int _0V9_EN = 14;
static const int _0V85_EN = 20;
static const int _3V3_ISNS_ALERT = 9;
static const int _1V8_ISNS_ALERT = 8;
static const int _1V2_ISNS_ALERT = 23;
static const int _0V9_ISNS_ALERT = 24;
static const int _0V85_ISNS_ALERT = 15;

static const int SYS_SPI_MISO = 16;
static const int SYS_SPI_MOSI = 19;
static const int SYS_SPI_SCLK = 18;
static const int SYS_SPI_CS = 17;
static const int I2C0_SDA = 4;
static const int I2C0_SCL = 5;
static const int I2C1_SDA = 6;
static const int I2C1_SCL = 7;
static const int MCU_HUB_LED = 25;
static const int FPGA_MCU_M0 = 2;
static const int FPGA_MCU_M1 = 1;
static const int FPGA_MCU_M2 = 3;

// INA700 Sensors
static const int INA700_3V3_Sense = 0x47;
static const int INA700_1V8_Sense = 0x46;
static const int INA700_1V2_Sense = 0x45;
static const int INA700_0V9_Sense = 0x44;

// INA700 Registers
static const uint16_t INA700_DIETEMP = 0x06;
static const uint16_t INA700_CURRENT = 0x07;
static const uint16_t INA700_VBUS = 0x05;
static const uint32_t INA700_POWER = 0x08;

// INA236 Sensor
static const int _0V85_Sense = 0x48;

// INA236 Registers
static const uint8_t INA236_VBUS = 0x02;
static const uint8_t INA236_Power = 0x03;
static const uint8_t INA236_Current = 0x04;

// INA236 ADCRANGE Set to 1 OR Mask
static const uint16_t INA236_CONFIG_ADCRANGE_MASK = 0b0001000000000000;


// Resolution 
static const float mili = 0.001;
static const float VBUS_RESOLUTION = 1.6 * mili;

// TODO: Why do I even need R_SHUNT???
static const float R_SHUNT = 0.0005; // 500 uOhm
static const float CURRENT_LSB_MIN = 0.0018310546875;
static const float SHUNT_CAL = 0.00512/(CURRENT_LSB_MIN * R_SHUNT * 4);

int main() {
    stdio_init_all();
    spi_init(spi0, SPI_SPEED * 1000);
    i2c_init(i2c0, I2C_SPEED * 1000);
    i2c_init(i2c1, I2C_SPEED * 1000);

    gpio_set_function(I2C0_SDA, GPIO_FUNC_I2C);
    gpio_set_function(I2C0_SCL, GPIO_FUNC_I2C);
    gpio_set_function(I2C1_SDA, GPIO_FUNC_I2C);
    gpio_set_function(I2C1_SCL, GPIO_FUNC_I2C);

    // TODO: Do MCU_CLK stuff

    // Init all pins we'll be using
    gpio_init(MCU_HUB_LED);
    gpio_init(_3V3_EN);
    gpio_init(_2V5_EN);
    gpio_init(_1V8_EN);
    gpio_init(_1V2_EN);
    gpio_init(_0V9_EN);
    gpio_init(_0V85_EN);
    gpio_init(_3V3_ISNS_ALERT);
    gpio_init(_1V8_ISNS_ALERT);
    gpio_init(_1V2_ISNS_ALERT);
    gpio_init(_0V9_ISNS_ALERT);
    gpio_init(_0V85_ISNS_ALERT);
    gpio_init(FPGA_MCU_M0);
    gpio_init(FPGA_MCU_M1);
    gpio_init(FPGA_MCU_M2);

    // Set direction of all pins
    gpio_set_dir(MCU_HUB_LED, GPIO_OUT);
    gpio_set_dir(_3V3_EN, GPIO_OUT);
    gpio_set_dir(_2V5_EN, GPIO_OUT);
    gpio_set_dir(_1V8_EN, GPIO_OUT);
    gpio_set_dir(_1V2_EN, GPIO_OUT);
    gpio_set_dir(_0V9_EN, GPIO_OUT);
    gpio_set_dir(_0V85_EN, GPIO_OUT);

    gpio_set_dir(FPGA_MCU_M0, GPIO_OUT);
    gpio_set_dir(FPGA_MCU_M1, GPIO_OUT);
    gpio_set_dir(FPGA_MCU_M2, GPIO_OUT);

    gpio_set_dir(_3V3_ISNS_ALERT, GPIO_IN);
    gpio_set_dir(_1V8_ISNS_ALERT, GPIO_IN);
    gpio_set_dir(_1V2_ISNS_ALERT, GPIO_IN);
    gpio_set_dir(_0V9_ISNS_ALERT, GPIO_IN);
    gpio_set_dir(_0V85_ISNS_ALERT, GPIO_IN);

    // Pull Up
    gpio_pull_up(I2C0_SCL);
    gpio_pull_up(I2C0_SDA);
    gpio_pull_up(I2C1_SCL);
    gpio_pull_up(I2C1_SDA);

    // Write Low
    gpio_put(_3V3_EN, 0);
    gpio_put(_2V5_EN, 0);
    gpio_put(_1V8_EN, 0);
    gpio_put(_1V2_EN, 0);
    gpio_put(_0V9_EN, 0);
    gpio_put(_0V85_EN, 0);
    gpio_put(FPGA_MCU_M0, 0);
    gpio_put(FPGA_MCU_M1, 0);
    gpio_put(FPGA_MCU_M2, 0);

    // Set LED Low
    gpio_put(MCU_HUB_LED, 0);

    // Initialize Power Supplies
    gpio_put(_0V85_EN, 1);
    gpio_put(_1V8_EN, 1);
    gpio_put(_0V9_EN, 1);
    gpio_put(_1V2_EN, 1);
    gpio_put(_3V3_EN, 1);
    gpio_put(_2V5_EN, 1);

    // Set FPGA Mode Pins
    gpio_put(FPGA_MCU_M0, 1);
    gpio_put(FPGA_MCU_M1, 0);
    gpio_put(FPGA_MCU_M2, 0);

    // Set clock speed
    set_sys_clock_khz(CLK_SPEED * 1000, true);

    sleep_ms(4000);
    while(true) {
        gpio_put(MCU_HUB_LED, 1);
        sleep_ms(500);
        gpio_put(MCU_HUB_LED, 0);
        sleep_ms(500);
    }
}
