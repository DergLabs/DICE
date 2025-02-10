library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity hdmi_tx_top is
    generic (
        VIDEO_RESOLUTION : string := "3840P_30"
    );

    port (
        -- Clocks & Reset
        pixel_ref_clk           : in std_logic;
        clk_27m                 : in std_logic;
        reset                   : in std_logic;
        video_src_sel           : in std_logic;

        -- External Camera Video signals
        cam_video_data_in       : in std_logic_vector(23 downto 0);
        cam_video_pixel_clk_in  : in std_logic;
        cam_video_hsync_in      : in std_logic;
        cam_video_vsync_in      : in std_logic;
        cam_video_de_in         : in std_logic;

        -- HDMI Clk & Data
        hdmi_out_nrst           : out std_logic;
        video_pixel_clk         : out std_logic;
        video_hs                : out std_logic;
        video_vs                : out std_logic;
        video_de                : out std_logic;
        video_data              : out std_logic_vector(23 downto 0);

        -- HDMI Controller I2C
        hdmi_i2c_scl            : inout std_logic;
        hdmi_i2c_sda            : inout std_logic
    );
end hdmi_tx_top;

architecture Behavioral of hdmi_tx_top is
    signal s_video_hs       : std_logic;
    signal s_video_vs       : std_logic;
    signal s_video_de       : std_logic;
    signal s_video_data     : std_logic_vector(23 downto 0);

    signal video_hs_x      : std_logic;
    signal video_vs_x      : std_logic;
    signal video_de_x      : std_logic;
    signal video_data_x    : std_logic_vector(23 downto 0);


    signal rst_n            : std_logic;
    signal hdmi_nrst        : std_logic;

    signal i2c_lut_index    : std_logic_vector(9 downto 0);
    signal i2c_lut_data     : std_logic_vector(31 downto 0);
begin

    reset_power_on_i2c : entity work.reset_power_on
    generic map(
        FREQ            => 27, 
        MAX_TIME        => 200
    )
    port map (
        clk             => clk_27m,
        user_rst        => reset,
        power_on_rst    => rst_n
    );

    reset_power_on_hdmi : entity work.reset_power_on
    generic map(
        FREQ            => 27, 
        MAX_TIME        => 200
    )
    port map (
        clk             => clk_27m,
        user_rst        => reset,
        power_on_rst    => hdmi_nrst
    );
    
    
    i2c_config : entity work.i2c_config
    port map(
        rst             => NOT rst_n,
        clk             => clk_27m,
        clk_div_cnt     => D"99",
        i2c_addr_2byte  => 0,
        lut_index       => i2c_lut_index,
        lut_dev_addr    => i2c_lut_data(31 downto 24),
        lut_reg_addr    => i2c_lut_data(23 downto 8),
        lut_reg_data    => i2c_lut_data(7 downto 0),
        --error => 0, 
        --done => 0, 
        i2c_scl         => hdmi_i2c_scl,
        i2c_sda         => hdmi_i2c_sda
    );

    lut_hdmi_config : entity work.lut_hdmi_out
    port map (
        lut_index   => i2c_lut_index,
        lut_data    => i2c_lut_data
    );

    color_bar_gen : entity work.color_bar
    port map (
        clk         => pixel_ref_clk,
        rst         => reset,
        hs          => s_video_hs,
        vs          => s_video_vs,
        de          => s_video_de,
        video_data  => s_video_data
    );

    video_mux : entity work.video_mux
    generic map(
        video_in_width => 24,
        video_out_width => 24,
        pixels_per_clk => 1
    )
    port map (
        clk                 => pixel_ref_clk,
        reset               => reset,
        video_source_sel    => video_src_sel,

        cam_video_data_in   => cam_video_data_in,
        cam_video_hsync_in  => cam_video_hsync_in,
        cam_video_vsync_in  => cam_video_vsync_in,
        cam_video_de_in     => cam_video_de_in,

        test_video_data_in  => s_video_data,
        test_video_hsync_in => s_video_hs,
        test_video_vsync_in => s_video_vs,
        test_video_de_in    => s_video_de,

        video_data_out      => video_data_x,
        video_hsync_out     => video_hs_x,
        video_vsync_out     => video_vs_x,
        video_de_out        => video_de_x
    );

    -- register output signals
    process(pixel_ref_clk)
    begin
        if rising_edge(pixel_ref_clk) then
            if (reset) then 
                video_data <= (others => '0');
                video_hs <= '0';
                video_vs <= '0';
                video_de <= '0';
            else
                video_data <= video_data_x;
                video_hs <= video_hs_x;
                video_vs <= video_vs_x;
                video_de <= video_de_x;
            end if;
        end if;
    end process;

    /*video_data      <= video_data;
    video_pixel_clk <= pixel_ref_clk;
    video_hs        <= video_hs;
    video_vs        <= video_vs;
    video_de        <= video_de;

    video_data      <= cam_video_data_in;
    video_pixel_clk <= cam_video_pixel_clk_in;
    video_hs        <= cam_video_hsync_in;
    video_vs        <= cam_video_vsync_in;
    video_de        <= cam_video_de_in;*/

    OBUF_inst : OBUF
    port map (
       O => video_pixel_clk, -- 1-bit output: Buffer output (connect directly to top-level port)
       I => pixel_ref_clk  -- 1-bit input: Buffer input
    );

    hdmi_out_nrst   <= hdmi_nrst;

end Behavioral;
