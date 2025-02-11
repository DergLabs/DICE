----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2025 10:33:01 PM
-- Design Name: 
-- Module Name: rgb2ycrcb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rgb2ycrcb is
    port ( 
        clk_i       : in std_logic;
        rst_i       : in std_logic;

        pixel_i     : in std_logic_vector(23 downto 0);
        valid_i     : in std_logic;

        ycrcb_o     : out std_logic_vector(23 downto 0);
        valid_o     : out std_logic
    );
end rgb2ycrcb;

architecture Behavioral of rgb2ycrcb is

begin


end Behavioral;
