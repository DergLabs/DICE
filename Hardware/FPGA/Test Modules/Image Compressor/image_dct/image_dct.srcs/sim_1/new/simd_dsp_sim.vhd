library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simd_dsp_sim is
end simd_dsp_sim;

architecture sim of simd_dsp_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal a0 : unsigned(11 downto 0) := (others => '0');
    signal b0 : unsigned(11 downto 0) := (others => '0');

    signal a1 : unsigned(11 downto 0) := (others => '0');
    signal b1 : unsigned(11 downto 0) := (others => '0');

    signal a2 : unsigned(11 downto 0) := (others => '0');
    signal b2 : unsigned(11 downto 0) := (others => '0');

    signal a3 : unsigned(11 downto 0) := (others => '0');
    signal b3 : unsigned(11 downto 0) := (others => '0');

    signal out0 : unsigned(11 downto 0) := (others => '0');
    signal out1 : unsigned(11 downto 0) := (others => '0');
    signal out2 : unsigned(11 downto 0) := (others => '0');
    signal out3 : unsigned(11 downto 0) := (others => '0');

    signal prog_counter : unsigned(7 downto 0) := (others => '0');
    
begin
    

    TOP : entity work.simd_4x12b_dsp
        generic map (
            W => 12,
            OP => "ADD"
        )
        port map (
            clk_i => clk,
            a0 => a0,
            b0 => b0,
            a1 => a1,
            b1 => b1,
            a2 => a2,
            b2 => b2,
            a3 => a3,
            b3 => b3,
            out0 => out0,
            out1 => out1,
            out2 => out2,
            out3 => out3
        );

        clk <= not clk after clk_period / 2;
 
        
        process(clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                    prog_counter <= (others => '0');
                else
                    if prog_counter = X"0E" then
                        prog_counter <= (others => '0');
                    else
                        prog_counter <= prog_counter + 1;
                    end if;
                end if;
            end if;
        end process;

        
        
        process is
        variable delay_ns : integer := 10;
        variable wait_rst : boolean := TRUE;
        begin
            rst <= '1';
            wait_rst := FALSE;
            a0 <= X"000";
            b0 <= X"000";
            a1 <= X"000";
            b1 <= X"000";
            a2 <= X"000";
            b2 <= X"000";
            a3 <= X"000";
            b3 <= X"000";
            wait for 50 ns;

            rst <= '0';
            --wait for 10 ns;

            a0 <= to_unsigned(175, a0'length);
            b0 <= to_unsigned(100, b0'length);
            a1 <= to_unsigned(20, a1'length);
            b1 <= to_unsigned(58, b1'length);
            a2 <= to_unsigned(12, a2'length);
            b2 <= to_unsigned(500, b2'length);
            a3 <= to_unsigned(277, a3'length);
            b3 <= to_unsigned(209, b3'length);
            wait for delay_ns * ns;

            wait_rst := TRUE;
            wait for delay_ns * ns;
            
            if (wait_rst) then
                wait for 300 ns;
            end if;

        end process;

end sim;