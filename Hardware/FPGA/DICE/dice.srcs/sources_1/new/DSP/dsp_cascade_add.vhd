-- Synthesis will Infer DSP48E2
-- operation (A + B) + C, 
-- 3 cycle latency from Din to Dout


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dsp_cascade_add is
    generic (
        AWIDTH : natural := 24;  -- Width of A input, max is 27b
        BWIDTH : natural := 24;  -- Width of B input, max is 27b
        CWIDTH : natural := 24   -- Width of C input, max is 48b
       );
    port (
        clk  : in  std_logic;     -- Clock
        rst  : in  std_logic;     -- Reset
        ain  : in  std_logic_vector(AWIDTH-1 downto 0); -- A input
        bin  : in  std_logic_vector(BWIDTH-1 downto 0); -- B input
        cin  : in  std_logic_vector(CWIDTH-1 downto 0); -- C input
        pout : out std_logic_vector(maximum(AWIDTH, BWIDTH) downto 0) -- Output
        );
end dsp_cascade_add;

architecture Behavioral of dsp_cascade_add is

    constant ab_max : natural := maximum(AWIDTH, BWIDTH);
    constant bc_max : natural := maximum(CWIDTH, ab_max);

    signal a        : unsigned(AWIDTH-1 downto 0);
    signal b        : unsigned(BWIDTH-1 downto 0);
    signal c        : unsigned(CWIDTH-1 downto 0);
    signal c_temp   : unsigned(CWIDTH-1 downto 0);
    signal add1     : unsigned(ab_max downto 0);
    signal add2     : unsigned(bc_max downto 0);
    signal p        : unsigned(bc_max downto 0);

begin

    process(clk, rst)
    begin
        if rst = '1' then
        a    <= (others => '0');
        b    <= (others => '0');
        c    <= (others => '0');
        c_temp <= (others => '0');
        add1  <= (others => '0');
        add2 <= (others => '0');
        p    <= (others => '0');
        elsif rising_edge(clk) then
            a    <= unsigned(ain);
            b    <= unsigned(bin);
            c    <= unsigned(cin);
            c_temp <= c;
            add1  <= resize(a, ab_max+1) + resize(b, ab_max+1);
            add2 <= add1 + resize(c_temp, add1'length);
            p    <= add2;
    end if;
    end process;

    pout <= std_logic_vector(p);

end Behavioral;
-- The following is an instantiation template for cascadeadd
-- Component Declaration
-- Uncomment the below component declaration when using
--component dsp_cascade_add
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
-- <your_instance_name> : dsp_cascade_add
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
				
				