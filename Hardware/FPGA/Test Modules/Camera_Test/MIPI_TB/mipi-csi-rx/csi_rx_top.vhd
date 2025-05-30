library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

--VHDL MIPI CSI-2 Rx designed for Xilinx 7-series FPGAs
--Copyright (C) 2016 David Shah
--Licensed under the MIT License

--This driver is designed for 4 lane links and has been tested with the Omnivison OV13850
--It supports resolutions up to 4k at 30fps (higher has not been tested but may work) with
--10-bit Bayer data (support for other output formats is not yet implemented). This is output
--in traditional parallel video format with a few tweaks

--For improved timing performance up to 4 pixels per clock can be output. For the ease of debayering blocks,
--the previous line's data; and whether the current line is even (BGBG) or odd (GRGR) is also output.

--At minimum you will need to provide it with suitable clocks from a PLL (the pixel clock input
--should in general either be phase locked to the master clock input to the camera or the CSI byte clock)
--and configure skew parameters and video port timings for your camera setup

--The primary testing platform is a Digilent Genesys 2 (Kintex-7 XC7K325T) with a
--custom FMC breakout board to connect two Firefly OV13850 modules.
--A previous version has also been tested on a ML605 Virtex-6 development board;
--however functioning support is not guaranteed

entity csi_rx_4lane is
  generic (
    --FPGA series to control SERDES/buffer generation
    --either "VIRTEX6" or "7SERIES"
    fpga_series : string := "ULTRASCALE_PLUS";

    --Low-level PHY parameters

    dphy_term_en : boolean := true; --Enable internal termination on all pairs

    --Use these to invert channels if needed on your PCB
    d0_invert : boolean := false;
    d1_invert : boolean := false;
    d2_invert : boolean := false;
    d3_invert : boolean := false;

    --These skew values are the delay settings for the IDELAYs on each lane
    --Adjust these for optimum stability with your PCB layout and cameras
    d0_skew : natural := 0;
    d1_skew : natural := 0;
    d2_skew : natural := 0;
    d3_skew : natural := 0;

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
    generate_idelayctrl : boolean := false

  );
  port(
    ref_clock_i    : in std_logic;
    pixel_clock_in : in std_logic; --Output pixel clock from PLL
    byte_clock_out : out std_logic; --DSI byte clock output
    ila_clk : in std_logic;

    phy_rdy_o : out std_logic; -- Output signal indicating the PHY is initialized and ready
    dci_lock : out std_logic; -- Output signal indicating the DCM is locked
    enable : in std_logic; --system enable input
    reset : in std_logic; --synchronous active high reset input

    video_valid : out std_logic; --goes high when valid frames are being received

    --DSI signals, signal 1 is P and signal 0 is N
    dphy_clk : in std_logic_vector(1 downto 0);
    dphy_d0 : in std_logic_vector(1 downto 0);
    dphy_d1 : in std_logic_vector(1 downto 0);
    dphy_d2 : in std_logic_vector(1 downto 0);
    dphy_d3 : in std_logic_vector(1 downto 0);

    --Pixel data output
    hsync_o : out std_logic;
    vsync_o : out std_logic;
    den_o : out std_logic;
    line_start_o : out std_logic; --like hsync but asserted for one clock period only and only for visible lines
    data_even_o : out std_logic_vector(23 downto 0);
    data_odd_o : out std_logic_vector(23 downto 0)
  );
end csi_rx_4lane;

