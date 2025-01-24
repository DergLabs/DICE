library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity image_stats_sim is
end image_stats_sim;

architecture sim of image_stats_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal data_i : std_logic_vector(23 downto 0) := (others => '0');
    signal valid_i : std_logic := '0';

    signal laplacian_var_o : std_logic_vector(15 downto 0) := (others => '0');
    signal laplacian_mean_o : std_logic_vector(15 downto 0) := (others => '0');
    signal laplacian_std_dev_o : std_logic_vector(15 downto 0) := (others => '0');
    signal laplacian_valid_o : std_logic := '0';

    signal gradient_var_o : std_logic_vector(15 downto 0) := (others => '0');
    signal gradient_mean_o : std_logic_vector(15 downto 0) := (others => '0');
    signal gradient_std_dev_o : std_logic_vector(15 downto 0) := (others => '0');
    signal gradient_valid_o : std_logic := '0';


    signal prog_counter : unsigned(7 downto 0) := (others => '0');

    type row_type is array (0 to 7) of std_logic_vector(23 downto 0);
    -- Define a type for the complete 8x8 matrix
    type matrix_type is array (0 to 7) of row_type;
    
    constant DATA_MATRIX : matrix_type := (
        -- Row 0
        (X"A5B4C3", X"123456", X"789ABC", X"DEF012", X"345678", X"9ABCDE", X"F01234", X"567890"),
        -- Row 1
        (X"FEDCBA", X"987654", X"321098", X"765432", X"109876", X"543210", X"987654", X"321098"),
        -- Row 2
        (X"AABBCC", X"DDEEFF", X"112233", X"445566", X"778899", X"AABBCC", X"DDEEFF", X"112233"),
        -- Row 3
        (X"456789", X"ABCDEF", X"123456", X"789ABC", X"DEF012", X"345678", X"9ABCDE", X"F01234"),
        -- Row 4
        (X"111111", X"222222", X"333333", X"444444", X"555555", X"666666", X"777777", X"888888"),
        -- Row 5
        (X"999999", X"AAAAAA", X"BBBBBB", X"CCCCCC", X"DDDDDD", X"EEEEEE", X"FFFFFF", X"000000"),
        -- Row 6
        (X"135790", X"246801", X"357912", X"468023", X"579134", X"680245", X"791356", X"802467"),
        -- Row 7
        (X"CAFE01", X"BABE02", X"DEAD03", X"BEEF04", X"FACE05", X"FEED06", X"F00D07", X"FADE08")
    );
    
begin
    

    TOP : entity work.image_statistics_top
    generic map (
        NUM_SAMPLES => 8
    )
    port map (
        clk_i => clk,
        ce_i => '1',
        rst_i => rst,

        pixel_i => data_i,
        valid_i => valid_i,

        laplacian_var_o => laplacian_var_o,
        laplacian_mean_o => laplacian_mean_o,
        laplacian_std_dev_o => laplacian_std_dev_o,
        laplacian_valid_o => laplacian_valid_o,

        gradient_var_o => gradient_var_o,
        gradient_mean_o => gradient_mean_o,
        gradient_std_dev_o => gradient_std_dev_o,
        gradient_valid_o => gradient_valid_o
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
                data_i <= DATA_MATRIX(to_integer(prog_counter) mod 8)(to_integer(prog_counter) / 8);
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
        wait for delay_ns * 63 * ns;

        valid_i <= '0';
        wait for delay_ns * 1200 * ns;
        wait_rst := TRUE;
        wait for delay_ns * ns;
        
        if (wait_rst) then
            wait for 300 ns;
        end if;

    end process;

end sim;