library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity multi_ch_lossy_comp is
    /*generic (
        NUM_CHANNELS : integer := 3;
        OUTPUT_WIDTH : integer := 8
    );*/
    port ( 
        clk_i      : in  std_logic;
        rst_i      : in  std_logic;
        vio_rst_i  : in  std_logic;
        data_i     : in  std_logic_vector(23 downto 0);
        valid_i    : in  std_logic;
        --ce_o       : out std_logic_vector(2 downto 0);
        --done_o     : out std_logic_vector(2 downto 0);
        --data_o     : out std_logic_vector((NUM_CHANNELS * (OUTPUT_WIDTH * 8) - 1) downto 0);
        data_o    : out std_logic_vector(255 downto 0);
        valid_o    : out std_logic_vector(2 downto 0)
    );
end multi_ch_lossy_comp;

architecture Behavioral of multi_ch_lossy_comp is

    signal core_0_data_o : std_logic_vector(79 downto 0);
    signal core_0_valid_o : std_logic;

    signal core_1_data_o : std_logic_vector(95 downto 0);
    signal core_1_valid_o : std_logic;

    signal core_2_data_o : std_logic_vector(79 downto 0);
    signal core_2_valid_o : std_logic;

begin
    

    -- Cb Core
    core_0 : entity work.lossy_compressor
    generic map (
        EN_SUBSAMPLE => true,
        OUTPUT_WIDTH => 10
    )
    port map (
        clk_i   => clk_i,
        rst_i   => rst_i,
        vio_rst_i => vio_rst_i,
        data_i  => data_i(7 downto 0),
        valid_i => valid_i,
        q_scale_i => X"02",
        ce_o   => open,
        done_o => open,
        data_o  => core_0_data_o,
        valid_o => core_0_valid_o
    );

    -- Y Core
    core_1 : entity work.lossy_compressor
    generic map (
        EN_SUBSAMPLE => false,
        OUTPUT_WIDTH => 12
    )
    port map (
        clk_i   => clk_i,
        rst_i   => rst_i,
        vio_rst_i => vio_rst_i,
        data_i  => data_i(15 downto 8),
        valid_i => valid_i,
        q_scale_i => X"00",
        ce_o   => open,
        done_o => open,
        data_o  => core_1_data_o,
        valid_o => core_1_valid_o
    );

    -- Cr Core
    core_2 : entity work.lossy_compressor
    generic map (
        EN_SUBSAMPLE => true,
        OUTPUT_WIDTH => 10
    )
    port map (
        clk_i   => clk_i,
        rst_i   => rst_i,
        vio_rst_i => vio_rst_i,
        data_i  => data_i(23 downto 16),
        valid_i => valid_i,
        q_scale_i => X"02",
        ce_o   => open,
        done_o => open,
        data_o  => core_2_data_o,
        valid_o => core_2_valid_o
    );

    -- combine output data from channels
    data_o <= core_0_data_o & core_1_data_o & core_2_data_o;
    valid_o <= core_0_valid_o & core_1_valid_o & core_2_valid_o;

end Behavioral;

