library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pixel_ram_sim is
end pixel_ram_sim;

architecture sim of pixel_ram_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal data_i : std_logic_vector(7 downto 0) := (others => '0');
    signal addr_i : std_logic_vector(5 downto 0) := (others => '0');
    signal we_i : std_logic := '0';
    signal data_o : std_logic_vector(7 downto 0) := (others => '0');

    signal prog_counter : unsigned(7 downto 0) := (others => '0');
    
begin
    

    TOP : entity work.pixel_ram
        generic map (
            WIDTH => 8
        )
        port map (
            clk_i => clk,
            we_i => we_i,
            addr_i => addr_i,
            data_i => data_i,
            data_o => data_o
        );
        

        clk <= not clk after clk_period / 2;
 
        
        process(clk)
        begin
            if rising_edge(clk) then
                if rst = '1' then
                    prog_counter <= (others => '0');
                else
                    if prog_counter = X"40" then
                        prog_counter <= (others => '0');
                        addr_i <= (others => '0');
                    else
                        prog_counter <= prog_counter + 1;
                        addr_i <= std_logic_vector(unsigned(addr_i) + 1);
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
            we_i <= '0';
            wait for 50 ns;

            rst <= '0';
            --wait for 10 ns;
            we_i <= '1';
            data_i <= X"FF";
            wait for delay_ns * 64 * ns;

            we_i <= '0';
            data_i <= X"00";
            wait for delay_ns * 128 * ns;

            wait_rst := TRUE;
            wait for delay_ns * ns;
            
            if (wait_rst) then
                wait for 300 ns;
            end if;

        end process;

end sim;