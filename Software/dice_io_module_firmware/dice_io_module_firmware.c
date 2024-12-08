#include <hardware/gpio.h>
#include <pico/time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#include "pico/stdlib.h"
#include "hardware/clocks.h"
#include "hardware/i2c.h"
#include "constants.h"

#include "functions.h"
#include "dice_imx477.h"

char buffer[BUFFER_SIZE];

int main() {
    const size_t MBUS_SIZE = sizeof(MBUS) / sizeof(MBUS[0]);
    stdio_init_all();

    // Set clock speed
    set_sys_clock_khz(CLK_SPEED * 1000, true);

    // Init all pins we'll be using
    gpio_init(VBUS_ISNS_ALRT);
    gpio_set_dir(VBUS_ISNS_ALRT, GPIO_IN);
    gpio_pull_up(VBUS_ISNS_ALRT);

    gpio_init(MIPI_RST_R);
    gpio_set_dir(MIPI_RST_R, GPIO_OUT);

    gpio_init(USBPD_FLT_IN);
    gpio_set_dir(USBPD_FLT_IN, GPIO_IN);
    gpio_pull_up(USBPD_FLT_IN);

    gpio_init(USBPD_SINK_EN);
    gpio_set_dir(USBPD_SINK_EN, GPIO_IN);
    gpio_pull_up(USBPD_SINK_EN);

    gpio_init(USBPD_DBG_ACC);
    gpio_set_dir(USBPD_DBG_ACC, GPIO_IN);
    gpio_pull_up(USBPD_DBG_ACC);

    gpio_init(USBPD_CAP_MIS);
    gpio_set_dir(USBPD_CAP_MIS, GPIO_IN);
    gpio_pull_up(USBPD_CAP_MIS);

    gpio_init(USBPD_PLG_FLIP);
    gpio_set_dir(USBPD_PLG_FLIP, GPIO_IN);
    gpio_pull_up(USBPD_PLG_FLIP);

    gpio_init(USBPD_PLG_EVNT);
    gpio_set_dir(USBPD_PLG_EVNT, GPIO_IN);
    gpio_pull_up(USBPD_PLG_EVNT);

    gpio_init(CAM_PWR_EN);
    gpio_set_dir(CAM_PWR_EN, GPIO_OUT);

    gpio_init(CAM_LED_EN);
    gpio_set_dir(CAM_LED_EN, GPIO_OUT);

    gpio_init(MCU_HUB_LED);
    gpio_set_dir(MCU_HUB_LED, GPIO_OUT);
    gpio_put(MCU_HUB_LED, 0);

    for(int i = 0; i < MBUS_SIZE; i++) {
        gpio_init(MBUS[i]);
        gpio_set_dir(MBUS[i], GPIO_OUT);
        gpio_put(MBUS[i], false);
    }

    // i2c ex
    // https://www.digikey.com/en/maker/projects/raspberry-pi-pico-rp2040-i2c-example-with-micropython-and-cc/47d0c922b79342779cdbd4b37b7eb7e2
    // Set up I2C

    // Initialize I2C port at 400 kHz
    i2c_init(i2c0, I2C0_SPEED * 1000);
    i2c_init(i2c1, I2C1_SPEED * 1000);

    gpio_init(I2C0_SDA);
    gpio_set_function(I2C0_SDA, GPIO_FUNC_I2C);

    gpio_init(I2C0_SCL);
    gpio_set_function(I2C0_SCL, GPIO_FUNC_I2C);

    gpio_init(I2C1_SDA);
    gpio_set_function(I2C1_SDA, GPIO_FUNC_I2C);

    gpio_init(I2C1_SCL);
    gpio_set_function(I2C1_SCL, GPIO_FUNC_I2C);

    sleep_ms(2000);
    printf("I2C Initialized, waiting 20 seconds before setting up camera\n");
    sleep_ms(20000);
    printf("Setting up Camera\n");
    sleep_ms(1000);
    // Set up Camera
    gpio_put(CAM_PWR_EN, true);
    sleep_ms(50);
    gpio_put(CAM_LED_EN, true);
    sleep_ms(50);
    imx477_init();
    sleep_ms(10);

    // Disable I2C1
    i2c_deinit(i2c1);
    gpio_set_function(I2C1_SDA, GPIO_FUNC_NULL);
    gpio_set_function(I2C1_SCL, GPIO_FUNC_NULL);

    gpio_put(MBUS[0], true);
    sleep_ms(10);

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

    while(true) {
        printf("Watchdog\n");
        gpio_put(MCU_HUB_LED, false);
        sleep_ms(500);
        gpio_put(MCU_HUB_LED, true);
        sleep_ms(500);

        // INA700 Readings
        int16_t ina700_temp;
        int16_t ina700_current;
        int16_t ina700_voltage;
        uint32_t ina700_power;

        if(!ina700_read_16_reg(INA700_DIETEMP, &ina700_temp)) {
            printf("Failed to read INA700 Temperature\n");
        }

        if(!ina700_read_16_reg(INA700_CURRENT, &ina700_current)) {
            printf("Failed to read INA700 Current\n");
        }

        if(!ina700_read_16_reg(INA700_VBUS, &ina700_voltage)) {
            printf("Failed to read INA700 Voltage\n");
        }

        if(!ina700_read_32_reg(INA700_POWER, &ina700_power)) {
            printf("Failed to read INA700 Power\n");
        }

        // INA700 Calculated Values;
        float ina700_calculated_temp = (ina700_temp >> 4) * temp_resolution;
        int16_t ina700_calculated_current = ina700_current * current_resolution;
        float ina700_calculated_voltage = ina700_voltage * voltage_resolution;
        float ina700_calculated_power = ina700_power * power_resolution;

        // USBPD IO Values
        bool usbpd_sink_en = gpio_get(USBPD_SINK_EN);
        bool usbpd_dbg_acc = gpio_get(USBPD_DBG_ACC);
        bool usbpd_cap_mis = gpio_get(USBPD_CAP_MIS);
        bool usbpd_plg_flip = gpio_get(USBPD_PLG_FLIP);
        bool usbpd_plg_evnt = gpio_get(USBPD_PLG_EVNT);

        absolute_time_t abs_time = get_absolute_time();

        // Display USBPD IO Values
        printf("BEGIN TRANSMISSION\n\n");
        printf("Absolute Time: %llu\n", abs_time);
        printf("USBPD Sink Enable: %d\n", usbpd_sink_en);
        printf("USBPD Debug Access: %d\n", usbpd_dbg_acc);
        printf("USBPD Capacity Mismatch: %d\n", usbpd_cap_mis);
        printf("USBPD Plug Flip: %d\n", usbpd_plg_flip);
        printf("USBPD Plug Event: %d\n", usbpd_plg_evnt);
        printf("\n");
        printf("INA700 Readings\n");
        printf("Temperature: %.2fC(%02X)\n", ina700_calculated_temp,
               ina700_temp);
        printf("Current: %dmA(%02X)\n", ina700_calculated_current,
               ina700_current);
        printf("Voltage: %.2fV(%02X)\n", ina700_calculated_voltage,
               ina700_voltage);
        printf("Power: %.2fW(%02X)\n", ina700_calculated_power, ina700_power);
        printf("END TRANSMISSION\n\n");

        // fflush(stdout);
        // readInput(buffer);
        // printf("Buffer: %s\n", buffer);
        //
        // if (strcmp(buffer, "tl") == 0) {
        //     printf("Setting RST to LOW\n");
        //     gpio_put(MBUS[1], 0);
        //     sleep_ms(1);
        // } else if (strcmp(buffer, "th") == 0){
        //     printf("Setting RST to HIGH\n");
        //     gpio_put(MBUS[1], 1);
        //     sleep_ms(1);
        // } else if (strcmp(buffer, "ph") == 0){
        //     printf("Pulsing RST High for 1ms\n");
        //     gpio_put(MBUS[1], 1);
        //     sleep_ms(1);
        //     gpio_put(MBUS[1], 0);
        // }
    }
}
