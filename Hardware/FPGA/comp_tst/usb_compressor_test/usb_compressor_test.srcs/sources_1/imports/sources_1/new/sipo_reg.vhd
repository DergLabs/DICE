----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2025 04:02:10 PM
-- Design Name: 
-- Module Name: sipo_reg - Behavioral
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
        IN_WIDTH : integer := 8;
        OUT_TAPS : integer := 8;
        TAP_END : integer := 0;
        DEPTH : integer := 8
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
    signal vaid_counter_x : unsigned(15 downto 0) := (others => '0');
    signal data_x : std_logic_vector((IN_WIDTH*DEPTH)-1 downto 0) := (others => '0');
    signal valid_x : std_logic := '0';
begin

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
    
    -- Counter to set valid signal high when 9th pixel is recieved, valid is set low when valid_i = 0, otherwise it stays high once set
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            vaid_counter_x <= (others => '0');
        elsif rising_edge(clk_i) then
            if (valid_x = '1') then
                if (vaid_counter_x = DEPTH-1) then
                    vaid_counter_x <= (others => '0');
                else
                    vaid_counter_x <= vaid_counter_x + 1;
                end if; 
            else
                vaid_counter_x <= (others => '0');
            end if;
        end if;
    end process;

    -- Non-Clocked mux to load shift reg data into hold register on when 9th pixel is recieved
    /*with pixel_counter_x select
    data_o <= data_x((OUT_TAPS*IN_WIDTH)-1 downto TAP_END) when to_unsigned(DEPTH-1, pixel_counter_x'length),
              data_o when others;
              
    with pixel_counter_x select
        valid_o <= valid_x when to_unsigned(DEPTH-1, pixel_counter_x'length),
        valid_o when others;*/ 

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
