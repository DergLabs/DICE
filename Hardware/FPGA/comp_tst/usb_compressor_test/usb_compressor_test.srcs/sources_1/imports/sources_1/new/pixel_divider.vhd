----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/23/2025 01:56:31 AM
-- Design Name: 
-- Module Name: pixel_divider - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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
        pixel_o         : out std_logic_vector(95 downto 0)
    );
end pixel_divider;

architecture Behavioral of pixel_divider is
    signal dct1_pixel_out : std_logic_vector(95 downto 0);
    signal shifted_pixels : std_logic_vector(95 downto 0);
begin
    dct1_pixel_out <= pixel_i;
    
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            shifted_pixels <= (others => '0');
        elsif rising_edge(clk_i) then
            -- Bit shift all pixels right by 3 bits
            shifted_pixels(95 downto 84) <= std_logic_vector(shift_right(signed(dct1_pixel_out(95 downto 84)), 3));
            shifted_pixels(83 downto 72) <= std_logic_vector(shift_right(signed(dct1_pixel_out(83 downto 72)), 3));
            shifted_pixels(71 downto 60) <= std_logic_vector(shift_right(signed(dct1_pixel_out(71 downto 60)), 3));
            shifted_pixels(59 downto 48) <= std_logic_vector(shift_right(signed(dct1_pixel_out(59 downto 48)), 3));
            shifted_pixels(47 downto 36) <= std_logic_vector(shift_right(signed(dct1_pixel_out(47 downto 36)), 3));
            shifted_pixels(35 downto 24) <= std_logic_vector(shift_right(signed(dct1_pixel_out(35 downto 24)), 3));
            shifted_pixels(23 downto 12) <= std_logic_vector(shift_right(signed(dct1_pixel_out(23 downto 12)), 3));
            shifted_pixels(11 downto 0) <= std_logic_vector(shift_right(signed(dct1_pixel_out(11 downto 0)), 3));

            /*if (shifted_pixels(84) = '1') then
                divided_pixels(95 downto 84) <= std_logic_vector(signed(shifted_pixels(95 downto 84)) + 1);
            else
                divided_pixels(95 downto 84) <= shifted_pixels(95 downto 84);
            end if;

            if (shifted_pixels(72) = '1') then
                divided_pixels(83 downto 72) <= std_logic_vector(signed(shifted_pixels(83 downto 72)) + 1);
            else
                divided_pixels(83 downto 72) <= shifted_pixels(83 downto 72);
            end if;

            if (shifted_pixels(60) = '1') then
                divided_pixels(71 downto 60) <= std_logic_vector(signed(shifted_pixels(71 downto 60)) + 1);
            else
                divided_pixels(71 downto 60) <= shifted_pixels(71 downto 60);
            end if;

            if (shifted_pixels(48) = '1') then
                divided_pixels(59 downto 48) <= std_logic_vector(signed(shifted_pixels(59 downto 48)) + 1);
            else
                divided_pixels(59 downto 48) <= shifted_pixels(59 downto 48);
            end if;

            if (shifted_pixels(36) = '1') then
                divided_pixels(47 downto 36) <= std_logic_vector(signed(shifted_pixels(47 downto 36)) + 1);
            else
                divided_pixels(47 downto 36) <= shifted_pixels(47 downto 36);
            end if;

            if (shifted_pixels(24) = '1') then
                divided_pixels(35 downto 24) <= std_logic_vector(signed(shifted_pixels(35 downto 24)) + 1);
            else
                divided_pixels(35 downto 24) <= shifted_pixels(35 downto 24);
            end if;

            if (shifted_pixels(12) = '1') then
                divided_pixels(23 downto 12) <= std_logic_vector(signed(shifted_pixels(23 downto 12)) + 1);
            else
                divided_pixels(23 downto 12) <= shifted_pixels(23 downto 12);
            end if;

            if (shifted_pixels(0) = '1') then
                divided_pixels(11 downto 0) <= std_logic_vector(signed(shifted_pixels(11 downto 0)) + 1);
            else
                divided_pixels(11 downto 0) <= shifted_pixels(11 downto 0);
            end if;*/
        end if; 
    end process;

    --pixel_o <= divided_pixels;
    pixel_o <= shifted_pixels;

end Behavioral;
