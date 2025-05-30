// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Dec 13 19:51:43 2024
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/johnh/Desktop/camera_test_v2/camera_test_v2.gen/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_27m, clk_297m, clk_74m, reset, locked, clk_in1)
/* synthesis syn_black_box black_box_pad_pin="reset,locked" */
/* synthesis syn_force_seq_prim="clk_27m" */
/* synthesis syn_force_seq_prim="clk_297m" */
/* synthesis syn_force_seq_prim="clk_74m" */
/* synthesis syn_force_seq_prim="clk_in1" */;
  output clk_27m /* synthesis syn_isclock = 1 */;
  output clk_297m /* synthesis syn_isclock = 1 */;
  output clk_74m /* synthesis syn_isclock = 1 */;
  input reset;
  output locked;
  input clk_in1 /* synthesis syn_isclock = 1 */;
endmodule
