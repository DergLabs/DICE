library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity quantization_table is
    port ( 
        clk_i                   : in std_logic;
        ce_i                    : in std_logic;
        rst_i                   : in std_logic;
        scale_factor_i          : in unsigned(7 downto 0);
        addr_i                  : in std_logic_vector(4 downto 0);
        quantization_table_o    : out std_logic_vector(63 downto 0)
    );
end quantization_table;

architecture Behavioral of quantization_table is

    -- Create array of 2-bit vectors for RAM data
    type ram_data_array_2b_t is array (0 to 7) of std_logic_vector(1 downto 0);
    signal ram_data : ram_data_array_2b_t;
    --signal ram_data_x : ram_data_array_2b_t;

    -- 8 bit vectors for resized data
    type ram_data_array_8b_t is array (0 to 7) of unsigned(7 downto 0);
    signal ram_data_resized : ram_data_array_8b_t;
    signal ram_data_adjusted : ram_data_array_8b_t;


    signal addr_x : std_logic_vector(4 downto 0) := (others => '0');
    signal addr_delayed : std_logic_vector(4 downto 0) := (others => '0');
    signal ce_delayed : std_logic;


    -- Lowest value quatnization table is stored (equivelant to original table * 0.125)
    -- Values are stored as the bit shift amounts
    -- To increase the value of the quantization table, add the scale factor to the value
    -- Scale Factor of 0 = 0.125, 1 = 0.25, 2 = 0.5, 3 = 1, 4 = 2, 5 = 4, 6 = 8, 7 = 16 (equivalent to original table * scale factor)
    --A1 02_03_01_01_00_01_00_01
    --B1 02_03_01_01_00_00_00_00
    --C1 03_04_02_02_01_01_00_00
    --D1 02_03_01_02_01_01_00_00
    --A2 03_04_03_03_02_03_01_02
    --B2 02_04_03_03_02_03_02_02
    --C2 03_04_04_04_03_03_03_03
    --D3 02_03_02_02_01_02_01_02

    -- Higher Qualtiy Quantization Matrix
    --A1 01_01_01_01_01_00_00_00
    --B1 01_01_01_01_01_01_00_00
    --C1 02_01_01_01_01_01_01_00
    --D1 03_02_03_01_01_01_01_01
    --A2 03_03_03_06_01_01_01_01
    --B2 03_03_03_03_03_01_01_01
    --C2 03_03_03_03_02_01_01_01
    --D3 03_03_03_03_02_01_01_01

