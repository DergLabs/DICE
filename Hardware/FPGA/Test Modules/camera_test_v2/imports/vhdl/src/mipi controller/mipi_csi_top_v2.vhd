library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library work;
use work.mipi_parameters.all;

entity mipi_csi_top_v2 is
    port (
        -- Clocks & Reset
        sys_clk_p_i             : in std_logic;
        sys_clk_n_i             : in std_logic;
        reset_i                 : in std_logic;

        -- Status Signals
        phy_ready_o             : out std_logic;
        mmcm_locked_o           : out std_logic;

        -- MIPI D-PHY Signals
        dphy_clk_i             : in std_logic_vector(1 downto 0);
        dphy_data_p_i          : in std_logic_vector((LANES-1) downto 0);
        dphy_data_n_i          : in std_logic_vector((LANES-1) downto 0);

        -- HDMI Data & Control Signals
        hdmi_nrst_o            : out std_logic;
        hdmi_pixel_clk_o       : out std_logic;
        hdmi_hs_o              : out std_logic;
        hdmi_vs_o              : out std_logic;
        hdmi_de_o              : out std_logic;
        hdmi_data_o            : out std_logic_vector(23 downto 0);

        hdmi_i2c_scl_io        : inout std_logic;
        hdmi_i2c_sda_io        : inout std_logic;

        video_src_sel          : in std_logic
    );
end mipi_csi_top_v2;

architecture Behavioral of mipi_csi_top_v2 is
    signal sys_clk_ibuf_x       : std_logic; -- IBUFDS 200MHz Clock to global buffer
    signal sys_clk_bufg_x       : std_logic; -- Global buffer output to MMCM and logic
    signal reset_n_x            : std_logic; -- Inverted reset signal, logic uses active high, reset_i is active low

    signal mipi_subsystem_reset_x : std_logic;

    signal clk_297m_x           : std_logic; -- 297MHz pixel clock
    signal mutli_pixel_clk_x    : std_logic; -- 297MHz / PIXELS_PER_CLOCK
    signal clk_27m_x            : std_logic; -- 27MHz clock for i2c controller

    signal mmcm_locked_x        : std_logic; -- MMCM locked signal
    signal idelay_rdy_x         : std_logic; -- IDELAYCTRL dry signal

    -- DPHY Signals
    signal dci_locked_x         : std_logic;
    signal dphy_clk_lp_p_x      : std_logic;
    signal dphy_data_lp_p_x     : std_logic_vector((LANES-1) downto 0);
    signal dphy_hs_data_x       : std_logic_vector(((SERDES_DATA_WIDTH * LANES) - 1) downto 0);
    signal dphy_byte_clk_x      : std_logic;
    

    -- Packet processing & control signals
    signal line_reset_x         : std_logic;
    signal frame_sync_x         : std_logic;

    signal byte_valid_x         : std_logic_vector((LANES - 1) downto 0);
    signal lanes_valid_x        : std_logic;
    signal decoded_data_valid_x : std_logic;
    signal unpacked_data_valid_x: std_logic;
    signal raw_line_valid_x     : std_logic;

    -- Register stage 0 signals
    signal unpacked_data_r_x    : std_logic_vector(((PIXELS_PER_CLOCK * PIXEL_WIDTH) - 1) downto 0);    
    signal unpacked_data_valid_r_x : std_logic;
    signal raw_line_valid_r_x   : std_logic;
    signal frame_sync_r_x       : std_logic;


    signal aligned_bytes_x      : std_logic_vector(((LANES * SERDES_DATA_WIDTH) - 1) downto 0);
    signal aligned_lanes_x      : std_logic_vector(((LANES * SERDES_DATA_WIDTH) - 1) downto 0);
    signal decoded_data_x       : std_logic_vector(((LANES * SERDES_DATA_WIDTH) - 1) downto 0);
    signal packet_length_x      : std_logic_vector(7 downto 0);
    signal packet_type_x        : std_logic_vector(2 downto 0);
    signal unpacked_data_x      : std_logic_vector(((PIXELS_PER_CLOCK * PIXEL_WIDTH) - 1) downto 0);

    signal multi_pixel_bus_x    : std_logic_vector(((PIXELS_PER_CLOCK * PIXEL_WIDTH * 3) - 1) downto 0);
    signal debayer_valid_x      : std_logic;

    signal output_reformat_valid_x : std_logic;

    -- Register stage 1 signals
    signal cam_video_data_r_x : std_logic_vector(23 downto 0);
    signal cam_video_vsync_r_x : std_logic;
    signal cam_video_hsync_r_x : std_logic;
    signal cam_video_de_r_x : std_logic;


    -- HDMI Camera signals
    signal video_src_sel_x      : std_logic;
    signal cam_video_data_x : std_logic_vector(23 downto 0);   
    signal cam_video_pixel_clk_x : std_logic;
    signal cam_video_hsync_x : std_logic;    
    signal cam_video_vsync_x : std_logic;     
    signal cam_video_de_x : std_logic;      
    
    -- Register Stage 2 signals


    component clk_wiz_0
    port
     (-- Clock in ports
      -- Clock out ports
      clk_27m          : out    std_logic;
      clk_297m          : out    std_logic;
      clk_74m          : out    std_logic;
      -- Status and control signals
      reset             : in     std_logic;
      locked            : out    std_logic;
      clk_in1           : in     std_logic
     );
    end component;

    COMPONENT vio_0
    PORT (
        clk : IN STD_LOGIC;
        probe_in0 : IN std_logic;
        probe_in1 : IN std_logic;
        probe_in2 : IN std_logic;
        probe_in3 : IN std_logic;
        probe_in4 : IN std_logic;
        probe_in5 : IN std_logic;
        probe_in6 : IN std_logic;
        probe_out0 : OUT std_logic 
    );
    END COMPONENT;

