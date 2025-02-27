-- This code implements a parameterizable adder followed by multiplier which will be packed into DSP Block. 
-- Widths must be less than or equal to what is supported by the DSP block else exta logic will be inferred
-- Operation : (a + b) * c
-- 3 Cycle latency from Din to Dout

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dsp_preadd_mult is
  generic (
           AWIDTH : natural := 12;  -- Width of A input
           BWIDTH : natural := 16;  -- Width of B input
           CWIDTH : natural := 17   -- Width of C input
          );
  port (
        clk  : in  std_logic;     -- Clock
        rst  : in  std_logic;     -- Reset
        ain  : in  std_logic_vector(AWIDTH-1 downto 0); -- A input
        bin  : in  std_logic_vector(BWIDTH-1 downto 0); -- B input
        cin  : in  std_logic_vector(CWIDTH-1 downto 0); -- C input
        pout : out std_logic_vector(BWIDTH+CWIDTH downto 0) -- Output
       );
end dsp_preadd_mult;

architecture rtl of dsp_preadd_mult is

signal a       : signed(AWIDTH-1 downto 0);
signal b       : signed(BWIDTH-1 downto 0);
signal c       : signed(CWIDTH-1 downto 0);
signal add     : signed(BWIDTH downto 0);
signal mult, p : signed(BWIDTH+CWIDTH downto 0);

begin

process(clk, rst)
 begin
    if rst = '1' then
       a    <= (others => '0');
       b    <= (others => '0');
       c    <= (others => '0');
       add  <= (others => '0');
       mult <= (others => '0');
       p    <= (others => '0');
    elsif rising_edge(clk) then
        a    <= signed(ain);
        b    <= signed(bin);
        c    <= signed(cin);
        add  <= resize(a, BWIDTH+1) + resize(b, BWIDTH+1);
        mult <= add * c;
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
--component dsp_preadd_mult
--  generic (
--           AWIDTH : natural := 12;  -- Width of A input
--           BWIDTH : natural := 16;  -- Width of B input
--           CWIDTH : natural := 17   -- Width of C input
--          );
--  port (
--        clk  : in  std_logic;     -- Clock
--        rst  : in  std_logic;     -- Reset
--        ain  : in  std_logic_vector(AWIDTH-1 downto 0); -- A input
--        bin  : in  std_logic_vector(BWIDTH-1 downto 0); -- B input
--        cin  : in  std_logic_vector(CWIDTH-1 downto 0); -- C input
--        pout : out std_logic_vector(BWIDTH+CWIDTH downto 0) -- Output
--       );
--end component;

-- Instantiation
-- Uncomment the instantiation below when using
-- <your_instance_name> : dsp_preadd_mult
--  generic map (
--           AWIDTH => 12;  -- Width of A input
--           BWIDTH => 16;  -- Width of B input
--           CWIDTH => 17   -- Width of C input
--          );
--  port map
--       (
--        clk => clk,
--        rst => rst,
--        ain => ain,
--        bin => bin,
--        cin => cin,
--        pout => pout
--       );
				
				