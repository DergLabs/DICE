#include <stdio.h>
#include "pico/stdlib.h"
#include "hardware/i2c.h"
#include "hardware/timer.h"
#include "hardware/clocks.h"
#include "hardware/uart.h"

// Will Be multiplied by 1000 when used, in a call that takes in kHz
// making the result 250MHz
static const int CLK_SPEED = 250;

// IO Module Pins
static const int USBPD_FLT_IN = 26;
static const int USBPD_SINK_EN = 24;
static const int USBPD_DBG_ACC = 27;
static const int USBPD_CAP_MIS = 28;
static const int USBPD_PLG_FLIP = 0;
static const int USBPD_PLG_EVNT = 1;

static const int CAM_PWR_EN = 2;
static const int CAM_LED_EN = 3;
static const int I2C0_SDA = 4;
static const int I2C0_SCL = 5;
static const int I2C1_SDA = 6;
static const int I2C1_SCL = 7;
static const int HDMI_BUFF_EN = 8;
static const int MCU_HUB_LED = 25;

static const float mili = 0.001;
static const float micro = 0.0000001;

static const float temp_resolution = 125 * mili; // mili degree Celsius
static const float current_resolution = 480 * micro; // micro Amp
static const float voltage_resolution = 3.125 * mili; // mili Volt
static const float power_resolution = 96 * micro; // micro Watt

static const int MBUS[] = {
    16, // MBUS_D0
    15, // MBUS_D1
    14, // MBUS_D2
    13, // MBUS_D3
    12, // MBUS_D4
     9, // MBUS_D5
    10, // MBUS_D6
    11, // MBUS_D7
    18, // MBUS_D8
    19, // MBUS_D9
    20, // MBUS_D10
    21, // MBUS_D11
    22, // MBUS_D12
    23, // MBUS_D13
    17, // MBUS_D14
};

// I2C Device Addresses
static const uint8_t INA700_ADDR = 0x44;
// TODO: Add description from HDMI_R and HDMI_W not sure what they are for
static const uint8_t HDMI_R = 0xB6;
static const uint8_t HDMI_W = 0xB7;

// INA700 Registers
static const uint16_t INA700_DIETEMP = 0x6;
static const uint16_t INA700_CURRENT = 0x7;
static const uint16_t INA700_VBUS = 0x5;
static const uint32_t INA700_POWER = 0x8;

// I2c Ports 
i2c_inst_t *I2C_PORT0 = i2c0;
i2c_inst_t *I2C_PORT1 = i2c1;

bool ina700_read_32_reg(uint8_t reg, uint32_t* data) {
    uint8_t buf[4];
    if (i2c_write_blocking(I2C_PORT0, INA700_ADDR, &reg, 1, true) != 1) {
        return false;
    }
    if (i2c_read_blocking(I2C_PORT0, INA700_ADDR, buf, 2, false) != 2) {
        return false;
    }
	*data = (buf[3] << 24 | buf[3] << 16) && (buf[1] << 8 | buf[0]);
    return true;
}

bool ina700_read_16_reg(uint8_t reg, int16_t* data) {
    uint8_t buf[2];
    if (i2c_write_blocking(I2C_PORT0, INA700_ADDR, &reg, 1, true) != 1) {
        return false;
    }
    if (i2c_read_blocking(I2C_PORT0, INA700_ADDR, buf, 2, false) != 2) {
        return false;
    }
    *data = (buf[1] << 8) | buf[0];
    return true;
}

