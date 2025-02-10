----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2025 11:23:03 AM
-- Design Name: 
-- Module Name: pixel_subsampler - Behavioral
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
--library UNISIM;
--use UNISIM.VComponents.all;

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
            valid_o <= '0';
        elsif rising_edge(clk_i) then
            valid_o <= valid_i;
            if sel_pixel = '0' then
                data_o <= data_i;
            else
                data_o <= data_o;
            end if;
        end if;
    end process;

end Behavioral;
