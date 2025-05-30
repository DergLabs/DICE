----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 01/21/2025 03:44:15 PM
-- Design Name: 
-- Module Name: multi_ch_loss_comp - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Top level module for multi-channel compression core. Creates 3 compressor instances for Y, Cr and Cb channels
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
use IEEE.NUMERIC_STD.ALL;

entity multi_ch_lossy_comp is
    generic (
        Y_BITS : integer := 12;
        CR_BITS : integer := 10;
        CB_BITS : integer := 10;

        EN_Y_SUBSAMPLE : boolean := false;
        EN_CR_SUBSAMPLE : boolean := true;
        EN_CB_SUBSAMPLE : boolean := true;
        EN_ZIGZAG : boolean := false
    );
    port ( 
        clk_i      : in  std_logic;
        rst_i      : in  std_logic;
        vio_rst_i  : in  std_logic;
        data_i     : in  std_logic_vector(23 downto 0);
        valid_i    : in  std_logic;
        data_o    : out std_logic_vector(((Y_BITS * 8) + (CR_BITS * 8) + (CB_BITS * 8)) - 1 downto 0);
        valid_o    : out std_logic_vector(2 downto 0)
    );
end multi_ch_lossy_comp;

architecture Behavioral of multi_ch_lossy_comp is

    signal core_0_data_o : std_logic_vector((CB_BITS * 8) - 1 downto 0);
    signal core_0_valid_o : std_logic;

    signal core_1_data_o : std_logic_vector((Y_BITS * 8) - 1 downto 0);
    signal core_1_valid_o : std_logic;

    signal core_2_data_o : std_logic_vector((CR_BITS * 8) - 1 downto 0);
    signal core_2_valid_o : std_logic;

begin
    

    -- Cb Core, 9-bit output
    core_0 : entity work.lossy_compressor
    generic map (
        EN_SUBSAMPLE => EN_CB_SUBSAMPLE,
        EN_ZIGZAG => EN_ZIGZAG,
        OUTPUT_WIDTH => CB_BITS
    )
    port map (
        clk_i   => clk_i,
        rst_i   => rst_i,
        vio_rst_i => vio_rst_i,
        data_i  => data_i(7 downto 0),
        valid_i => valid_i,
        q_scale_i => X"02", -- Defualt is 0x02
        data_o  => core_0_data_o,
        valid_o => core_0_valid_o
    );

    -- Y Core, 12-bit output
    core_1 : entity work.lossy_compressor
    generic map (
        EN_SUBSAMPLE => EN_Y_SUBSAMPLE,
        EN_ZIGZAG => EN_ZIGZAG,
        OUTPUT_WIDTH => Y_BITS
    )
    port map (
        clk_i   => clk_i,
        rst_i   => rst_i,
        vio_rst_i => vio_rst_i,
        data_i  => data_i(15 downto 8),
        valid_i => valid_i,
        q_scale_i => X"00", -- Defualt is 0x00
        data_o  => core_1_data_o,
        valid_o => core_1_valid_o
    );

    -- Cr Core, 9-bit output
    core_2 : entity work.lossy_compressor
    generic map (
        EN_SUBSAMPLE => EN_CR_SUBSAMPLE,
        EN_ZIGZAG => EN_ZIGZAG,
        OUTPUT_WIDTH => CR_BITS
    )
    port map (
        clk_i   => clk_i,
        rst_i   => rst_i,
        vio_rst_i => vio_rst_i,
        data_i  => data_i(23 downto 16),
        valid_i => valid_i,
        q_scale_i => X"02", -- Defualt is 0x02
        data_o  => core_2_data_o,
        valid_o => core_2_valid_o
    );

    -- combine output data from channels
    data_o <= core_0_data_o & core_1_data_o & core_2_data_o;
    valid_o <= core_0_valid_o & core_1_valid_o & core_2_valid_o;

end Behavioral;

