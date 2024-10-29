#include <stdint.h>

// Will Be multiplied by 1000 when used, in a call that takes in kHz
// making the result 250MHz
static const uint8_t CLK_SPEED = 250;
static const uint8_t DESIRED_MCU_CLK_SPEED = 100; // MHz

static const uint8_t SPI_SPEED = 40;
static const uint16_t I2C_SPEED = 400;

// GPIO Pins
static const uint8_t _3V3_EN = 22;
static const uint8_t _2V5_EN = 21;
static const uint8_t _1V8_EN = 12;
static const uint8_t _1V2_EN = 10;
static const uint8_t _0V9_EN = 14;
static const uint8_t _0V85_EN = 20;
static const uint8_t _3V3_ISNS_ALERT = 9;
static const uint8_t _1V8_ISNS_ALERT = 8;
static const uint8_t _1V2_ISNS_ALERT = 23;
static const uint8_t _0V9_ISNS_ALERT = 24;
static const uint8_t _0V85_ISNS_ALERT = 15;

static const uint8_t SYS_SPI_MISO = 16;
static const uint8_t SYS_SPI_MOSI = 19;
static const uint8_t SYS_SPI_SCLK = 18;
static const uint8_t SYS_SPI_CS = 17;
static const uint8_t I2C0_SDA = 4;
static const uint8_t I2C0_SCL = 5;
static const uint8_t I2C1_SDA = 6;
static const uint8_t I2C1_SCL = 7;
static const uint8_t MCU_HUB_LED = 25;
static const uint8_t FPGA_MCU_M0 = 2;
static const uint8_t FPGA_MCU_M1 = 1;
static const uint8_t FPGA_MCU_M2 = 3;
static const uint8_t MCU_CLK = 0;

// INA700 Sensors
static const int INA700_3V3_SENSE = 0x47;
static const int INA700_1V8_SENSE = 0x46;
static const int INA700_1V2_SENSE = 0x45;
static const int INA700_0V9_SENSE = 0x44;

// INA700 Registers
static const uint8_t INA700_DIETEMP = 0x06;
static const uint8_t INA700_CURRENT = 0x07;
static const uint8_t INA700_VBUS = 0x05;
static const uint8_t INA700_POWER = 0x08;

// INA236 Sensor
static const int INA236_0V85_SENSE = 0x40;

// INA236 Registers
static const uint8_t INA236_CONFIGURATION = 0x00;
static const uint8_t INA236_VBUS = 0x02;
static const uint8_t INA236_POWER = 0x03;
static const uint8_t INA236_CURRENT = 0x04;
static const uint8_t INA236_CALIBRATION = 0x05;

// INA236 ADCRANGE Set to 1 OR Mask
static const uint16_t INA236_CONFIG_ADCRANGE_MASK = 0b0001000000000000;

// Resolution
static const float mili = 0.001;
static const float micro = 0.000001;

static const float ina700_temp_resolution = 125 * mili;
static const float ina700_current_resolution = 480 * mili;
static const float ina700_voltage_resolution = 3.125 * mili;
static const float ina700_power_resolution = 96 * micro;
static const float ina236_bus_voltage_resolution = 1.6 * mili;

// For the INA236 to report current values in Amperes, a constant conversion
// value must be written in the calibration register that is dependent on the
// selected CURRENT_LSB and the shunt resistance used in the application.
static const float R_SHUNT = 0.0005; // 500 uOhm
static const float INA236_CURRENT_LSB_MIN =
    0.0018310546875; // Max Expected Current / 2^15
static const float SHUNT_CAL_CONST = 0.00512;
// "For ADCRANGE = 1, the value of SHUNT_CAL must be divided by 4."
static const float SHUNT_CAL =
    (SHUNT_CAL_CONST / (INA236_CURRENT_LSB_MIN * R_SHUNT)) / 4;
static const uint16_t SHUNT_CAL_INT = (uint16_t)SHUNT_CAL;
