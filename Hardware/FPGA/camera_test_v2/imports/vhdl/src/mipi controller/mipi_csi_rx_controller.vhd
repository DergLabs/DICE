library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

library work;
use work.mipi_parameters.all;

entity mipi_csi_rx_controller is 
    port (
        -- System Clock
        sys_clk_bufg_i : in std_logic;

        -- Reset & status Signals
        reset_n_i : in std_logic;
        mmcm_locked_i : in std_logic;

        -- MIPI D-PHY input Signals
        dphy_clk_i : in std_logic_vector(1 downto 0);
        dphy_data_p_i : in std_logic_vector(LANES - 1 downto 0);
        dphy_data_n_i : in std_logic_vector(LANES - 1 downto 0);

        -- Output Signals
        byte_clk_o : out std_logic;
        frame_sync_o : out std_logic;
        unpacked_data_o : out std_logic_vector(((PIXELS_PER_CLOCK * PIXEL_WIDTH) - 1) downto 0);
        unpacked_data_valid_o : out std_logic;
        raw_line_valid_o : out std_logic;

        dci_locked_o : out std_logic;
        idelay_rdy_o : out std_logic;
        mipi_subsystem_reset_o : out std_logic
    );
end mipi_csi_rx_controller;

architecture Behavioral of mipi_csi_rx_controller is

    signal mipi_subsystem_reset_x : std_logic;
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

    signal aligned_bytes_x      : std_logic_vector(((LANES * SERDES_DATA_WIDTH) - 1) downto 0);
    signal aligned_lanes_x      : std_logic_vector(((LANES * SERDES_DATA_WIDTH) - 1) downto 0);
    signal decoded_data_x       : std_logic_vector(((LANES * SERDES_DATA_WIDTH) - 1) downto 0);
    signal packet_length_x      : std_logic_vector(7 downto 0);
    signal packet_type_x        : std_logic_vector(2 downto 0);
    signal unpacked_data_x      : std_logic_vector(((PIXELS_PER_CLOCK * PIXEL_WIDTH) - 1) downto 0);

