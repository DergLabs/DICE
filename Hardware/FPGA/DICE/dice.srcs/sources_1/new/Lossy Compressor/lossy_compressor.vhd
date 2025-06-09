----------------------------------------------------------------------------------
-- Company: Drexel University
-- Engineer: John Hofmeyr
-- 
-- Create Date: 01/21/2025 03:44:15 PM
-- Design Name: 
-- Module Name: image_compressor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Top level module for Lossy compressor, ties Subsample, DCT and Quantization together 
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

entity lossy_compressor is
    generic (
        EN_SUBSAMPLE : boolean := true; -- 4:2:2 subsampling
        EN_ZIGZAG : boolean := true; -- zigzag reordering of output data
        OUTPUT_WIDTH : integer := 8 -- Bit width of each word
    );
    port ( 
        clk_i      : in std_logic;
        rst_i      : in std_logic;
        vio_rst_i  : in std_logic;

        data_i     : in std_logic_vector(7 downto 0);
        valid_i    : in std_logic;
        q_scale_i  : in unsigned(7 downto 0);

        data_o     : out std_logic_vector((OUTPUT_WIDTH * 8) - 1 downto 0);
        valid_o    : out std_logic
    );
end lossy_compressor;

architecture Behavioral of lossy_compressor is
    constant INTERMEDIATE_WIDTH : integer := 12;
    constant DIVIDED_WIDTH : integer := 9;

    signal valid_x : std_logic;

    signal subsampled_pixel : std_logic_vector(7 downto 0);
    signal subsample_valid : std_logic;

    signal pixel_cols : std_logic_vector(63 downto 0);
    signal pixel_cols_wide : std_logic_vector((INTERMEDIATE_WIDTH * 8) - 1 downto 0);
    signal col_valid : std_logic;

    signal dct1_pixel_out : std_logic_vector((INTERMEDIATE_WIDTH * 8) - 1 downto 0);
    signal dct1_valid_out : std_logic;

    signal divided_pixels : std_logic_vector((INTERMEDIATE_WIDTH * 8) - 1 downto 0);
    signal pixel_0        : std_logic_vector(8 downto 0);
    signal pixel_1        : std_logic_vector(8 downto 0);
    signal pixel_2        : std_logic_vector(8 downto 0);
    signal pixel_3        : std_logic_vector(8 downto 0);
    signal pixel_4        : std_logic_vector(8 downto 0);
    signal pixel_5        : std_logic_vector(8 downto 0);
    signal pixel_6        : std_logic_vector(8 downto 0);
    signal pixel_7        : std_logic_vector(8 downto 0);
    signal resized_pixels : std_logic_vector((DIVIDED_WIDTH * 8) - 1 downto 0);

    signal pixel_rows : std_logic_vector((DIVIDED_WIDTH * 8) - 1 downto 0);
    signal row_valid : std_logic;

    signal pixel_rows_wide : std_logic_vector((INTERMEDIATE_WIDTH * 8) - 1 downto 0);
    
    signal dct2_pixel_out : std_logic_vector((INTERMEDIATE_WIDTH * 8) - 1 downto 0);
    signal dct2_valid_out : std_logic;

    signal divided_pixels_valid : std_logic;
    
    signal delayed_pixel_in : std_logic_vector(7 downto 0);
    signal delayed_valid_in : std_logic;

    signal quantized_data : std_logic_vector((OUTPUT_WIDTH * 8) - 1 downto 0);
    signal quantized_valid : std_logic;

