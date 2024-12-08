library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

--High-Speed D-PHY lane RX PHY for MIPI CSI-2 Rx core
--Copyright (C) 2016 David Shah
--Licensed under the MIT License

--This entity handles input skew compensation and deserialisation for the
--CSI data input lanes. Output is has arbitrary alignment which must be fixed later on
--in the processing chain
entity csi_rx_hs_lane_phy is
generic(
  series : string := "7SERIES"; --FPGA series, 7SERIES or VIRTEX6
  invert : boolean := false; --Whether or not to invert output (i.e. if pairs are swapped)
  term_en : boolean := true; --Whether or not to enable internal input termination
  delay : natural --IDELAY delay value for skew compensation
);

port (
  ddr_bit_clock : in STD_LOGIC; --true and complement DDR bit clocks, buffered from D-PHY clock
  ddr_bit_clock_b : in STD_LOGIC;
  byte_clock : in STD_LOGIC; --byte clock; i.e. input clock /4
  --enable : in STD_LOGIC; --active high enable for SERDES
  reset : in STD_LOGIC; --reset, latched internally to byte clock
  dphy_hs : in STD_LOGIC_VECTOR (1 downto 0); --lane input, 1 is P, 0 is N
  deser_out : out STD_LOGIC_VECTOR (7 downto 0) --deserialised byte output
);

end csi_rx_hs_lane_phy;

architecture Behavioral of csi_rx_hs_lane_phy is
signal reset_lat : std_logic; --reset synchronised to byte clock
signal in_se : std_logic; --input after differential buffer
signal in_delayed : std_logic; --input after deskew

--for Ultrascale+ devices where ISERDES does not have a clock enable
--signal ddr_bit_clock_buf : std_logic;
--signal ddr_bit_clock_b_buf : std_logic;
signal delayed_data : std_logic;

--for Virtex-6 devices where we cascade two ISERDESs
--signal shift_1 : std_logic;
--signal shift_2 : std_logic;

signal serdes_out_int : std_logic_vector(7 downto 0);
begin

  process(byte_clock)
  begin
  if rising_edge(byte_clock) then
      reset_lat <= reset;
  end if;
  end process;

--  inbuf : IBUFDS
--    generic map(
--        DIFF_TERM => term_en,
--        IBUF_LOW_PWR => FALSE,
--        IOSTANDARD => "DEFAULT")
--    port map(
--        O => in_se,
--        I => dphy_hs(1),
--        IB => dphy_hs(0));
        
        
    IBUFDS_DPHY_inst : IBUFDS_DPHY
        generic map (
          DIFF_TERM => term_en,               -- Differential termination
          IOSTANDARD => "DEFAULT",         -- I/O standard
          SIM_DEVICE => series  -- Set the device version (ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1,
                                           -- ULTRASCALE_PLUS_ES2)
        )
        port map (
          HSRX_O => in_se,             -- 1-bit output: HS RX output
          LPRX_O_N => open,         -- 1-bit output: LP RX output (Slave)
          LPRX_O_P => open,         -- 1-bit output: LP RX output (Master)
          HSRX_DISABLE => '0', -- 1-bit input: Disable control for HS mode
          I => dphy_hs(1),                       -- 1-bit input: Data input0 PAD
          IB => dphy_hs(0),                     -- 1-bit input: Data input1 PAD
          LPRX_DISABLE => '1'  -- 1-bit input: Disable control for LP mode
        );

  --ultrascale+ specific blocks
  gen_upp : if series = "ULTRASCALE_PLUS" generate


   -- BUFGCE: General Clock Buffer with Clock Enable
   --         Kintex UltraScale+
   -- Xilinx HDL Language Template, version 2023.2

