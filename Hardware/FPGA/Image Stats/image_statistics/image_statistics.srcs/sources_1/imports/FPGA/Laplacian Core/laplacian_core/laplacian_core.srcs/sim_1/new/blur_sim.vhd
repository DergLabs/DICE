library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity blur_sim is
end blur_sim;

architecture sim of blur_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal data_i : std_logic_vector(23 downto 0) := (others => '0');
    signal valid_i : std_logic := '0';


    signal blur_o : std_logic_vector(15 downto 0) := (others => '0');
    signal valid_o : std_logic := '0';

    signal prog_counter : unsigned(7 downto 0) := (others => '0');
    
begin
    

    TOP : entity work.lpc_top
        port map (
            clk_i => clk,
            rst_i => rst,

            pixel_i => data_i,
            valid_i => valid_i,

            blur_o => blur_o,
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
            type data_array is array (0 to 63) of std_logic_vector(23 downto 0);
            constant test_data_1 : data_array := (
                X"7A1B2C", X"D34E5F", X"890123", X"456789",
                X"ABCDEF", X"012345", X"678901", X"234567",
                X"89ABCD", X"EF0123", X"456789", X"ABCDEF",
                X"012345", X"678901", X"234567", X"89ABCD",
                X"EF0123", X"456789", X"ABCDEF", X"012345",
                X"678901", X"234567", X"89ABCD", X"EF0123",
                X"456789", X"ABCDEF", X"012345", X"678901",
                X"234567", X"89ABCD", X"EF0123", X"456789",
                X"ABCDEF", X"012345", X"678901", X"234567",
                X"89ABCD", X"EF0123", X"456789", X"ABCDEF",
                X"012345", X"678901", X"234567", X"89ABCD",
                X"EF0123", X"456789", X"ABCDEF", X"012345",
                X"678901", X"234567", X"89ABCD", X"EF0123",
                X"456789", X"ABCDEF", X"012345", X"678901",
                X"234567", X"89ABCD", X"EF0123", X"456789",
                X"ABCDEF", X"012345", X"678901", X"234567"
            );
            
            constant test_data_2 : data_array := (
                X"B1C2D3", X"E4F567", X"890ABC", X"DEF012",
                X"345678", X"9ABCDE", X"F01234", X"567890",
                X"ABCDEF", X"123456", X"789ABC", X"DEF012",
                X"345678", X"9ABCDE", X"F01234", X"567890",
                X"ABCDEF", X"123456", X"789ABC", X"DEF012",
                X"345678", X"9ABCDE", X"F01234", X"567890",
                X"ABCDEF", X"123456", X"789ABC", X"DEF012",
                X"345678", X"9ABCDE", X"F01234", X"567890",
                X"ABCDEF", X"123456", X"789ABC", X"DEF012",
                X"345678", X"9ABCDE", X"F01234", X"567890",
                X"ABCDEF", X"123456", X"789ABC", X"DEF012",
                X"345678", X"9ABCDE", X"F01234", X"567890",
                X"ABCDEF", X"123456", X"789ABC", X"DEF012",
                X"345678", X"9ABCDE", X"F01234", X"567890",
                X"ABCDEF", X"123456", X"789ABC", X"DEF012",
                X"345678", X"9ABCDE", X"F01234", X"567890"
            );
            
            constant test_data_3 : data_array := (
                X"1A2B3C", X"4D5E6F", X"789012", X"345678",
                X"9ABCDE", X"F01234", X"567890", X"ABCDEF",
                X"123456", X"789ABC", X"DEF012", X"345678",
                X"9ABCDE", X"F01234", X"567890", X"ABCDEF",
                X"123456", X"789ABC", X"DEF012", X"345678",
                X"9ABCDE", X"F01234", X"567890", X"ABCDEF",
                X"123456", X"789ABC", X"DEF012", X"345678",
                X"9ABCDE", X"F01234", X"567890", X"ABCDEF",
                X"123456", X"789ABC", X"DEF012", X"345678",
                X"9ABCDE", X"F01234", X"567890", X"ABCDEF",
                X"123456", X"789ABC", X"DEF012", X"345678",
                X"9ABCDE", X"F01234", X"567890", X"ABCDEF",
                X"123456", X"789ABC", X"DEF012", X"345678",
                X"9ABCDE", X"F01234", X"567890", X"ABCDEF",
                X"123456", X"789ABC", X"DEF012", X"345678",
                X"9ABCDE", X"F01234", X"567890", X"ABCDEF"
            );
        begin
            rst <= '1';
            wait_rst := FALSE;
            valid_i <= '0';
            data_i <= X"000000";
            wait for 50 ns;
            rst <= '0';
            wait for 10 ns;
            
            valid_i <= '1';
            for i in test_data_1'range loop
                data_i <= test_data_1(i);
                wait for delay_ns * ns;
            end loop;
            
            valid_i <= '0';
            wait for delay_ns * 80 * ns;
            valid_i <= '1';
            for i in test_data_2'range loop
                data_i <= test_data_2(i);
                wait for delay_ns * ns;
            end loop;
            valid_i <= '0';
            wait for delay_ns * 80 * ns;
            valid_i <= '1';
            for i in test_data_3'range loop
                data_i <= test_data_3(i);
                wait for delay_ns * ns;
            end loop;
            valid_i <= '0';
            wait_rst := TRUE;
            wait for delay_ns * 400 * ns;
            
            if (wait_rst) then
                wait for 300 ns;
            end if;
        end process;

end sim;