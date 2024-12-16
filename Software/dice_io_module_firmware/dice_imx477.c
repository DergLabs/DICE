#include <stdio.h>
#include "dice_imx477.h"
#include "functions.h"

imgsensor_mode_t *sensor_config;
imgsensor_mode_t *selected_img_mode;

/* 12 mpix */
static imx477_reg_t mode_4056x3040_regs[] = {
    {REG_LINE_LEN_MSB, 0x5D},
    {REG_LINE_LEN_LSB, 0xC0},
    {REG_X_ADD_STA_MSB, 0x00},
    {REG_X_ADD_STA_LSB, 0x00},
    {REG_Y_ADD_STA_MSB, 0x00},
    {REG_Y_ADD_STA_LSB, 0x00},
    {REG_X_ADD_END_MSB, 0x0f},
    {REG_X_ADD_END_LSB, 0xd7},
    {REG_Y_ADD_END_MSB, 0x0B},
    {REG_Y_ADD_END_LSB, 0xDF},
    {REG_DOL_HDR_EN, 0x00},
    {REG_DOL_HDR_NUM, 0x00},
    {REG_DOL_CSI_DT_FMT_H_2ND, 0x0a},
    {REG_DOL_CSI_DT_FMT_L_2ND, 0x0a},
    {REG_DOL_CSI_DT_FMT_H_3ND, 0x0a},
    {REG_DOL_CSI_DT_FMT_L_3ND, 0x0a},
    {0x0220, 0x00},
    {0x0221, 0x11},
    {REG_X_ENV_INC_CONST, 0x01},
    {REG_X_ODD_INC_CONST, 0x01},
    {REG_Y_ENV_INC_CONST, 0x01},
    {REG_Y_ODD_INC, 0x01},
    {REG_BINNING_MODE, 0x00},
    {REG_BINNING_HV, 0x11},
    {REG_BINNING_WEIGHTING, 0x02},
    {0x3140, 0x02},
    {0x3c00, 0x00},
    {0x3c01, 0x03},
    {0x3c02, 0xa2},
    {REG_ADC_BIT_SETTING, 0x01},
    {0x5748, 0x07},
    {0x5749, 0xff},
    {0x574a, 0x00},
    {0x574b, 0x00},
    {0x7b75, 0x0a},
    {0x7b76, 0x0c},
    {0x7b77, 0x07},
    {0x7b78, 0x06},
    {0x7b79, 0x3c},
    {0x7b53, 0x01},
    {0x9369, 0x5A},
    {0x936b, 0x55},
    {0x936d, 0x28},
    {0x9304, 0x00},
    {0x9305, 0x00},
    {0x9e9a, 0x2f},
    {0x9e9b, 0x2f},
    {0x9e9c, 0x2f},
    {0x9e9d, 0x00},
    {0x9e9e, 0x00},
    {0x9e9f, 0x00},
    {0xa2a9, 0x60},
    {0xa2b7, 0x00},
    {REG_SCALE_MODE, 0x00},
    {REG_SCALE_M_MSbit, 0x00},
    {REG_SCALE_M_LSB, 0x10},
    {REG_DIG_CROP_X_OFFSET_MSB, 0x00},
    {REG_DIG_CROP_X_OFFSET_LSB, 0x00},
    {REG_DIG_CROP_Y_OFFSET_MSB, 0x00},
    {REG_DIG_CROP_Y_OFFSET_LSB, 0x00},
    {REG_DIG_CROP_WIDTH_MSB, 0x0f},
    {REG_DIG_CROP_WIDTH_LSB, 0xd8},
    {REG_DIG_CROP_HEIGHT_MSB, 0x0b},
    {REG_DIG_CROP_HEIGHT_LSB, 0xE0},
    {REG_X_OUT_SIZE_MSB, 0x0F}, // change to 1920
    {REG_X_OUT_SIZE_LSB, 0xd8},
    {REG_Y_OUT_SIZE_MSB, 0x0B},
    {REG_Y_OUT_SIZE_LSB, 0xE0},
    {REG_IVTPXCK_DIV, 0x05},
    {REG_IVTSYCK_DIV, 0x02},
    {REG_IVT_PREPLLCK_DIV, 0x02},
    {REG_PLL_IVT_MPY_MSB, 0x00},
    {REG_PLL_IVT_MPY_LSB, 0x9B},
    {REG_IOPPXCK_DIV, 0x0c}, // decided by output bit width
    {REG_IOPSYCK_DIV, 0x02},
    {REG_IOP_PREPLLCK_DIV, 0x02},
    {REG_IOP_MPY_MSB, 0x00},
    {REG_IOP_MPY_LSB, 0x85},
    {REG_PLL_MULTI_DRV, 0x01},
    {REG_REQ_LINK_BIT_RATE_MSB, 0x07},
    {REG_REQ_LINK_BIT_RATE_LMSB, 0x08},
    {REG_REQ_LINK_BIT_RATE_MLSB, 0x00},
    {REG_REQ_LINK_BIT_RATE_LSB, 0x00},
    {REG_TCLK_POST_EX_MSB, 0x00},
    {REG_TCLK_POST_EX_LSB, 0x7f},
    {REG_THS_PRE_EX_MSB, 0x00},
    {REG_THS_PRE_EX_LSB, 0x4f},
    {REG_THS_ZERO_MIN_MSB, 0x00},
    {REG_THS_ZERO_MIN_LSB, 0x77},
    {REG_THS_TRAIL_EX_MSB, 0x00},
    {REG_THS_TRAIL_EX_LSB, 0x5f},
    {REG_TCLK_TRAIL_MIN_MSB, 0x00},
    {REG_TCLK_TRAIL_MIN_LSB, 0x57},
    {REG_TCLK_PREP_EX_MSB, 0x00},
    {REG_TCLK_PREP_EX_LSB, 0x4f},
    {REG_TCLK_ZERO_EX_MSB, 0x01},
    {REG_TCLK_ZERO_EX_LSB, 0x27},
    {REG_TLPX_EX_MSB, 0x00},
    {REG_TLPX_EX_LSB, 0x3f},
    {0xe04c, 0x00},
    {0xe04d, 0x7f},
    {0xe04e, 0x00},
    {0xe04f, 0x1f},
    {0x3e20, 0x01},
    {REG_PDAF_CTRL1_0, 0x00},
    {REG_POWER_SAVE_ENABLE, 0x00},
    {REG_LINE_LEN_INCLK_MSB, 0x02},
    {REG_LINE_LEN_INCLK_LSB, 0xAE},
};

