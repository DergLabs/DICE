//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
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
//  2017/8/9     meisq          1.0         Original
//*******************************************************************************/
module reset_power_on(
	input              clk,
	input              user_rst,          //user reset, high active
	output             power_on_rst       //power on reset,high active     
);
//// ---------------- internal constants --------------
parameter N = 32 ;             // debounce timer bitwidth
parameter FREQ = 50;           //model clock :Mhz
parameter MAX_TIME = 200;      //ms
localparam TIMER_MAX_VAL =   MAX_TIME * 1000 * FREQ;

reg[N - 1:0] cnt = 0;
reg rst_reg;
assign power_on_rst = rst_reg;
always@(posedge clk or posedge user_rst)
begin
	if(user_rst == 1'b1)
		cnt <= 0;
	else if(cnt < TIMER_MAX_VAL)
		cnt <= cnt + 1;
	else
		cnt <= cnt;
end
always@(posedge clk)
	rst_reg <= (cnt < TIMER_MAX_VAL) ? 1'b0 : 1'b1;
endmodule 