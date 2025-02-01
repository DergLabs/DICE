----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/21/2025 03:44:15 PM
-- Design Name: 
-- Module Name: image_compressor - Behavioral
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

entity image_compressor is
    port ( 
        clk_i      : in std_logic;
        rst_i      : in std_logic;

        data_i     : in std_logic_vector(7 downto 0);
        valid_i    : in std_logic;

        ce_o       : out std_logic;
        done_o     : out std_logic;
        data_o     : out std_logic_vector(63 downto 0);
        valid_o    : out std_logic
    );
end image_compressor;

architecture Behavioral of image_compressor is
    signal valid_x : std_logic;

    signal subsampled_pixel : std_logic_vector(7 downto 0);
    signal subsample_valid : std_logic;

    signal pixel_cols : std_logic_vector(63 downto 0);
    signal pixel_cols_wide : std_logic_vector(95 downto 0);
    signal col_valid : std_logic;

    signal dct1_pixel_out : std_logic_vector(95 downto 0);
    signal dct1_valid_out : std_logic;

    signal shifted_pixels : std_logic_vector(95 downto 0);
    signal divided_pixels : std_logic_vector(95 downto 0);
    signal pixel_0        : std_logic_vector(8 downto 0);
    signal pixel_1        : std_logic_vector(8 downto 0);
    signal pixel_2        : std_logic_vector(8 downto 0);
    signal pixel_3        : std_logic_vector(8 downto 0);
    signal pixel_4        : std_logic_vector(8 downto 0);
    signal pixel_5        : std_logic_vector(8 downto 0);
    signal pixel_6        : std_logic_vector(8 downto 0);
    signal pixel_7        : std_logic_vector(8 downto 0);
    signal resized_pixels : std_logic_vector(71 downto 0);

    signal pixel_rows_resized : std_logic_vector(95 downto 0);
    signal pixel_rows : std_logic_vector(71 downto 0);
    signal row_valid : std_logic;
    signal row_num : std_logic_vector(3 downto 0);

    signal pixel_rows_wide : std_logic_vector(95 downto 0);
    
    signal dct2_pixel_out : std_logic_vector(95 downto 0);
    signal dct2_valid_out : std_logic;

    signal transpose_ce_x : std_logic := '0';
    signal row_dct_ce_x : std_logic := '0';
    signal quantizer_ce_x : std_logic := '0';

    signal enable_ce_counter : boolean := false;

    signal counter : integer := 0;

    signal resized_pixels_delay : std_logic_vector(71 downto 0);
    signal transpose_ce_x_delay : std_logic;
    signal dct1_valid_out_delay : std_logic;
    -- Testing Only
    /*COMPONENT vio_0
    PORT (
        clk : IN STD_LOGIC;
        probe_in0 : IN STD_LOGIC_VECTOR(63 DOWNTO 0);
        probe_in1 : IN std_logic;
        probe_out0 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        probe_out1 : OUT std_logic
    );
    END COMPONENT;
    -- Testing Only
    signal data_o_test : std_logic_vector(63 downto 0);
    signal valid_o_test : std_logic;
    signal data_i : std_logic_vector(7 downto 0);
    signal valid_i : std_logic;*/

