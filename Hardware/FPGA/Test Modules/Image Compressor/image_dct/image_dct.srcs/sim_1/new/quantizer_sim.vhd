library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity quantizer_sim is
end quantizer_sim;

architecture sim of quantizer_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal data_i : std_logic_vector(95 downto 0) := (others => '0');
    signal scale_factor : unsigned(3 downto 0) := (others => '0');
    signal valid_i : std_logic := '0';
    signal ce_i : std_logic := '0';

    signal quantization_o : std_logic_vector(63 downto 0) := (others => '0');
    signal valid_o : std_logic := '0';

    signal prog_counter : unsigned(7 downto 0) := (others => '0');

    type data_array_type is array (0 to 7) of std_logic_vector(95 downto 0);
        
    -- Define the constant with example 96-bit values
    constant DATA_ARRAY : data_array_type := (
        -- Element 0
        X"fdb008027016f86ff21ad3a0",
        -- Element 1
        X"000036fef01cff70ac01bede",
        -- Element 2
        X"fdc001fd901dfa0fe5039fe1",
        -- Element 3
        X"003fd5fff02d003fbd001041",
        -- Element 4
        X"01c009fe5ffd002fe302fff7",
        -- Element 5
        X"00100ffff023005fdb011fc3",
        -- Element 6
        X"fe3008fe6ffcfe9fec030fec",
        -- Element 7
        X"000fe8fff01effffe6fff018"
    );
    
begin
    

    TOP : entity work.quantizer
        port map (
            clk_i => clk,
            ce_i => ce_i,
            rst_i => rst,
            data_i => data_i,
            valid_i => valid_i,
            scale_factor_i => std_logic_vector(scale_factor),
            data_o => quantization_o,
            valid_o => valid_o
    );

    clk <= not clk after clk_period / 2;


    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                prog_counter <= (others => '0');
            else
                if prog_counter = X"7" then
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
        valid_i <= '0';
        wait_rst := FALSE;
        wait for 50 ns;

        rst <= '0';
        wait for delay_ns * ns;

        valid_i <= '1';
        ce_i <= '1';
        scale_factor <= X"3";
        wait for delay_ns * 64 * ns;

        scale_factor <= X"0";
        wait for delay_ns * 64 * ns;
    

        wait_rst := TRUE;
        wait for delay_ns * ns;
        
        if (wait_rst) then
            wait for 300 ns;
        end if;

    end process;

end sim;