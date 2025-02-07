----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 02/02/2025 09:15:56 PM
-- Design Name: 
-- Module Name: output_memory - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Output ram for converting wide processor output bus to narrow FT600 input bus
-- When DEPTH is changed, FIFO IP must be re-run to generate new FIFO
-- !!! IMPORTANT !!! FIFO IP must be run with the following settings:
-- Implementation: Simple Dual Port Ram, non-common Clock
-- Port A operating Mode - No Change, Use ENA Pin, Port A Write Width = DIN_WIDTH, Port A Depth = DIN_WIDTH/DOUT_WIDTH, no RST 
-- Port B operating Mode - Write First (doesnt really matter), Use ENB Pin, Port B Read Width = DOUT_WIDTH, Port B Depth = DEPTH (Auto Calculated), no RST
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

use IEEE.math_real."ceil";
use IEEE.math_real."log2";

entity output_memory is
    generic (
        DIN_WIDTH : integer := 128;
        DOUT_WIDTH : integer := 16;
        NUM_WRITE_WORDS : integer := 8;
        NUM_READ_WORDS : integer := 64;
        DEPTH : integer := 64
    );
    port ( 
        rst_i               : in std_logic;

        data_i              : in std_logic_vector(DIN_WIDTH-1 downto 0);
        data_in_valid       : in std_logic;
        write_clk_i         : in std_logic;


        reciever_ready_i    : in std_logic;
        data_o              : out std_logic_vector(DOUT_WIDTH-1 downto 0);
        data_out_valid      : out std_logic;
        read_clk_i          : in std_logic;

        memory_clear_o      : out std_logic

    );
end output_memory;

architecture Behavioral of output_memory is

    -- Output Ram Signals
    signal output_ram_wr_addr           : std_logic_vector(6 downto 0);
    signal output_ram_rd_addr           : std_logic_vector(10 downto 0);

    -- Counters
    signal write_counter : integer := 0;
    signal read_counter : integer := 0;

    -- reciever ready flag on write clock
    signal reciever_ready_wr_clk : std_logic := '0';

    -- Output memory
    COMPONENT blk_mem_gen_1
    PORT (
        clka        : IN STD_LOGIC;
        ena         : IN STD_LOGIC;
        wea         : IN STD_LOGIC;
        addra       : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        dina        : IN STD_LOGIC_VECTOR((DIN_WIDTH - 1) DOWNTO 0);

        clkb        : IN STD_LOGIC;
        rstb        : IN STD_LOGIC;
        enb         : IN STD_LOGIC;
        addrb       : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
        doutb       : OUT STD_LOGIC_VECTOR((DOUT_WIDTH - 1) DOWNTO 0);
        rsta_busy   : OUT STD_LOGIC;
        rstb_busy   : OUT STD_LOGIC 
    );
    END COMPONENT;

begin

    reciever_ready_wr_clk <= reciever_ready_i when rising_edge(write_clk_i);

    -- output write address counter
    process(write_clk_i, rst_i)
    begin
        if rst_i = '1' then
            write_counter <= 0;
            memory_clear_o <= '0';  
            output_ram_wr_addr <= (others => '0');
        elsif rising_edge(write_clk_i) then
            if (data_in_valid = '1') then
                write_counter <= write_counter + 1;
                output_ram_wr_addr <= std_logic_vector(unsigned(output_ram_wr_addr) + 1);
            elsif (reciever_ready_wr_clk = '1') then
                write_counter <= 0;
                output_ram_wr_addr <= (others => '0');
            else
                output_ram_wr_addr <= output_ram_wr_addr;
                write_counter <= write_counter;
            end if;
        end if;
    end process;
    
    -- output read address counter
    process(read_clk_i, rst_i)
    begin
        if rst_i = '1' then
            read_counter <= 0;
        elsif rising_edge(read_clk_i) then
            if reciever_ready_i = '1' then
                if (read_counter = NUM_READ_WORDS - 1) then
                    read_counter <= 0;
                    output_ram_rd_addr <= (others => '0');
                else
                    read_counter <= read_counter + 1;
                    output_ram_rd_addr <= std_logic_vector(unsigned(output_ram_rd_addr) + 1);
                end if;
            else 
                read_counter <= 0;
                output_ram_rd_addr <= (others => '0');
            end if;
        end if;
    end process;

    -- Output memory
    output_memory : blk_mem_gen_1
    PORT MAP (
        clka => write_clk_i,
        ena => '1',
        wea => data_in_valid,
        addra => output_ram_wr_addr,
        dina => data_i,

        clkb => read_clk_i,
        rstb => rst_i,
        enb => reciever_ready_i,
        addrb => output_ram_rd_addr,
        doutb => data_o,
        rsta_busy => open,
        rstb_busy => open
    );
    
    data_out_valid <= reciever_ready_i when rising_edge(read_clk_i);

end Behavioral;