// TODO: This is the temporary default mode
#define mode_default mode_4056x3040_regs

static imgsensor_mode_t sensor_config_2Lane[] = {
    {.sensor_mode = 1,
     .integration_def = 500,
     .integration = 500,
     .integration_max = 9312 - 22,
     .integration_min = 7,
     .width = 4056,
     .height = 3040,
     .frame_length = 9312, // decided frame rate along with mode regs
     .fps = 5,
     .gain = 200,
     .gain_max = 978,
     .bits = 12,
     .test_pattern = 0,
     .reg_list =
         {
             .num_of_regs = _countof(mode_4056x3040_regs),
             .regs = mode_4056x3040_regs,
         }},
};

static bool camera_stream_on(uint8_t on) {
    return imx477_write(REG_MODE_SEL, on);
}

static void set_mirror_flip(uint8_t image_mirror) {

    uint8_t iTemp = 0x03;

    image_mirror = IMAGE_NORMAL;
    // sensor_i2c_read(REG_IMG_ORIENT ,  iTemp);
    // iTemp = iTemp & 0x03;
    switch(image_mirror) {
    case IMAGE_NORMAL:
        imx477_write(REG_IMG_ORIENT, iTemp | 0x03); // Set normal
        break;
    case IMAGE_V_MIRROR:
        imx477_write(REG_IMG_ORIENT, iTemp | 0x01); // Set flip
        break;
    case IMAGE_H_MIRROR:
        imx477_write(REG_IMG_ORIENT, iTemp | 0x02); // Set mirror
        break;
    case IMAGE_HV_MIRROR:
        imx477_write(REG_IMG_ORIENT, iTemp); // Set mirror and flip
        break;
    }
}
void sensor_configure_mode(imgsensor_mode_t *mode) {
    camera_stream_on(false);
    set_mirror_flip(mode->mirror);

    for(uint16_t i = 0; i < mode->reg_list.num_of_regs; i++) {
        // CyU3PDebugPrint (4, "Reg 0x%x val 0x%x\n", (mode_default +
        // i)->address, (mode_default + i)->val);
        imx477_write(((mode->reg_list.regs) + i)->address,
                     ((mode->reg_list.regs) + i)->val);
    }

    imx477_write(REG_TEST_PATTERN_LSB,
                 (mode->test_pattern < 8) ? mode->test_pattern : 0);
    imx477_write(REG_MAP_COUPLET_CORR, 0x01);
    imx477_write(REG_SING_DYNAMIC_CORR, 0x01);
    imx477_write(REG_CIT_LSHIFT_LONG_EXP, 0x00);
    imx477_write(REG_FRAME_LEN_MSB, (mode->frame_length & 0xFF00) >> 8);
    imx477_write(REG_FRAME_LEN_LSB, mode->frame_length & 0xFF);

    imx477_write(REG_TP_RED_MSB, 0x0);
    imx477_write(REG_TP_RED_LSB, 0x0);
    imx477_write(REG_TP_GREENR_MSB, 0x00);
    imx477_write(REG_TP_GREENR_LSB, 0x00);
    imx477_write(REG_TP_GREENB_MSB, 0x00);
    imx477_write(REG_TP_GREENB_LSB, 0x0);
    imx477_write(REG_TP_BLUE_MSB, 0x07);
    imx477_write(REG_TP_BLUE_LSB, 0xFF);
    imx477_write(REG_COARSE_INTEGRATION_TIME_MSB,
                 (mode->integration_def >> 8) & 0xFF);
    imx477_write(REG_COARSE_INTEGRATION_TIME_LSB, mode->integration_def & 0xFF);

    camera_stream_on(selected_img_mode->sensor_mode);
}