architecture Behavioral of csi_rx_4lane is
  signal csi_byte_clock : std_logic;
  signal link_reset_out : std_logic;
  signal wait_for_sync : std_logic;
  signal packet_done : std_logic;
  signal word_clock : std_logic;
  signal word_data : std_logic_vector(31 downto 0);
  signal word_valid : std_logic;

  signal packet_payload : std_logic_vector(31 downto 0);
  signal packet_payload_valid : std_logic;
  signal csi_vsync : std_logic;
  signal csi_in_frame, csi_in_line : std_logic;

  signal unpack_data : std_logic_vector(39 downto 0);
  signal unpack_data_valid : std_logic;

  -- pass from vout to debayer
  signal video_hsync_x : std_logic;
  signal video_vsync_x : std_logic;
  signal video_den_x   : std_logic;
  signal video_line_start_x : std_logic;
  signal video_odd_line_x   : std_logic;
  signal video_data_x       : std_logic_vector(((10 * pixels_per_clock) - 1) downto 0); --LSW is leftmost pixel
  signal video_prev_line_x  : std_logic_vector(((10 * pixels_per_clock) - 1) downto 0); --last line's data at this point, for a debayering block to use

  -- pass from debayer to white balance
  signal debayer_hsync_x : std_logic;
  signal debayer_vsync_x : std_logic;
  signal debayer_den_x   : std_logic;
  signal debayer_line_start_x : std_logic;
  signal debayer_data_even : std_logic_vector(29 downto 0);
  signal debayer_data_odd  : std_logic_vector(29 downto 0);
  
  signal dci_locked : std_logic;
  signal enable_phy : std_logic;

  COMPONENT ila_0

  PORT (
    clk : IN STD_LOGIC;



    probe0 : IN std_logic; 
    probe1 : IN std_logic; 
    probe2 : IN std_logic; 
    probe3 : IN std_logic; 
    probe4 : IN std_logic; 
    probe5 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
    probe6 : IN std_logic; 
    probe7 : IN STD_LOGIC_VECTOR(31 DOWNTO 0); 
    probe8 : IN std_logic; 
    probe9 : IN std_logic; 
    probe10 : IN std_logic; 
    probe11 : IN std_logic; 
    probe12 : IN STD_LOGIC_VECTOR(39 DOWNTO 0); 
    probe13 : IN std_logic; 
    probe14 : IN std_logic; 
    probe15 : IN std_logic; 
    probe16 : IN std_logic; 
    probe17 : IN std_logic; 
    probe18 : IN std_logic; 
    probe19 : IN STD_LOGIC_VECTOR(19 DOWNTO 0); 
    probe20 : IN STD_LOGIC_VECTOR(19 DOWNTO 0); 
    probe21 : std_logic; 
    probe22 : std_logic; 
    probe23 : std_logic; 
    probe24 : std_logic; 
    probe25 : IN STD_LOGIC_VECTOR(29 DOWNTO 0); 
    probe26 : IN STD_LOGIC_VECTOR(29 DOWNTO 0); 
    probe27 : std_logic;
    probe28 : std_logic
  );
  END COMPONENT  ;

