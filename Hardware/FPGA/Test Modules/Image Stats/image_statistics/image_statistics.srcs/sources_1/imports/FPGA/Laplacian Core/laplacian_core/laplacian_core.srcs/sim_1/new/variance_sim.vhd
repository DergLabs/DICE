library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity variance_sim is
end variance_sim;

architecture sim of variance_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal data_i : signed(10 downto 0) := (others => '0');
    signal valid_i : std_logic := '0';


    signal var_o : std_logic_vector(15 downto 0) := (others => '0');
    signal mean_o : std_logic_vector(15 downto 0) := (others => '0');
    signal std_dev_o : std_logic_vector(15 downto 0) := (others => '0');
    signal valid_o : std_logic := '0';

    signal prog_counter : unsigned(7 downto 0) := (others => '0');
    
begin
    

    TOP : entity work.statistics_core
        generic map (
            variance_depth => 16,
            data_width => 11
        )
        port map (
            clk_i => clk,
            ce_i => '1',
            rst_i => rst,
            data_i => data_i,
            valid_i => valid_i,

            var_o => var_o,
            mean_o => mean_o,
            std_dev_o => std_dev_o,
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
            valid_i <= '0';
            data_i <= to_signed(0, data_i'length); --0
            wait for 50 ns;

            rst <= '0';
            --wait for 10 ns;

            valid_i <= '1';
            data_i <= to_signed(-175, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(29, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(139, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(220, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(682, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(-285, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(-770, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(100, data_i'length);
            wait for delay_ns * ns;
            

            --valid_i <= '0';
            --wait for delay_ns * 10 * ns;

            --valid_i <= '1';
            data_i <= to_signed(-200, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(582, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(120, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(-990, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(385, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(20, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(1020, data_i'length);
            wait for delay_ns * ns;
            
            data_i <= to_signed(-500, data_i'length);
            wait for delay_ns * ns;
            

            valid_i <= '0';
            wait for delay_ns * ns;

            wait_rst := TRUE;
            wait for delay_ns * ns;
            
            if (wait_rst) then
                wait for 300 ns;
            end if;

        end process;

end sim;