// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri May 30 01:29:11 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/sys_clk_mmcm/sys_clk_mmcm_stub.v
// Design      : sys_clk_mmcm
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module sys_clk_mmcm(clk_out1, reset, locked, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="reset,locked,clk_in1_p,clk_in1_n" */
/* synthesis syn_force_seq_prim="clk_out1" */;
  output clk_out1 /* synthesis syn_isclock = 1 */;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
