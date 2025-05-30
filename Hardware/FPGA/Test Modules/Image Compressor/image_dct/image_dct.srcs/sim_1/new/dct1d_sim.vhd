library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dct1d_sim is
end dct1d_sim;

architecture sim of dct1d_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal data_i : std_logic_vector(95 downto 0) := (others => '0');
    signal valid_i : std_logic := '0';

    signal data_o : std_logic_vector(95 downto 0) := (others => '0');
    signal valid_o : std_logic := '0';


    signal prog_counter : unsigned(7 downto 0) := (others => '0');

    signal pixel0 : std_logic_vector(11 downto 0) := (others => '0');
    signal pixel1 : std_logic_vector(11 downto 0) := (others => '0');
    signal pixel2 : std_logic_vector(11 downto 0) := (others => '0');
    signal pixel3 : std_logic_vector(11 downto 0) := (others => '0');
    signal pixel4 : std_logic_vector(11 downto 0) := (others => '0');
    signal pixel5 : std_logic_vector(11 downto 0) := (others => '0');
    signal pixel6 : std_logic_vector(11 downto 0) := (others => '0');
    signal pixel7 : std_logic_vector(11 downto 0) := (others => '0');
    
begin
    

    TOP : entity work.dct1d
        port map (
            clk_i => clk,
            rst_i => rst,
            data_i => data_i,
            valid_i => valid_i,
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

    pixel0 <= X"0B2";
    pixel1 <= X"0FB";
    pixel2 <= X"0F0";
    pixel3 <= X"0EF";
    pixel4 <= X"0F7";
    pixel5 <= X"0F4";
    pixel6 <= X"0F2";
    pixel7 <= X"0F2";
        
    process is
    variable delay_ns : integer := 10;
    variable wait_rst : boolean := TRUE;
    begin
        rst <= '1';
        wait_rst := FALSE;
        data_i <= (others => '0');
        valid_i <= '0';
        wait for 50 ns;

        rst <= '0';
        --wait for 10 ns;

       
        valid_i <= '1';
        data_i <= pixel7 & pixel6 & pixel5 & pixel4 & pixel3 & pixel2 & pixel1 & pixel0;
        wait for delay_ns * ns;

        valid_i <= '0';

        wait_rst := TRUE;
        wait for delay_ns * ns;
        
        if (wait_rst) then
            wait for 300 ns;
        end if;

    end process;

end sim;