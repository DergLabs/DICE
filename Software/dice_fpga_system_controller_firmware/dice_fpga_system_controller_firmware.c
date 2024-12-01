#include <pico.h>
#include <pico/error.h>
#include <pico/types.h>
#include <stdio.h>
#include <string.h>
#include "pico/stdio.h"
#include "hardware/spi.h"
#include "hardware/i2c.h"
#include "hardware/clocks.h"
#include "hardware/gpio.h"
#include "hardware/pwm.h"
#include <boards/pico.h>
#include <pico/time.h>
#include "pico/multicore.h"

#include "constants.h"
#include "functions.h"

void blink_core1() {
	gpio_put(MCU_HUB_LED, 1);
	sleep_ms(500);
	gpio_put(MCU_HUB_LED, 0);
	sleep_ms(500);
}

int main() {
    // Set clock speed
    set_sys_clock_khz(CLK_SPEED * 1000, true);

    stdio_init_all();
    spi_init(spi0, SPI_SPEED * 1000 * 1000);
    i2c_init(i2c0, I2C_SPEED * 1000);
    i2c_init(i2c1, I2C_SPEED * 1000);

    gpio_set_function(I2C0_SDA, GPIO_FUNC_I2C);
    gpio_pull_up(I2C0_SCL);

    gpio_set_function(I2C0_SCL, GPIO_FUNC_I2C);
    gpio_pull_up(I2C0_SDA);

    gpio_set_function(I2C1_SDA, GPIO_FUNC_I2C);
    gpio_pull_up(I2C1_SDA);

    gpio_set_function(I2C1_SCL, GPIO_FUNC_I2C);
    gpio_pull_up(I2C1_SCL);

    // Set SPI format
    spi_set_format(spi0,       // SPI instance
                   8,          // Number of bits per transfer
                   SPI_CPOL_0, // Polarity (CPOL)
                   SPI_CPHA_0, // Phase (CPHA)
                   SPI_MSB_FIRST);
    // Initialize SPI pins
    gpio_set_function(SYS_SPI_MISO, GPIO_FUNC_SPI);
    gpio_set_function(SYS_SPI_SCK, GPIO_FUNC_SPI);
    gpio_set_function(SYS_SPI_MOSI, GPIO_FUNC_SPI);
    // Chip select is GPIO, so we'll handle it manually
    gpio_init(SYS_SPI_CS);
    gpio_set_dir(SYS_SPI_CS, GPIO_OUT);
    gpio_put(SYS_SPI_CS, 1); // Chip select is active-low

    // TODO: Repurpose this code for PWM on fan
    // gpio_set_function(MCU_CLK, GPIO_FUNC_PWM);
    // uint slice_num = pwm_gpio_to_slice_num(MCU_CLK);
    // uint channel = pwm_gpio_to_channel(MCU_CLK);
    // pwm_config config = pwm_get_default_config();
    // float divider = (CLK_SPEED * 1.0) / DESIRED_MCU_CLK_SPEED;
    // pwm_config_set_clkdiv(&config, divider);
    // // Wrap value of 1 for 50% duty cycle
    // pwm_config_set_wrap(&config, 1);
    // // Initialize the PWM with the config
    // pwm_init(slice_num, &config, true);
    // pwm_set_gpio_level(MCU_CLK, 1);

    gpio_init(FPGA_MCU_M0);
    gpio_set_dir(FPGA_MCU_M0, GPIO_OUT);

    gpio_init(FPGA_MCU_M1);
    gpio_set_dir(FPGA_MCU_M1, GPIO_OUT);

    gpio_init(FPGA_MCU_M2);
    gpio_set_dir(FPGA_MCU_M2, GPIO_OUT);
    gpio_put(FPGA_MCU_M2, 1);

    gpio_init(_0V85_EN);
    gpio_set_dir(_0V85_EN, GPIO_OUT);

    gpio_init(_0V85_ISNS_ALERT);
    gpio_set_dir(_0V85_ISNS_ALERT, GPIO_IN);
    gpio_pull_up(_0V85_ISNS_ALERT);

    gpio_init(_1V2_ISNS_ALERT);
    gpio_set_dir(_1V2_ISNS_ALERT, GPIO_IN);
    gpio_pull_up(_1V2_ISNS_ALERT);

    gpio_init(_1V8_ISNS_ALERT);
    gpio_set_dir(_1V8_ISNS_ALERT, GPIO_IN);
    gpio_pull_up(_1V8_ISNS_ALERT);

    gpio_init(FAN_PWM);
    gpio_set_dir(FAN_PWM, GPIO_OUT);

    gpio_init(_3V3_ISNS_ALERT);
    gpio_set_dir(_3V3_ISNS_ALERT, GPIO_IN);
    gpio_pull_up(_3V3_ISNS_ALERT);

    gpio_init(_1V2_EN);
    gpio_set_dir(_1V2_EN, GPIO_OUT);

    gpio_init(_1V8_EN);
    gpio_set_dir(_1V8_EN, GPIO_OUT);

    gpio_init(_3V3_EN);
    gpio_set_dir(_3V3_EN, GPIO_OUT);

    gpio_init(_5V0_EN);
    gpio_set_dir(_5V0_EN, GPIO_OUT);

    gpio_init(MCU_HUB_LED);
    gpio_set_dir(MCU_HUB_LED, GPIO_OUT);
    gpio_put(MCU_HUB_LED, 1);

    // Initialize Power Supplies
    gpio_put(_0V85_EN, 1);
    sleep_ms(1);
    gpio_put(_1V8_EN, 1);
    gpio_put(_1V2_EN, 1);
    sleep_ms(1);
    gpio_put(_3V3_EN, 1);
    gpio_put(_5V0_EN, 1);

    // Set FPGA Mode Pins
    // SPI Mode:  (M[2:0]) 001
    // JTAG Mode: (M[2:0]) 101
    sleep_ms(5);
    gpio_put(FPGA_MCU_M2, 0);
    gpio_put(FPGA_MCU_M1, 0);
    gpio_put(FPGA_MCU_M0, 1);

    uint8_t INA236_CONFIG_BUF[3];
    // Configuration Register
    INA236_CONFIG_BUF[0] = INA236_CONFIGURATION;
    // HIGH Byte
    INA236_CONFIG_BUF[1] = (INA236_CONFIG_ADCRANGE_MASK >> 8) & 0xFF;
    // LOW Byte
    INA236_CONFIG_BUF[2] = INA236_CONFIG_ADCRANGE_MASK & 0x0F;

    // Calibration Register for Power and Current Calculations
    uint8_t INA236_SHUNT_CAL_BUF[3];
    // Calibration Register
    INA236_SHUNT_CAL_BUF[0] = INA236_CALIBRATION;
    // HIGH Byte
    INA236_SHUNT_CAL_BUF[1] = (SHUNT_CAL_INT >> 8) & 0xFF;
    // LOW Byte
    INA236_SHUNT_CAL_BUF[2] = SHUNT_CAL_INT & 0x0F;

    sleep_ms(4000);
    // Configure INA236 Over I2C
    // Set ADC Range to 1(+/- 20.48mV)
    if(i2c_write_blocking(i2c0, INA236_0V85_SENSE, INA236_CONFIG_BUF, 3,
                          false) == PICO_ERROR_GENERIC) {
        printf("INA236_0V85_SENSE address not acknowledged, or no device "
               "present\n");
    }

    if(i2c_write_blocking(i2c0, INA236_0V85_SENSE, INA236_SHUNT_CAL_BUF, 3,
                          false) == PICO_ERROR_GENERIC)
        printf("INA236_0V85_SENSE address not acknowledged, or no device "
               "present\n");

    float avg_temps[AVG_TEMP_LEN] = {};
	memset(avg_temps, 0, AVG_TEMP_LEN);
    int avg_temps_ctr = 0;

	// Launch process to blink led in second core
	multicore_launch_core1(blink_core1);
    while(true) {
        tight_loop_contents(); // PWM

		// Sample measurements `AVG_TEMP_LEN` times a second
		sleep_ms(1000/AVG_TEMP_LEN);

        printf("Watchdog\n");

        // INA700 Readings
        int16_t temp_reading_3V3;
        int16_t temp_reading_1V8;
        int16_t temp_reading_1V2;

        int16_t current_reading_3V3;
        int16_t current_reading_1V8;
        int16_t current_reading_1V2;

        int16_t voltage_reading_3V3;
        int16_t voltage_reading_1V8;
        int16_t voltage_reading_1V2;

        uint32_t power_reading_3V3;
        uint32_t power_reading_1V8;
        uint32_t power_reading_1V2;

        // INA236 Readings
        uint16_t current_reading_0V85;
        uint16_t voltage_reading_0V85;
        uint16_t power_reading_0V85;

        // Temp readings from all INA700 Sensors
        if(!device_i2c_read_i16(i2c0, INA700_3V3_SENSE, &INA700_DIETEMP, 2,
                                &temp_reading_3V3, 2))
            printf("Could not read Temp from INA700: 3V3_SENSE\n");
        if(!device_i2c_read_i16(i2c0, INA700_1V8_SENSE, &INA700_DIETEMP, 2,
                                &temp_reading_1V8, 2))
            printf("Could not read Temp from INA700: 1V8_SENSE\n");
        if(!device_i2c_read_i16(i2c0, INA700_1V2_SENSE, &INA700_DIETEMP, 2,
                                &temp_reading_1V2, 2))
            printf("Could not read Temp from INA700: 1V2_SENSE\n");

        // Current readings from all INA700 Sensors
        if(!device_i2c_read_i16(i2c0, INA700_3V3_SENSE, &INA700_CURRENT, 2,
                                &current_reading_3V3, 2))
            printf("Could not read Current from INA700: 3V3_SENSE\n");
        if(!device_i2c_read_i16(i2c0, INA700_1V8_SENSE, &INA700_CURRENT, 2,
                                &current_reading_1V8, 2))
            printf("Could not read Current from INA700: 1V8_SENSE\n");
        if(!device_i2c_read_i16(i2c0, INA700_1V2_SENSE, &INA700_CURRENT, 2,
                                &current_reading_1V2, 2))
            printf("Could not read Current from INA700: 1V2_SENSE\n");

        // Voltage readings from all INA700 Sensors
        if(!device_i2c_read_i16(i2c0, INA700_3V3_SENSE, &INA700_VBUS, 2,
                                &voltage_reading_3V3, 2))
            printf("Could not read Voltage from INA700: 3V3_SENSE\n");
        if(!device_i2c_read_i16(i2c0, INA700_1V8_SENSE, &INA700_VBUS, 2,
                                &voltage_reading_1V8, 2))
            printf("Could not read Voltage from INA700: 1V8_SENSE\n");
        if(!device_i2c_read_i16(i2c0, INA700_1V2_SENSE, &INA700_VBUS, 2,
                                &voltage_reading_1V2, 2))
            printf("Could not read Voltage from INA700: 1V2_SENSE\n");

        // Power readings from all INA700 Sensors
        if(!device_i2c_read_u32(i2c0, INA700_3V3_SENSE, &INA700_POWER, 2,
                                &power_reading_3V3, 2))
            printf("Could not read Power from INA700: 3V3_SENSE\n");
        if(!device_i2c_read_u32(i2c0, INA700_1V8_SENSE, &INA700_POWER, 2,
                                &power_reading_1V8, 2))
            printf("Could not read Power from INA700: 1V8_SENSE\n");
        if(!device_i2c_read_u32(i2c0, INA700_1V2_SENSE, &INA700_POWER, 2,
                                &power_reading_1V2, 2))
            printf("Could not read Power from INA700: 1V2_SENSE\n");

        // Readings from INA236 Sensors
        if(!device_i2c_read_u16(i2c0, INA236_0V85_SENSE, &INA236_VBUS, 2,
                                &voltage_reading_0V85, 2))
            printf("Could not read Voltage from INA236: 0V85_SENSE\n");
        if(!device_i2c_read_u16(i2c0, INA236_0V85_SENSE, &INA236_POWER, 2,
                                &power_reading_0V85, 2))
            printf("Could not read Power from INA236: 0V85_SENSE\n");
        if(!device_i2c_read_u16(i2c0, INA236_0V85_SENSE, &INA236_CURRENT, 2,
                                &current_reading_0V85, 2))
            printf("Could not read Current from INA236: 0V85_SENSE\n");

        float ina700_3V3_calculated_temp =
            (temp_reading_3V3 >> 4) * ina700_temp_resolution;
        int16_t ina700_3V3_calculated_current =
            current_reading_3V3 * ina700_current_resolution;
        float ina700_3V3_calculated_voltage =
            voltage_reading_3V3 * ina700_voltage_resolution;
        float ina700_3V3_calculated_power =
            power_reading_3V3 * ina700_power_resolution;

        float ina700_1V8_calculated_temp =
            (temp_reading_1V8 >> 4) * ina700_temp_resolution;
        int16_t ina700_1V8_calculated_current =
            current_reading_1V8 * ina700_current_resolution;
        float ina700_1V8_calculated_voltage =
            voltage_reading_1V8 * ina700_voltage_resolution;
        float ina700_1V8_calculated_power =
            power_reading_1V8 * ina700_power_resolution;

        float ina700_1V2_calculated_temp =
            (temp_reading_1V2 >> 4) * ina700_temp_resolution;
        int16_t ina700_1V2_calculated_current =
            current_reading_1V2 * ina700_current_resolution;
        float ina700_1V2_calculated_voltage =
            voltage_reading_1V2 * ina700_voltage_resolution;
        float ina700_1V2_calculated_power =
            power_reading_1V2 * ina700_power_resolution;

        float ina236_0V85_calculated_voltage =
            voltage_reading_0V85 * ina236_bus_voltage_resolution;
        float ina236_0V85_calculated_power =
            power_reading_0V85 * INA236_CURRENT_LSB_MIN * 32;
        float ina236_0V85_calculated_current =
            current_reading_0V85 * INA236_CURRENT_LSB_MIN;

        float avg_temp =
            (ina700_1V2_calculated_temp + ina700_1V8_calculated_temp +
             ina700_3V3_calculated_temp) /
            3;
        avg_temps[avg_temps_ctr] = avg_temp;
        avg_temps_ctr = (avg_temps_ctr + 1) % AVG_TEMP_LEN;

        absolute_time_t abs_time = get_absolute_time();

        printf("BEGIN TRANSMISSION\n");
        printf("Absolute Time: %llu\n", abs_time);

        float avg_of_avg_temps = avg_float_arr(avg_temps, AVG_TEMP_LEN);
        if(avg_temp >= 90.f || avg_of_avg_temps >= 85.f) {
            gpio_put(_1V8_EN, 0);
            gpio_put(_1V2_EN, 0);
            sleep_ms(1);
            gpio_put(_3V3_EN, 0);

            printf("Temperatures have reached too high: Average Current Temp: "
                   "%0.2f, Average Temp over Last Second: %0.2f, turning off "
                   "_1V8, _1V2, "
                   "_3V3 power supplies\n",
                   avg_temp, avg_of_avg_temps);
        }

        printf("INA700 Readings\n");

        if(gpio_get(_1V8_EN) && gpio_get(_1V2_EN) && gpio_get(_3V3_EN)) {
            printf("\n3V3\n");
            printf("Temperature: %.2fC(%02X)\n", ina700_3V3_calculated_temp,
                   temp_reading_3V3);
            printf("Current: %dmA(%02X)\n", ina700_3V3_calculated_current,
                   current_reading_3V3);
            printf("Voltage: %.2fV(%02X)\n", ina700_3V3_calculated_voltage,
                   voltage_reading_3V3);
            printf("Power: %.2fW(%02X)\n", ina700_3V3_calculated_power,
                   power_reading_3V3);

            printf("\n1V8\n");
            printf("Temperature: %.2fC(%02X)\n", ina700_1V8_calculated_temp,
                   temp_reading_1V8);
            printf("Current: %dmA(%02X)\n", ina700_1V8_calculated_current,
                   current_reading_1V8);
            printf("Voltage: %.2fV(%02X)\n", ina700_1V8_calculated_voltage,
                   voltage_reading_1V8);
            printf("Power: %.2fW(%02X)\n", ina700_1V8_calculated_power,
                   power_reading_1V8);

            printf("\n1V2\n");
            printf("Temperature: %.2fC(%02X)\n", ina700_1V2_calculated_temp,
                   temp_reading_1V2);
            printf("Current: %dmA(%02X)\n", ina700_1V2_calculated_current,
                   current_reading_1V2);
            printf("Voltage: %.2fV(%02X)\n", ina700_1V2_calculated_voltage,
                   voltage_reading_1V2);
            printf("Power: %.2fW(%02X)\n", ina700_1V2_calculated_power,
                   power_reading_1V2);

        } else {
            printf(
                "Temperatures had reached >= 90 C, power supplies _1V8, _1V2, "
                "_3V3 are turned off\n");
        }

        printf("\nINA236 Readings\n");
        printf("\n0V85\n");
        printf("Current: %fA(%02X)\n", ina236_0V85_calculated_current,
               current_reading_0V85);
        printf("Voltage: %.2fV(%02X)\n", ina236_0V85_calculated_voltage,
               voltage_reading_0V85);
        printf("Power: %.2fW(%02X)\n", ina236_0V85_calculated_power,
               power_reading_0V85);
        printf("-----------------------------\n");
        printf("\n");
        printf("END TRANSMISSION\n");
    }
}
