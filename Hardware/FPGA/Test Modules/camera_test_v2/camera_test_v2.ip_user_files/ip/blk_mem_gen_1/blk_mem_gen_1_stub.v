// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Dec 14 00:42:30 2024
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/johnh/Desktop/camera_test_v2/camera_test_v2.gen/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_stub.v
// Design      : blk_mem_gen_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *)
module blk_mem_gen_1(clka, rsta, ena, wea, addra, dina, douta, clkb, rstb, enb, 
  web, addrb, dinb, doutb, rsta_busy, rstb_busy)
/* synthesis syn_black_box black_box_pad_pin="rsta,ena,wea[0:0],addra[11:0],dina[119:0],douta[119:0],rstb,enb,web[0:0],addrb[11:0],dinb[119:0],doutb[119:0],rsta_busy,rstb_busy" */
/* synthesis syn_force_seq_prim="clka" */
/* synthesis syn_force_seq_prim="clkb" */;
  input clka /* synthesis syn_isclock = 1 */;
  input rsta;
  input ena;
  input [0:0]wea;
  input [11:0]addra;
  input [119:0]dina;
  output [119:0]douta;
  input clkb /* synthesis syn_isclock = 1 */;
  input rstb;
  input enb;
  input [0:0]web;
  input [11:0]addrb;
  input [119:0]dinb;
  output [119:0]doutb;
  output rsta_busy;
  output rstb_busy;
endmodule
