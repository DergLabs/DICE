library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity subsample_sim is
end subsample_sim;

architecture sim of subsample_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal cr_i : std_logic_vector(7 downto 0) := (others => '0');
    signal cb_i : std_logic_vector(7 downto 0) := (others => '0');
    signal valid_i : std_logic := '0';

    signal cr_o : std_logic_vector(7 downto 0) := (others => '0');
    signal cb_o : std_logic_vector(7 downto 0) := (others => '0');
    signal valid_o : std_logic := '0';


    signal prog_counter : unsigned(7 downto 0) := (others => '0');
    
begin
    

    TOP : entity work.pixel_subsampler
        port map (
            clk_i => clk,
            rst_i => rst,
            cr_i => cr_i,
            cb_i => cb_i,
            valid_i => valid_i,
            cr_o => cr_o,
            cb_o => cb_o,
            valid_o => valid_o
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
        cr_i <= (others => '0');
        cb_i <= (others => '0');
        valid_i <= '0';
        wait for 50 ns;

        rst <= '0';
        --wait for 10 ns;

        cr_i <= X"FF";
        cb_i <= X"FF";
        valid_i <= '1';
        wait for delay_ns * ns;

        cr_i <= X"15";
        cb_i <= X"86";
        valid_i <= '1';
        wait for delay_ns * ns;

        cr_i <= X"AB";
        cb_i <= X"CD";
        valid_i <= '1';
        wait for delay_ns * ns;

        cr_i <= X"23";
        cb_i <= X"58";
        valid_i <= '1';
        wait for delay_ns * ns;

        cr_i <= X"FF";
        cb_i <= X"FF";
        valid_i <= '1';
        wait for delay_ns * ns;

        cr_i <= X"1C";
        cb_i <= X"AA";
        valid_i <= '1';
        wait for delay_ns * ns;

        cr_i <= X"47";
        cb_i <= X"CC";
        valid_i <= '1';
        wait for delay_ns * ns;

        cr_i <= X"BA";
        cb_i <= X"7C";
        valid_i <= '1';
        wait for delay_ns * ns;


        cr_i <= X"F9";
        cb_i <= X"78";
        valid_i <= '0';
        wait for delay_ns * 10 * ns;
    

        wait_rst := TRUE;
        wait for delay_ns * ns;
        
        if (wait_rst) then
            wait for 300 ns;
        end if;

    end process;

end sim;