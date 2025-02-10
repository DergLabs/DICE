library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gradient_calc_sim is
end gradient_calc_sim;

architecture sim of gradient_calc_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal data_i : std_logic_vector(71 downto 0) := (others => '0');
    signal valid_i : std_logic := '0';
    signal new_pixel_i : std_logic := '0';


    signal data_o : std_logic_vector(13 downto 0) := (others => '0');
    signal valid_o : std_logic := '0';

    signal prog_counter : unsigned(7 downto 0) := (others => '0');
    
begin
    

    TOP : entity work.gradient_calc
        port map (
            clk_i => clk,
            rst_i => rst,
            data_i => data_i,
            valid_i => valid_i,
            new_pixel_i => new_pixel_i,

            data_o => data_o,
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
            data_i <= X"00_00_00_00_00_00_00_00_00"; --0
            wait for 50 ns;

            rst <= '0';
            --wait for 10 ns;

            valid_i <= '1';
            data_i <= X"00_00_FF_00_00_FF_00_00_FF";
            wait for delay_ns * ns;
            
            data_i <= X"C6_BC_EE_A1_F5_81_22_58_05";
            wait for delay_ns * ns;

            data_i <= X"00_00_FF_00_00_FF_00_00_FF";
            wait for delay_ns * ns;
            
            data_i <= X"C6_BC_EE_A1_F5_81_22_58_05";
            wait for delay_ns * ns;

            data_i <= X"00_00_FF_00_00_FF_00_00_FF";
            wait for delay_ns * ns;
            
            data_i <= X"C6_BC_EE_A1_F5_81_22_58_05";
            wait for delay_ns * ns;

            data_i <= X"00_00_FF_00_00_FF_00_00_FF";
            wait for delay_ns * ns;
            
            data_i <= X"C6_BC_EE_A1_F5_81_22_58_05";
            wait for delay_ns * ns;
            
            data_i <= X"00_00_FF_00_00_FF_00_00_FF";
            wait for delay_ns * ns;
            
            data_i <= X"C6_BC_EE_A1_F5_81_22_58_05";
            wait for delay_ns * ns;
            

            valid_i <= '0';
            wait for delay_ns * 9 * ns;

            wait_rst := TRUE;
            wait for delay_ns * ns;
            
            if (wait_rst) then
                wait for 300 ns;
            end if;

        end process;

end sim;