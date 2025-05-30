-- This code implements a parameterizable multiplier which will be packed into DSP Block. Widths must be less than or equal to what is supported by the DSP block else exta logic will be inferred
-- Operation : (a*b)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dsp_mult is
   generic (
      AWIDTH      : natural := 12;  -- Width of A input, max is 27b
      BWIDTH      : natural := 16;  -- Width of B input, max is 18b
      USE_SIGNED  : boolean := false  -- If true, inputs and outputs are signed, else unsigned
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

signal p       : std_logic_vector((AWIDTH+BWIDTH)-1 downto 0);

begin

   gen_dsp_mult_signed : if USE_SIGNED generate
      signal a       : signed(AWIDTH-1 downto 0);
      signal b       : signed(BWIDTH-1 downto 0);
      signal mult    : signed((AWIDTH+BWIDTH)-1 downto 0);

   begin

      process(clk, rst)
      begin
         if rst = '1' then
            a    <= (others => '0');
            b    <= (others => '0');
            mult <= (others => '0');
         elsif rising_edge(clk) then
            a    <= signed(ain);
            b    <= signed(bin);
            mult <= a * b;
      end if;
      end process;

      p <= std_logic_vector(mult);
   end generate;

   gen_dsp_mult_unsigned : if not USE_SIGNED generate
      signal a       : unsigned(AWIDTH-1 downto 0);
      signal b       : unsigned(BWIDTH-1 downto 0);
      signal mult    : unsigned((AWIDTH+BWIDTH)-1 downto 0);

   begin

      process(clk, rst)
      begin
         if rst = '1' then
            a    <= (others => '0');
            b    <= (others => '0');
            mult <= (others => '0');
         elsif rising_edge(clk) then
            a    <= unsigned(ain);
            b    <= unsigned(bin);
            mult <= a * b;
      end if;
      end process;

      p <= std_logic_vector(mult);
   end generate;

   -- Type conversion for output
   pout <= std_logic_vector(p);

end rtl;
