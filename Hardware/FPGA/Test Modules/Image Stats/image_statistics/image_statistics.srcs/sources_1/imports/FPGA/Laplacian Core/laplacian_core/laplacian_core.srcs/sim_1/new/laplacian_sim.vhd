library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity laplacian_sim is
end laplacian_sim;

architecture sim of laplacian_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal pixel_i : std_logic_vector(71 downto 0) := (others => '0');
    signal data_valid : std_logic := '0';


    signal laplacian_o : std_logic_vector(10 downto 0) := (others => '0');

    signal data_out_ready : std_logic := '0';

    signal prog_counter : unsigned(7 downto 0) := (others => '0');
    
begin
    

    TOP : entity work.laplacian_core
        port map (
            clk_i => clk,
            rst_i => rst,
            pixel_i => pixel_i,
            valid_i => data_valid,

            laplacian_o => laplacian_o,
            valid_o => data_out_ready
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
            data_valid <= '0';
            pixel_i <= X"00_00_00_00_00_00_00_00_00"; --0
            wait for 50 ns;

            rst <= '0';
            --wait for 10 ns;

            data_valid <= '1';
            pixel_i <= X"62_85_62_FF_83_FF_62_85_32";
            wait for delay_ns * ns;

            pixel_i <= X"00_00_FF_00_00_FF_00_00_FF";
            wait for delay_ns * ns;

            pixel_i <= X"C6_BC_EE_A1_F5_81_22_58_05";
            wait for delay_ns * ns; 
            data_valid <= '0';
            wait for delay_ns * 100 * ns;

            wait_rst := TRUE;
            wait for delay_ns * ns;
            
            if (wait_rst) then
                wait for 300 ns;
            end if;

        end process;

end sim;