begin

    -- Testing Only
    /*test_io : vio_0
    PORT MAP (
        clk => clk_i,
        probe_in0 => data_o_test,
        probe_in1 => valid_o_test,
        probe_out0 => data_i,
        probe_out1 => valid_i
    );*/

    -- Register valid signal to align with data
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            valid_x <= '0';
        elsif rising_edge(clk_i) then
            valid_x <= valid_i;
        end if;
    end process;

    -- Counter to hold valid_x 171 cycles + number of output pixels
    -- Quantizer should output 8 pixels
    /*process(clk_i, rst_i)
    variable num_pixels : integer := 54 + 40;
    variable core_latency : integer := 77; 
    begin
        if rst_i = '1' then
            counter <= 0;
            enable_ce_counter <= false;
            done_o <= '0';
        elsif rising_edge(clk_i) then
            if valid_x = '1' then
                counter <= 0;
                enable_ce_counter <= true;
                done_o <= '0';
            else
                if counter = ((core_latency + num_pixels) - 1) then
                    counter <= 0;
                    enable_ce_counter <= false;
                    done_o <= '1';
                else
                    counter <= counter + 1;
                    --enable_ce_counter <= true;
                end if;
            end if;
        end if;
    end process;*/

    -- Pixel subsampler
    /*pixel_subsampler_inst : entity work.pixel_subsampler
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
    );*/

    -- serial in parallel out register
    -- Accepts one 8b pixel per clock, outputs eight 8b pixels every 8 cycles 
    -- Pixels must be read in column wise
    input_sipo_reg : entity work.sipo_reg
    generic map (
        IN_WIDTH => 8,
        OUT_TAPS => 8,
        TAP_END => 0,
        DEPTH => 8
    )
    port map (
        clk_i => clk_i,
        rst_i => rst_i,
        data_i => data_i,
        valid_i => valid_i,
        data_o => pixel_cols,
        valid_o => col_valid
    );

    -- Resize pixel data from 8bit unsigned to 12bit unsigned for 1st DCT
    pixel_cols_wide <=  X"0" & pixel_cols(63 downto 56) &
                        X"0" & pixel_cols(55 downto 48) &
                        X"0" & pixel_cols(47 downto 40) &
                        X"0" & pixel_cols(39 downto 32) &
                        X"0" & pixel_cols(31 downto 24) &
                        X"0" & pixel_cols(23 downto 16) &
                        X"0" & pixel_cols(15 downto 8) &
                        X"0" & pixel_cols(7 downto 0);

    -- Apply DCT column Wise
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

    -- Divide DCT output by 8 to prevent overflow in next DCT stage
    pixel_divider : entity work.pixel_divider
    port map(
        clk_i => clk_i,
        rst_i => rst_i,
        pixel_i => dct1_pixel_out,
        pixel_o => divided_pixels
    );

    -- Clock enable generator for transpose, DCT, and quantizer
    -- Transpose requires 8 clock cycles to load in 8 columns before a row is output
    -- All stages after transpose operate at clk/8
    /*process(clk_i, rst_i)
    variable clk_div : integer := 8;
    variable counter : integer := 0;
    begin
        if rst_i = '1' then
            counter := 0;
            transpose_ce_x <= '0';
        elsif rising_edge(clk_i) then            
            if enable_ce_counter then
                if counter = clk_div - 1 then
                    counter := 0;
                else
                    counter := counter + 1;
                end if;

                if counter = clk_div - 1 then
                    transpose_ce_x <= '1';
                else
                    transpose_ce_x <= '0';
                end if;
            else
                transpose_ce_x <= '0';
                counter := 0;
            end if;
        end if;
    end process;*/

    pixel_0 <= std_logic_vector(resize(signed(divided_pixels(11 downto 0)), 9));
    pixel_1 <= std_logic_vector(resize(signed(divided_pixels(23 downto 12)), 9));
    pixel_2 <= std_logic_vector(resize(signed(divided_pixels(35 downto 24)), 9));
    pixel_3 <= std_logic_vector(resize(signed(divided_pixels(47 downto 36)), 9));
    pixel_4 <= std_logic_vector(resize(signed(divided_pixels(59 downto 48)), 9));
    pixel_5 <= std_logic_vector(resize(signed(divided_pixels(71 downto 60)), 9));
    pixel_6 <= std_logic_vector(resize(signed(divided_pixels(83 downto 72)), 9));
    pixel_7 <= std_logic_vector(resize(signed(divided_pixels(95 downto 84)), 9));

    resized_pixels <= pixel_7 & pixel_6 & pixel_5 & pixel_4 & pixel_3 & pixel_2 & pixel_1 & pixel_0;

    /*transpose_ce_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 1,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i(0) => transpose_ce_x,
        data_o(0) => transpose_ce_x_delay
    );*/

    transpose_valid_delay : entity work.data_delay_reg
    generic map (
        SHIFT_DEPTH => 1,
        DATA_WIDTH => 1
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i(0) => dct1_valid_out,
        data_o(0) => dct1_valid_out_delay
    );

    -- Transpose 8x8 pixel matrix
    -- Transpose requires 8 clock cycles to load in 8 columns before a row is output
    pixel_transpose : entity work.transpose
    generic map (
        ELEMENT_WIDTH => 9,
        NUM_ELEMENTS => 8,
        DEPTH => 8
    )
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i => resized_pixels,
        valid_i => dct1_valid_out_delay,
        data_o => pixel_rows,
        valid_o => row_valid,
        row_num_o => row_num
    );

    pixel_rows_wide <= std_logic_vector(resize(signed(pixel_rows(71 downto 63)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(62 downto 54)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(53 downto 45)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(44 downto 36)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(35 downto 27)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(26 downto 18)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(17 downto 9)), 12)) &
                        std_logic_vector(resize(signed(pixel_rows(8 downto 0)), 12));
                      


    -- Register clock enable signal
    -- Aigns with transpose output for DCT stage
    /*process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            row_dct_ce_x <= '0';
        elsif rising_edge(clk_i) then
            row_dct_ce_x <= transpose_ce_x;
        end if;
    end process;*/

    -- Apply DCT row Wise
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

    -- Register clock enable signal
    -- Aligns with DCT output for quantizer stage
    /*process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            quantizer_ce_x <= '0';
        elsif rising_edge(clk_i) then
            quantizer_ce_x <= row_dct_ce_x;
        end if;
    end process;*/

    -- Quantize DCT output
    quantizer : entity work.quantizer
    port map (
        clk_i => clk_i,
        ce_i => '1',
        rst_i => rst_i,
        data_i => dct2_pixel_out,
        valid_i => dct2_valid_out,
        data_o => data_o,
        valid_o => valid_o
    );

    -- register ce output
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            ce_o <= '0';
        elsif rising_edge(clk_i) then
            ce_o <= '1';
        end if;
    end process;

    --valid_o <= valid_o_test;
    --data_o <= data_o_test;

end Behavioral;
