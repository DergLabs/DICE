library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

--High-Speed D-PHY clock RX PHY for MIPI CSI-2 Rx core
--Copyright (C) 2016 David Shah
--Licensed under the MIT License

-- This receives the input clock and produces both real and complement DDR bit
-- clocks and an SDR (i.e. in/4) byte clock for the SERDES and other downstream devices


entity csi_rx_hs_clk_phy is
	 generic (
    series : string := "7SERIES"; --FPGA series, 7SERIES or VIRTEX6
		term_en : boolean := true
   );
   port (
     dphy_clk : in STD_LOGIC_VECTOR (1 downto 0); --D-PHY clock input; 1 is P, 0 is N
     reset : in STD_LOGIC; --reset input for BUFR
     enable : in STD_LOGIC;
     ddr_bit_clock : out STD_LOGIC; --DDR bit clock (i.e. input clock buffered) out
     ddr_bit_clock_b : out STD_LOGIC; --Inverted DDR bit clock out
     byte_clock : out STD_LOGIC --SDR byte clock (i.e. input clock / 4) out
     
  );
end csi_rx_hs_clk_phy;

architecture Behavioral of csi_rx_hs_clk_phy is
signal bit_clock_int_pre : std_logic;
signal bit_clock_int : std_logic;
signal bit_clock_b_int : std_logic;
signal byte_clock_int : std_logic;

signal bit_clk_pre_buf : std_logic;
signal bit_clk_int_buf : std_logic;
signal bit_clk_b_int_buf : std_logic;
signal byte_clk_int_buf : std_logic;
begin

--	iclkdbuf : IBUFDS
--		generic map (
--			DIFF_TERM => term_en,
--			IBUF_LOW_PWR => FALSE,
--			IOSTANDARD => "DEFAULT"
--		)
--		port map(
--			O => bit_clock_int_pre,
--			I => dphy_clk(1),
--			IB => dphy_clk(0)
--		);
		
    IBUFDS_DPHY_inst : IBUFDS_DPHY
        generic map (
          DIFF_TERM => term_en,               -- Differential termination
          IOSTANDARD => "DEFAULT",         -- I/O standard
          SIM_DEVICE => series  -- Set the device version (ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1,
                                           -- ULTRASCALE_PLUS_ES2)
        )
        port map (
          HSRX_O => bit_clock_int_pre,             -- 1-bit output: HS RX output
          LPRX_O_N => open,         -- 1-bit output: LP RX output (Slave)
          LPRX_O_P => open,         -- 1-bit output: LP RX output (Master)
          HSRX_DISABLE => '0', -- 1-bit input: Disable control for HS mode
          I => dphy_clk(1),                       -- 1-bit input: Data input0 PAD
          IB => dphy_clk(0),                     -- 1-bit input: Data input1 PAD
          LPRX_DISABLE => '1'  -- 1-bit input: Disable control for LP mode
        );
		
		
    bit_clk_buf : BUFGCE
    generic map (
      CE_TYPE => "SYNC",               -- ASYNC, HARDSYNC, SYNC
      IS_CE_INVERTED => '0',           -- Programmable inversion on CE
      IS_I_INVERTED => '0',            -- Programmable inversion on I
      SIM_DEVICE => series             -- ULTRASCALE, ULTRASCALE_PLUS
    )
    port map (
      O => bit_clock_int,   -- 1-bit output: Buffer
      CE => enable, -- 1-bit input: Buffer enable
      I => bit_clock_int_pre    -- 1-bit input: Buffer
    );	

	/*iclkbufio: BUFIO
		port map (
			O => bit_clock_int,
			I => bit_clock_int_pre
		);*/
		

  bit_clock_b_int <= NOT bit_clock_int;

  clk_div_gen : if series = "7SERIES" generate
  clkdiv : BUFR
		generic map (
			BUFR_DIVIDE => "4",
			SIM_DEVICE => series
		)
		port map (
			O => byte_clock_int,
			CE => '1',
			CLR => reset,
			I => bit_clock_int_pre
		);
   elsif series = "ULTRASCALE_PLUS" generate

   -- BUFGCE_DIV: General Clock Buffer with Divide Function
   --             Kintex UltraScale+
   -- Xilinx HDL Language Template, version 2023.2

   BUFGCE_DIV_inst : BUFGCE_DIV
   generic map (
      BUFGCE_DIVIDE => 4,              -- 1-8
      -- Programmable Inversion Attributes: Specifies built-in programmable inversion on specific pins
      IS_CE_INVERTED => '0',           -- Optional inversion for CE
      IS_CLR_INVERTED => '0',          -- Optional inversion for CLR
      IS_I_INVERTED => '0',            -- Optional inversion for I
      SIM_DEVICE => series             -- ULTRASCALE, ULTRASCALE_PLUS
   )
   port map (
      O => byte_clock_int,     -- 1-bit output: Buffer
      CE => enable,               -- 1-bit input: Buffer enable
      CLR => reset,            -- 1-bit input: Asynchronous clear
      I => bit_clock_int_pre   -- 1-bit input: Buffer
   );
   
   end generate;
   

  ddr_bit_clock <= bit_clock_int;
  ddr_bit_clock_b <= bit_clock_b_int;
  byte_clock <= byte_clock_int;
  
end Behavioral;
