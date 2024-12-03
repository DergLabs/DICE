library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package constants is

-- General I2C Constants
constant BUS_HIGH               : integer := X"FFFFFFFF";

-- HDMI Transmitter & Resolution variables
constant VIDEO_RESOLUTION       : string := "3840P";
constant HDMI_I2C_ADDR          : integer := X"72";
constant HDMI_TPI_REG           : integer := X"C7";
constant HDMI_PIXEL_CLK_LSB_REG : integer := X"00"; 
constant HDMI_PIXEL_CLK_MSB_REG : integer := X"01";
constant HDMI_VFREQ_LSB_REG     : integer := X"02";
constant HDMI_VREQ_MSB_REG      : integer := X"03";
constant HDMI_H_PIXELS_LSB_REG  : integer := X"04";
constant HDMI_H_PIXELS_MSB_REG  : integer := X"05";
constant HDMI_V_PIXELS_LSB_REG  : integer := X"06";
constant HDMI_V_PIXELS_MSB_REG  : integer := X"07";
constant HDMI_BUS_CFG_REG       : integer := X"08";
constant HDMI_IN_FORMAT_REG     : integer := X"09";
constant HDMI_OUT_FORMAT_REG    : integer := X"0A";
constant HDMI_TMDS_CTRL_REG     : integer := X"1A";
constant HDMI_PWR_CTRL_REG      : integer := X"1E";


-- Camera variables
constant CAM_MODE               : string := "12MP";
constant CAM_I2C_ADDR           : integer := X"34";
constant I2C_ADDR_MASK          : integer := X"FE";

constant CAM_REG_SW_RESET       : integer := X"0103";	
constant CAM_REG_MODEL_ID_MSB   : integer := X"0016";
constant CAM_REG_MODEL_ID_LSB   : integer := X"0017";
constant CAM_REG_MODE_SEL       : integer := X"0100";
constant CAM_REG_CSI_LANE       : integer := X"0114";
constant CAM_REG_DPHY_CTRL      : integer := X"0808";	
constant CAM_REG_EXCK_FREQ_MSB  : integer := X"0136";
constant CAM_REG_EXCK_FREQ_LSB  : integer := X"0137";
constant CAM_REG_FRAME_LEN_MSB  : integer := X"0340";
constant CAM_REG_FRAME_LEN_LSB  : integer := X"0341";
constant CAM_REG_LINE_LEN_MSB   : integer := X"0342";
constant CAM_REG_LINE_LEN_LSB   : integer := X"0343";
constant CAM_REG_X_ADD_STA_MSB  : integer := X"0344";
constant CAM_REG_X_ADD_STA_LSB  : integer := X"0345";
constant CAM_REG_X_ADD_END_MSB  : integer := X"0348";
constant CAM_REG_X_ADD_END_LSB  : integer := X"0349";
constant CAM_REG_Y_ADD_STA_MSB  : integer := X"0346";
constant CAM_REG_Y_ADD_STA_LSB  : integer := X"0347";
constant CAM_REG_Y_ADD_END_MSB  : integer := X"034A";
constant CAM_REG_Y_ADD_END_LSB  : integer := X"034B";

end package constants;