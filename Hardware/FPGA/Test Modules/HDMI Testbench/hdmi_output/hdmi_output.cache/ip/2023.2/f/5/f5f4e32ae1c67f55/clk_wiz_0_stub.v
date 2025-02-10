// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Nov 19 19:02:35 2024
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk_27m, clk_148_5m, clk_297m, clk_74m, clk_25m, 
  reset, locked, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="reset,locked,clk_in1_p,clk_in1_n" */
/* synthesis syn_force_seq_prim="clk_27m" */
/* synthesis syn_force_seq_prim="clk_148_5m" */
/* synthesis syn_force_seq_prim="clk_297m" */
/* synthesis syn_force_seq_prim="clk_74m" */
/* synthesis syn_force_seq_prim="clk_25m" */;
  output clk_27m /* synthesis syn_isclock = 1 */;
  output clk_148_5m /* synthesis syn_isclock = 1 */;
  output clk_297m /* synthesis syn_isclock = 1 */;
  output clk_74m /* synthesis syn_isclock = 1 */;
  output clk_25m /* synthesis syn_isclock = 1 */;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
