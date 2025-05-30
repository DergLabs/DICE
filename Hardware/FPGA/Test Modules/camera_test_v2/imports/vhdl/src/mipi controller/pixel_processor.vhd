library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library work;
use work.mipi_parameters.all;


entity pixel_processor is
    port (
        -- Clocks and Reset
        byte_clk_i : in std_logic;
        pixel_clk_i : in std_logic;
        reset_i : in std_logic;
        enable_i : in std_logic;

        -- Pixel Data
        unpacked_data_i : in std_logic_vector((LANES * PIXEL_WIDTH) - 1 downto 0);
        unpacked_data_valid_i : in std_logic;
        raw_line_valid_i : in std_logic;

        -- Sync signals
        frame_sync_i : in std_logic;

        -- Output Pixel Data
        pixel_data_o : out std_logic_vector(23 downto 0);
        vsync_o : out std_logic;
        hsync_o : out std_logic;
        de_o : out std_logic
    );
end pixel_processor;

architecture Behavioral of pixel_processor is

    -- Clocks and Reset
    signal mutli_pixel_clk_x : std_logic;

    -- Debayer Filter signals
    signal multi_pixel_bus_x : std_logic_vector((PIXEL_WIDTH * PIXELS_PER_CLOCK * 3) - 1 downto 0);
    signal debayer_valid_x : std_logic;

    -- White Balance Module signals
    signal vsync_x : std_logic;
    signal hsync_x : std_logic;
    signal den_x : std_logic;
    signal line_start_x : std_logic;


begin

    -- Buffer to generate 148.5MHz clock for 2px/clock
    BUFGCE_DIV_PIXEL_CLK : BUFGCE_DIV
    generic map (
        BUFGCE_DIVIDE => PIXELS_PER_CLOCK,              -- 1-8
                                -- Programmable Inversion Attributes: Specifies built-in programmable inversion on specific pins
        IS_CE_INVERTED => '0',           -- Optional inversion for CE
        IS_CLR_INVERTED => '0',          -- Optional inversion for CLR
        IS_I_INVERTED => '0',            -- Optional inversion for I
        SIM_DEVICE => fpga_series             -- ULTRASCALE, ULTRASCALE_PLUS
    )
    port map (
        O => mutli_pixel_clk_x,     -- 1-bit output: Buffer
        CE => enable_i,               -- 1-bit input: Buffer enable_i
        CLR => reset_i,            -- 1-bit input: Asynchronous clear
        I => pixel_clk_i   -- 1-bit input: Buffer
    );

    video_timing_ctrl : entity work.video_timing_ctrl
    generic map(
      video_hlength => VIDEO_HLENGTH,
      video_vlength => VIDEO_VLENGTH,

      video_hsync_pol => VIDEO_HSYNC_POL,
      video_hsync_len => VIDEO_HSYNC_LEN / pixels_per_clock,
      video_hbp_len => VIDEO_HBP_LEN / pixels_per_clock,
      video_h_visible => VIDEO_H_VISIBLE / pixels_per_clock,

      video_vsync_pol => VIDEO_VSYNC_POL,
      video_vsync_len => VIDEO_VSYNC_LEN,
      video_vbp_len => VIDEO_VBP_LEN,
      video_v_visible => VIDEO_V_VISIBLE,

      sync_v_pos => (VIDEO_VBP_LEN + VIDEO_VSYNC_LEN - 1), --keep output 1 line behind input
      sync_h_pos => (VIDEO_HLENGTH - 5)
    )
    port map(
      pixel_clock => pixel_clk_i,
      reset => reset_i,

      ext_sync => raw_line_valid_i,

      timing_h_pos => open,
      timing_v_pos => open,
      pixel_x => open,
      pixel_y => open,

      video_vsync => vsync_x,
      video_hsync => hsync_x,
      video_den => den_x,
      video_line_start => open
    );

    vsync_o <= vsync_x;
    hsync_o <= hsync_x;
    de_o <= den_x;

    -- Debayer Filter
    debayer_filter : entity work.debayer_filter
    generic map (
        PIXEL_WIDTH => PIXEL_WIDTH,
        PIXEL_PER_CLK => PIXELS_PER_CLOCK
    )

    port map (
        clk_i => byte_clk_i,
        reset_i => frame_sync_i,
        line_valid_i => raw_line_valid_i,
        data_i => unpacked_data_i,
        data_valid_i => unpacked_data_valid_i,
        output_o => multi_pixel_bus_x,
        output_valid_o => debayer_valid_x
    );

    output_reformatter : entity work.output_reformatter
    generic map (
        PIXEL_WIDTH => PIXEL_WIDTH,
        PIXEL_PER_CLK => PIXELS_PER_CLOCK
    )

    port map (
        clk_i => byte_clk_i,
        pixel_clk_slow_i => mutli_pixel_clk_x,
        pixel_clk_fast_i => pixel_clk_i,
        data_i => multi_pixel_bus_x,
        data_in_valid_i => debayer_valid_x,
        line_sync_i => raw_line_valid_i,
        frame_sync_i => frame_sync_i,
        output_o => pixel_data_o,
        output_valid_o => open
    );

end Behavioral;