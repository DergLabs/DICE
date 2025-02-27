----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 01/21/2025 11:23:03 AM
-- Design Name: 
-- Module Name: pixel_subsampler - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements very basic 4:2:2 pixel subsampling for chroma subsample. Takes in 2 pixels in 2 cycles, outputs 1 pixel for 2 cycles. Implements (px1 + px2) / 2
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
--library UNISIM;
--use UNISIM.VComponents.all;
-- implements 4:2:2 subsampling
entity pixel_subsampler is
    generic (
        WIDTH : integer := 8
    );
    port ( 
        clk_i       : in std_logic;
        rst_i       : in std_logic;

        data_i      : in std_logic_vector(WIDTH-1 downto 0);
        valid_i     : in std_logic;

        data_o        : out std_logic_vector(WIDTH-1 downto 0);
        valid_o     : out std_logic
    );
end pixel_subsampler;

architecture Behavioral of pixel_subsampler is
    signal sel_pixel : std_logic;
    signal prev_pixel : unsigned(WIDTH-1 downto 0);
begin

    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            sel_pixel <= '0';
        elsif rising_edge(clk_i) then
            sel_pixel <= not sel_pixel;
        end if;
    end process;


    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            data_o <= (others => '0');
            prev_pixel <= (others => '0');
            valid_o <= '0';
        elsif rising_edge(clk_i) then
            valid_o <= valid_i;
            if sel_pixel = '0' then
                data_o <= std_logic_vector(resize(shift_right(resize(unsigned(data_i), 16) + resize(prev_pixel, 16)), 1), WIDTH-1);
            else
                prev_pixel <= data_i;
                data_o <= data_o;
            end if;
        end if;
    end process;

end Behavioral;
