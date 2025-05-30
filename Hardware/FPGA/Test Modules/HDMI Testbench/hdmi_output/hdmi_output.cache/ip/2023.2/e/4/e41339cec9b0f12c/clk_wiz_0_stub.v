// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Wed Oct 30 11:51:40 2024
// Host        : john-linux-desktop running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk_27m, clk_148_5m, clk_297m, reset, locked, 
  clk_in1)
/* synthesis syn_black_box black_box_pad_pin="reset,locked" */
/* synthesis syn_force_seq_prim="clk_27m" */
/* synthesis syn_force_seq_prim="clk_148_5m" */
/* synthesis syn_force_seq_prim="clk_297m" */
/* synthesis syn_force_seq_prim="clk_in1" */;
  output clk_27m /* synthesis syn_isclock = 1 */;
  output clk_148_5m /* synthesis syn_isclock = 1 */;
  output clk_297m /* synthesis syn_isclock = 1 */;
  input reset;
  output locked;
  input clk_in1 /* synthesis syn_isclock = 1 */;
endmodule
