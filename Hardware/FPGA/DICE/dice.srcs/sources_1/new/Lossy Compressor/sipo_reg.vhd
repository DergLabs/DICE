----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 01/21/2025 04:02:10 PM
-- Design Name: 
-- Module Name: sipo_reg - Behavioral
-- Project Name: DICE
-- Target Devices: XCKU3P-2FFVA676
-- Tool Versions: 2023.2
-- Description: Serial-In Parallel-Out Register. Out_Taps = number of registers to tap off of for output, Tap_End = which register to stop at
--              output bus width = (# output taps * input width) - (tap end + 1) downto 0
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

entity sipo_reg is
    generic (
        -- NOTE: output bus width = (# output taps * input width) - (tap end + 1) downto 0
        IN_WIDTH : integer := 8; -- Width of input bus 
        OUT_TAPS : integer := 8; -- How many register to tap off for output bus 
        TAP_END : integer := 0; -- What register to end tapping off of
        DEPTH : integer := 8;    -- How many registers to hold incoming data
        SHIFT_DIR : string := "LEFT2RIGHT" -- Shift data from left to right or right to left
    );
    port ( 
        clk_i       : in std_logic;
        rst_i       : in std_logic;
        data_i      : in std_logic_vector(IN_WIDTH-1 downto 0);
        valid_i     : in std_logic;

        data_o      : out std_logic_vector((OUT_TAPS*IN_WIDTH)-(TAP_END+1) downto 0);
        valid_o     : out std_logic
    );
end sipo_reg;

architecture Behavioral of sipo_reg is
    signal pixel_counter_x : unsigned(15 downto 0) := (others => '0');
    signal data_x : std_logic_vector((IN_WIDTH*DEPTH)-1 downto 0) := (others => '0');
    signal valid_x : std_logic := '0';
begin

    gen_shift_reg : if SHIFT_DIR = "LEFT2RIGHT" generate
        -- shift register to hold incoming pixel data
        process(clk_i, rst_i)
        begin
            if (rst_i = '1') then
                data_x <= (others => '0');
            elsif rising_edge(clk_i) then
                if (valid_i = '1') then
                    valid_x <= '1';
                    data_x <= data_i & data_x((IN_WIDTH*DEPTH)-1 downto IN_WIDTH);
                else
                    valid_x <= '0';
                    data_x <= data_x;
                end if;
            end if;
        end process;
    elsif SHIFT_DIR = "RIGHT2LEFT" generate
        -- shift register to hold incoming pixel data
        process(clk_i, rst_i)
        begin
            if (rst_i = '1') then
                data_x <= (others => '0');
            elsif rising_edge(clk_i) then
                if (valid_i = '1') then
                    valid_x <= '1';
                    data_x <= data_x((IN_WIDTH*(DEPTH-1))-1 downto 0) & data_i;
                else
                    valid_x <= '0';
                    data_x <= data_x;
                end if;
            end if;
        end process;
    end generate;

    -- counter to toggle saving from pixel shift reg to pixel hold reg
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            pixel_counter_x <= (others => '0');
        elsif rising_edge(clk_i) then
            if (valid_x = '1') then
                if (pixel_counter_x = DEPTH-1) then
                    pixel_counter_x <= (others => '0');
                else
                    pixel_counter_x <= pixel_counter_x + 1;
                end if; 
            else
                pixel_counter_x <= (others => '0');
            end if;
        end if;
    end process;
    
    -- output data and valid signal
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            data_o <= (others => '0');
            valid_o <= '0';
        elsif rising_edge(clk_i) then
            if pixel_counter_x = DEPTH-1 then
                data_o <= data_x((OUT_TAPS*IN_WIDTH)-1 downto TAP_END);
                valid_o <= valid_x;
            else
                data_o <= data_o;
                valid_o <= '0';
            end if;
        end if;

    end process;
  
end Behavioral;