begin


  mipi_dphy_ila : ila_0
  PORT MAP (
    clk => ila_clk,
    probe0 => csi_byte_clock, 
    probe1 => link_reset_out, 
    probe2 => wait_for_sync, 
    probe3 => packet_done, 
    probe4 => word_clock, 
    probe5 => word_data, 
    probe6 => word_valid, 
    probe7 => packet_payload, 
    probe8 => packet_payload_valid, 
    probe9 => csi_vsync, 
    probe10 => csi_in_frame, 
    probe11 => csi_in_line, 
    probe12 => unpack_data, 
    probe13 => unpack_data_valid, 
    probe14 => video_hsync_x, 
    probe15 => video_vsync_x, 
    probe16 => video_den_x, 
    probe17 => video_line_start_x, 
    probe18 => video_odd_line_x, 
    probe19 => video_data_x, 
    probe20 => video_prev_line_x, 
    probe21 => debayer_hsync_x, 
    probe22 => debayer_vsync_x, 
    probe23 => debayer_den_x, 
    probe24 => debayer_line_start_x, 
    probe25 => debayer_data_even, 
    probe26 => debayer_data_odd, 
    probe27 => dci_locked,
    probe28 => enable_phy
  );

   DCIRESET_inst : DCIRESET
   port map (
      LOCKED => dci_locked, -- 1-bit output: LOCK status output
      RST => reset        -- 1-bit input: Active-High asynchronous reset input
   );
   
   enable_phy <= dci_locked and enable;
   dci_lock <= dci_locked;
   phy_rdy_o <= enable_phy;

  link : entity work.csi_rx_4_lane_link
    generic map(
      fpga_series => fpga_series,
      dphy_term_en => dphy_term_en,
      d0_invert => d0_invert,
      d1_invert => d1_invert,
      d2_invert => d2_invert,
      d3_invert => d3_invert,
      d0_skew => d0_skew,
      d1_skew => d1_skew,
      d2_skew => d2_skew,
      d3_skew => d3_skew,
      generate_idelayctrl => generate_idelayctrl)
    port map(
      dphy_clk => dphy_clk,
      dphy_d0 => dphy_d0,
      dphy_d1 => dphy_d1,
      dphy_d2 => dphy_d2,
      dphy_d3 => dphy_d3,
      ref_clock => ref_clock_i,
      reset => reset,
      enable => enable_phy,
      wait_for_sync => wait_for_sync,
      packet_done => packet_done,
      reset_out => link_reset_out,
      word_clock => csi_byte_clock,
      word_data => word_data,
      word_valid => word_valid);

  depacket : entity work.csi_rx_packet_handler
    port map (
      clock => csi_byte_clock,
      reset => link_reset_out,
      enable => enable_phy,
      data => word_data,
      data_valid => word_valid,
      sync_wait => wait_for_sync,
      packet_done => packet_done,
      payload_out => packet_payload,
      payload_valid => packet_payload_valid,
      vsync_out => csi_vsync,
      in_frame => csi_in_frame,
      in_line => csi_in_line);

  unpack10 : entity work.csi_rx_10bit_unpack
    port map (
      clock => csi_byte_clock,
      reset => link_reset_out,
      enable => enable_phy,
      data_in => packet_payload,
      din_valid => packet_payload_valid,
      data_out => unpack_data,
      dout_valid => unpack_data_valid);

  vout : entity work.csi_rx_video_output
    generic map (
      video_hlength => video_hlength,
      video_vlength => video_vlength,
      video_hsync_pol => video_hsync_pol,
      video_hsync_len => video_hsync_len,
      video_hbp_len => video_hbp_len,
      video_h_visible => video_h_visible,
      video_vsync_pol => video_vsync_pol,
      video_vsync_len => video_vsync_len,
      video_vbp_len => video_vbp_len,
      video_v_visible => video_v_visible,
      pixels_per_clock => pixels_per_clock)
    port map (
      output_clock => pixel_clock_in,
      csi_byte_clock => csi_byte_clock,
      enable => enable_phy,
      reset => reset,
      pixel_data_in => unpack_data,
      pixel_data_valid => unpack_data_valid,
      csi_in_frame => csi_in_frame,
      csi_in_line => csi_in_line,
      csi_vsync => csi_vsync,
      video_valid => video_valid,
      video_hsync => video_hsync_x,
      video_vsync => video_vsync_x,
      video_den => video_den_x,
      video_line_start => video_line_start_x,
      video_odd_line => video_odd_line_x,
      video_data => video_data_x,
      video_prev_line_data => video_prev_line_x
    );

  debayer : entity work.simple_debayer
  port map (
    clock => pixel_clock_in,
    input_hsync => video_hsync_x,
    input_vsync => video_vsync_x,
    input_den => video_den_x,
    input_line_start => video_line_start_x,
    input_odd_line => video_odd_line_x,
    input_data => video_data_x,
    input_prev_line_data => video_prev_line_x,

    output_hsync => debayer_hsync_x,
    output_vsync => debayer_vsync_x,
    output_den => debayer_den_x,
    output_line_start => debayer_line_start_x,
    output_data_even => debayer_data_even, --10bit R:G:B
    output_data_odd => debayer_data_odd --10bit R:G:B
  );

  white_balance : entity work.image_gain_wb
  generic map (
    --Red, green and blue channel gains in units of 1/8
    --currently default values are used
    -- TODO: confirm these are the appropriate values for our system (maybe make them an input or generic?)
    red_gain => 10,
    green_gain => 7,
    blue_gain => 9
  )
  port map (
    clock => pixel_clock_in,

    input_vsync => debayer_vsync_x,
    input_hsync => debayer_hsync_x,
    input_den => debayer_den_x,
    input_line_start => debayer_line_start_x,
    input_data_even => debayer_data_even,
    input_data_odd => debayer_data_odd,

    output_vsync => vsync_o,
    output_hsync => hsync_o,
    output_den => den_o,
    output_line_start => line_start_o,
    output_data_even => data_even_o,
    output_data_odd => data_odd_o
  );

  byte_clock_out <= csi_byte_clock;
end Behavioral;
