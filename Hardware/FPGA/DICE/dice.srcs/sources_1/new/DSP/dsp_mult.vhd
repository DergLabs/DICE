-- This code implements a parameterizable multiplier which will be packed into DSP Block. Widths must be less than or equal to what is supported by the DSP block else exta logic will be inferred
-- Operation : (a*b)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dsp_mult is
  generic (
           AWIDTH : natural := 12;  -- Width of A input
           BWIDTH : natural := 16  -- Width of B input
          );
  port (
        clk  : in  std_logic;     -- Clock
        rst  : in  std_logic;     -- Reset
        ain  : in  std_logic_vector(AWIDTH-1 downto 0); -- A input
        bin  : in  std_logic_vector(BWIDTH-1 downto 0); -- B input
        pout : out std_logic_vector((AWIDTH+BWIDTH)-1 downto 0) -- Output
       );
end dsp_mult;

architecture rtl of dsp_mult is

signal a       : unsigned(AWIDTH-1 downto 0);
signal b       : unsigned(BWIDTH-1 downto 0);
signal mult, p : unsigned((AWIDTH+BWIDTH)-1 downto 0);

begin

process(clk, rst)
 begin
    if rst = '1' then
       a    <= (others => '0');
       b    <= (others => '0');
       mult <= (others => '0');
       p    <= (others => '0');
    elsif rising_edge(clk) then
        a    <= unsigned(ain);
        b    <= unsigned(bin);
        --mult <= resize(a, AWIDTH) * resize(b, BWIDTH);
        mult <= a * b;
        p    <= mult;
  end if;
end process;

--
-- Type conversion for output
--
pout <= std_logic_vector(p);

end rtl;
-- The following is an instantiation template for presubmult
-- Component Declaration
-- Uncomment the below component declaration when using
--component dsp_mult
--  generic (
--           AWIDTH : natural := 12;  -- Width of A input
--           BWIDTH : natural := 16;  -- Width of B input
--          );
--  port (
--        clk  : in  std_logic;     -- Clock
--        rst  : in  std_logic;     -- Reset
--        ain  : in  std_logic_vector(AWIDTH-1 downto 0); -- A input
--        bin  : in  std_logic_vector(BWIDTH-1 downto 0); -- B input
--        pout : out std_logic_vector(BWIDTH+CWIDTH downto 0) -- Output
--       );
--end component;

-- Instantiation
-- Uncomment the instantiation below when using
-- <your_instance_name> : dsp_mult
--  generic map (
--           AWIDTH => 12;  -- Width of A input
--           BWIDTH => 16;  -- Width of B input
--          );
--  port map
--       (
--        clk => clk,
--        rst => rst,
--        ain => ain,
--        bin => bin,
--        pout => pout
--       );
				
				