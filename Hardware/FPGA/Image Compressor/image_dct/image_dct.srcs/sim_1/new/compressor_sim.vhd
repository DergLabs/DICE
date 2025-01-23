library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity compressor_sim is
end compressor_sim;

architecture sim of compressor_sim is
    constant clock : integer := 100000000;
    constant clk_period : time := 1 sec / clock;

    signal clk : std_logic := '1';
    signal rst : std_logic := '0';

    signal data_i : std_logic_vector(7 downto 0) := (others => '0');
    signal valid_i : std_logic := '0';

    signal data_o : std_logic_vector(95 downto 0) := (others => '0');
    signal valid_o : std_logic := '0';


    signal prog_counter : unsigned(7 downto 0) := (others => '0');

    type row_type is array (0 to 7) of std_logic_vector(7 downto 0);
    -- Define a type for the complete 8x8 matrix
    type matrix_type is array (0 to 7) of row_type;
    
    -- Define the constant with the values
    constant DATA_MATRIX : matrix_type := (
        -- Row 0
        (std_logic_vector(to_unsigned(178, 8)),
         std_logic_vector(to_unsigned(11, 8)),
         std_logic_vector(to_unsigned(0, 8)),
         std_logic_vector(to_unsigned(3, 8)),
         std_logic_vector(to_unsigned(0, 8)),
         std_logic_vector(to_unsigned(1, 8)),
         std_logic_vector(to_unsigned(0, 8)),
         std_logic_vector(to_unsigned(0, 8))),
        
        -- Row 1
        (std_logic_vector(to_unsigned(251, 8)),
         std_logic_vector(to_unsigned(195, 8)),
         std_logic_vector(to_unsigned(17, 8)),
         std_logic_vector(to_unsigned(1, 8)),
         std_logic_vector(to_unsigned(2, 8)),
         std_logic_vector(to_unsigned(0, 8)),
         std_logic_vector(to_unsigned(0, 8)),
         std_logic_vector(to_unsigned(0, 8))),
         
        -- Row 2
        (std_logic_vector(to_unsigned(240, 8)),
         std_logic_vector(to_unsigned(243, 8)),
         std_logic_vector(to_unsigned(182, 8)),
         std_logic_vector(to_unsigned(4, 8)),
         std_logic_vector(to_unsigned(0, 8)),
         std_logic_vector(to_unsigned(2, 8)),
         std_logic_vector(to_unsigned(0, 8)),
         std_logic_vector(to_unsigned(0, 8))),
         
        -- Row 3
        (std_logic_vector(to_unsigned(239, 8)),
         std_logic_vector(to_unsigned(243, 8)),
         std_logic_vector(to_unsigned(247, 8)),
         std_logic_vector(to_unsigned(131, 8)),
         std_logic_vector(to_unsigned(1, 8)),
         std_logic_vector(to_unsigned(0, 8)),
         std_logic_vector(to_unsigned(1, 8)),
         std_logic_vector(to_unsigned(0, 8))),
         
        -- Row 4
        (std_logic_vector(to_unsigned(247, 8)),
         std_logic_vector(to_unsigned(242, 8)),
         std_logic_vector(to_unsigned(242, 8)),
         std_logic_vector(to_unsigned(237, 8)),
         std_logic_vector(to_unsigned(108, 8)),
         std_logic_vector(to_unsigned(1, 8)),
         std_logic_vector(to_unsigned(0, 8)),
         std_logic_vector(to_unsigned(0, 8))),
         
        -- Row 5
        (std_logic_vector(to_unsigned(244, 8)),
         std_logic_vector(to_unsigned(242, 8)),
         std_logic_vector(to_unsigned(245, 8)),
         std_logic_vector(to_unsigned(242, 8)),
         std_logic_vector(to_unsigned(214, 8)),
         std_logic_vector(to_unsigned(39, 8)),
         std_logic_vector(to_unsigned(0, 8)),
         std_logic_vector(to_unsigned(2, 8))),
         
        -- Row 6
        (std_logic_vector(to_unsigned(242, 8)),
         std_logic_vector(to_unsigned(246, 8)),
         std_logic_vector(to_unsigned(242, 8)),
         std_logic_vector(to_unsigned(247, 8)),
         std_logic_vector(to_unsigned(243, 8)),
         std_logic_vector(to_unsigned(166, 8)),
         std_logic_vector(to_unsigned(1, 8)),
         std_logic_vector(to_unsigned(0, 8))),
         
        -- Row 7
        (std_logic_vector(to_unsigned(242, 8)),
         std_logic_vector(to_unsigned(245, 8)),
         std_logic_vector(to_unsigned(242, 8)),
         std_logic_vector(to_unsigned(243, 8)),
         std_logic_vector(to_unsigned(246, 8)),
         std_logic_vector(to_unsigned(231, 8)),
         std_logic_vector(to_unsigned(108, 8)),
         std_logic_vector(to_unsigned(10, 8)))
    );
    
begin
    

    TOP : entity work.image_compressor
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
        wait for delay_ns * 1280 * ns;

        valid_i <= '0';
        wait_rst := TRUE;
        wait for delay_ns * ns;
        
        if (wait_rst) then
            wait for 300 ns;
        end if;

    end process;

end sim;