begin

    -- Register valid signal to align with data
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            valid_x <= '0';
        elsif rising_edge(clk_i) then
            valid_x <= valid_i;
        end if;
    end process;

    -- Pixel subsampler, simply replaces every other pixel with previous pixel
    gen_subsample : if EN_SUBSAMPLE generate
        pixel_subsampler_inst : entity work.pixel_subsampler
        generic map (
            WIDTH => 8
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            data_i => data_i,
            valid_i => valid_i,
            data_o => subsampled_pixel,
            valid_o => subsample_valid
        );

        -- serial in parallel out register
        -- Accepts one 8b pixel per clock, outputs eight 8b pixels every 8 cycles 
        -- Pixels must be read in column wise
        input_sipo_reg : entity work.sipo_reg
        generic map (
            IN_WIDTH => 8,
            OUT_TAPS => 8,
            TAP_END => 0,
            DEPTH => 8,
            SHIFT_DIR => "LEFT2RIGHT"
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            data_i => subsampled_pixel,
            valid_i => subsample_valid,
            data_o => pixel_cols,
            valid_o => col_valid
        );
    else generate

        input_data_delay_reg : entity work.data_delay_reg
        generic map (
            SHIFT_DEPTH => 3,
            DATA_WIDTH => 8
        )
        port map (
            clk_i => clk_i,
            ce_i => '1',
            rst_i => rst_i,
            data_i => data_i,
            data_o => delayed_pixel_in
        );

        input_valid_delay_reg : entity work.data_delay_reg
        generic map (
            SHIFT_DEPTH => 3,
            DATA_WIDTH => 1
        )
        port map (
            clk_i => clk_i,
            ce_i => '1',
            rst_i => rst_i,
            data_i(0) => valid_i,
            data_o(0) => delayed_valid_in
        );

        -- serial in parallel out register
        -- Accepts one 8b pixel per clock, outputs eight 8b pixels every 8 cycles 
        -- Pixels must be read in column wise
        input_sipo_reg : entity work.sipo_reg
        generic map (
            IN_WIDTH => 8,
            OUT_TAPS => 8,
            TAP_END => 0,
            DEPTH => 8,
            SHIFT_DIR => "LEFT2RIGHT"
        )
        port map (
            clk_i => clk_i,
            rst_i => rst_i,
            data_i => delayed_pixel_in,
            valid_i => delayed_valid_in,
            data_o => pixel_cols,
            valid_o => col_valid
        );
    end generate;

    -- Resize pixel data from 8bit unsigned to 12bit signed for 1st DCT
    pixel_cols_wide <=  X"0" & pixel_cols(63 downto 56) &
                        X"0" & pixel_cols(55 downto 48) &
                        X"0" & pixel_cols(47 downto 40) &
                        X"0" & pixel_cols(39 downto 32) &
                        X"0" & pixel_cols(31 downto 24) &
                        X"0" & pixel_cols(23 downto 16) &
                        X"0" & pixel_cols(15 downto 8) &
                        X"0" & pixel_cols(7 downto 0);

    -- Apply DCT column Wise, output 12-bit signed
    col_dct : entity work.dct1d
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i => pixel_cols_wide,
        valid_i => col_valid,
        data_o => dct1_pixel_out,
        valid_o => dct1_valid_out
    );

    -- Divide DCT output by 8 to prevent overflow in next DCT stage, output 12-bit signed, can be resized to 9-bit signed
    pixel_divider : entity work.pixel_divider
    port map(
        clk_i => clk_i,
        rst_i => rst_i,
        pixel_i => dct1_pixel_out,
        valid_i => dct1_valid_out,
        pixel_o => divided_pixels,
        valid_o => divided_pixels_valid
    );

    -- Resize from 12bit signed to 9bit signed to save resources in transpose stage
    pixel_0 <= std_logic_vector(resize(signed(divided_pixels(11 downto 0)), 9));
    pixel_1 <= std_logic_vector(resize(signed(divided_pixels(23 downto 12)), 9));
    pixel_2 <= std_logic_vector(resize(signed(divided_pixels(35 downto 24)), 9));
    pixel_3 <= std_logic_vector(resize(signed(divided_pixels(47 downto 36)), 9));
    pixel_4 <= std_logic_vector(resize(signed(divided_pixels(59 downto 48)), 9));
    pixel_5 <= std_logic_vector(resize(signed(divided_pixels(71 downto 60)), 9));
    pixel_6 <= std_logic_vector(resize(signed(divided_pixels(83 downto 72)), 9));
    pixel_7 <= std_logic_vector(resize(signed(divided_pixels(95 downto 84)), 9));

    resized_pixels <= pixel_7 & pixel_6 & pixel_5 & pixel_4 & pixel_3 & pixel_2 & pixel_1 & pixel_0;

    -- Transpose 8x8 pixel matrix
    -- Transpose requires 8 clock cycles to load in 8 columns before a row is output
    pixel_transpose : entity work.transpose
    generic map (
        -- Number of bits per element
        ELEMENT_WIDTH => 9
        -- Leave NUM_ELEMENTS and DEPTH as default for 8x8 matrix
        --NUM_ELEMENTS => 8,
        --DEPTH => 8
    )
    port map (
        clk_i => clk_i,
        rst_i => vio_rst_i,
        data_i => resized_pixels,
        valid_i => divided_pixels_valid,
        data_o => pixel_rows,
        valid_o => row_valid
    );

    -- Resize from 9bit signed to 12bit signed for 2nd DCT stage
    pixel_rows_wide <= std_logic_vector(resize(signed(pixel_rows(71 downto 63)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(62 downto 54)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(53 downto 45)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(44 downto 36)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(35 downto 27)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(26 downto 18)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(17 downto 9)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(8 downto 0)), 12));
                      

    -- Apply DCT row Wise, outputs 12-bit signed value
    row_dct : entity work.dct1d
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i => pixel_rows_wide,
        valid_i => row_valid,
        data_o => dct2_pixel_out,
        valid_o => dct2_valid_out
    );

    -- Quantize DCT output
    quantizer : entity work.quantizer
    generic map (
        OUTPUT_WIDTH => OUTPUT_WIDTH
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i or vio_rst_i,
        data_i => dct2_pixel_out,
        valid_i => dct2_valid_out,
        scale_factor_i => q_scale_i,
        data_o => quantized_data,
        valid_o => quantized_valid
    );

    gen_zigzag : 
    if EN_ZIGZAG generate
        -- Zigzag reorder quantized DCT output
        zigzag_encode : entity work.zigzag_encoder
        generic map (
            ELEMENT_WIDTH => OUTPUT_WIDTH
        )
        port map(
            clk_i => clk_i,
            rst_i => vio_rst_i,
            data_i => quantized_data,
            valid_i => quantized_valid,
            data_o => data_o,
            valid_o => valid_o
        );
    else generate
        -- No zigzag reordering, output quantized data directly
        data_o <= quantized_data;
        valid_o <= quantized_valid;
    end generate;

end Behavioral;
