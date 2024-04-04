// (c) Copyright 1995-2012 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
// DO NOT MODIFY THIS FILE.


// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG

ila_ddr2_axi your_instance_name (
	.clk(clk), // input wire clk
	.trig_out(trig_out),// output wire trig_out 
	.trig_out_ack(trig_out_ack),// input wire trig_out_ack 

	.probe0(probe0), // input wire [0:0]  probe0  
	.probe1(probe1), // input wire [0:0]  probe1 
	.probe2(probe2), // input wire [0:0]  probe2 
	.probe3(probe3), // input wire [0:0]  probe3 
	.probe4(probe4), // input wire [0:0]  probe4 
	.probe5(probe5), // input wire [0:0]  probe5 
	.probe6(probe6), // input wire [0:0]  probe6 
	.probe7(probe7), // input wire [0:0]  probe7 
	.probe8(probe8), // input wire [0:0]  probe8 
	.probe9(probe9), // input wire [0:0]  probe9 
	.probe10(probe10), // input wire [1:0]  probe10 
	.probe11(probe11), // input wire [1:0]  probe11 
	.probe12(probe12), // input wire [1:0]  probe12 
	.probe13(probe13), // input wire [0:0]  probe13 
	.probe14(probe14), // input wire [0:0]  probe14 
	.probe15(probe15), // input wire [0:0]  probe15 
	.probe16(probe16), // input wire [0:0]  probe16 
	.probe17(probe17), // input wire [0:0]  probe17 
	.probe18(probe18), // input wire [5:0]  probe18 
	.probe19(probe19), // input wire [0:0]  probe19 
	.probe20(probe20), // input wire [63:0]  probe20 
	.probe21(probe21), // input wire [0:0]  probe21 
	.probe22(probe22), // input wire [0:0]  probe22 
	.probe23(probe23), // input wire [0:0]  probe23 
	.probe24(probe24), // input wire [0:0]  probe24 
	.probe25(probe25), // input wire [0:0]  probe25 
	.probe26(probe26), // input wire [31:0]  probe26 
	.probe27(probe27), // input wire [31:0]  probe27 
	.probe28(probe28), // input wire [4:0]  probe28 
	.probe29(probe29), // input wire [3:0]  probe29 
	.probe30(probe30), // input wire [0:0]  probe30 
	.probe31(probe31), // input wire [0:0]  probe31 
	.probe32(probe32), // input wire [5:0]  probe32 
	.probe33(probe33), // input wire [2:0]  probe33 
	.probe34(probe34), // input wire [3:0]  probe34 
	.probe35(probe35), // input wire [5:0]  probe35 
	.probe36(probe36), // input wire [5:0]  probe36 
	.probe37(probe37), // input wire [5:0]  probe37 
	.probe38(probe38), // input wire [5:0]  probe38 
	.probe39(probe39), // input wire [2:0]  probe39 
	.probe40(probe40), // input wire [0:0]  probe40 
	.probe41(probe41), // input wire [0:0]  probe41 
	.probe42(probe42), // input wire [0:0]  probe42 
	.probe43(probe43), // input wire [3:0]  probe43 
	.probe44(probe44), // input wire [4:0]  probe44 
	.probe45(probe45), // input wire [4:0]  probe45 
	.probe46(probe46), // input wire [0:0]  probe46 
	.probe47(probe47), // input wire [0:0]  probe47 
	.probe48(probe48), // input wire [3:0]  probe48 
	.probe49(probe49), // input wire [53:0]  probe49 
	.probe50(probe50), // input wire [26:0]  probe50 
	.probe51(probe51), // input wire [11:0]  probe51 
	.probe52(probe52), // input wire [11:0]  probe52 
	.probe53(probe53), // input wire [11:0]  probe53 
	.probe54(probe54), // input wire [5:0]  probe54 
	.probe55(probe55), // input wire [3:0]  probe55 
	.probe56(probe56), // input wire [7:0]  probe56 
	.probe57(probe57), // input wire [7:0]  probe57 
	.probe58(probe58), // input wire [7:0]  probe58 
	.probe59(probe59), // input wire [7:0]  probe59 
	.probe60(probe60), // input wire [7:0]  probe60 
	.probe61(probe61), // input wire [7:0]  probe61 
	.probe62(probe62), // input wire [7:0]  probe62 
	.probe63(probe63), // input wire [7:0]  probe63 
	.probe64(probe64), // input wire [0:0]  probe64 
	.probe65(probe65), // input wire [0:0]  probe65 
	.probe66(probe66), // input wire [5:0]  probe66 
	.probe67(probe67), // input wire [5:0]  probe67 
	.probe68(probe68), // input wire [5:0]  probe68 
	.probe69(probe69), // input wire [4:0]  probe69 
	.probe70(probe70), // input wire [11:0]  probe70 
	.probe71(probe71), // input wire [11:0]  probe71 
	.probe72(probe72), // input wire [5:0]  probe72 
	.probe73(probe73), // input wire [5:0]  probe73 
	.probe74(probe74), // input wire [5:0]  probe74 
	.probe75(probe75), // input wire [107:0]  probe75 
	.probe76(probe76), // input wire [107:0]  probe76 
	.probe77(probe77), // input wire [107:0]  probe77 
	.probe78(probe78), // input wire [89:0]  probe78 
	.probe79(probe79), // input wire [47:0]  probe79 
	.probe80(probe80), // input wire [15:0]  probe80 
	.probe81(probe81), // input wire [47:0]  probe81 
	.probe82(probe82), // input wire [15:0]  probe82 
	.probe83(probe83), // input wire [5:0]  probe83 
	.probe84(probe84), // input wire [5:0]  probe84 
	.probe85(probe85), // input wire [0:0]  probe85 
	.probe86(probe86), // input wire [0:0]  probe86 
	.probe87(probe87), // input wire [0:0]  probe87 
	.probe88(probe88), // input wire [0:0]  probe88 
	.probe89(probe89), // input wire [0:0]  probe89 
	.probe90(probe90), // input wire [0:0]  probe90 
	.probe91(probe91), // input wire [4:0]  probe91 
	.probe92(probe92), // input wire [5:0]  probe92 
	.probe93(probe93), // input wire [5:0]  probe93 
	.probe94(probe94), // input wire [2:0]  probe94 
	.probe95(probe95), // input wire [0:0]  probe95 
	.probe96(probe96), // input wire [5:0]  probe96 
	.probe97(probe97), // input wire [2:0]  probe97 
	.probe98(probe98), // input wire [5:0]  probe98 
	.probe99(probe99), // input wire [0:0]  probe99 
	.probe100(probe100), // input wire [0:0]  probe100 
	.probe101(probe101), // input wire [0:0]  probe101 
	.probe102(probe102), // input wire [0:0]  probe102 
	.probe103(probe103), // input wire [0:0]  probe103 
	.probe104(probe104), // input wire [0:0]  probe104 
	.probe105(probe105), // input wire [0:0]  probe105 
	.probe106(probe106), // input wire [0:0]  probe106 
	.probe107(probe107), // input wire [0:0]  probe107 
	.probe108(probe108), // input wire [7:0]  probe108 
	.probe109(probe109), // input wire [7:0]  probe109 
	.probe110(probe110), // input wire [5:0]  probe110 
	.probe111(probe111), // input wire [5:0]  probe111 
	.probe112(probe112), // input wire [7:0]  probe112 
	.probe113(probe113), // input wire [0:0]  probe113 
	.probe114(probe114), // input wire [7:0]  probe114 
	.probe115(probe115), // input wire [5:0]  probe115 
	.probe116(probe116), // input wire [4:0]  probe116 
	.probe117(probe117), // input wire [1:0]  probe117 
	.probe118(probe118), // input wire [0:0]  probe118 
	.probe119(probe119), // input wire [0:0]  probe119 
	.probe120(probe120), // input wire [0:0]  probe120 
	.probe121(probe121), // input wire [0:0]  probe121 
	.probe122(probe122), // input wire [0:0]  probe122 
	.probe123(probe123), // input wire [5:0]  probe123 
	.probe124(probe124), // input wire [5:0]  probe124 
	.probe125(probe125), // input wire [0:0]  probe125 
	.probe126(probe126), // input wire [7:0]  probe126 
	.probe127(probe127), // input wire [7:0]  probe127 
	.probe128(probe128), // input wire [7:0]  probe128 
	.probe129(probe129), // input wire [7:0]  probe129 
	.probe130(probe130), // input wire [7:0]  probe130 
	.probe131(probe131), // input wire [7:0]  probe131 
	.probe132(probe132), // input wire [7:0]  probe132 
	.probe133(probe133), // input wire [7:0]  probe133 
	.probe134(probe134), // input wire [0:0]  probe134 
	.probe135(probe135), // input wire [0:0]  probe135 
	.probe136(probe136), // input wire [0:0]  probe136 
	.probe137(probe137), // input wire [107:0]  probe137 
	.probe138(probe138), // input wire [107:0]  probe138 
	.probe139(probe139), // input wire [107:0]  probe139 
	.probe140(probe140), // input wire [0:0]  probe140 
	.probe141(probe141), // input wire [53:0]  probe141 
	.probe142(probe142) // input wire [5:0]  probe142
);

// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file ila_ddr2_axi when simulating
// the core, ila_ddr2_axi. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.