begin

    -- register addr signal
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            addr_x <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
                addr_x <= addr_i;
            else
                addr_x <= addr_x;
            end if;
        end if;
    end process;

    -- Store upper half of table
    ram_inst0 : RAM32M
    generic map (
        -- Initialize each RAM with one column of the initialization data
        /*INIT_A => X"0203010100010001",
        INIT_B => X"0203010100000000",
        INIT_C => X"0304020201010000", 
        INIT_D => X"0203010201010000",*/
        INIT_A => X"01_01_01_01_01_00_00_00",
        INIT_B => X"01_01_01_01_01_01_00_00",
        INIT_C => X"02_01_01_01_01_01_01_00",
        INIT_D => X"03_02_03_01_01_01_01_01",
        IS_WCLK_INVERTED => '0'
    )
    port map (
        -- Output ports - split 8-bit data across 4 2-bit outputs
        DOA => ram_data(0),
        DOB => ram_data(1),
        DOC => ram_data(2),
        DOD => ram_data(3),
        
        -- Address inputs - all the same
        ADDRA => addr_x,
        ADDRB => addr_x,
        ADDRC => addr_x,
        ADDRD => addr_x,
        
        -- Data inputs - tied low
        DIA => "00",
        DIB => "00",
        DIC => "00",
        DID => "00",
        
        -- Clock and write enable
        WCLK => clk_i,
        WE => '0'
    );

    -- Store lower half of table
    ram_inst1 : RAM32M
    generic map (
        -- Initialize each RAM with one column of the initialization data
        /*INIT_A => X"0304030302030102",
        INIT_B => X"0204030302030202",
        INIT_C => X"0304040403030303",
        INIT_D => X"0203020201020102",*/
        INIT_A => X"03_03_03_06_01_01_01_01",
        INIT_B => X"03_03_03_03_03_01_01_01",
        INIT_C => X"03_03_03_03_02_01_01_01",
        INIT_D => X"03_03_03_03_02_01_01_01",
        IS_WCLK_INVERTED => '0'
    )
    port map (
        -- Output ports - split 8-bit data across 4 2-bit outputs
        DOA => ram_data(4),
        DOB => ram_data(5),
        DOC => ram_data(6),
        DOD => ram_data(7),
        
        -- Address inputs - all the same
        ADDRA => addr_x,
        ADDRB => addr_x,
        ADDRC => addr_x,
        ADDRD => addr_x,
        
        -- Data inputs - tied low
        DIA => "00",
        DIB => "00",
        DIC => "00",
        DID => "00",
        
        -- Clock and write enable
        WCLK => clk_i,
        WE => '0'
    );

    -- register ram data & resize to 8b
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            for i in 0 to 7 loop
                ram_data_resized(i) <= (others => '0');
            end loop;
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
                for i in 0 to 7 loop
                    ram_data_resized(i) <= resize(unsigned(ram_data(i)), 8);
                end loop;
            else
                for i in 0 to 7 loop
                    ram_data_resized(i) <= ram_data_resized(i);
                end loop;
            end if;
        end if;
    end process;

    --delay addr value by 3 cycles
    addr_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 2,
        DATA_WIDTH => 5
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i => addr_i,
        data_o => addr_delayed
    );

    -- delay ce one cycle
    ce_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 1,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i(0) => ce_i,
        data_o(0) => ce_delayed
    );

    -- Adjust quantization values that overflow 2 bit outputs, 
    -- could use 2 clock cycles to correctly access them, but this is easier and maintains sigle cycle operation
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            for i in 0 to 7 loop
                ram_data_adjusted(i) <= (others => '0');
            end loop;
        elsif rising_edge(clk_i) then
            --if (ce_delayed = '1') then
                /*if (addr_delayed = "10000") then -- At ADDR 16 adjust values that are 4 to account for overflow
                    ram_data_adjusted(0) <= ram_data_resized(0) + scale_factor_i;
                    ram_data_adjusted(1) <= ram_data_resized(1) + scale_factor_i;
                    --ram_data_adjusted(2) <= ram_data_resized(2) + scale_factor_i;
                    ram_data_adjusted(2) <= X"06" + scale_factor_i;
                    ram_data_adjusted(3) <= ram_data_resized(3) + scale_factor_i;
                    ram_data_adjusted(4) <= ram_data_resized(4) + scale_factor_i;
                    ram_data_adjusted(5) <= ram_data_resized(5) + scale_factor_i;
                    --ram_data_adjusted(6) <= X"04" + scale_factor_i;
                    ram_data_adjusted(6) <= ram_data_resized(6) + scale_factor_i;
                    ram_data_adjusted(7) <= ram_data_resized(7) + scale_factor_i;*/
                if (addr_delayed = "10100") then -- At ADDR 20 adjust values that are 4 to account for overflow
                    ram_data_adjusted(0) <= ram_data_resized(0) + scale_factor_i;
                    ram_data_adjusted(1) <= ram_data_resized(1) + scale_factor_i;
                    ram_data_adjusted(2) <= ram_data_resized(2) + scale_factor_i;
                    ram_data_adjusted(3) <= ram_data_resized(3) + scale_factor_i;
                    --ram_data_adjusted(4) <= ram_data_resized(4) + scale_factor_i;
                    ram_data_adjusted(4) <= X"06" + scale_factor_i;
                    ram_data_adjusted(5) <= ram_data_resized(5) + scale_factor_i;
                    ram_data_adjusted(6) <= ram_data_resized(6) + scale_factor_i;
                    ram_data_adjusted(7) <= ram_data_resized(7) + scale_factor_i;
                /*elsif (addr_delayed = "11000") then -- At ADDR 24 adjust values that are 4 to account for overflow
                    ram_data_adjusted(0) <= ram_data_resized(0) + scale_factor_i;
                    ram_data_adjusted(1) <= ram_data_resized(1) + scale_factor_i;
                    --ram_data_adjusted(2) <= X"04" + scale_factor_i;
                    ram_data_adjusted(2) <= ram_data_resized(2) + scale_factor_i;
                    ram_data_adjusted(3) <= ram_data_resized(3) + scale_factor_i;
                    --ram_data_adjusted(4) <= X"04" + scale_factor_i;
                    ram_data_adjusted(4) <= X"06" + scale_factor_i;
                    --ram_data_adjusted(5) <= X"04" + scale_factor_i;
                    --ram_data_adjusted(6) <= X"04" + scale_factor_i;
                    ram_data_adjusted(5) <= ram_data_resized(5) + scale_factor_i;
                    ram_data_adjusted(6) <= ram_data_resized(6) + scale_factor_i;
                    ram_data_adjusted(7) <= ram_data_resized(7) + scale_factor_i;*/
                else   
                    ram_data_adjusted(0) <= ram_data_resized(0) + scale_factor_i;
                    ram_data_adjusted(1) <= ram_data_resized(1) + scale_factor_i;
                    ram_data_adjusted(2) <= ram_data_resized(2) + scale_factor_i;
                    ram_data_adjusted(3) <= ram_data_resized(3) + scale_factor_i;
                    ram_data_adjusted(4) <= ram_data_resized(4) + scale_factor_i;
                    ram_data_adjusted(5) <= ram_data_resized(5) + scale_factor_i;
                    ram_data_adjusted(6) <= ram_data_resized(6) + scale_factor_i;
                    ram_data_adjusted(7) <= ram_data_resized(7) + scale_factor_i;
                end if;
             --else
                --for i in 0 to 7 loop
                    --ram_data_adjusted(i) <= ram_data_adjusted(i);
                --end loop;
            --end if;
        end if;
    end process;

    -- Register output
    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            quantization_table_o <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
                quantization_table_o <= std_logic_vector(ram_data_adjusted(0)) & 
                std_logic_vector(ram_data_adjusted(1)) & 
                std_logic_vector(ram_data_adjusted(2)) & 
                std_logic_vector(ram_data_adjusted(3)) &
                std_logic_vector(ram_data_adjusted(4)) & 
                std_logic_vector(ram_data_adjusted(5)) & 
                std_logic_vector(ram_data_adjusted(6)) & 
                std_logic_vector(ram_data_adjusted(7));
                                    
            else 
                quantization_table_o <= quantization_table_o;
            end if;
        end if;
    end process;

end Behavioral;