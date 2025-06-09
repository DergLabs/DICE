library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity zigzag_sim is
end zigzag_sim;

architecture sim of zigzag_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    constant NUM_ELEMENTS : integer := 8;
    constant ELEMENT_WIDTH : integer := 8; -- 8 bits per element

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal data_i : std_logic_vector((ELEMENT_WIDTH * NUM_ELEMENTS) - 1 downto 0) := (others => '0');
    signal valid_i : std_logic := '0';

    signal data_o : std_logic_vector((ELEMENT_WIDTH * NUM_ELEMENTS) - 1 downto 0) := (others => '0');
    signal valid_o : std_logic := '0';

    signal prog_counter : unsigned(15 downto 0) := (others => '0');

    
begin

    TOP : entity work.zigzag_encoder
    generic map (
            ELEMENT_WIDTH => ELEMENT_WIDTH
    )
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

        -- Block 0
        valid_i <= '1';
        data_i <= X"07_06_05_04_03_02_01_00";
        wait for delay_ns * ns;

        -- Block 1
        data_i <= X"0F_0E_0D_0C_0B_0A_09_08";
        wait for delay_ns * ns;

        -- Block 2
        data_i <= X"17_16_15_14_13_12_11_10";
        wait for delay_ns * ns;

        -- Block 3
        data_i <= X"1F_1E_1D_1C_1B_1A_19_18";
        wait for delay_ns * ns;

        -- Block 4
        data_i <= X"27_26_25_24_23_22_21_20";
        wait for delay_ns * ns;

        -- Block 5
        data_i <= X"2F_2E_2D_2C_2B_2A_29_28";
        wait for delay_ns * ns;

        -- Block 6
        data_i <= X"37_36_35_34_33_32_31_30";
        wait for delay_ns * ns;

        -- Block 7
        data_i <= X"3F_3E_3D_3C_3B_3A_39_38";
        wait for delay_ns * ns;
        valid_i <= '0'; -- end of data input
        -- End of data input

        wait for delay_ns * 51 * ns; -- wait 51 cycles for next block

        -- Send same block but in reverse
        -- block 7
        valid_i <= '1';
        data_i <= X"3F_3E_3D_3C_3B_3A_39_38";
        wait for delay_ns * ns;

        -- block 6
        data_i <= X"37_36_35_34_33_32_31_30";
        wait for delay_ns * ns;

        -- block 5
        data_i <= X"2F_2E_2D_2C_2B_2A_29_28";
        wait for delay_ns * ns;

        -- block 4
        data_i <= X"27_26_25_24_23_22_21_20";
        wait for delay_ns * ns;

        -- block 3
        data_i <= X"1F_1E_1D_1C_1B_1A_19_18";
        wait for delay_ns * ns;

        -- block 2
        data_i <= X"17_16_15_14_13_12_11_10";
        wait for delay_ns * ns;

        -- block 1
        data_i <= X"0F_0E_0D_0C_0B_0A_09_08";
        wait for delay_ns * ns;

        -- block 0
        data_i <= X"07_06_05_04_03_02_01_00";
        wait for delay_ns * ns;
        valid_i <= '0'; -- end of reverse data input
        -- End of reverse data input

        wait for delay_ns * 100 * ns;
        wait_rst := TRUE;
        wait for delay_ns * ns;
        
        if (wait_rst) then
            wait for 300 ns;
        end if;

    end process;

end sim;