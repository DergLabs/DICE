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
//  2017/7/19     meisq          1.0         Original
//*******************************************************************************/


//Register Control
//Initialization, writes 0x00 to 0xC7 to reset and start TPI Mode
//Configure Input bus -> Register format: [7-6 TClkSel | 5 Input Bus width | 4 Edge Select | 3-0 Pixel Repetition Factor] -- 0x60 configures for 1x Tclk, Full wide pixel (24b), Falling edge, No replication
//Input data format -> Register format: [7-6 Input Color depth | 5-4 reserved | 3-2 Video range Expansion | 1-0 Input color space] -- 0x00 Configures for 8bpc, Auto range extension, RGB888 color space
//Output data format -> Register format: [7-6 Output Color depth | 5 Dithering | 4 Colorspace standard | 3-2 Video range compression | 1-0 Output Format] -- 0x00 Configures for 8bpc, No Dither, BT.601 conversion, Auto Range Compression, RGB888 color space
//Power State Control -> Register format: [7-5 reserved | 4 CTRL Pin Control | 3-2 Reserved | 1-0 TX Power State] -- 0x00 Configures for Tri-state CTROL Pin, TX Full operation
//TPI System Control -> Register format: [7 reserved | 6 Link integrity mode | 5 reserved | 4 TMDS Output Control | 3 AV Mute | 2 DDC Bus Req | 1 DDC Bus Grant | 0 Output Mode] -- 0x01 configures for Static link mode, Active TMDS, Normal AV, No DDC, DVI Mode
// Default

module lut_hdmi_out(
	input[9:0]             lut_index, // Look-up table index address
	output reg[31:0]       lut_data   // I2C device address register address register data
);

always@(*)
begin
	case(lut_index)
	    //To be compatible with the 16bit register address, add 8'h00 -- Format is (i2c Address 1 byte (0x72 in our case) | Register Address 2 bytes (MSB is always 0x00) | Register Data 1 byte)
		8'd0 : lut_data <=  {8'h72,16'hC7, 8'h00}; //Initialization
		8'd1 : lut_data <=  {8'h72,16'h08, 8'h60}; //Configure Input bus 
		8'd2 : lut_data <=  {8'h72,16'h09, 8'h00}; //Input data format 
		8'd3 : lut_data <=  {8'h72,16'h0A, 8'h00}; //Output data format
		8'd4 : lut_data <=  {8'h72,16'h1E, 8'h00}; //Power State Control 
		8'd5 : lut_data <=  {8'h72,16'h1A, 8'h01}; //TPI System Control
		default:lut_data <= {8'hff,16'hff, 8'hff}; // Default
	endcase
end


endmodule 