----------------------------------------------------------------------------------
-- Create Date: 11/02/2024 05:26:01 PM
--
-- Module Name: mipi_to_hdmi_top - Behavioral
-- Project Name: MIPI to HDMI Pass-Through
-- Target Devices: Kintex Ultrascale+ (xkcu3p-ffva676-2-i)
-- Tool Versions: 2023.2
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity mipi_to_hdmi_top is
   generic(
    --FPGA series to control SERDES/buffer generation
    --either "VIRTEX6" or "7SERIES"
    fpga_series : string := "ULTRASCALE_PLUS";

    --Low-level PHY parameters
    dphy_term_en : boolean := false; --Enable internal termination on all pairs

    --Use these to invert channels if needed on your PCB
    d0_invert : boolean := false;
    d1_invert : boolean := false;
    d2_invert : boolean := false;
    d3_invert : boolean := false;

    --These skew values are the delay settings for the IDELAYs on each lane
    --Adjust these for optimum stability with your PCB layout and cameras
    d0_skew : natural := 10;
    d1_skew : natural := 10;
    d2_skew : natural := 10;
    d3_skew : natural := 10;

    --Output port pixel timings (for included OV13850 config at 23.98fps with MCLK 24.399MHz and output clock 145Mz)
    video_hlength : natural := 4041; --total visible and blanking pixels per line
    video_vlength : natural := 2992; --total visible and blanking lines per frame

    video_hsync_pol : boolean := true; --hsync polarity: true for positive sync, false for negative sync
    video_hsync_len : natural := 48; --horizontal sync length in pixels
    video_hbp_len : natural := 122; --horizontal back porch length (excluding sync)
    video_h_visible : natural := 3840; --number of visible pixels per line

    video_vsync_pol : boolean := true; --vsync polarity: true for positive sync, false for negative sync
    video_vsync_len : natural := 3; --vertical sync length in lines
    video_vbp_len : natural := 23; --vertical back porch length (excluding sync)
    video_v_visible : natural := 2160; --number of visible lines per frame

    pixels_per_clock : natural := 2;  --Number of pixels per clock to output; 1, 2 or 4


    --Set this to false if this is not the first CSI rx or other IDELAY using device in the system
    generate_idelayctrl : boolean := true;

    video_resolution : string := "3840P_30"
    );
  port (
    sys_clk_p_i : in std_logic;
    sys_clk_n_i : in std_logic;

    reset_i : in std_logic; --synchronous active low reset input
    rdy_i   : in std_logic; -- active high, microcontroller ready
    gpio_probe_o : out std_logic;
    locked_led_o : out std_logic;

    --DSI signals, signal 1 is P and signal 0 is N
    dphy_clk_i : in std_logic_vector(1 downto 0);
    dphy_d0_i : in std_logic_vector(1 downto 0);
    dphy_d1_i : in std_logic_vector(1 downto 0);
    dphy_d2_i : in std_logic_vector(1 downto 0);
    dphy_d3_i : in std_logic_vector(1 downto 0);

    -- HDMI Clk & Data
    hdmi_out_nrst_o : out std_logic;
    video_pixel_clk_o : out std_logic;
    video_hs_o : out std_logic;
    video_vs_o : out std_logic;
    video_de_o : out std_logic;
    video_data_o : out std_logic_vector(23 downto 0);

    -- HDMI Controller I2C
    hdmi_i2c_scl_io : inout std_logic;
    hdmi_i2c_sda_io : inout std_logic
  );
end mipi_to_hdmi_top;

architecture Behavioral of mipi_to_hdmi_top is
    signal ref_clock_x : std_logic;
    signal ref_clock   : std_logic;
    signal reset_c     : std_logic;

    signal pixel_clk_x : std_logic;
    signal byte_clk_x  : std_logic;
    signal video_valid_x : std_logic;

    signal hsync_x     : std_logic;
    signal vsync_x     : std_logic;
    signal den_x       : std_logic;
    signal line_start_x : std_logic;
    signal data_even_x  : std_logic_vector(23 downto 0);
    signal data_odd_x   : std_logic_vector(23 downto 0);

    signal video_data_combined_x : std_logic_vector(23 downto 0);

    signal clk_lock_x    : std_logic;
    signal clk_27m_x     : std_logic;
    signal clk_148_5m_x  : std_logic;
    signal clk_297m_x    : std_logic;
    signal s_video_clk_x : std_logic;

    component clk_wiz_0
    port
     (-- Clock in ports
      -- Clock out ports
      clk_148_5m          : out    std_logic;
      clk_297m          : out    std_logic;
      clk_27m          : out    std_logic;
      -- Status and control signals
      reset             : in     std_logic;
      locked            : out    std_logic;
      clk_in1           : in     std_logic
     );
    end component;


