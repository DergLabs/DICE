----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date:
-- Design Name: 
-- Module Name: data_delay_reg - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Configurable delay register for pipelining/delaying signals. Shift depth = how many cycles to delay by, data width = bus width
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_delay_reg is
    generic (
        SHIFT_DEPTH : integer := 8; -- Specify Number of clock cycles to shift
        DATA_WIDTH  : integer := 8 -- Specify data width
    );
    port ( 
        clk_i          : in std_logic;
        ce_i           : in std_logic;
        rst_i          : in std_logic;
        data_i         : in std_logic_vector((DATA_WIDTH - 1) downto 0);
        data_o         : out std_logic_vector((DATA_WIDTH - 1) downto 0)
    );
end data_delay_reg;

architecture Behavioral of data_delay_reg is

    type array_slv is array (DATA_WIDTH-1 downto 0) of std_logic_vector(SHIFT_DEPTH-1 downto 0);
    signal shift_reg : array_slv;

begin

    process (clk_i, rst_i)
    begin
    if (rst_i = '1') then
        for i in 0 to DATA_WIDTH-1 loop
            shift_reg(i) <= (others => '0');
        end loop;
    elsif rising_edge(clk_i) then
        if (ce_i = '1') then
            for i in 0 to DATA_WIDTH-1 loop
                shift_reg(i) <= shift_reg(i)(SHIFT_DEPTH-2 downto 0) & data_i(i);
            end loop;
        end if;
    end if;
    end process;

    process (shift_reg)
    begin
        for i in 0 to DATA_WIDTH-1 loop
            data_o(i) <= shift_reg(i)(SHIFT_DEPTH-1);
        end loop;
    end process;

end Behavioral;





