library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.constants.all;

entity i2c_config_data is
port (
    lut_index   :   in STD_LOGIC_VECTOR(9 downto 0);
    output_reg  :   out STD_LOGIC_VECTOR(31 downto 0)
);
end i2c_config_data;

architecture behavioral of i2c_config_data is

    signal PIXEL_CLK    : integer;
    signal V_CLK        : integer;
    signal H_PIXELS     : integer;
    signal V_PIXELS     : integer;

begin

with VIDEO_RESOLUTION select
    PIXEL_CLK <=    X"7404"     when "3840P",
                    X"3A02"     when "1080P",
                    X"7404"     when others;

with VIDEO_RESOLUTION select
    V_CLK <=        X"001E"     when "3840P",
                    X"003C"     when "1080P",
                    X"001E"     when others;

with VIDEO_RESOLUTION select
    H_PIXELS <=     X"0F00"     when "3840P",
                    X"0780"     when "1080P",
                    X"0F00"     when others;

with VIDEO_RESOLUTION select
    V_PIXELS <=     X"0870"     when "3840P",
                    X"0438"     when "1080P",
                    X"0870"     when others;

process(lut_index)
begin
    case lut_index is

        -- Stage 1: Configure HDMI Transmitter
        -- Resetting TPI twice just to be sure
        when 0 => lut_data <= HDMI_I2C_ADDR & HDMI_TPI_REG & X"00";
        when 1 => lut_data <= HDMI_I2C_ADDR & HDMI_TPI_REG & X"00";
        -- Disable TMDS
        when 2 => lut_data <= HDMI_I2C_ADDR & HDMI_TMDS_CRTL_REG & X"11";
        -- Enter Full Operation D0 state
        when 3 => lut_data <= HDMI_I2C_ADDR & HDMI_PWR_CTRL_REG & X"00";
        -- Configure Pixel Clock
        when 4 => lut_data <= HDMI_I2C_ADDR & HDMI_PIXEL_CLK_LSB_REG & PIXEL_CLK(7 downto 0);
        when 5 => lut_data <= HDMI_I2C_ADDR & HDMI_PIXEL_CLK_MSB_REG & PIXEL_CLK(15 downto 8);
        -- Configure VSYNC Frequency
        when 6 => lut_data <= HDMI_I2C_ADDR & HDMI_VFREQ_LSB_REG & V_CLK(7 downto 0);
        when 7 => lut_data <= HDMI_I2C_ADDR & HDMI_VFREQ_MSB_REG & V_CLK(15 downto 8);
        -- Configure # Horizontal pixels
        when 8 => lut_data <= HDMI_I2C_ADDR & HDMI_H_PIXELS_LSB_REG & H_PIXELS(7 downto 0);
        when 9 => lut_data <= HDMI_I2C_ADDR & HDMI_H_PIXELS_MSB_REG & H_PIXELS(15 downto 8);
        -- Configure # Vertical pixels
        when 10 => lut_data <= HDMI_I2C_ADDR & HDMI_V_PIXELS_LSB_REG & V_PIXELS(7 downto 0);
        when 11 => lut_data <= HDMI_I2C_ADDR & HDMI_V_PIXELS_MSB_REG & V_PIXELS(15 downto 8);
        -- Configure Input Bus for 24b RGB
        when 12 => lut_data <= HDMI_I2C_ADDR & HDMI_BUS_CFG_REG & X"60";
        -- Configure Output Video Format
        when 13 => lut_data <= HDMI_I2C_ADDR & HDMI_OUT_FORMAT_REG & X"00";
        -- Enable TMDS Output
        when 14 => lut_data <= HDMI_I2C_ADDR & HDMI_TMDS_CTRL_REG & X"01";
        -- HDMI CONIFG COMPLETE

        -- Stage 2: Configure Camera
                
        when others => lut_data <= BUS_HIGH;
    end case;
end process;




end behavioral; 