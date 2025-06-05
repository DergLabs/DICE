-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Fri May 30 04:38:37 2025
-- Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vio_0_stub.vhdl
-- Design      : vio_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku3p-ffva676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    clk : in STD_LOGIC;
    probe_out0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_out5 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_out6 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_out0[0:0],probe_out1[15:0],probe_out2[15:0],probe_out3[15:0],probe_out4[15:0],probe_out5[15:0],probe_out6[15:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2023.2";
begin
end;