int main()
{
    const size_t MBUS_SIZE = sizeof(MBUS) / sizeof(MBUS[0]);
    stdio_init_all();

    // Set clock speed
    set_sys_clock_khz(CLK_SPEED*1000, true); 

    // Init all pins we'll be using
    gpio_init(USBPD_FLT_IN);
    gpio_init(USBPD_SINK_EN);
    gpio_init(USBPD_DBG_ACC);
    gpio_init(USBPD_CAP_MIS);
    gpio_init(USBPD_PLG_FLIP);
    gpio_init(USBPD_PLG_EVNT);

    gpio_init(CAM_PWR_EN);
    gpio_init(CAM_LED_EN);
    gpio_init(I2C0_SDA);
    gpio_init(I2C0_SCL);
    gpio_init(I2C1_SDA);
    gpio_init(I2C1_SCL);
    gpio_init(HDMI_BUFF_EN);
    gpio_init(MCU_HUB_LED);

    for (int i = 0; i < MBUS_SIZE; i++) {
        gpio_init(MBUS[i]);
    }

    // Set directions of pins
    gpio_set_dir(USBPD_SINK_EN, GPIO_IN);
    gpio_set_dir(USBPD_DBG_ACC, GPIO_IN);
    gpio_set_dir(USBPD_CAP_MIS, GPIO_IN);
    gpio_set_dir(USBPD_PLG_FLIP, GPIO_IN);
    gpio_set_dir(USBPD_PLG_EVNT, GPIO_IN);

    gpio_set_dir(USBPD_FLT_IN, GPIO_OUT);
    gpio_set_dir(CAM_PWR_EN, GPIO_OUT);
    gpio_set_dir(CAM_LED_EN, GPIO_OUT);
    gpio_set_dir(HDMI_BUFF_EN, GPIO_OUT);
    gpio_set_dir(MCU_HUB_LED, GPIO_OUT);

    for (int i = 0; i < MBUS_SIZE; i++)
        gpio_set_dir(MBUS[i], GPIO_OUT);

    // Pull Up/Down resistors

    // Up
    gpio_pull_up(USBPD_FLT_IN);
    gpio_pull_up(USBPD_SINK_EN);
    gpio_pull_up(USBPD_DBG_ACC);
    gpio_pull_up(USBPD_CAP_MIS);
    gpio_pull_up(USBPD_PLG_FLIP);
    gpio_pull_up(USBPD_PLG_EVNT);
    gpio_pull_up(I2C0_SCL);
    gpio_pull_up(I2C0_SDA);
    gpio_pull_up(I2C1_SCL);
    gpio_pull_up(I2C1_SDA);

    // Down
    gpio_pull_down(CAM_PWR_EN);
    gpio_pull_down(CAM_LED_EN);
    gpio_pull_down(HDMI_BUFF_EN);

    for (int i = 0; i < MBUS_SIZE; i++)
        gpio_pull_down(MBUS[i]);


    // i2c ex https://www.digikey.com/en/maker/projects/raspberry-pi-pico-rp2040-i2c-example-with-micropython-and-cc/47d0c922b79342779cdbd4b37b7eb7e2
    // Set up I2C

    // Initialize I2C port at 400 kHz
    i2c_init(I2C_PORT0, 400 * 1000);
    i2c_init(I2C_PORT1, 400 * 1000);

    // Initialize I2C pins
    gpio_set_function(I2C0_SDA, GPIO_FUNC_I2C);
    gpio_set_function(I2C0_SCL, GPIO_FUNC_I2C);
    gpio_set_function(I2C1_SDA, GPIO_FUNC_I2C);
    gpio_set_function(I2C1_SCL, GPIO_FUNC_I2C);

    // USBPD IO Values
    bool usbpd_sink_en = gpio_get(USBPD_SINK_EN);
    bool usbpd_dbg_acc = gpio_get(USBPD_DBG_ACC);
    bool usbpd_cap_mis = gpio_get(USBPD_CAP_MIS);
    bool usbpd_plg_flip = gpio_get(USBPD_PLG_FLIP);
    bool usbpd_plg_evnt = gpio_get(USBPD_PLG_EVNT);

	// Wait 4 seconds to allow terminal to set up
	sleep_ms(4000);

	// Display USBPD IO Values
    printf("USBPD Sink Enable: %d\n", usbpd_sink_en);
    printf("USBPD Debug Access: %d\n", usbpd_dbg_acc);
    printf("USBPD Capacity Mismatch: %d\n", usbpd_cap_mis);
    printf("USBPD Plug Flip: %d\n", usbpd_plg_flip);
    printf("USBPD Plug Event: %d\n", usbpd_plg_evnt);
    printf("-----------------------------\n");

    while (true) {
        gpio_put(MCU_HUB_LED, false); 
        sleep_ms(500);
        gpio_put(MCU_HUB_LED, true);
        sleep_ms(500);

        // INA700 Readings 
        int16_t ina700_temp;
        int16_t ina700_current;
		int16_t ina700_voltage;
        uint32_t ina700_power;

        if (!ina700_read_16_reg(INA700_DIETEMP, &ina700_temp)) {
            printf("Failed to read INA700 Temperature\n");
        }

        if (!ina700_read_16_reg(INA700_CURRENT, &ina700_current)) {
            printf("Failed to read INA700 Current\n");
        }

        if (!ina700_read_16_reg(INA700_CURRENT, &ina700_voltage)) {
            printf("Failed to read INA700 Voltage\n");
        }

        if (!ina700_read_32_reg(INA700_POWER, &ina700_power)) {
            printf("Failed to read INA700 Power\n");
        }

        // INA700 Calculated Values;
        int16_t ina700_calculated_temp = ina700_temp * temp_resolution;
        int16_t ina700_calculated_current = ina700_current * current_resolution;
        int16_t ina700_calculated_voltage = ina700_voltage * voltage_resolution;
        int16_t ina700_calculated_power = ina700_power * power_resolution;

        printf("INA700 Readings\n");
        printf("Temperature: %dC\n", ina700_calculated_temp);
        printf("Current: %dA\n", ina700_calculated_current);
        printf("Voltage: %dV\n", ina700_calculated_voltage);
		printf("Current: %dW\n", ina700_calculated_power);
        printf("-----------------------------\n");
    }


    
}
