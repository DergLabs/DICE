library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity multi_core_test is
    generic (
        NUM_CHANNELS : integer := 3
    );
    port ( 
        clk_i      : in  std_logic;
        rst_i      : in  std_logic;
        data_i     : in  std_logic_vector((NUM_CHANNELS*8)-1 downto 0);
        valid_i    : in  std_logic;
        ce_o       : out std_logic_vector(NUM_CHANNELS - 1 downto 0);
        done_o     : out std_logic_vector(NUM_CHANNELS - 1 downto 0);
        data_o     : out std_logic_vector((NUM_CHANNELS * 64 - 1) downto 0);
        valid_o    : out std_logic_vector(NUM_CHANNELS - 1 downto 0)
    );
end multi_core_test;

architecture Behavioral of multi_core_test is
    constant SLICE_WIDTH : integer := 8;
    type input_array is array (0 to NUM_CHANNELS-1) of std_logic_vector(SLICE_WIDTH-1 downto 0);
    signal channel_inputs : input_array;
begin
    -- Duplicate input data across channels
    gen_inputs: for i in 0 to NUM_CHANNELS-1 generate
        channel_inputs(i) <= data_i(((i mod 3) + 1)*SLICE_WIDTH-1 downto (i mod 3)*SLICE_WIDTH);
    end generate;

    gen_channels: for i in 0 to NUM_CHANNELS-1 generate
        channel_inst : entity work.image_compressor
            port map (
                clk_i   => clk_i,
                rst_i   => rst_i,
                data_i  => channel_inputs(i),
                valid_i => valid_i,
                ce_o   => ce_o(i),
                done_o => done_o(i),
                data_o  => data_o((i+1)*64-1 downto i*64),
                valid_o => valid_o(i)
            );
    end generate;
end Behavioral;