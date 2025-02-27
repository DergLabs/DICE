----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 01/21/2025 08:29:31 PM
-- Design Name: 
-- Module Name: quantizer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: Implements quantization via bit shift. Uses following formula to round to nearest integer: N = (X + (Y/2)) / Y, Y = 1 << QuantizationValue
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity quantizer is
    generic (
        OUTPUT_WIDTH : integer := 10 -- Bit width of each word
    );
    port (
        clk_i           : in std_logic;
        ce_i            : in std_logic;
        rst_i           : in std_logic;

        data_i          : in std_logic_vector(95 downto 0);
        valid_i         : in std_logic;
        scale_factor_i  : in unsigned(7 downto 0);

        data_o          : out std_logic_vector((OUTPUT_WIDTH * 8) - 1 downto 0);
        valid_o         : out std_logic
    );
end quantizer;

architecture Behavioral of quantizer is
    signal valid_x : std_logic;
    signal data_x : std_logic_vector(95 downto 0);

    signal quantized_data : std_logic_vector(95 downto 0);

    signal ram_addr : std_logic_vector(4 downto 0);

    signal quantization_factor : std_logic_vector(63 downto 0);
    
    signal resized_data : std_logic_vector((8 * OUTPUT_WIDTH) - 1 downto 0);

    signal quantization_factor_delayed : std_logic_vector(63 downto 0);

    signal corrected_data : signed(95 downto 0);
    signal correction_factors : unsigned(95 downto 0);
                     
