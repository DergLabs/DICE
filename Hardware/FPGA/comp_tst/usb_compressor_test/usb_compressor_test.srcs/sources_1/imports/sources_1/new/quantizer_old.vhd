----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2025 08:29:31 PM
-- Design Name: 
-- Module Name: quantizer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
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
    port (
        clk_i           : in std_logic;
        ce_i            : in std_logic;
        rst_i           : in std_logic;

        data_i          : in std_logic_vector(95 downto 0);
        valid_i         : in std_logic;
        --scale_factor_i  : in std_logic_vector(3 downto 0);

        data_o          : out std_logic_vector(63 downto 0);
        valid_o         : out std_logic
    );
end quantizer;

architecture Behavioral of quantizer is
    signal valid_x : std_logic;
    signal valid_v_x : std_logic_vector(0 downto 0);
    signal data_x : std_logic_vector(95 downto 0);

    signal quantized_data : std_logic_vector(95 downto 0);

    signal ram_addr : std_logic_vector(4 downto 0);

    signal quantization_factor : std_logic_vector(63 downto 0);
    
    signal resized_data : std_logic_vector(63 downto 0);

    signal quantization_factor_delayed : std_logic_vector(63 downto 0);
                                                            
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
        data_i => (0 => valid_i),
        data_o => valid_v_x
    );

    valid_x <= valid_v_x(0);

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
        scale_factor_i => X"03", -- Hard coded to 3 for now (equivelant to original table values)
        addr_i => ram_addr,
        quantization_table_o => quantization_factor
    );

    -- delay quant table by 1 cycle
    quant_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 1,
        DATA_WIDTH => 64
    )
    port map (
        clk_i => clk_i,
        ce_i => ce_i,
        rst_i => rst_i,
        data_i => quantization_factor,
        data_o => quantization_factor_delayed
    );

    -- quantize data using right shift
    quantized_data(95 downto 84) <= std_logic_vector(shift_right(signed(data_x(95 downto 84)), to_integer(unsigned(quantization_factor_delayed(7 downto 0)))));
    quantized_data(83 downto 72) <= std_logic_vector(shift_right(signed(data_x(83 downto 72)), to_integer(unsigned(quantization_factor_delayed(15 downto 8)))));
    quantized_data(71 downto 60) <= std_logic_vector(shift_right(signed(data_x(71 downto 60)), to_integer(unsigned(quantization_factor_delayed(23 downto 16)))));
    quantized_data(59 downto 48) <= std_logic_vector(shift_right(signed(data_x(59 downto 48)), to_integer(unsigned(quantization_factor_delayed(31 downto 24)))));
    quantized_data(47 downto 36) <= std_logic_vector(shift_right(signed(data_x(47 downto 36)), to_integer(unsigned(quantization_factor_delayed(39 downto 32)))));
    quantized_data(35 downto 24) <= std_logic_vector(shift_right(signed(data_x(35 downto 24)), to_integer(unsigned(quantization_factor_delayed(47 downto 40)))));
    quantized_data(23 downto 12) <= std_logic_vector(shift_right(signed(data_x(23 downto 12)), to_integer(unsigned(quantization_factor_delayed(55 downto 48)))));
    quantized_data(11 downto 0)  <= std_logic_vector(shift_right(signed(data_x(11 downto 0)),  to_integer(unsigned(quantization_factor_delayed(63 downto 56)))));

    -- resize to signed 8bit 
    resized_data(7 downto 0)   <= std_logic_vector(resize(signed(quantized_data(11 downto 0)), 8));
    resized_data(15 downto 8)  <= std_logic_vector(resize(signed(quantized_data(23 downto 12)), 8));
    resized_data(23 downto 16) <= std_logic_vector(resize(signed(quantized_data(35 downto 24)), 8));
    resized_data(31 downto 24) <= std_logic_vector(resize(signed(quantized_data(47 downto 36)), 8));
    resized_data(39 downto 32) <= std_logic_vector(resize(signed(quantized_data(59 downto 48)), 8));
    resized_data(47 downto 40) <= std_logic_vector(resize(signed(quantized_data(71 downto 60)), 8));
    resized_data(55 downto 48) <= std_logic_vector(resize(signed(quantized_data(83 downto 72)), 8));
    resized_data(63 downto 56) <= std_logic_vector(resize(signed(quantized_data(95 downto 84)), 8));

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