begin

    byte_clk_o <= dphy_byte_clk_x;
    frame_sync_o <= frame_sync_x;
    unpacked_data_o <= unpacked_data_x;
    unpacked_data_valid_o <= unpacked_data_valid_x;
    raw_line_valid_o <= raw_line_valid_x;

    dci_locked_o <= dci_locked_x;
    idelay_rdy_o <= idelay_rdy_x;
    mipi_subsystem_reset_o <= mipi_subsystem_reset_x;


    -- MIPI D-PHY Controller
    mipi_dphy : entity work.csi_rx_dphy
    generic map (
        fpga_series => FPGA_SERIES,

        dphy_term_en => DPHY_TERM,

        d0_invert => DHY0_INVERT,
        d1_invert => DHY1_INVERT,
        d2_invert => DHY2_INVERT,
        d3_invert => DHY3_INVERT,

        d0_skew => DPHY0_SKEW,
        d1_skew => DPHY1_SKEW,
        d2_skew => DPHY2_SKEW,
        d3_skew => DPHY3_SKEW,

        generate_idelayctrl => GENERATE_IDELAYCTRL,

        mipi_lanes => LANES,
        mipi_data_width => SERDES_DATA_WIDTH
    )

    port map (
        -- MIPI D-PHY input Signals
        dphy_clk_i => dphy_clk_i,
        dphy_data_p_i => dphy_data_p_i,
        dphy_data_n_i => dphy_data_n_i,

        -- MIPI D-PHY output Signals
        ddr_bit_clk_o => open,
        byte_clk_o => dphy_byte_clk_x,
        dphy_hs_data_o => dphy_hs_data_x,

        -- MIPI LP Output Signals
        dphy_clk_lp_p_o => dphy_clk_lp_p_x,          
        dphy_clk_lp_n_o => open,

        dphy_data_lp_p_o => dphy_data_lp_p_x,
        dphy_data_lp_n_o => open,

        -- Reference clock for clock detection and IDELAYCTRLs (nominally ~200MHz)
        ref_clock_i => sys_clk_bufg_i,

        -- Enable and reset_i signals
        reset_i => reset_n_i,                    
        enable_i => mmcm_locked_i,    
        subsystem_reset_o => mipi_subsystem_reset_x,                      

        -- ready signal
        dci_locked_o => dci_locked_x,
        idelay_rdy_o => idelay_rdy_x
    );

    line_reset : entity work.line_reset_generator
    port map (
        clk_i => dphy_byte_clk_x,
        lp_data_i => dphy_data_lp_p_x(0),
        line_reset_o => line_reset_x

    );

    gen_frame_det : if (USE_LP_FRAME_DETECT) generate
        frame_detect : entity work.frame_detector
        port map(
            reset_i => mipi_subsystem_reset_x,
            clk_i => dphy_byte_clk_x,
            data_valid_i => byte_valid_x(0),
            data_lane0_i => aligned_bytes_x(7 downto 0),
            detected_frame_sync_o => frame_sync_x
        );
        elsif not (USE_LP_FRAME_DETECT) generate
            frame_sync_x <= dphy_clk_lp_p_x;
    end generate;

    -- Generate Byte Aligners
    gen_byte_aligner : for i in 0 to LANES-1 generate
        byte_aligner : entity work.mipi_csi_rx_byte_aligner
        generic map (
            MIPI_GEAR => SERDES_DATA_WIDTH
        )

        port map (
            clk_i => dphy_byte_clk_x,
            reset_i => mipi_subsystem_reset_x OR line_reset_x,
            byte_i => dphy_hs_data_x((SERDES_DATA_WIDTH * i) + SERDES_DATA_WIDTH - 1 downto (SERDES_DATA_WIDTH * i)),
            byte_o => aligned_bytes_x((SERDES_DATA_WIDTH * i) + SERDES_DATA_WIDTH - 1 downto (SERDES_DATA_WIDTH * i)),
            byte_valid_o => byte_valid_x(i)
        );
    end generate;

    -- Align MIPI Lanes
    lane_aligner : entity work.mipi_csi_rx_lane_aligner
    generic map (
        MIPI_GEAR => SERDES_DATA_WIDTH,
        MIPI_LANES => LANES
    )

    port map (
        clk_i => dphy_byte_clk_x,
        reset_i => mipi_subsystem_reset_x OR line_reset_x,
        bytes_valid_i => byte_valid_x,
        byte_i => aligned_bytes_x,
        lane_valid_o => lanes_valid_x,
        lane_byte_o => aligned_lanes_x
    );

    -- Decode MIPI Packet
    packet_decoder_4l : entity work.mipi_csi_rx_packet_decoder_8b4lane
    port map (
        clk_i => dphy_byte_clk_x,
        data_valid_i => lanes_valid_x,
        data_i => aligned_lanes_x,
        output_valid_o => decoded_data_valid_x,
        data_o => decoded_data_x,
        packet_length_o => open,
        packet_type_o => packet_type_x
    );

    -- Decode MIPI Packet
    /*gen_packet_decoder : if (LANES = 4) generate
        packet_decoder_4l : entity work.mipi_csi_rx_packet_decoder_8b4lane
        port map (
            clk_i => dphy_byte_clk_x,
            data_valid_i => lanes_valid_x,
            data_i => aligned_lanes_x,
            output_valid_o => decoded_data_valid_x,
            data_o => decoded_data_x,
            packet_length_o => open,
            packet_type_o => packet_type_x
        );
    elsif (LANES = 2) generate
        packet_decoder_2l : entity work.mipi_csi_rx_packet_decoder_8b2lane
        port map (
            clk_i => dphy_byte_clk_x,
            data_valid_i => lanes_valid_x,
            data_i => aligned_lanes_x,
            output_valid_o => decoded_data_valid_x,
            data_o => decoded_data_x,
            packet_length_o => open,
            packet_type_o => packet_type_x
        );
    end generate;*/

    -- Unpack MIPI pixel Data
    packet_unpack_8b4lane_4ppc : entity work.mipi_csi_rx_raw_depacker_8b4lane
    generic map (
        PIXEL_WIDTH => PIXEL_WIDTH
    )
    port map (
        clk_i => dphy_byte_clk_x,
        data_valid_i => decoded_data_valid_x,
        data_i => decoded_data_x,
        packet_type_i => packet_type_x,
        output_o => unpacked_data_x,
        output_valid_o => unpacked_data_valid_x,
        raw_line_o => raw_line_valid_x
    );

    /*gen_packet_unpack : if (LANES = 4) generate
        packet_unpack_8b4lane_4ppc : entity work.mipi_csi_rx_raw_depacker_8b4lane
        generic map (
            PIXEL_WIDTH => PIXEL_WIDTH
        )
        port map (
            clk_i => dphy_byte_clk_x,
            data_valid_i => decoded_data_valid_x,
            data_i => decoded_data_x,
            packet_type_i => packet_type_x,
            output_o => unpacked_data_x,
            output_valid_o => unpacked_data_valid_x,
            raw_line_o => raw_line_valid_x
        );
    elsif (LANES = 2) generate
        packet_unpack_8b2lane_2ppc : entity work.mipi_csi_rx_raw_depacker_8b2lane_2ppc
        generic map (
            PIXEL_WIDTH => PIXEL_WIDTH
        )
        port map (
            clk_i => dphy_byte_clk_x,
            data_valid_i => decoded_data_valid_x,
            data_i => decoded_data_x,
            packet_type_i => packet_type_x,
            output_o => unpacked_data_x,
            output_valid_o => unpacked_data_valid_x,
            raw_line_o => raw_line_valid_x
        );
    end generate;*/

end Behavioral;
 
 
 