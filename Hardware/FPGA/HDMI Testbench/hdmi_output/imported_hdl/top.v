//  Author:lhj                                                                  //
//                                                                              //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//2018/01/05                    1.0          Original
//*******************************************************************************/
`include "video_define.v"
//`define	VIDEO_3840_2160

module top(
	input                           sys_clk_p,      // Differentia system clock 200Mhz input on board
	input                           sys_clk_n,
	output                          fan,
	//hdmi output  9136       
	inout                           hdmi1_scl,         // i2c port hdmi input1 and hdmi output1
	inout                           hdmi1_sda,
	//inout                           hdmi2_scl,         // i2c port hdmi input2 and hdmi output2
	//inout                           hdmi2_sda,	
	//output                          hdmi_in_nreset,    //reset all hdmi input ports  
	output                          hdmi_out_nreset,   //reset all hdmi output ports  
	output                          vout1_clk,
	output                          vout1_hs,
	output                          vout1_vs,
	output                          vout1_de,
	output[23:0]                    vout1_data
	//output                          vout2_clk,
	//output                          vout2_hs,
	//output                          vout2_vs,
	//output                          vout2_de,
	//output[35:0]                    vout2_data  	
);
wire                            video_clk;
wire[7:0]                       video_r;
wire[7:0]                       video_g;
wire[7:0]                       video_b;
wire                            hs;
wire                            vs;
wire                            de;

wire                            clk_27m;
wire                            clk_148_5;
wire                            clk_297;
wire                            rst_n;
wire                            locked;
wire                            hdmi_nreset;
wire[9:0]                       lut1_index;
wire[31:0]                      lut1_data;
//wire[9:0]                       lut2_index;
//wire[31:0]                      lut2_data;
//wire[31:0]                      lut2_data;
//assign fan      = 1'b0;
assign vout1_clk = video_clk;
assign vout1_hs = hs;
assign vout1_vs = vs;
assign vout1_de = de;
assign vout1_data = {video_r,video_g,video_b};

//assign vout2_clk = video_clk;
//assign vout2_hs = hs;
//assign vout2_vs = vs;
//assign vout2_de = de;
//assign vout2_data = {video_r,4'd0,video_g,4'd0,video_b,4'd0};
//assign hdmi_in_nreset = hdmi_nreset;
assign hdmi_out_nreset = hdmi_nreset;

//1920x1080 148.5Mhz
`ifdef  VIDEO_1920_1080
assign video_clk = clk_148_5;
`elsif VIDEO_3840_2160
assign video_clk = clk_297; 
`endif

//video_pll video_pll_m0
// (
//	// Clock in ports
//	.clk_in1_p         (sys_clk_p          ),
//	.clk_in1_n         (sys_clk_n          ),
//	// Clock out ports
//	.clk_out1          (clk_27m            ),
//	.clk_out2          (clk_148_5          ),
//	.clk_out3          (clk_297            ),
//	// Status and control signals
//	.reset             (1'b0               ),
//	.locked            (locked             )
// );

// Power on reset for HDMI Transmitter 
reset_power_on #
 (
    .FREQ(27),
   . MAX_TIME(200)
 ) 

reset_power_on_m0
 (            
	.clk                        (clk_27m                  ),               
	.user_rst                   (1'b0                     ),               //user reset high active
	.power_on_rst               (hdmi_nreset              )                //power on resethigh active     
 );
 
// Power on reset for i2c controller
reset_power_on #
  (
	.FREQ(27),
	.MAX_TIME(500)
  ) 
reset_power_on_m1
(            
	.clk                        (clk_27m                  ),               
	.user_rst                   (1'b0                     ),               //user reset high active
	.power_on_rst               (rst_n                    )                //power on resethigh active     
);

//I2C master controller
i2c_config i2c_config_m0(
	.rst                        (~rst_n                   ),
	.clk                        (clk_27m                  ),
	.clk_div_cnt                (16'd99                   ),
	.i2c_addr_2byte             (1'b0                     ),
	.lut_index                  (lut1_index               ),
	.lut_dev_addr               (lut1_data[31:24]         ),
	.lut_reg_addr               (lut1_data[23:8]          ),
	.lut_reg_data               (lut1_data[7:0]           ),
	.error                      (                         ),
	.done                       (                         ),
	.i2c_scl                    (hdmi1_scl                ),
	.i2c_sda                    (hdmi1_sda                )
);

//configure look-up table
lut_hdmi_out lut_m0(
	.lut_index                  (lut1_index               ),
	.lut_data                   (lut1_data                )
);


color_bar hdmi_color_bar(
	.clk               (video_clk          ),
	.rst               (1'b0               ),
	.hs                (hs                 ),
	.vs                (vs                 ),
	.de                (de                 ),
	.rgb_r             (video_r            ),
	.rgb_g             (video_g            ),
	.rgb_b             (video_b            )
);
endmodule