// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Feb 10 19:11:13 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/dsp_macro_add_22b/dsp_macro_add_22b_stub.v
// Design      : dsp_macro_add_22b
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dsp_macro_v1_0_4,Vivado 2023.2" *)
module dsp_macro_add_22b(CLK, CE, SCLR, A, C, D, P)
/* synthesis syn_black_box black_box_pad_pin="CE,SCLR,A[11:0],C[11:0],D[11:0],P[13:0]" */
/* synthesis syn_force_seq_prim="CLK" */;
  input CLK /* synthesis syn_isclock = 1 */;
  input CE;
  input SCLR;
  input [11:0]A;
  input [11:0]C;
  input [11:0]D;
  output [13:0]P;
endmodule
