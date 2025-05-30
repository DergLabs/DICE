
--  Multiply-accumulate unit
--  The following code implements a parameterizable Multiply-accumulate unit
--  with synchronous load to reset the accumulator without losing a clock cycle
--  Size of inputs/output should be less than/equal to what is supported by the architecture else extra logic/dsps will be inferred
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dsp_mac is
  generic (
           SIZEIN  : natural := 16; -- width of the inputs, Max is 48b
           SIZEOUT : natural := 40  -- width of the output, Max is 48b
          );
  port (
        clk         : in std_logic;
        rst         : in std_logic;
        ce          : in std_logic;
        sload       : in  std_logic;
        a           : in  signed (SIZEIN-1 downto 0);
        b           : in  signed (SIZEIN-1 downto 0);
        accum_out   : out signed (SIZEOUT-1 downto 0));
end entity;

architecture rtl of dsp_mac is
  -- Declare registers for intermediate values
signal a_reg, b_reg          : signed (SIZEIN-1 downto 0);
signal sload_reg             : std_logic;
signal mult_reg              : signed (2*SIZEIN-1 downto 0);
signal adder_out, old_result : signed (SIZEOUT-1 downto 0);

begin

    process (adder_out, sload_reg)
    begin
        if sload_reg = '1' then
            old_result <= (others => '0');
        else
            -- 'sload' is now active (=low) and opens the accumulation loop.
            -- The accumulator takes the next multiplier output in
            -- the same cycle.
            old_result <= adder_out;
        end if;
    end process;

    process (clk, rst)
    begin
        if rst = '1' then
            a_reg     <= (others => '0');
            b_reg     <= (others => '0');
            mult_reg  <= (others => '0');
            sload_reg <= '0';
            adder_out <= (others => '0');
        elsif rising_edge(clk) then
            if ce = '1' then
                a_reg     <= a;
                b_reg     <= b;
                mult_reg  <= a_reg * b_reg;
                sload_reg <= sload;
                -- Store accumulation result into a register
                adder_out <= old_result + mult_reg;
            end if;
        end if;
    end process;

-- Output accumulation result
accum_out <= adder_out;

end rtl;
-- The following is an instantiation template for macc
-- Component Declaration
-- Uncomment the below component declaration when using
--component macc
--  generic (
--           SIZEIN  : natural := 16; -- width of the inputs
--           SIZEOUT : natural := 40  -- width of the output
--          );
--  port (
--        clk         : in std_logic;
--        rst         : in std_logic;
--        ce          : in std_logic;
--        sload       : in  std_logic;
--        a           : in  signed (SIZEIN-1 downto 0);
--        b           : in  signed (SIZEIN-1 downto 0);
--        accum_out   : out signed (SIZEOUT-1 downto 0));
--end component;

-- Instantiation
-- Uncomment the instantiation below when using
--<your_instance_name> : macc
--  generic map (
--                SIZEIN =>   16, -- width of the inputs
--                SIZEOUT =>  40  -- width of the output
--          );
--  port map (
--            clk => clk,
--            rst => rst,
--            ce => ce,
--            sload => sload,
--            a => a,
--            b => b,
--            accum_out => accum_out
--           );
				