begin

    reset_c <= not (reset_i and rdy_i);
    gpio_probe_o <= rdy_i;
    locked_led_o <= clk_lock_x;

   -- IBUFDS: Differential Input Buffer
   --         Kintex UltraScale+
   -- Xilinx HDL Language Template, version 2023.2

   IBUFDS_inst : IBUFDS
   port map (
      O => ref_clock_x,   -- 1-bit output: Buffer output
      I => sys_clk_p_i,   -- 1-bit input: Diff_p buffer input (connect directly to top-level port)
      IB => sys_clk_n_i  -- 1-bit input: Diff_n buffer input (connect directly to top-level port)
   );


   -- BUFG: General Clock Buffer
   --       Kintex UltraScale+
   -- Xilinx HDL Language Template, version 2023.2

   BUFG_inst : BUFG
   port map (
      O => ref_clock, -- 1-bit output: Clock output.
      I => ref_clock_x  -- 1-bit input: Clock input.
   );

  video_clk : clk_wiz_0
    port map ( 
        -- Clock out ports
        clk_27m => clk_27m_x,
        clk_148_5m => clk_148_5m_x,
        clk_297m => clk_297m_x,
        -- Status and control signals
        reset => reset_c,
        locked => clk_lock_x,
        -- Clock in ports
        clk_in1 => ref_clock
    );

    mipi : entity work.csi_rx_4lane
      generic map (
        --FPGA series to control SERDES/buffer generation
        --either "VIRTEX6" or "7SERIES"
        fpga_series => fpga_series,
    
        --Low-level PHY parameters
        dphy_term_en => dphy_term_en,
    
        --Use these to invert channels if needed on your PCB
        d0_invert => d0_invert,
        d1_invert => d1_invert,
        d2_invert => d2_invert,
        d3_invert => d3_invert,
    
        --These skew values are the delay settings for the IDELAYs on each lane
        --Adjust these for optimum stability with your PCB layout and cameras
        d0_skew => d0_skew,
        d1_skew => d1_skew,
        d2_skew => d2_skew,
        d3_skew => d3_skew,
    
        --Output port pixel timings (for included OV13850 config at 23.98fps with MCLK 24.399MHz and output clock 145Mz)
        video_hlength => video_hlength, --total visible and blanking pixels per line
        video_vlength => video_vlength, --total visible and blanking lines per frame
    
        video_hsync_pol => video_hsync_pol, --hsync polarity: true for positive sync, false for negative sync
        video_hsync_len => video_hsync_len, --horizontal sync length in pixels
        video_hbp_len => video_hbp_len, --horizontal back porch length (excluding sync)
        video_h_visible => video_h_visible, --number of visible pixels per line
    
        video_vsync_pol => video_vsync_pol, --vsync polarity: true for positive sync, false for negative sync
        video_vsync_len => video_vsync_len, --vertical sync length in lines
        video_vbp_len => video_vbp_len, --vertical back porch length (excluding sync)
        video_v_visible => video_v_visible, --number of visible lines per frame

        pixels_per_clock => pixels_per_clock,  --Number of pixels per clock to output; 1, 2 or 4
    
    
        --Set this to false if this is not the first CSI rx or other IDELAY using device in the system
        generate_idelayctrl => generate_idelayctrl
      )
      port map (
        ref_clock_i    => ref_clock,
        pixel_clock_in => clk_148_5m_x, --Output pixel clock from PLL
        byte_clock_out => byte_clk_x,   --DSI byte clock output
    
        enable => clk_lock_x, --system enable input
        reset  => reset_c, --synchronous active high reset input
    
        video_valid => video_valid_x, --goes high when valid frames are being received
    
        --DSI signals, signal 1 is P and signal 0 is N
        dphy_clk => dphy_clk_i,
        dphy_d0  => dphy_d0_i,
        dphy_d1  => dphy_d1_i,
        dphy_d2  => dphy_d2_i,
        dphy_d3  => dphy_d3_i,
    
        --Pixel data output
        hsync_o => hsync_x,
        vsync_o => vsync_x,
        den_o   => den_x,
        line_start_o => line_start_x, --like hsync but asserted for one clock period only and only for visible lines
        data_even_o  => data_even_x,
        data_odd_o   => data_odd_x
      );

    pixel_combine : entity work.pixel_combiner
      port map (
        -- Clocks & Reset
        reset => reset_c,
        clk_297m => clk_297m_x,
        clk_148_5m => clk_148_5m_x,

        -- Input Video Signals
        video_even_data_i => data_even_x,
        video_odd_data_i => data_odd_x,

        -- Output Video Signals
        video_data_o => video_data_combined_x
    );

    hdmi : entity work.hdmi_tx_top
      generic map(
        VIDEO_RESOLUTION => video_resolution
      )
      port map(
        -- Clocks & Reset
        clk_297m    => clk_297m_x,
        clk_27m     => clk_27m_x,
        reset       => reset_c,
    
        -- External Video signals
        ext_video_data => video_data_combined_x,
        ext_video_hsync_in => hsync_x,
        ext_video_vsync_in => vsync_x,
        ext_video_de_in => den_x,
    
        -- HDMI Clk & Data
        hdmi_out_nrst => hdmi_out_nrst_o,
        video_pixel_clk => video_pixel_clk_o,
        video_hs => video_hs_o,
        video_vs => video_vs_o,
        video_de => video_de_o,
        video_data => video_data_o,
    
        -- HDMI Controller I2C
        hdmi_i2c_scl => hdmi_i2c_scl_io,
        hdmi_i2c_sda => hdmi_i2c_sda_io
      );

end Behavioral;
