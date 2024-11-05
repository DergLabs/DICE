#ifndef CONSTANTS_H
#define CONSTANTS_H
#include <stdint.h>
#include "hardware/i2c.h"

#define BUFFER_SIZE 32 // Buffer size including space for null terminator

// Will Be multiplied by 1000 when used, in a call that takes in kHz
// making the result 250MHz
static const int CLK_SPEED = 250;
// Will Be multiplied by 1000 when used, in a call that takes in kHz
// making the result 400MHz
static const int I2C_SPEED = 400;

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
static const float micro = 0.000001;

static const float temp_resolution = 125 * mili;
static const float current_resolution = 480 * mili;
static const float voltage_resolution = 3.125 * mili;
static const float power_resolution = 96 * micro;

static const int MBUS[] = {
    16, // MBUS_D0
    15, // MBUS_D1
    14, // MBUS_D2
    13, // MBUS_D3
    12, // MBUS_D4
    9,  // MBUS_D5
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

// INA700 Registers
static const uint16_t INA700_DIETEMP = 0x06;
static const uint16_t INA700_CURRENT = 0x07;
static const uint16_t INA700_VBUS = 0x05;
static const uint32_t INA700_POWER = 0x08;
//
// I2c Ports
i2c_inst_t *I2C_PORT0 = i2c0;
i2c_inst_t *I2C_PORT1 = i2c1;
#endif // !CONSTANTS_H
