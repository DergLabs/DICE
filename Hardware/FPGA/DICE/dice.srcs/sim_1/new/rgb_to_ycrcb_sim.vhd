library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity rgb_to_ycrcb_sim is
end rgb_to_ycrcb_sim;

architecture sim of rgb_to_ycrcb_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal data_i : std_logic_vector(23 downto 0) := (others => '0');
    signal valid_i : std_logic := '0';

    signal data_o : std_logic_vector(23 downto 0) := (others => '0');
    signal valid_o : std_logic := '0';

    signal prog_counter : unsigned(5 downto 0) := (others => '0');

    
begin
    
    -- System verilog version
    /*TOP : entity work.rgb_to_ycrcb
        port map (
            clk_i => clk,
            rst_i => rst,
            rgb_i => data_i,
            rgb_valid_i => valid_i,
            ycrcb_o => data_o,
            ycrcb_valid_o => valid_o
    );*/

    -- VHDL version
    TOP : entity work.rgb_to_ycrcb
        port map (
            clk_i => clk,
            rst_i => rst,

            rgb_i => data_i,
            valid_i => valid_i,
            
            ycrcb_o => data_o,
            valid_o => valid_o
    );



    clk <= not clk after clk_period / 2;

    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                prog_counter <= (others => '0');
            else
                if prog_counter = X"3F" then
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
        wait for 50 ns;

        rst <= '0';
        wait for delay_ns * ns;

       
        valid_i <= '1';
        data_i <= X"000000";
        wait for delay_ns * ns;

        data_i <= X"FFFFFF";
        wait for delay_ns * ns;

        data_i <= X"FF0000";
        wait for delay_ns * ns;

        data_i <= X"00FF00";
        wait for delay_ns * ns;

        data_i <= X"0000FF";
        wait for delay_ns * ns;

        data_i <= X"808080";
        wait for delay_ns * ns;

        data_i <= X"6496C8";
        wait for delay_ns * ns;

        valid_i <= '0';
        wait for delay_ns * 1200 * ns;
        wait_rst := TRUE;
        wait for delay_ns * ns;
        
        if (wait_rst) then
            wait for 300 ns;
        end if;

    end process;

end sim;