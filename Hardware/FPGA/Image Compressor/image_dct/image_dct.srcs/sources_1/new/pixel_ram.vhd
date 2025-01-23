----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 01/21/2025 11:19:48 AM
-- Design Name: pixel ram 
-- Module Name: pixel_ram - Behavioral
-- Project Name: DICE
-- Target Devices: XCKU3P-FFVA676-2i
-- Tool Versions: 2023.2
-- Description: 64x8 or 64x9 LUT RAM for storing pixel data, holds 8x8 grid of pixels for performing 2D DCT Compression
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
use IEEE.math_real."ceil";
use IEEE.math_real."log2";
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity pixel_ram is
    generic (
        WIDTH       : integer := 8;
        DEPTH       : integer := 64
    );
    port ( 
        clk_i       : in std_logic;
        we_i        : in std_logic;
        addr_i      : in std_logic_vector(integer(ceil(log2(real(DEPTH)))) downto 0);
        data_i      : in std_logic_vector(WIDTH-1 downto 0);

        data_o      : out std_logic_vector(WIDTH-1 downto 0)
    );
end pixel_ram;

architecture Behavioral of pixel_ram is

begin
    
    gen_ram64 : if DEPTH = 64 generate
        pixel_ram : for i in 0 to WIDTH-1 generate
            RAM64X1S_inst : RAM64X1S
            generic map (
                INIT => X"0000000000000000", -- Initial contents of RAM
                IS_WCLK_INVERTED => '0') -- Specifies active high/low WCLK
            port map (
                O => data_o(i),        -- 1-bit data output
                A0 => addr_i(0),      -- Address[0] input bit
                A1 => addr_i(1),      -- Address[1] input bit
                A2 => addr_i(2),      -- Address[2] input bit
                A3 => addr_i(3),      -- Address[3] input bit
                A4 => addr_i(4),      -- Address[4] input bit
                A5 => addr_i(5),      -- Address[5] input bit
                D => data_i(i),        -- 1-bit data input
                WCLK => clk_i,  -- Write clock input
                WE => we_i       -- Write enable input
            );
        end generate;
    end generate gen_ram64;

    gen_ram32 : if DEPTH = 32 generate
        pixel_ram : for i in 0 to WIDTH-1 generate
                RAM32X1S_inst : RAM32X1S
                generic map (
                    INIT => X"00000000", -- Initial contents of RAM
                    IS_WCLK_INVERTED => '0') -- Specifies active high/low WCLK
                port map (
                    O => data_o(i),        -- 1-bit data output
                    A0 => addr_i(0),      -- Address[0] input bit
                    A1 => addr_i(1),      -- Address[1] input bit
                    A2 => addr_i(2),      -- Address[2] input bit
                    A3 => addr_i(3),      -- Address[3] input bit
                    A4 => addr_i(4),      -- Address[4] input bit
                    
                    D => data_i(i),        -- 1-bit data input
                    WCLK => clk_i,  -- Write clock input
                    WE => we_i       -- Write enable input
                );
            end generate;
    end generate gen_ram32;
 
end Behavioral;

