library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity csi_rx_dphy is
    generic(
        fpga_series         : string := "ULTRASCALE_PLUS";

        dphy_term_en        : boolean := true;

        d0_invert           : boolean := false;
        d1_invert           : boolean := false;
        d2_invert           : boolean := false;
        d3_invert           : boolean := false;

        d0_skew             : natural := 0;
        d1_skew             : natural := 0;
        d2_skew             : natural := 0;
        d3_skew             : natural := 0;

        generate_idelayctrl : boolean := false;

        mipi_lanes          : integer := 4;
        mipi_data_width     : integer := 8
    );

    port (
        -- MIPI D-PHY input Signals
        dphy_clk_i          : in STD_LOGIC_VECTOR (1 downto 0);    --clock lane (1 is P, 0 is N)
        dphy_data_p_i       : in STD_LOGIC_VECTOR ((mipi_lanes - 1) downto 0);   
        dphy_data_n_i       : in STD_LOGIC_VECTOR ((mipi_lanes - 1) downto 0);

        -- MIPI D-PHY output Signals
        ddr_bit_clk_o       : out STD_LOGIC;                      --DDR bit clock 
        byte_clk_o          : out STD_LOGIC;                      --SDR byte clock

        dphy_hs_data_o      : out STD_LOGIC_VECTOR (((mipi_lanes * mipi_data_width) - 1) downto 0); --HS data output

        -- MIPI LP Output Signals
        dphy_clk_lp_p_o     : out STD_LOGIC;                     
        dphy_clk_lp_n_o     : out STD_LOGIC;

        dphy_data_lp_p_o    : out STD_LOGIC_VECTOR ((mipi_lanes - 1) downto 0); 
        dphy_data_lp_n_o    : out STD_LOGIC_VECTOR ((mipi_lanes - 1) downto 0);

        -- Reference clock for clock detection and IDELAYCTRLs (nominally ~200MHz)
        ref_clock_i         : in STD_LOGIC;

        -- Enable and reset_i signals
        reset_i             : in STD_LOGIC;                            --active high synchronous reset_i in
        enable_i            : in STD_LOGIC;     
        subsystem_reset_o   : out std_logic;                      --active high enable_i from MMCM Locked signal

        -- ready signal
        dci_locked_o        : out STD_LOGIC;
        idelay_rdy_o        : out STD_LOGIC
    );

end csi_rx_dphy;

architecture Behavioral of csi_rx_dphy is

    signal dphy_hs_clk_x : std_logic;
    signal dphy_hs_clk_buf_x : std_logic;
    signal byte_clk_x : std_logic;

    signal ibuf_dphy_hs_data_x : std_logic_vector ((mipi_lanes - 1) downto 0);
    signal idelay_hs_data_x : std_logic_vector ((mipi_lanes - 1) downto 0);
    signal data_phy0_rst_x : std_logic;
    signal data_phy1_rst_x : std_logic;
    signal data_phy2_rst_x : std_logic;
    signal data_phy3_rst_x : std_logic;

    signal idelay_ready_x : std_logic;
    signal enable_x : std_logic;
    signal dci_locked_x : std_logic;

    signal phy_subsystem_rst_x : std_logic;

