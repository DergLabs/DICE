----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/11/2025 03:40:37 PM
-- Design Name: 
-- Module Name: dsp_cascade_add - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
-- operation (A+B)+C, 3 cycle latency
entity dsp_cascade_add is
    generic (
        AWIDTH : natural := 24;  -- Width of A input
        BWIDTH : natural := 24;  -- Width of B input
        CWIDTH : natural := 24   -- Width of C input
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
				
				