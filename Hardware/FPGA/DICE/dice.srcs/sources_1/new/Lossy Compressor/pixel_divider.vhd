----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 01/23/2025 01:56:31 AM
-- Design Name: 
-- Module Name: pixel_divider - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements simple integer divide by 8 with rounding to nearest integer. Uses the following equation for N = X/Y: N = (X + (Y/2)) / Y
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity pixel_divider is
    port ( 
        clk_i           : in std_logic;
        rst_i           : in std_logic;
        pixel_i         : in std_logic_vector(95 downto 0);
        valid_i         : in std_logic;
        pixel_o         : out std_logic_vector(95 downto 0);
        valid_o         : out std_logic
    );
end pixel_divider;

architecture Behavioral of pixel_divider is
    signal dct1_pixel_out : std_logic_vector(95 downto 0);
    signal corrected_data : signed(95 downto 0);
    signal shifted_pixels : std_logic_vector(95 downto 0);

    signal valid_x : std_logic := '0';
begin
    dct1_pixel_out <= pixel_i;

    valid_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 2,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i(0) => valid_i,
        data_o(0) => valid_x
    );

    process(clk_i, rst_i)
        variable lsbs : std_logic_vector(2 downto 0);
        variable sign_bit : std_logic;
    begin
        if rst_i = '1' then
            shifted_pixels <= (others => '0');
        elsif rising_edge(clk_i) then

            -- Add 4 to the value to round it
            corrected_data(95 downto 84) <= signed(dct1_pixel_out(95 downto 84)) + 4;
            corrected_data(83 downto 72) <= signed(dct1_pixel_out(83 downto 72)) + 4;
            corrected_data(71 downto 60) <= signed(dct1_pixel_out(71 downto 60)) + 4;
            corrected_data(59 downto 48) <= signed(dct1_pixel_out(59 downto 48)) + 4;
            corrected_data(47 downto 36) <= signed(dct1_pixel_out(47 downto 36)) + 4;
            corrected_data(35 downto 24) <= signed(dct1_pixel_out(35 downto 24)) + 4;
            corrected_data(23 downto 12) <= signed(dct1_pixel_out(23 downto 12)) + 4;
            corrected_data(11 downto 0) <=  signed(dct1_pixel_out(11 downto 0)) + 4;

            -- Divide by 8
            shifted_pixels(95 downto 84) <= std_logic_vector(shift_right(corrected_data(95 downto 84), 3));
            shifted_pixels(83 downto 72) <= std_logic_vector(shift_right(corrected_data(83 downto 72), 3));
            shifted_pixels(71 downto 60) <= std_logic_vector(shift_right(corrected_data(71 downto 60), 3));
            shifted_pixels(59 downto 48) <= std_logic_vector(shift_right(corrected_data(59 downto 48), 3));
            shifted_pixels(47 downto 36) <= std_logic_vector(shift_right(corrected_data(47 downto 36), 3));
            shifted_pixels(35 downto 24) <= std_logic_vector(shift_right(corrected_data(35 downto 24), 3));
            shifted_pixels(23 downto 12) <= std_logic_vector(shift_right(corrected_data(23 downto 12), 3));
            shifted_pixels(11 downto 0) <=  std_logic_vector(shift_right(corrected_data(11 downto 0), 3));

        end if;
    end process;


    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            valid_o <= '0';
            pixel_o <= (others => '0');
        elsif rising_edge(clk_i) then
            if (valid_x = '1') then
                valid_o <= '1';
                pixel_o <= shifted_pixels;
            else
                valid_o <= '0';
                pixel_o <= pixel_o;
            end if;
        end if;
    end process;

    
end Behavioral;