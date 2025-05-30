library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity transpose_sim is
end transpose_sim;

architecture sim of transpose_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal data_i : std_logic_vector(95 downto 0) := (others => '0');
    signal valid_i : std_logic := '0';
    signal data_new : std_logic := '0';
    signal ce : std_logic := '0';
    signal row_num : std_logic_vector(3 downto 0) := (others => '0');

    signal data_o : std_logic_vector(95 downto 0) := (others => '0');
    signal valid_o : std_logic := '0';


    signal prog_counter : unsigned(7 downto 0) := (others => '0');

    -- Define a type for the array of 96-bit vectors
    type data_array_type is array (0 to 15) of std_logic_vector(95 downto 0);
        
    -- Define the constant with example 96-bit values
    constant DATA_ARRAY : data_array_type := (
        -- Element 0
        X"001ff6ff6ff7000ff8ff90eb",
        -- Element 1
        X"ffffe8fe9fe8ffffddfdc0d0",
        -- Element 2
        X"fffff6ffd005007fccfc50b1",
        -- Element 3
        X"00dff000000f01dff1fc308a",
        -- Element 4
        X"00d00dfffff301a015fc3065",
        -- Element 5
        X"00000dff800300402cfce037",
        -- Element 6
        X"fff00dff200d00000dff200d",
        -- Element 7
        X"000001ffe001000001ffe001",

        -- Reverse order
        -- Element 8
        X"000001ffe001000001ffe001",
        -- Element 9
        X"fff00dff200d00000dff200d",
        -- Element 10
        X"00000dff800300402cfce037",
        -- Element 11
        X"00d00dfffff301a015fc3065",
        -- Element 12
        X"00dff000000f01dff1fc308a",
        -- Element 13
        X"fffff6ffd005007fccfc50b1",
        -- Element 14
        X"ffffe8fe9fe8ffffddfdc0d0",
        -- Element 15
        X"001ff6ff6ff7000ff8ff90eb"

    );
    
begin
    

    TOP : entity work.transpose
        generic map (
            ELEMENT_WIDTH => 12,
            NUM_ELEMENTS => 8,
            DEPTH => 8
        )
        port map (
            clk_i => clk,
            rst_i => rst,
            data_i => data_i,
            valid_i => valid_i,
            ce_i => ce,
            data_o => data_o,
            valid_o => valid_o,
            row_num_o => row_num
    );

    clk <= not clk after clk_period / 2;


    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                prog_counter <= (others => '0');
            else
                if prog_counter = X"F" then
                    prog_counter <= (others => '0');
                else
                    prog_counter <= prog_counter + 1;
                end if;
                data_i <= DATA_ARRAY(to_integer(prog_counter));
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
        ce <= '1';
        data_new <= '1';
        wait for delay_ns * ns;
        data_new <= '0';
        wait for delay_ns * 8 * ns;

        data_new <= '1';
        wait for delay_ns * ns;
        data_new <= '0';
        wait for delay_ns * 8 * ns;

        data_new <= '1';
        wait for delay_ns * ns;
        data_new <= '0';
        wait for delay_ns * 8 * ns;

        data_new <= '1';
        wait for delay_ns * ns;
        data_new <= '0';
        wait for delay_ns * 8 * ns;

        data_new <= '1';
        wait for delay_ns * ns;
        data_new <= '0';
        wait for delay_ns * 8 * ns;

        data_new <= '1';
        wait for delay_ns * ns;
        data_new <= '0';
        wait for delay_ns * 8 * ns;

        data_new <= '1';
        wait for delay_ns * ns;
        data_new <= '0';
        wait for delay_ns * 8 * ns;

        data_new <= '1';
        wait for delay_ns * ns;
        data_new <= '0';
        wait for delay_ns * 8 * ns;

        data_new <= '1';
        wait for delay_ns * ns;
        data_new <= '0';
        wait for delay_ns * 8 * ns;

        data_new <= '1';
        wait for delay_ns * ns;
        data_new <= '0';
        wait for delay_ns * 8 * ns;

        data_new <= '1';
        wait for delay_ns * ns;
        data_new <= '0';
        wait for delay_ns * 8 * ns;

        valid_i <= '0';
        wait_rst := TRUE;
        wait for delay_ns * ns;
        
        if (wait_rst) then
            wait for 300 ns;
        end if;

    end process;

end sim;