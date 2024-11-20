-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Tue Nov 19 19:02:35 2024
-- Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/johnh/Desktop/DICE/Hardware/FPGA/HDMI
--               Testbench/hdmi_output/hdmi_output.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.vhdl}
-- Design      : clk_wiz_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku3p-ffva676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_wiz_0 is
  Port ( 
    clk_27m : out STD_LOGIC;
    clk_148_5m : out STD_LOGIC;
    clk_297m : out STD_LOGIC;
    clk_74m : out STD_LOGIC;
    clk_25m : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1_p : in STD_LOGIC;
    clk_in1_n : in STD_LOGIC
  );

end clk_wiz_0;

architecture stub of clk_wiz_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_27m,clk_148_5m,clk_297m,clk_74m,clk_25m,reset,locked,clk_in1_p,clk_in1_n";
begin
end;
