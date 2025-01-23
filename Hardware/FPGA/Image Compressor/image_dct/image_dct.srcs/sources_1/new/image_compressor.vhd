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

    signal pixel_rows : std_logic_vector(95 downto 0);
    signal row_valid : std_logic;
    signal row_num : std_logic_vector(3 downto 0);

    signal pixel_rows_wide : std_logic_vector(95 downto 0);
    
    signal dct2_pixel_out : std_logic_vector(95 downto 0);
    signal dct2_valid_out : std_logic;

    signal transpose_ce_x : std_logic := '0';
    signal row_dct_ce_x : std_logic := '0';
    signal quantizer_ce_x : std_logic := '0';

begin

    -- Register valid signa
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            valid_x <= '0';
        elsif rising_edge(clk_i) then
            valid_x <= valid_i;
        end if;
    end process;


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

    pixel_cols_wide <=  X"0" & pixel_cols(63 downto 56) &
                        X"0" & pixel_cols(55 downto 48) &
                        X"0" & pixel_cols(47 downto 40) &
                        X"0" & pixel_cols(39 downto 32) &
                        X"0" & pixel_cols(31 downto 24) &
                        X"0" & pixel_cols(23 downto 16) &
                        X"0" & pixel_cols(15 downto 8) &
                        X"0" & pixel_cols(7 downto 0);

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

    pixel_divider : entity work.pixel_divider
    port map(
        clk_i => clk_i,
        pixel_i => dct1_pixel_out,
        pixel_o => divided_pixels
    );

    -- Clock enable generator
    process(clk_i, rst_i)
        variable clk_div : integer := 8;
        variable counter : integer := 0;
    begin
        if rst_i = '1' then
            counter := 0;
            transpose_ce_x <= '0';
        elsif rising_edge(clk_i) then
            if (valid_x = '1') then
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
    end process;


    pixel_transpose : entity work.transpose
    generic map (
        ELEMENT_WIDTH => 12,
        NUM_ELEMENTS => 8,
        DEPTH => 8
    )
    port map (
        clk_i => clk_i,
        ce_i => transpose_ce_x,
        rst_i => rst_i,
        data_i => divided_pixels,
        valid_i => dct1_valid_out,
        data_o => pixel_rows,
        valid_o => row_valid,
        row_num_o => row_num
    );

    -- Register clock enable signal
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            row_dct_ce_x <= '0';
        elsif rising_edge(clk_i) then
            row_dct_ce_x <= transpose_ce_x;
        end if;
    end process;

    row_dct : entity work.dct1d
    port map (
        clk_i => clk_i,
        ce_i => row_dct_ce_x,
        rst_i => rst_i,
        data_i => pixel_rows,
        valid_i => row_valid,
        data_o => dct2_pixel_out,
        valid_o => dct2_valid_out
    );

    -- Register clock enable signal
    process(clk_i, rst_i)
    begin
        if rst_i = '1' then
            quantizer_ce_x <= '0';
        elsif rising_edge(clk_i) then
            quantizer_ce_x <= row_dct_ce_x;
        end if;
    end process;

    quantizer : entity work.quantizer
    port map (
        clk_i => clk_i,
        ce_i => quantizer_ce_x,
        rst_i => rst_i,
        data_i => dct2_pixel_out,
        valid_i => dct2_valid_out,
        data_o => data_o,
        valid_o => valid_o
    );


end Behavioral;