begin

    -- Delay input data 4 cycles to allow for quantization table to be read
    data_reg : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 4,
        DATA_WIDTH => 96
    )
    port map (
        clk_i => clk_i,
        ce_i => ce_i,
        rst_i => rst_i,
        data_i => data_i,
        data_o => data_x
    );
    
    -- Delay input valid 4 cycles to allow for quantization table to be read
    valid_reg : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 4,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_i,
        ce_i => ce_i,
        rst_i => rst_i,
        data_i(0) => valid_i,
        data_o(0) => valid_x
    );

    -- counter for quantization table address, every other item in the table is 0
    -- Table increments by 4 each cycle
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            ram_addr <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1' and valid_i = '1') then
                if (ram_addr = "11111") then
                    ram_addr <= (others => '0');
                else
                    ram_addr <= std_logic_vector(unsigned(ram_addr) + 4);
                end if;
            else
                ram_addr <= ram_addr;
            end if;
        end if;
    end process;

    -- get quantization factor, provides 64b vector with eight 8b quantization factors
    -- Factors are accessed column wise from LSB to MSB (Left to right in the table)
    quantization_table : entity work.quantization_table
    port map (
        clk_i => clk_i,
        ce_i => ce_i,
        rst_i => rst_i,
        scale_factor_i => scale_factor_i, -- Hard coded to 0 for now (Highest Qualtiy)
        addr_i => ram_addr,
        quantization_table_o => quantization_factor
    );
    
    -- Create Quantization values and divide by 2 for correction factor
    correction_factors(11 downto 0) <= "0" & (shift_left("000000000001", to_integer(unsigned(quantization_factor(7 downto 0))))(11 downto 1));
    correction_factors(23 downto 12) <= "0" & (shift_left("000000000001", to_integer(unsigned(quantization_factor(15 downto 8))))(11 downto 1));
    correction_factors(35 downto 24) <= "0" & (shift_left("000000000001", to_integer(unsigned(quantization_factor(23 downto 16))))(11 downto 1));
    correction_factors(47 downto 36) <= "0" & (shift_left("000000000001", to_integer(unsigned(quantization_factor(31 downto 24))))(11 downto 1));
    correction_factors(59 downto 48) <= "0" & (shift_left("000000000001", to_integer(unsigned(quantization_factor(39 downto 32))))(11 downto 1));
    correction_factors(71 downto 60) <= "0" & (shift_left("000000000001", to_integer(unsigned(quantization_factor(47 downto 40))))(11 downto 1));
    correction_factors(83 downto 72) <= "0" & (shift_left("000000000001", to_integer(unsigned(quantization_factor(55 downto 48))))(11 downto 1));
    correction_factors(95 downto 84)  <= "0" & (shift_left("000000000001", to_integer(unsigned(quantization_factor(63 downto 56))))(11 downto 1));


    -- Add (quantization factor/2) to data for correct rounding
    corrected_data(95 downto 84) <= signed(data_x(95 downto 84)) + (to_integer(correction_factors(11 downto 0)));
    corrected_data(83 downto 72) <= signed(data_x(83 downto 72)) + (to_integer(correction_factors(23 downto 12)));
    corrected_data(71 downto 60) <= signed(data_x(71 downto 60)) + (to_integer(correction_factors(35 downto 24)));
    corrected_data(59 downto 48) <= signed(data_x(59 downto 48)) + (to_integer(correction_factors(47 downto 36)));
    corrected_data(47 downto 36) <= signed(data_x(47 downto 36)) + (to_integer(correction_factors(59 downto 48)));
    corrected_data(35 downto 24) <= signed(data_x(35 downto 24)) + (to_integer(correction_factors(71 downto 60)));
    corrected_data(23 downto 12) <= signed(data_x(23 downto 12)) + (to_integer(correction_factors(83 downto 72)));
    corrected_data(11 downto 0)  <= signed(data_x(11 downto 0))  + (to_integer(correction_factors(95 downto 84)));

    -- quantize data using right shift
    quantized_data(95 downto 84) <= std_logic_vector(shift_right(corrected_data(95 downto 84), to_integer(unsigned(quantization_factor(7 downto 0)))));
    quantized_data(83 downto 72) <= std_logic_vector(shift_right(corrected_data(83 downto 72), to_integer(unsigned(quantization_factor(15 downto 8)))));
    quantized_data(71 downto 60) <= std_logic_vector(shift_right(corrected_data(71 downto 60), to_integer(unsigned(quantization_factor(23 downto 16)))));
    quantized_data(59 downto 48) <= std_logic_vector(shift_right(corrected_data(59 downto 48), to_integer(unsigned(quantization_factor(31 downto 24)))));
    quantized_data(47 downto 36) <= std_logic_vector(shift_right(corrected_data(47 downto 36), to_integer(unsigned(quantization_factor(39 downto 32)))));
    quantized_data(35 downto 24) <= std_logic_vector(shift_right(corrected_data(35 downto 24), to_integer(unsigned(quantization_factor(47 downto 40)))));
    quantized_data(23 downto 12) <= std_logic_vector(shift_right(corrected_data(23 downto 12), to_integer(unsigned(quantization_factor(55 downto 48)))));
    quantized_data(11 downto 0)  <= std_logic_vector(shift_right(corrected_data(11 downto 0),  to_integer(unsigned(quantization_factor(63 downto 56)))));

    -- resize to signed  
    resized_data((OUTPUT_WIDTH - 1) downto 0)                      <= std_logic_vector(resize(signed(quantized_data(11 downto 0)), OUTPUT_WIDTH));
    resized_data((2 * OUTPUT_WIDTH) - 1 downto OUTPUT_WIDTH)       <= std_logic_vector(resize(signed(quantized_data(23 downto 12)), OUTPUT_WIDTH));
    resized_data((3 * OUTPUT_WIDTH) - 1 downto (OUTPUT_WIDTH * 2)) <= std_logic_vector(resize(signed(quantized_data(35 downto 24)), OUTPUT_WIDTH));
    resized_data((4 * OUTPUT_WIDTH) - 1 downto (OUTPUT_WIDTH * 3)) <= std_logic_vector(resize(signed(quantized_data(47 downto 36)), OUTPUT_WIDTH));
    resized_data((5 * OUTPUT_WIDTH) - 1 downto (OUTPUT_WIDTH * 4)) <= std_logic_vector(resize(signed(quantized_data(59 downto 48)), OUTPUT_WIDTH));
    resized_data((6 * OUTPUT_WIDTH) - 1 downto (OUTPUT_WIDTH * 5)) <= std_logic_vector(resize(signed(quantized_data(71 downto 60)), OUTPUT_WIDTH));
    resized_data((7 * OUTPUT_WIDTH) - 1 downto (OUTPUT_WIDTH * 6)) <= std_logic_vector(resize(signed(quantized_data(83 downto 72)), OUTPUT_WIDTH));
    resized_data((8 * OUTPUT_WIDTH) - 1 downto (OUTPUT_WIDTH * 7)) <= std_logic_vector(resize(signed(quantized_data(95 downto 84)), OUTPUT_WIDTH));


    -- Register quantized data
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            valid_o <= '0';
            data_o <= (others => '0');
        elsif rising_edge(clk_i) then
            if (ce_i = '1') then
                valid_o <= valid_x;
                data_o <= resized_data;
            else
                valid_o <= '0';
                data_o <= data_o;
            end if;
        end if;
    end process;


end Behavioral;