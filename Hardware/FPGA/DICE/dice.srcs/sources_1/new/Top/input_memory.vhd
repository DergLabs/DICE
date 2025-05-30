----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 02/02/2025 09:15:56 PM
-- Design Name: 
-- Module Name: input_memory - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Input FIFO memory for interfacing processing cores with FT600 controller
-- When DEPTH is changed, FIFO IP must be re-run to generate new FIFO
-- !!! IMPORTANT !!! FIFO IP must be run with the following settings:
-- Implementation: Block Ram or Distributed Ram, do not use Builtin FIFO
-- Synchronization Stages = 2
-- Write Depth = DEPTH, Write Width = DIN_WIDTH, Read Width = DOUT_WIDTH
-- First Word Fall Through = Enabled
-- Valid Flag = Enabled
-- DOUT Reset Value = 0, Reset Safety Circuit = Enabled, Asynchronous Reset = Enabled
-- 
-- !!! IMPORTANT !!! Keep FIFO Input/Outputs multiples of 16
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity input_memory is
    generic (
        DIN_WIDTH   : integer := 8;
        DOUT_WIDTH  : integer := 8
        --DEPTH       : integer := 64
    );
    port ( 
        rst_i           : in std_logic;
        data_i          : in std_logic_vector(DIN_WIDTH-1 downto 0);
        data_in_valid   : in std_logic;    
        write_clk_i     : in std_logic;
        write_en_i      : in std_logic;

        read_hold_ram_i : in std_logic;
        hold_ram_data_o : out std_logic_vector(DIN_WIDTH-1 downto 0);
        
        data_o          : out std_logic_vector(DOUT_WIDTH-1 downto 0);
        data_out_valid  : out std_logic;
        
        read_clk_i      : in std_logic;

        empty_o         : out std_logic;
        full_o          : out std_logic
    );
end input_memory;

architecture Behavioral of input_memory is

    signal input_fifo_rd_en         : std_logic;
    signal input_fifo_rd_en_delayed : std_logic;
    signal fifo_valid               : std_logic;

    signal wr_rst_busy              : std_logic;
    signal rd_rst_busy              : std_logic;
    signal fifo_data_o              : std_logic_vector(DOUT_WIDTH-1 downto 0);

    signal hold_mem_wr_addr        : std_logic_vector(11 downto 0);
    signal hold_mem_rd_addr        : std_logic_vector(11 downto 0);

    COMPONENT input_data_fifo
    PORT (
        rst         : IN STD_LOGIC;
        wr_clk      : IN STD_LOGIC;
        rd_clk      : IN STD_LOGIC;
        din         : IN STD_LOGIC_VECTOR(DIN_WIDTH-1 DOWNTO 0);
        wr_en       : IN STD_LOGIC;
        rd_en       : IN STD_LOGIC;
        dout        : OUT STD_LOGIC_VECTOR(DOUT_WIDTH-1 DOWNTO 0);
        full        : OUT STD_LOGIC;
        empty       : OUT STD_LOGIC;
        valid       : OUT STD_LOGIC;
        wr_rst_busy : OUT STD_LOGIC;
        rd_rst_busy : OUT STD_LOGIC 
    );
    END COMPONENT;


    -- Port A 16-bit wide, 2048 Elements Deep (4KB)
    -- Port B Also 16-bit wide, 2048 Elements Deep (4KB)
    -- When writing 32x32 tile, total of 1024 32-bit words are sent or 2048 16-bit chunks
    COMPONENT input_pixel_hold_ram
    PORT (
        clka : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        wea : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        dina : IN STD_LOGIC_VECTOR(DIN_WIDTH-1 DOWNTO 0);
        clkb : IN STD_LOGIC;
        rstb : IN STD_LOGIC;
        enb : IN STD_LOGIC;
        addrb : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        doutb : OUT STD_LOGIC_VECTOR(DIN_WIDTH-1 DOWNTO 0);
        rsta_busy : OUT STD_LOGIC;
        rstb_busy : OUT STD_LOGIC 
    );
    END COMPONENT; 
begin

    input_fifo_rd_en <= not(write_en_i) when rising_edge(read_clk_i);

    rd_en_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 2,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => read_clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i(0) => input_fifo_rd_en,
        data_o(0) => input_fifo_rd_en_delayed
    );

    input_cdc_fifo : input_data_fifo
    PORT MAP (
      rst => rst_i,
      wr_clk => write_clk_i,
      rd_clk => read_clk_i,

      din => data_i,
      wr_en => data_in_valid,

      rd_en => input_fifo_rd_en_delayed,
      dout => fifo_data_o,

      full => full_o,
      empty => empty_o,
      valid => fifo_valid,

      wr_rst_busy => wr_rst_busy,
      rd_rst_busy => rd_rst_busy
    );
    
    -- Output data to processing core and set valid flag
    process(read_clk_i, rst_i)
    begin
        if rst_i = '1' then
            data_o <= (others => '0');
            data_out_valid <= '0';
        elsif rising_edge(read_clk_i) then
            if (fifo_valid = '1' and input_fifo_rd_en_delayed  = '1') then
                data_o <= fifo_data_o;
                data_out_valid <= '1';
            else
                data_o <= data_o;
                data_out_valid <= '0';
            end if;
        end if;
    end process;

    -- Counter for hold memory read/write address
    -- Memory is 8KB, 4096x16b
    -- When reading, we read from 
    process(write_clk_i, rst_i)
    begin
        if rst_i = '1' then
            hold_mem_wr_addr <= X"000";
            hold_mem_rd_addr <= X"000";
        elsif rising_edge(write_clk_i) then
            if data_in_valid = '1' then
                hold_mem_wr_addr <= std_logic_vector(unsigned(hold_mem_wr_addr) + 1);
                hold_mem_rd_addr <= X"000"; -- reset read address when writing
            end if;

            if read_hold_ram_i = '1' then
                hold_mem_rd_addr <= std_logic_vector(unsigned(hold_mem_rd_addr) + 1);
                hold_mem_wr_addr <= X"000"; -- reset write address when reading
            end if;
        end if;
    end process;

    -- Hold memory to store input data, initialized to all zeros, when reading last word we look for 0x0000
    pixel_hold_ram : input_pixel_hold_ram
    PORT MAP (
        clka => write_clk_i,
        ena => '1',
        wea => data_in_valid,
        addra => hold_mem_wr_addr,
        dina => data_i,
        clkb => write_clk_i, -- Same clock is used as write clock since we read directly to FT600
        rstb => rst_i,
        enb => read_hold_ram_i,
        addrb => hold_mem_rd_addr,
        doutb => hold_ram_data_o,
        rsta_busy => open,
        rstb_busy => open
    );

end Behavioral;