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

end Behavioral;