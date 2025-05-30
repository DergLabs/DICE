-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Mon May 26 22:38:30 2025
-- Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/output_mem_ila/output_mem_ila_stub.vhdl
-- Design      : output_mem_ila
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku3p-ffva676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity output_mem_ila is
  Port ( 
    clk : in STD_LOGIC;
    probe0 : in STD_LOGIC_VECTOR ( 12 downto 0 );
    probe1 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    probe2 : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end output_mem_ila;

architecture stub of output_mem_ila is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe0[12:0],probe1[8:0],probe2[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "ila,Vivado 2023.2";
begin
end;
