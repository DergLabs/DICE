----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2025 01:04:23 AM
-- Design Name: 
-- Module Name: dsp_msub - Behavioral
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

-- Operation : c - (a*a)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dsp_msub is
  generic (
           AWIDTH : natural := 12;  -- Width of A input
           CWIDTH : natural := 17   -- Width of C input
          );
  port (
        clk  : in  std_logic;     -- Clock
        ce   : in  std_logic;     -- Clock enable
        rst  : in  std_logic;     -- Reset
        ain  : in  std_logic_vector(AWIDTH-1 downto 0); -- A input
        cin  : in  std_logic_vector(CWIDTH-1 downto 0); -- C input
        pout : out std_logic_vector(CWIDTH-1 downto 0) -- Output
       );
end dsp_msub;

architecture rtl of dsp_msub is

signal a       : signed(AWIDTH-1 downto 0);
signal c, ctmp : signed(CWIDTH-1 downto 0);
signal mult    : signed(AWIDTH+AWIDTH-1 downto 0);
signal sub     : signed(AWIDTH+AWIDTH-1 downto 0);
signal p       : signed(CWIDTH-1 downto 0);

begin

process(clk, rst)
 begin
    if rst = '1' then
       a    <= (others => '0');
       c    <= (others => '0');
       ctmp <= (others => '0');
       sub  <= (others => '0');
       mult <= (others => '0');
       p    <= (others => '0');
    elsif rising_edge(clk) then
        if ce = '1' then
            a    <= signed(ain);
            c    <= signed(cin);
            ctmp <= c;
            mult <= resize(a, AWIDTH) * resize(a, AWIDTH);
            sub  <= resize(ctmp, AWIDTH+AWIDTH) - mult;
            p    <= resize(sub, CWIDTH);
        end if;
  end if;
end process;

--
-- Type conversion for output
--
pout <= std_logic_vector(p);

end rtl;