----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 05/28/2025 08:16:12 AM
-- Design Name: 
-- Module Name: dsp_madd - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements a parameterizable multiply-add operation with infered DSP48 cores
-- Implements P = (A*B + C)
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity dsp_madd is
    generic (
        AWIDTH : natural := 16;  -- Width of A input, max width is 18 bits 
        BWIDTH : natural := 16;  -- Width of B input, max width is 27 bits
        CWIDTH : natural := 16;   -- Width of C input, max width is 48 bits
        USE_SIGNED : boolean := false  -- Use signed arithmetic if true, unsigned if false
    );
    port ( 
        clk_i : in std_logic; -- Clock input
        rst_i : in std_logic; -- Reset input
        ain : in std_logic_vector(AWIDTH-1 downto 0); -- A input
        bin : in std_logic_vector(BWIDTH-1 downto 0); -- B input
        cin : in std_logic_vector(CWIDTH-1 downto 0); -- C input
        pout : out std_logic_vector(natural(maximum((AWIDTH+BWIDTH), CWIDTH)) downto 0) -- Output
    );
end dsp_madd;

architecture Behavioral of dsp_madd is

    signal p   : std_logic_vector(maximum((AWIDTH+BWIDTH), CWIDTH) downto 0);

begin

    gen_dsp_madd_signed : if USE_SIGNED generate
        signal a        : signed(AWIDTH-1 downto 0);
        signal b        : signed(BWIDTH-1 downto 0);
        signal c, c_tmp : signed(CWIDTH-1 downto 0);
        signal mult     : signed(AWIDTH+BWIDTH-1 downto 0);
        signal add      : signed(maximum((AWIDTH+BWIDTH), CWIDTH) downto 0); 
    begin
        process(clk_i, rst_i)
        begin
            if rst_i = '1' then
                a       <= (others => '0');
                b       <= (others => '0');
                c       <= (others => '0');
                c_tmp   <= (others => '0');
                mult    <= (others => '0');
                add     <= (others => '0');
            elsif rising_edge(clk_i) then
                a    <= signed(ain);
                b    <= signed(bin);
                c    <= signed(cin);
                c_tmp <= c;
                mult <= a * b;
                add  <= resize(mult, maximum(mult'length, CWIDTH) + 1) + resize(c_tmp, maximum(mult'length, CWIDTH) + 1);
            end if;
        end process;

        p <= std_logic_vector(add);
    end generate;

    gen_dsp_madd_unsigned : if not USE_SIGNED generate
        signal a        : unsigned(AWIDTH-1 downto 0);
        signal b        : unsigned(BWIDTH-1 downto 0);
        signal c, c_tmp : unsigned(CWIDTH-1 downto 0);
        signal mult     : unsigned(AWIDTH+BWIDTH-1 downto 0);
        signal add      : unsigned(maximum((AWIDTH+BWIDTH), CWIDTH) downto 0);
    begin

        process(clk_i, rst_i)
        begin
            if rst_i = '1' then
                a       <= (others => '0');
                b       <= (others => '0');
                c       <= (others => '0');
                c_tmp   <= (others => '0');
                mult    <= (others => '0');
                add     <= (others => '0');
            elsif rising_edge(clk_i) then
                a    <= unsigned(ain);
                b    <= unsigned(bin);
                c    <= unsigned(cin);
                c_tmp <= c;
                mult <= a * b;
                add  <= resize(mult, maximum(mult'length, CWIDTH) + 1) + resize(c_tmp, maximum(mult'length, CWIDTH) + 1);
            end if;
        end process;

        p <= std_logic_vector(add);
    end generate;

    -- Type conversion for output
    pout <= std_logic_vector(p);

end Behavioral;
