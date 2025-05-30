
-- This module describes a dynamic pre add/sub followed by multiplier, adder
-- Make sure the widths are less than what is supported by the architecture
-- Implements ((A+B)*C)+D when subadd is 0 or ((A-B)*C)+D when subadd is 1 
-- Maximum width for A, B and D are 18 bits, Max width for C is 25 bits, Max with for D is 43 bits
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dsp_preaddsub_mad is
	generic(
		AWIDTH : natural := 12; -- Max is 18b
		BWIDTH : natural := 16; -- Max is 18b
		CWIDTH : natural := 17 -- Max is 25b
	);
	port(
		clk    : in  std_logic;  -- clock input
        rst    : in  std_logic;  -- reset input
 		subadd : in  std_logic;  -- Dynamic subadd control
		ain    : in  std_logic_vector(AWIDTH - 1 downto 0);
		bin    : in  std_logic_vector(BWIDTH - 1 downto 0);
		cin    : in  std_logic_vector(CWIDTH - 1 downto 0);
		din    : in  std_logic_vector(BWIDTH + CWIDTH downto 0);
		pout   : out std_logic_vector(BWIDTH + CWIDTH downto 0)
	);
end dsp_preaddsub_mad;

architecture rtl of dsp_preaddsub_mad is
	signal a          : signed(AWIDTH - 1 downto 0);
	signal b          : signed(BWIDTH - 1 downto 0);
	signal c          : signed(CWIDTH - 1 downto 0);
	signal add        : signed(BWIDTH downto 0);
	signal d, mult, p : signed(BWIDTH + CWIDTH downto 0);

begin
	process(clk, rst)
	begin
        if rst = '1' then
            a <= (others => '0');
            b <= (others => '0');
            c <= (others => '0');
            d <= (others => '0');
            add <= (others => '0');
            mult <= (others => '0');
            p <= (others => '0');
		elsif rising_edge(clk) then
			a <= signed(ain);
			b <= signed(bin);
			c <= signed(cin);
			d <= signed(din);
			if subadd = '1' then
				add <= resize(a, BWIDTH + 1) - resize(b, BWIDTH + 1);
			else
				add <= resize(a, BWIDTH + 1) + resize(b, BWIDTH + 1);
			end if;
			mult <= add * c;
			p    <= mult + d;
		end if;
	end process;

	--
	-- Type conversion for output
	--
	pout <= std_logic_vector(p);

end rtl;
-- The following is an instantiation template for dynpreaddmultadd 
-- Component Declaration
-- Uncomment the below component declaration when using
-- component dynpreaddmultadd
--	generic(
--		AWIDTH : natural := 12;
--		BWIDTH : natural := 16;
--		CWIDTH : natural := 17
--	);
--	port(
--		clk    : in  std_logic;  -- clock input
--		rst    : in  std_logic;  -- reset input
-- 		subadd : in  std_logic;  -- Dynamic subadd control
--		ain    : in  std_logic_vector(AWIDTH - 1 downto 0);
--		bin    : in  std_logic_vector(BWIDTH - 1 downto 0);
--		cin    : in  std_logic_vector(CWIDTH - 1 downto 0);
--		din    : in  std_logic_vector(BWIDTH + CWIDTH downto 0);
--		pout   : out std_logic_vector(BWIDTH + CWIDTH downto 0)
--	);
-- end component;
-- Instantiation
-- Uncomment the below component declaration when using
-- <your_instance_name> : dynpreaddmultadd
-- generic map (
--		AWIDTH => AWIDTH, 
--		BWIDTH => BWIDTH, 
--		CWIDTH => CWIDTH
--       )
-- port map (
--		clk => clk,    
--		rst => rst,
-- 		subadd => subadd,          
--		ain => ain,    
--		bin => bin,    
--		cin => cin,    
--		din => din,    
--		pout => pout
--       );  
				
			