begin

    -- Reset Generator
   /* rx_clock_det_rst : entity work.csi_rx_clock_det
    port map (
        ref_clock => ref_clock_i,
        ext_clock => byte_clk_x,
        enable => enable_i,
        reset_in => reset_i,
        reset_out => phy_subsystem_rst_x
    );*/

    phy_subsystem_rst_x <= reset_i;
    subsystem_reset_o <= reset_i;

    gen_idctl : if generate_idelayctrl generate
        delayctrl : IDELAYCTRL
        generic map(
            SIM_DEVICE => "ULTRASCALE"
        )
        port map (
            RDY    => idelay_ready_x,
            REFCLK => ref_clock_i,
            RST    => reset_i
        );
    end generate;
    
    DCIRESET_inst : DCIRESET
    port map (
       LOCKED => dci_locked_x, -- 1-bit output: LOCK status output
       RST => reset_i        -- 1-bit input: Active-High asynchronous reset input
    );

    enable_x <= enable_i and dci_locked_x and idelay_ready_x;
    dci_locked_o <= dci_locked_x;
    idelay_rdy_o <= idelay_ready_x;

    -- Clock Phy
    IBUFDS_DPHY_inst : IBUFDS_DPHY
    generic map (
        DIFF_TERM => dphy_term_en,               -- Differential termination
        IOSTANDARD => "MIPI_DPHY_DCI",         -- I/O standard
        SIM_DEVICE => fpga_series  -- Set the device version (ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1,
                                        -- ULTRASCALE_PLUS_ES2)
    )
    port map (
        HSRX_O => dphy_hs_clk_x,             -- 1-bit output: HS RX output
        LPRX_O_N => dphy_clk_lp_n_o,         -- 1-bit output: LP RX output (Slave)
        LPRX_O_P => dphy_clk_lp_p_o,         -- 1-bit output: LP RX output (Master)
        HSRX_DISABLE => '0', -- 1-bit input: Disable control for HS mode
        I => dphy_clk_i(1),                       -- 1-bit input: Data input0 PAD
        IB => dphy_clk_i(0),                     -- 1-bit input: Data input1 PAD
        LPRX_DISABLE => '0'  -- 1-bit input: Disable control for LP mode
    );

    -- DDR Bit Clock buffer
    bit_clk_buf : BUFGCE
    generic map (
      CE_TYPE => "SYNC",               -- ASYNC, HARDSYNC, SYNC
      IS_CE_INVERTED => '0',           -- Programmable inversion on CE
      IS_I_INVERTED => '0',            -- Programmable inversion on I
      SIM_DEVICE => fpga_series             -- ULTRASCALE, ULTRASCALE_PLUS
    )
    port map (
      O => dphy_hs_clk_buf_x,   -- 1-bit output: Buffer
      CE => enable_x, -- 1-bit input: Buffer enable_i
      I => dphy_hs_clk_x    -- 1-bit input: Buffer
    );	

    ddr_bit_clk_o <= dphy_hs_clk_buf_x; -- Bit Clock goes to clk div and out to the rest of the system

    -- Byte Clock Buffer
    BUFGCE_DIV_inst : BUFGCE_DIV
    generic map (
        BUFGCE_DIVIDE => 4,              -- 1-8
                                -- Programmable Inversion Attributes: Specifies built-in programmable inversion on specific pins
        IS_CE_INVERTED => '0',           -- Optional inversion for CE
        IS_CLR_INVERTED => '0',          -- Optional inversion for CLR
        IS_I_INVERTED => '0',            -- Optional inversion for I
        SIM_DEVICE => fpga_series             -- ULTRASCALE, ULTRASCALE_PLUS
    )
    port map (
        O => byte_clk_x,     -- 1-bit output: Buffer
        CE => enable_x,               -- 1-bit input: Buffer enable_i
        CLR => reset_i,            -- 1-bit input: Asynchronous clear
        I => dphy_hs_clk_x   -- 1-bit input: Buffer
    );

    byte_clk_o <= byte_clk_x;

    process(byte_clk_x)
    begin
    if rising_edge(byte_clk_x) then
        data_phy0_rst_x <= phy_subsystem_rst_x;
        data_phy1_rst_x <= phy_subsystem_rst_x;
        data_phy2_rst_x <= phy_subsystem_rst_x;
        data_phy3_rst_x <= phy_subsystem_rst_x;
    end if;
    end process;

    -- Data PHY 0
    IBUFDS_DPHY0_inst : IBUFDS_DPHY
    generic map (
        DIFF_TERM           => dphy_term_en,                -- Differential termination
        IOSTANDARD          => "MIPI_DPHY_DCI",             -- I/O standard
        SIM_DEVICE          => fpga_series                  -- Set the device version (ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1,
                                                            -- ULTRASCALE_PLUS_ES2)
    )   
    port map (  
        HSRX_O              => ibuf_dphy_hs_data_x(0),      -- 1-bit output: HS RX output
        LPRX_O_N            => dphy_data_lp_n_o(0),         -- 1-bit output: LP RX output (Slave)
        LPRX_O_P            => dphy_data_lp_p_o(0),         -- 1-bit output: LP RX output (Master)
        HSRX_DISABLE        => '0',                         -- 1-bit input: Disable control for HS mode
        I                   => dphy_data_p_i(0),            -- 1-bit input: Data input0 PAD
        IB                  => dphy_data_n_i(0),            -- 1-bit input: Data input1 PAD
        LPRX_DISABLE        => '0'                          -- 1-bit input: Disable control for LP mode
    );

    -- Input Delay
    IDELAYE3_inst0 : IDELAYE3
    generic map (
        CASCADE             => "NONE",                      -- Cascade setting (MASTER, NONE, SLAVE_END, SLAVE_MIDDLE)
        DELAY_FORMAT        => "TIME",                      -- Units of the DELAY_VALUE (COUNT, TIME)
        DELAY_SRC           => "IDATAIN",                   -- Delay input (DATAIN, IDATAIN)
        DELAY_TYPE          => "FIXED",                     -- Set the type of tap delay line (FIXED, VARIABLE, VAR_LOAD)
        DELAY_VALUE         => d0_skew,                   -- Input delay value setting
        IS_CLK_INVERTED     => '0',                         -- Optional inversion for CLK
        IS_RST_INVERTED     => '0',                         -- Optional inversion for RST
        REFCLK_FREQUENCY    => 200.0,                       -- IDELAYCTRL clock input frequency in MHz (200.0-800.0)
        SIM_DEVICE          => fpga_series,                 -- Set the device version for simulation functionality (ULTRASCALE,
                                                            -- ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
        UPDATE_MODE         => "ASYNC"                      -- Determines when updates to the delay will take effect (ASYNC, MANUAL,
                                                            -- SYNC)
    )
    port map (
        CASC_OUT            => open,                        -- 1-bit output: Cascade delay output to ODELAY input cascade
        CNTVALUEOUT         => open,                        -- 9-bit output: Counter value output
        DATAOUT             => idelay_hs_data_x(0),         -- 1-bit output: Delayed data output
        CASC_IN             => '0',                         -- 1-bit input: Cascade delay input from slave ODELAY CASCADE_OUT
        CASC_RETURN         => '0',                         -- 1-bit input: Cascade delay returning from slave ODELAY DATAOUT
        CE                  => '0',                         -- 1-bit input: Active-High enable_i increment/decrement input
        CLK                 => byte_clk_x,                  -- 1-bit input: Clock input
        CNTVALUEIN          => b"000000000",                -- 9-bit input: Counter value input
        DATAIN              => '0',                         -- 1-bit input: Data input from the logic
        EN_VTC              => '1',                         -- 1-bit input: Keep delay constant over VT
        IDATAIN             => ibuf_dphy_hs_data_x(0),      -- 1-bit input: Data input from the IOBUF
        INC                 => '0',                         -- 1-bit input: Increment / Decrement tap delay input
        LOAD                => '0',                         -- 1-bit input: Load DELAY_VALUE input
        RST                 => '0'                    -- 1-bit input: Asynchronous Reset to the DELAY_VALUE
    );

    -- ISERDES
    ISERDESE3_inst0 : ISERDESE3
    generic map (
        DATA_WIDTH          => mipi_data_width,             -- Parallel data width (4,8)
        FIFO_ENABLE         => "TRUE",                      -- Enables the use of the FIFO
        FIFO_SYNC_MODE      => "FALSE",                     -- Always set to FALSE. TRUE is reserved for later use.
        IS_CLK_B_INVERTED   => '1',                         -- Optional inversion for CLK_B
        IS_CLK_INVERTED     => '0',                         -- Optional inversion for CLK
        IS_RST_INVERTED     => '0',                         -- Optional inversion for RST
        SIM_DEVICE          => fpga_series                  -- Set the device version for simulation functionality (ULTRASCALE,
                                                            -- ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
    )
    port map (
        FIFO_EMPTY          => open,                        -- 1-bit output: FIFO empty flag
        INTERNAL_DIVCLK     => open,                        -- 1-bit output: Internally divided down clock used when FIFO is
                                                            -- disabled (do not connect)

        Q                   => dphy_hs_data_o(7 downto 0),    -- 8-bit registered output
        CLK                 => dphy_hs_clk_buf_x,           -- 1-bit input: High-speed clock
        CLKDIV              => byte_clk_x,                  -- 1-bit input: Divided Clock
        CLK_B               => dphy_hs_clk_buf_x,           -- 1-bit input: Inversion of High-speed clock CLK
        D                   => idelay_hs_data_x(0),         -- 1-bit input: Serial Data Input
        FIFO_RD_CLK         => byte_clk_x,                 -- 1-bit input: FIFO read clock
        FIFO_RD_EN          => '1',                         -- 1-bit input: Enables reading the FIFO when asserted
        RST                 => data_phy0_rst_x                    -- 1-bit input: Asynchronous Reset
    );

    -- Data PHY 1
    IBUFDS_DPHY1_inst : IBUFDS_DPHY
    generic map (
        DIFF_TERM           => dphy_term_en,                -- Differential termination
        IOSTANDARD          => "MIPI_DPHY_DCI",             -- I/O standard
        SIM_DEVICE          => fpga_series                  -- Set the device version (ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1,
                                                            -- ULTRASCALE_PLUS_ES2)
    )   
    port map (  
        HSRX_O              => ibuf_dphy_hs_data_x(1),      -- 1-bit output: HS RX output
        LPRX_O_N            => dphy_data_lp_n_o(1),         -- 1-bit output: LP RX output (Slave)
        LPRX_O_P            => dphy_data_lp_p_o(1),         -- 1-bit output: LP RX output (Master)
        HSRX_DISABLE        => '0',                         -- 1-bit input: Disable control for HS mode
        I                   => dphy_data_p_i(1),            -- 1-bit input: Data input0 PAD
        IB                  => dphy_data_n_i(1),            -- 1-bit input: Data input1 PAD
        LPRX_DISABLE        => '0'                          -- 1-bit input: Disable control for LP mode
    );

    -- Input Delay
    IDELAYE3_inst1 : IDELAYE3
    generic map (
        CASCADE             => "NONE",                      -- Cascade setting (MASTER, NONE, SLAVE_END, SLAVE_MIDDLE)
        DELAY_FORMAT        => "TIME",                      -- Units of the DELAY_VALUE (COUNT, TIME)
        DELAY_SRC           => "IDATAIN",                   -- Delay input (DATAIN, IDATAIN)
        DELAY_TYPE          => "FIXED",                     -- Set the type of tap delay line (FIXED, VARIABLE, VAR_LOAD)
        DELAY_VALUE         => d1_skew,                   -- Input delay value setting
        IS_CLK_INVERTED     => '0',                         -- Optional inversion for CLK
        IS_RST_INVERTED     => '0',                         -- Optional inversion for RST
        REFCLK_FREQUENCY    => 200.0,                       -- IDELAYCTRL clock input frequency in MHz (200.0-800.0)
        SIM_DEVICE          => fpga_series,                 -- Set the device version for simulation functionality (ULTRASCALE,
                                                            -- ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
        UPDATE_MODE         => "ASYNC"                      -- Determines when updates to the delay will take effect (ASYNC, MANUAL,
                                                            -- SYNC)
    )
    port map (
        CASC_OUT            => open,                        -- 1-bit output: Cascade delay output to ODELAY input cascade
        CNTVALUEOUT         => open,                        -- 9-bit output: Counter value output
        DATAOUT             => idelay_hs_data_x(1),         -- 1-bit output: Delayed data output
        CASC_IN             => '0',                         -- 1-bit input: Cascade delay input from slave ODELAY CASCADE_OUT
        CASC_RETURN         => '0',                         -- 1-bit input: Cascade delay returning from slave ODELAY DATAOUT
        CE                  => '0',                         -- 1-bit input: Active-High enable_i increment/decrement input
        CLK                 => byte_clk_x,                  -- 1-bit input: Clock input
        CNTVALUEIN          => b"000000000",                -- 9-bit input: Counter value input
        DATAIN              => '0',                         -- 1-bit input: Data input from the logic
        EN_VTC              => '1',                         -- 1-bit input: Keep delay constant over VT
        IDATAIN             => ibuf_dphy_hs_data_x(1),      -- 1-bit input: Data input from the IOBUF
        INC                 => '0',                         -- 1-bit input: Increment / Decrement tap delay input
        LOAD                => '0',                         -- 1-bit input: Load DELAY_VALUE input
        RST                 => '0'                    -- 1-bit input: Asynchronous Reset to the DELAY_VALUE
    );

    -- ISERDES
    ISERDESE3_inst1 : ISERDESE3
    generic map (
        DATA_WIDTH          => mipi_data_width,             -- Parallel data width (4,8)
        FIFO_ENABLE         => "TRUE",                      -- Enables the use of the FIFO
        FIFO_SYNC_MODE      => "FALSE",                     -- Always set to FALSE. TRUE is reserved for later use.
        IS_CLK_B_INVERTED   => '1',                         -- Optional inversion for CLK_B
        IS_CLK_INVERTED     => '0',                         -- Optional inversion for CLK
        IS_RST_INVERTED     => '0',                         -- Optional inversion for RST
        SIM_DEVICE          => fpga_series                  -- Set the device version for simulation functionality (ULTRASCALE,
                                                            -- ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
    )
    port map (
        FIFO_EMPTY          => open,                        -- 1-bit output: FIFO empty flag
        INTERNAL_DIVCLK     => open,                        -- 1-bit output: Internally divided down clock used when FIFO is
                                                            -- disabled (do not connect)

        Q                   => dphy_hs_data_o(15 downto 8),    -- 8-bit registered output
        CLK                 => dphy_hs_clk_buf_x,           -- 1-bit input: High-speed clock
        CLKDIV              => byte_clk_x,                  -- 1-bit input: Divided Clock
        CLK_B               => dphy_hs_clk_buf_x,           -- 1-bit input: Inversion of High-speed clock CLK
        D                   => idelay_hs_data_x(1),         -- 1-bit input: Serial Data Input
        FIFO_RD_CLK         => byte_clk_x,                 -- 1-bit input: FIFO read clock
        FIFO_RD_EN          => '1',                         -- 1-bit input: Enables reading the FIFO when asserted
        RST                 => data_phy1_rst_x                    -- 1-bit input: Asynchronous Reset
    );

    -- Data PHY 2
    IBUFDS_DPHY2_inst : IBUFDS_DPHY
    generic map (
        DIFF_TERM           => dphy_term_en,                -- Differential termination
        IOSTANDARD          => "MIPI_DPHY_DCI",             -- I/O standard
        SIM_DEVICE          => fpga_series                  -- Set the device version (ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1,
                                                            -- ULTRASCALE_PLUS_ES2)
    )   
    port map (  
        HSRX_O              => ibuf_dphy_hs_data_x(2),      -- 1-bit output: HS RX output
        LPRX_O_N            => dphy_data_lp_n_o(2),         -- 1-bit output: LP RX output (Slave)
        LPRX_O_P            => dphy_data_lp_p_o(2),         -- 1-bit output: LP RX output (Master)
        HSRX_DISABLE        => '0',                         -- 1-bit input: Disable control for HS mode
        I                   => dphy_data_p_i(2),            -- 1-bit input: Data input0 PAD
        IB                  => dphy_data_n_i(2),            -- 1-bit input: Data input1 PAD
        LPRX_DISABLE        => '0'                          -- 1-bit input: Disable control for LP mode
    );

    -- Input Delay
    IDELAYE3_inst2 : IDELAYE3
    generic map (
        CASCADE             => "NONE",                      -- Cascade setting (MASTER, NONE, SLAVE_END, SLAVE_MIDDLE)
        DELAY_FORMAT        => "TIME",                      -- Units of the DELAY_VALUE (COUNT, TIME)
        DELAY_SRC           => "IDATAIN",                   -- Delay input (DATAIN, IDATAIN)
        DELAY_TYPE          => "FIXED",                     -- Set the type of tap delay line (FIXED, VARIABLE, VAR_LOAD)
        DELAY_VALUE         => d2_skew,                   -- Input delay value setting
        IS_CLK_INVERTED     => '0',                         -- Optional inversion for CLK
        IS_RST_INVERTED     => '0',                         -- Optional inversion for RST
        REFCLK_FREQUENCY    => 200.0,                       -- IDELAYCTRL clock input frequency in MHz (200.0-800.0)
        SIM_DEVICE          => fpga_series,                 -- Set the device version for simulation functionality (ULTRASCALE,
                                                            -- ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
        UPDATE_MODE         => "ASYNC"                      -- Determines when updates to the delay will take effect (ASYNC, MANUAL,
                                                            -- SYNC)
    )
    port map (
        CASC_OUT            => open,                        -- 1-bit output: Cascade delay output to ODELAY input cascade
        CNTVALUEOUT         => open,                        -- 9-bit output: Counter value output
        DATAOUT             => idelay_hs_data_x(2),         -- 1-bit output: Delayed data output
        CASC_IN             => '0',                         -- 1-bit input: Cascade delay input from slave ODELAY CASCADE_OUT
        CASC_RETURN         => '0',                         -- 1-bit input: Cascade delay returning from slave ODELAY DATAOUT
        CE                  => '0',                         -- 1-bit input: Active-High enable_i increment/decrement input
        CLK                 => byte_clk_x,                  -- 1-bit input: Clock input
        CNTVALUEIN          => b"000000000",                -- 9-bit input: Counter value input
        DATAIN              => '0',                         -- 1-bit input: Data input from the logic
        EN_VTC              => '1',                         -- 1-bit input: Keep delay constant over VT
        IDATAIN             => ibuf_dphy_hs_data_x(2),      -- 1-bit input: Data input from the IOBUF
        INC                 => '0',                         -- 1-bit input: Increment / Decrement tap delay input
        LOAD                => '0',                         -- 1-bit input: Load DELAY_VALUE input
        RST                 => '0'                    -- 1-bit input: Asynchronous Reset to the DELAY_VALUE
    );

    -- ISERDES
    ISERDESE3_inst2 : ISERDESE3
    generic map (
        DATA_WIDTH          => mipi_data_width,             -- Parallel data width (4,8)
        FIFO_ENABLE         => "TRUE",                      -- Enables the use of the FIFO
        FIFO_SYNC_MODE      => "FALSE",                     -- Always set to FALSE. TRUE is reserved for later use.
        IS_CLK_B_INVERTED   => '1',                         -- Optional inversion for CLK_B
        IS_CLK_INVERTED     => '0',                         -- Optional inversion for CLK
        IS_RST_INVERTED     => '0',                         -- Optional inversion for RST
        SIM_DEVICE          => fpga_series                  -- Set the device version for simulation functionality (ULTRASCALE,
                                                            -- ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
    )
    port map (
        FIFO_EMPTY          => open,                        -- 1-bit output: FIFO empty flag
        INTERNAL_DIVCLK     => open,                        -- 1-bit output: Internally divided down clock used when FIFO is
                                                            -- disabled (do not connect)

        Q                   => dphy_hs_data_o(23 downto 16),    -- 8-bit registered output
        CLK                 => dphy_hs_clk_buf_x,           -- 1-bit input: High-speed clock
        CLKDIV              => byte_clk_x,                  -- 1-bit input: Divided Clock
        CLK_B               => dphy_hs_clk_buf_x,           -- 1-bit input: Inversion of High-speed clock CLK
        D                   => idelay_hs_data_x(2),         -- 1-bit input: Serial Data Input
        FIFO_RD_CLK         => byte_clk_x,                 -- 1-bit input: FIFO read clock
        FIFO_RD_EN          => '1',                         -- 1-bit input: Enables reading the FIFO when asserted
        RST                 => data_phy2_rst_x                    -- 1-bit input: Asynchronous Reset
    );

    -- Data PHY 3
    IBUFDS_DPHY3_inst : IBUFDS_DPHY
    generic map (
        DIFF_TERM           => dphy_term_en,                -- Differential termination
        IOSTANDARD          => "MIPI_DPHY_DCI",             -- I/O standard
        SIM_DEVICE          => fpga_series                  -- Set the device version (ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1,
                                                            -- ULTRASCALE_PLUS_ES2)
    )   
    port map (  
        HSRX_O              => ibuf_dphy_hs_data_x(3),      -- 1-bit output: HS RX output
        LPRX_O_N            => dphy_data_lp_n_o(3),         -- 1-bit output: LP RX output (Slave)
        LPRX_O_P            => dphy_data_lp_p_o(3),         -- 1-bit output: LP RX output (Master)
        HSRX_DISABLE        => '0',                         -- 1-bit input: Disable control for HS mode
        I                   => dphy_data_p_i(3),            -- 1-bit input: Data input0 PAD
        IB                  => dphy_data_n_i(3),            -- 1-bit input: Data input1 PAD
        LPRX_DISABLE        => '0'                          -- 1-bit input: Disable control for LP mode
    );

    -- Input Delay
    IDELAYE3_inst3 : IDELAYE3
    generic map (
        CASCADE             => "NONE",                      -- Cascade setting (MASTER, NONE, SLAVE_END, SLAVE_MIDDLE)
        DELAY_FORMAT        => "TIME",                      -- Units of the DELAY_VALUE (COUNT, TIME)
        DELAY_SRC           => "IDATAIN",                   -- Delay input (DATAIN, IDATAIN)
        DELAY_TYPE          => "FIXED",                     -- Set the type of tap delay line (FIXED, VARIABLE, VAR_LOAD)
        DELAY_VALUE         => d3_skew,                   -- Input delay value setting
        IS_CLK_INVERTED     => '0',                         -- Optional inversion for CLK
        IS_RST_INVERTED     => '0',                         -- Optional inversion for RST
        REFCLK_FREQUENCY    => 200.0,                       -- IDELAYCTRL clock input frequency in MHz (200.0-800.0)
        SIM_DEVICE          => fpga_series,                 -- Set the device version for simulation functionality (ULTRASCALE,
                                                            -- ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
        UPDATE_MODE         => "ASYNC"                      -- Determines when updates to the delay will take effect (ASYNC, MANUAL,
                                                            -- SYNC)
    )
    port map (
        CASC_OUT            => open,                        -- 1-bit output: Cascade delay output to ODELAY input cascade
        CNTVALUEOUT         => open,                        -- 9-bit output: Counter value output
        DATAOUT             => idelay_hs_data_x(3),         -- 1-bit output: Delayed data output
        CASC_IN             => '0',                         -- 1-bit input: Cascade delay input from slave ODELAY CASCADE_OUT
        CASC_RETURN         => '0',                         -- 1-bit input: Cascade delay returning from slave ODELAY DATAOUT
        CE                  => '0',                         -- 1-bit input: Active-High enable_i increment/decrement input
        CLK                 => byte_clk_x,                  -- 1-bit input: Clock input
        CNTVALUEIN          => b"000000000",                -- 9-bit input: Counter value input
        DATAIN              => '0',                         -- 1-bit input: Data input from the logic
        EN_VTC              => '1',                         -- 1-bit input: Keep delay constant over VT
        IDATAIN             => ibuf_dphy_hs_data_x(3),      -- 1-bit input: Data input from the IOBUF
        INC                 => '0',                         -- 1-bit input: Increment / Decrement tap delay input
        LOAD                => '0',                         -- 1-bit input: Load DELAY_VALUE input
        RST                 => '0'                    -- 1-bit input: Asynchronous Reset to the DELAY_VALUE
    );

    -- ISERDES
    ISERDESE3_inst3 : ISERDESE3
    generic map (
        DATA_WIDTH          => mipi_data_width,             -- Parallel data width (4,8)
        FIFO_ENABLE         => "TRUE",                      -- Enables the use of the FIFO
        FIFO_SYNC_MODE      => "FALSE",                     -- Always set to FALSE. TRUE is reserved for later use.
        IS_CLK_B_INVERTED   => '1',                         -- Optional inversion for CLK_B
        IS_CLK_INVERTED     => '0',                         -- Optional inversion for CLK
        IS_RST_INVERTED     => '0',                         -- Optional inversion for RST
        SIM_DEVICE          => fpga_series                  -- Set the device version for simulation functionality (ULTRASCALE,
                                                            -- ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
    )
    port map (
        FIFO_EMPTY          => open,                        -- 1-bit output: FIFO empty flag
        INTERNAL_DIVCLK     => open,                        -- 1-bit output: Internally divided down clock used when FIFO is
                                                            -- disabled (do not connect)

        Q                   => dphy_hs_data_o(31 downto 24),    -- 8-bit registered output
        CLK                 => dphy_hs_clk_buf_x,           -- 1-bit input: High-speed clock
        CLKDIV              => byte_clk_x,                  -- 1-bit input: Divided Clock
        CLK_B               => dphy_hs_clk_buf_x,           -- 1-bit input: Inversion of High-speed clock CLK
        D                   => idelay_hs_data_x(3),         -- 1-bit input: Serial Data Input
        FIFO_RD_CLK         => byte_clk_x,                 -- 1-bit input: FIFO read clock
        FIFO_RD_EN          => '1',                         -- 1-bit input: Enables reading the FIFO when asserted
        RST                 => data_phy3_rst_x                    -- 1-bit input: Asynchronous Reset
    );


end Behavioral;