bool imx477_bus_test(void) {
    uint8_t model_lsb;
    uint8_t model_msb;
    // sensor_i2c_read (REG_MODEL_ID_MSB, &model_msb);
    // sensor_i2c_read (REG_MODEL_ID_LSB, &model_lsb);
    imx477_read(REG_MODEL_ID_MSB, &model_msb, 1);
    imx477_read(REG_MODEL_ID_LSB, &model_lsb, 1);

    if(((((uint16_t)model_msb & 0x0F) << 8) | model_lsb) == CAMERA_ID) {
        // CyU3PDebugPrint(4,"i2c sensor id: 0x%x\n", (((uint16_t)model_msb &
        // 0x0f) << 8) | model_lsb);
        printf("i2c sensor id: 0x%x\n",
               (((uint16_t)model_msb & 0x0f) << 8) | model_lsb);
        return true;
    }

    return false;
}

bool imx_init(void) { return imx477_init(); }
bool imx477_init(void) {
    if(!imx477_bus_test()) /* Verify that the sensor is connected. */
    {
        printf("Error: Reading SensorID Failed!\n");
        return false;
    }

    for(uint16_t i = 0; i < _countof(mode_default); i++) {
        imx477_write((mode_default + i)->address, (mode_default + i)->val);
    }
    sensor_config = sensor_config_2Lane;
	// TODO: There's sensor_config[0] is our default
    selected_img_mode = &sensor_config[0];
    sensor_configure_mode(selected_img_mode);

    return true;
}
