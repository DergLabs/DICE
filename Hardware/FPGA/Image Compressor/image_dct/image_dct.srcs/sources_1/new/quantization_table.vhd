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
        --scale_factor_i          : in std_logic_vector(3 downto 0);
        addr_i                  : in std_logic_vector(4 downto 0);
        quantization_table_o    : out std_logic_vector(63 downto 0)
    );
end quantization_table;

architecture Behavioral of quantization_table is

    -- Create array of 2-bit vectors for RAM data
    type ram_data_array_2b_t is array (0 to 7) of std_logic_vector(1 downto 0);
    signal ram_data : ram_data_array_2b_t;
    signal ram_data_x : ram_data_array_2b_t;

    -- 8 bit vectors for resized data
    type ram_data_array_8b_t is array (0 to 7) of std_logic_vector(7 downto 0);
    signal ram_data_resized : ram_data_array_8b_t;
    signal ram_data_adjusted : ram_data_array_8b_t;

    signal addr_x : std_logic_vector(4 downto 0) := (others => '0');
    signal scale_factor_i : std_logic_vector(3 downto 0) := (others => '0');


    -- Lowest value quatnization table
    --A1 02_03_01_01_00_01_00_01
    --B1 02_03_01_01_00_00_00_00
    --C1 03_04_02_02_01_01_00_00
    --D1 02_03_01_02_01_01_00_00
    --A2 03_04_03_03_02_03_01_02
    --B2 02_04_03_03_02_03_02_02
    --C2 03_04_04_04_03_03_03_03
    --D3 02_03_02_02_01_02_01_02

begin

    scale_factor_i <= "0011"; -- hard code to 3

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

    ram_inst0 : RAM32M
    generic map (
        -- Initialize each RAM with one column of the initialization data
        INIT_A => X"0203010100010001",
        INIT_B => X"0203010100000000",
        INIT_C => X"0304020201010000", 
        INIT_D => X"0203010201010000",
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

    ram_inst1 : RAM32M
    generic map (
        -- Initialize each RAM with one column of the initialization data
        INIT_A => X"0304030302030102",
        INIT_B => X"0204030302030202",
        INIT_C => X"0304040403030303",
        INIT_D => X"0203020201020102",
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
            for i in 0 to 7 loop
                ram_data_resized(i) <= "000000" & ram_data(i);
            end loop;
        end if;
    end process;

    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            for i in 0 to 7 loop
                ram_data_adjusted(i) <= (others => '0');
            end loop;
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
                if (addr_i = "10000" or addr_i = "10100") then
                    ram_data_adjusted(6) <= std_logic_vector(X"04" + unsigned(scale_factor_i));
                    ram_data_adjusted(2) <= std_logic_vector(unsigned(ram_data_resized(2)) + unsigned(scale_factor_i));
                    ram_data_adjusted(4) <= std_logic_vector(unsigned(ram_data_resized(4)) + unsigned(scale_factor_i));
                    ram_data_adjusted(5) <= std_logic_vector(unsigned(ram_data_resized(5)) + unsigned(scale_factor_i));
                elsif (addr_i = "11000") then
                    ram_data_adjusted(2) <= std_logic_vector(X"04" + unsigned(scale_factor_i));
                    ram_data_adjusted(4) <= std_logic_vector(X"04" + unsigned(scale_factor_i));
                    ram_data_adjusted(5) <= std_logic_vector(X"04" + unsigned(scale_factor_i));
                    ram_data_adjusted(6) <= std_logic_vector(X"04" + unsigned(scale_factor_i));
                else   
                    ram_data_adjusted(2) <= std_logic_vector(unsigned(ram_data_resized(2)) + unsigned(scale_factor_i));
                    ram_data_adjusted(4) <= std_logic_vector(unsigned(ram_data_resized(4)) + unsigned(scale_factor_i));
                    ram_data_adjusted(5) <= std_logic_vector(unsigned(ram_data_resized(5)) + unsigned(scale_factor_i));
                    ram_data_adjusted(6) <= std_logic_vector(unsigned(ram_data_resized(6)) + unsigned(scale_factor_i));
                end if;

                ram_data_adjusted(0) <= std_logic_vector(unsigned(ram_data_resized(0)) + unsigned(scale_factor_i));
                ram_data_adjusted(1) <= std_logic_vector(unsigned(ram_data_resized(1)) + unsigned(scale_factor_i));
                ram_data_adjusted(3) <= std_logic_vector(unsigned(ram_data_resized(3)) + unsigned(scale_factor_i));
                ram_data_adjusted(7) <= std_logic_vector(unsigned(ram_data_resized(7)) + unsigned(scale_factor_i));
             else
                for i in 0 to 7 loop
                    ram_data_adjusted(i) <= (others => '0');
                end loop;
            end if;
        end if;
    end process;

    process(clk_i, rst_i)
    begin
        if (rst_i = '1') then
            quantization_table_o <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
            quantization_table_o <= ram_data_adjusted(0) & ram_data_adjusted(1) & ram_data_adjusted(2) & ram_data_adjusted(3) &
                                    ram_data_adjusted(4) & ram_data_adjusted(5) & ram_data_adjusted(6) & ram_data_adjusted(7);
            else 
                quantization_table_o <= (others => '0');
            end if;
        end if;
    end process;

end Behavioral;