begin

    signal_debug : vio_0
    PORT MAP (
        clk => sys_clk_bufg_x,
        probe_in0 => reset_n_x,
        probe_in1 => mmcm_locked_o,
        probe_in2 => dci_locked_x,
        probe_in3 => phy_ready_o,
        probe_in4 => idelay_rdy_x,
        probe_in5 => mipi_subsystem_reset_x,
        probe_in6 => video_src_sel,
        probe_out0 => video_src_sel_x
    );

    reset_n_x <= not reset_i;
    mmcm_locked_o <= mmcm_locked_x;
    phy_ready_o <= mmcm_locked_x and dci_locked_x and idelay_rdy_x;

    -- Clocking Structure: 200MHz Differential OSC -> IBUFDS (Diff to Single-Ended) -> BUFG -> MMCM -> Logic

    -- Buffer incoming differential clock to meet timing & convert to single-ended
    IBUFDS_inst : IBUFDS
    port map (
        O => sys_clk_ibuf_x,   -- 1-bit output: Buffer output
        I => sys_clk_p_i,   -- 1-bit input: Diff_p buffer input (connect directly to top-level port)
        IB => sys_clk_n_i  -- 1-bit input: Diff_n buffer input (connect directly to top-level port)
    );

    -- Buffer MMCM output clock to meet timing
    BUFG_inst : BUFG
    port map (
        O => sys_clk_bufg_x, -- 1-bit output: Clock output.
        I => sys_clk_ibuf_x  -- 1-bit input: Clock input.
    );

    sys_clk_gen : clk_wiz_0
    port map ( 
        -- Clock out ports  
        clk_27m => clk_27m_x,
        clk_297m => clk_297m_x,
        clk_74m => mutli_pixel_clk_x,
        -- Status and control signals                
        reset => reset_n_x,
        locked => mmcm_locked_x,
        -- Clock in ports
        clk_in1 => sys_clk_bufg_x
    );

    -- MIPI DPHY Subsystem
    mipi_subsystem : entity work.mipi_csi_rx_controller
    port map (
        -- Clocks & Reset
        sys_clk_bufg_i => sys_clk_bufg_x,
        reset_n_i => reset_n_x,
        mmcm_locked_i => mmcm_locked_x,

        -- MIPI D-PHY Signals
        dphy_clk_i => dphy_clk_i,
        dphy_data_p_i => dphy_data_p_i,
        dphy_data_n_i => dphy_data_n_i,

        -- MIPI D-PHY output Signals
        byte_clk_o => dphy_byte_clk_x,
        frame_sync_o => frame_sync_x,
        unpacked_data_o => unpacked_data_x,
        unpacked_data_valid_o => unpacked_data_valid_x,
        raw_line_valid_o => raw_line_valid_x,

        -- Status Signals
        dci_locked_o => dci_locked_x,
        idelay_rdy_o => idelay_rdy_x,
        mipi_subsystem_reset_o => mipi_subsystem_reset_x

    );

    reister_stage0 : entity work.register_stage
    generic map (
        BUS1_WIDTH => 40,
        BUS2_WIDTH => 0,
        BUS3_WIDTH => 0,
        BUS4_WIDTH => 0
    )
    port map (
        clk_i => dphy_byte_clk_x,
        reset_i => reset_n_x,

        -- Input/Ouput Buses
        bus0_i => unpacked_data_x,
        bus1_i => (others => '0'),
        bus2_i => (others => '0'),
        bus3_i => (others => '0'),

        bus0_o => unpacked_data_r_x,

        -- Input/Output Signals
        signal0_i => frame_sync_x,
        signal1_i => raw_line_valid_x,
        signal2_i => unpacked_data_valid_x,
        signal3_i => '0',
        signal4_i => '0',
        signal5_i => '0',
        signal6_i => '0',
        signal7_i => '0',
        signal8_i => '0',
        signal9_i => '0',
        signal10_i => '0',
        signal11_i => '0',
        signal12_i => '0',
        signal13_i => '0',
        signal14_i => '0',
        signal15_i => '0',

        signal0_o => frame_sync_r_x,
        signal1_o => raw_line_valid_r_x,
        signal2_o => unpacked_data_valid_r_x

    );



    pixel_processor : entity work.pixel_processor
    port map (
        -- Clocks and Reset
        byte_clk_i => dphy_byte_clk_x,
        pixel_clk_i => clk_297m_x,
        reset_i => reset_n_x,
        enable_i => phy_ready_o,

        -- Pixel Data
        unpacked_data_i => unpacked_data_r_x,
        unpacked_data_valid_i => unpacked_data_valid_r_x,
        raw_line_valid_i => raw_line_valid_r_x,

        -- Sync signals
        frame_sync_i => frame_sync_r_x,

        -- Output Pixel Data
        pixel_data_o => cam_video_data_x,
        vsync_o => cam_video_vsync_x,
        hsync_o => cam_video_hsync_x,
        de_o => cam_video_de_x
    );

    reister_stage1 : entity work.register_stage
    generic map (
        BUS1_WIDTH => 24,
        BUS2_WIDTH => 0,
        BUS3_WIDTH => 0,
        BUS4_WIDTH => 0
    )
    port map (
        clk_i => clk_297m_x,
        reset_i => reset_n_x,

        -- Input/Ouput Buses
        bus0_i => cam_video_data_x,
        bus1_i => (others => '0'),
        bus2_i => (others => '0'),
        bus3_i => (others => '0'),

        bus0_o => cam_video_data_r_x,

        -- Input/Output Signals
        signal0_i => cam_video_vsync_x,
        signal1_i => cam_video_hsync_x,
        signal2_i => cam_video_de_x,
        signal3_i => '0',
        signal4_i => '0',
        signal5_i => '0',
        signal6_i => '0',
        signal7_i => '0',
        signal8_i => '0',
        signal9_i => '0',
        signal10_i => '0',
        signal11_i => '0',
        signal12_i => '0',
        signal13_i => '0',
        signal14_i => '0',
        signal15_i => '0',

        signal0_o => cam_video_vsync_r_x,
        signal1_o => cam_video_hsync_r_x,
        signal2_o => cam_video_de_r_x

    );

    -- HDMI Controller & Color Bar Test Pattern
    hdmi_controller : entity work.hdmi_tx_top
    generic map (
        VIDEO_RESOLUTION => VIDEO_RESOLUTION
    )

    port map (
        -- Clocks & Reset
        pixel_ref_clk           => clk_297m_x,
        clk_27m                 => clk_27m_x,
        reset                   => reset_n_x,
        video_src_sel           => video_src_sel_x,

        -- External Camera Video signals
        cam_video_data_in       => cam_video_data_r_x,
        cam_video_pixel_clk_in  => clk_297m_x,
        cam_video_hsync_in      => cam_video_hsync_r_x,
        cam_video_vsync_in      => cam_video_vsync_r_x,
        cam_video_de_in         => cam_video_de_r_x,

        -- HDMI Clk & Data
        hdmi_out_nrst           => hdmi_nrst_o,
        video_pixel_clk         => hdmi_pixel_clk_o,
        video_hs                => hdmi_hs_o,
        video_vs                => hdmi_vs_o,
        video_de                => hdmi_de_o,
        video_data              => hdmi_data_o,

        -- HDMI Controller I2C
        hdmi_i2c_scl            => hdmi_i2c_scl_io,
        hdmi_i2c_sda            => hdmi_i2c_sda_io
    );


end Behavioral;