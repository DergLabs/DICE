library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity top_sim is
end top_sim;

architecture sim of top_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal clk_p : std_logic := '0';
    signal clk_n : std_logic := '1';

    signal ftdi_clk : std_logic := '0';
    signal led_o : std_logic_vector(2 downto 0) := (others => '0');
    signal ftdi_rxf_n : std_logic;
    signal ftdi_txe_n : std_logic;

    signal ftdi_rstn : std_logic;
    signal ftdi_wakeup : std_logic;
    signal ftdi_oe_n : std_logic;
    signal ftdi_rd_n : std_logic;
    signal ftdi_wr_n : std_logic;

    signal ftdi_data_io : std_logic_vector(15 downto 0) := (others => 'Z');
    signal ftdi_be_io : std_logic_vector(1 downto 0) := (others => 'Z');

    signal prog_counter : unsigned(7 downto 0) := (others => '0');

    signal send_data : std_logic := '0';

    type row_type is array (0 to 7) of std_logic_vector(15 downto 0);
    -- Define a type for the complete 8x8 matrix
    type matrix_type is array (0 to 11) of row_type;
    
    constant DATA_MATRIX : matrix_type := (
        -- Row 0 (original row 0 upper bits)
        (X"A5B4", X"1234", X"789A", X"DEF0", X"3456", X"9ABC", X"F012", X"5678"),
        -- Row 1 (original row 0 lower bits)
        (X"C356", X"5678", X"BC12", X"1234", X"7890", X"DEAB", X"3434", X"9090"),
        -- Row 2 (original row 1 upper bits)
        (X"FEDC", X"9876", X"3210", X"7654", X"1098", X"5432", X"9876", X"3210"),
        -- Row 3 (original row 1 lower bits)
        (X"BA54", X"5432", X"9876", X"3210", X"7654", X"1098", X"5454", X"9898"),
        -- Row 4 (original row 2 upper bits)
        (X"AABB", X"DDEE", X"1122", X"4455", X"7788", X"AABB", X"DDEE", X"1122"),
        -- Row 5 (original row 2 lower bits)
        (X"CCFF", X"FF33", X"3366", X"6699", X"99CC", X"CCFF", X"FF33", X"3333"),
        -- Row 6 (original row 3 upper bits)
        (X"4567", X"ABCD", X"1234", X"789A", X"DEF0", X"3456", X"9ABC", X"F012"),
        -- Row 7 (original row 3 lower bits)
        (X"89EF", X"EF56", X"56BC", X"BC12", X"1278", X"7834", X"DECD", X"3434"),
        -- Row 8 (original row 4 upper bits)
        (X"1111", X"2222", X"3333", X"4444", X"5555", X"6666", X"7777", X"8888"),
        -- Row 9 (original row 5 upper bits)
        (X"9999", X"AAAA", X"BBBB", X"CCCC", X"DDDD", X"EEEE", X"FFFF", X"0000"),
        -- Row 10 (original row 6 upper bits)
        (X"1357", X"2468", X"3579", X"4680", X"5791", X"6802", X"7913", X"8024"),
        -- Row 11 (original row 7 upper bits)
        (X"CAFE", X"BABE", X"DEAD", X"BEEF", X"FACE", X"FEED", X"F00D", X"FADE")
    );
    
begin
    

    TOP : entity work.top
    port map(
        sysclk_n => clk_n,
        sysclk_p => clk_p,
        rst_i => rst,

        ftdi_clk_i => ftdi_clk,
        ftdi_rxf_n_i => ftdi_rxf_n,
        ftdi_txe_n_i => ftdi_txe_n,

        led_o => led_o,

        ftdi_rstn_o => ftdi_rstn,
        ftdi_wakeup_o => ftdi_wakeup,
        ftdi_oe_n_o => ftdi_oe_n,
        ftdi_rd_n_o => ftdi_rd_n,
        ftdi_wr_n_o => ftdi_wr_n,

        ftdi_data_io => ftdi_data_io,
        ftdi_be_io => ftdi_be_io
    );

    clk <= not clk after clk_period / 2;
    clk_p <= not clk_p after clk_period / 2;
    clk_n <= not clk_n;
    ftdi_clk <= clk;

    process(clk)
    begin
        if falling_edge(clk) and send_data = '1' then
            if rst = '1' then
                prog_counter <= (others => '0');
            else
                if prog_counter = X"3F" then
                    prog_counter <= (others => '0');
                else
                    prog_counter <= prog_counter + 1;
                end if;
                ftdi_data_io <= DATA_MATRIX(to_integer(prog_counter) mod 8)(to_integer(prog_counter) / 8);
            end if;
        end if;
    end process;


    process is
    variable delay_ns : integer := 10;
    variable wait_rst : boolean := TRUE;
    begin
        rst <= '1';
        ftdi_rxf_n <= '1';
        ftdi_txe_n <= '1';
        wait_rst := FALSE;
        wait for 50 ns;

        rst <= '0';
        ftdi_rxf_n <= '0';
        if(falling_edge(ftdi_oe_n)) then 
            if(falling_edge(ftdi_rd_n)) then
                ftdi_be_io <= "11";
                send_data <= '1';

                wait for delay_ns * 128 * ns;
            

                ftdi_rxf_n <= '1';
                ftdi_be_io <= "00";
                wait for delay_ns * 20 * ns;
                wait_rst := TRUE;
                wait for delay_ns * ns;
                
                if (wait_rst) then
                    wait for 300 ns;
                end if;
            end if;
        end if;
    end process;

end sim;