--   BUFGCE_inst_1 : BUFGCE
--   generic map (
--      CE_TYPE => "SYNC",               -- ASYNC, HARDSYNC, SYNC
--      IS_CE_INVERTED => '0',           -- Programmable inversion on CE
--      IS_I_INVERTED => '0',            -- Programmable inversion on I
--      SIM_DEVICE => series             -- ULTRASCALE, ULTRASCALE_PLUS
--   )
--   port map (
--      O => ddr_bit_clock_buf,   -- 1-bit output: Buffer
--      CE => enable, -- 1-bit input: Buffer enable
--      I => ddr_bit_clock    -- 1-bit input: Buffer
--   );
--
--   BUFGCE_inst_2 : BUFGCE
--   generic map (
--      CE_TYPE => "SYNC",               -- ASYNC, HARDSYNC, SYNC
--      IS_CE_INVERTED => '0',           -- Programmable inversion on CE
--      IS_I_INVERTED => '0',            -- Programmable inversion on I
--      SIM_DEVICE => series             -- ULTRASCALE, ULTRASCALE_PLUS
--   )
--   port map (
--      O => ddr_bit_clock_b_buf,   -- 1-bit output: Buffer
--      CE => enable, -- 1-bit input: Buffer enable
--      I => ddr_bit_clock_b    -- 1-bit input: Buffer
--   );

   IDELAYE3_inst : IDELAYE3
   generic map (
      CASCADE => "NONE",               -- Cascade setting (MASTER, NONE, SLAVE_END, SLAVE_MIDDLE)
      DELAY_FORMAT => "TIME",          -- Units of the DELAY_VALUE (COUNT, TIME)
      DELAY_SRC => "IDATAIN",          -- Delay input (DATAIN, IDATAIN)
      DELAY_TYPE => "FIXED",           -- Set the type of tap delay line (FIXED, VARIABLE, VAR_LOAD)
      DELAY_VALUE => delay,                -- Input delay value setting
      IS_CLK_INVERTED => '0',          -- Optional inversion for CLK
      IS_RST_INVERTED => '0',          -- Optional inversion for RST
      REFCLK_FREQUENCY => 200.0,       -- IDELAYCTRL clock input frequency in MHz (200.0-800.0)
      SIM_DEVICE => "ULTRASCALE_PLUS", -- Set the device version for simulation functionality (ULTRASCALE,
                                       -- ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
      UPDATE_MODE => "ASYNC"           -- Determines when updates to the delay will take effect (ASYNC, MANUAL,
                                       -- SYNC)
   )
   port map (
      CASC_OUT => open,       -- 1-bit output: Cascade delay output to ODELAY input cascade
      CNTVALUEOUT => open, -- 9-bit output: Counter value output
      DATAOUT => delayed_data,         -- 1-bit output: Delayed data output
      CASC_IN => '0',         -- 1-bit input: Cascade delay input from slave ODELAY CASCADE_OUT
      CASC_RETURN => '0', -- 1-bit input: Cascade delay returning from slave ODELAY DATAOUT
      CE => '0',                   -- 1-bit input: Active-High enable increment/decrement input
      CLK => byte_clock,                 -- 1-bit input: Clock input
      CNTVALUEIN => b"000000000",   -- 9-bit input: Counter value input
      DATAIN => '0',           -- 1-bit input: Data input from the logic
      EN_VTC => '1',           -- 1-bit input: Keep delay constant over VT
      IDATAIN => in_se,         -- 1-bit input: Data input from the IOBUF
      INC => '0',                 -- 1-bit input: Increment / Decrement tap delay input
      LOAD => '0',               -- 1-bit input: Load DELAY_VALUE input
      RST => reset_lat                  -- 1-bit input: Asynchronous Reset to the DELAY_VALUE
   );


   -- ISERDESE3: Input SERial/DESerializer
   --            Kintex UltraScale+
   ISERDESE3_inst : ISERDESE3
   generic map (
      DATA_WIDTH => 8,                 -- Parallel data width (4,8)
      FIFO_ENABLE => "TRUE",          -- Enables the use of the FIFO
      FIFO_SYNC_MODE => "FALSE",       -- Always set to FALSE. TRUE is reserved for later use.
      IS_CLK_B_INVERTED => '1',        -- Optional inversion for CLK_B
      IS_CLK_INVERTED => '0',          -- Optional inversion for CLK
      IS_RST_INVERTED => '0',          -- Optional inversion for RST
      SIM_DEVICE => series             -- Set the device version for simulation functionality (ULTRASCALE,
                                       -- ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
   )
   port map (
      FIFO_EMPTY => open,                 -- 1-bit output: FIFO empty flag
      INTERNAL_DIVCLK => open,            -- 1-bit output: Internally divided down clock used when FIFO is
                                          -- disabled (do not connect)

      Q => serdes_out_int,                -- 8-bit registered output
      CLK => ddr_bit_clock,           -- 1-bit input: High-speed clock
      CLKDIV => byte_clock,               -- 1-bit input: Divided Clock
      CLK_B => ddr_bit_clock,       -- 1-bit input: Inversion of High-speed clock CLK
      D => delayed_data,                           -- 1-bit input: Serial Data Input
      FIFO_RD_CLK => byte_clock,                 -- 1-bit input: FIFO read clock
      FIFO_RD_EN => '1',                  -- 1-bit input: Enables reading the FIFO when asserted
      RST => reset_lat                    -- 1-bit input: Asynchronous Reset
   );
end generate;


  --Inversion of output based on generic
  gen_true : if not invert generate
    deser_out <= serdes_out_int;
  end generate;

  gen_inv : if invert generate
    deser_out <= not serdes_out_int;
  end generate;
end architecture;
