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

`include "video_define.v"

module lut_hdmi_out(
	input[9:0]             lut_index, // Look-up table index address
	output reg[31:0]       lut_data   // I2C device address register address register data
);

//1920x1080 148.5Mhz
`ifdef  VIDEO_1920_1080
parameter PIXEL_CLK_LSB = 8'h02; //148.5Mhz/10,000 
parameter PIXEL_CLK_MSB = 8'h3A;

parameter V_CLK_LSB = 8'h3C; //60Hz
parameter V_CLK_MSB = 8'h00;

parameter H_PIXELS_LSB = 8'h80; //1920 horizontal pixels
parameter H_PIXELS_MSB  = 8'h07;

parameter V_PIXELS_LSB = 8'h38; //1080 vertical pixels
parameter V_PIXELS_MSB  = 8'h04;

//3840x2160 297Mhz
`elsif  VIDEO_3840_2160
parameter PIXEL_CLK_LSB = 8'h04; //297Mhz/10,000 
parameter PIXEL_CLK_MSB = 8'h74;

parameter V_CLK_LSB = 8'h1E; //60Hz
parameter V_CLK_MSB = 8'h00;

parameter H_PIXELS_LSB = 8'h00; //3840 horizontal pixels
parameter H_PIXELS_MSB  = 8'h0F;

parameter V_PIXELS_LSB = 8'h70; //2160 vertical pixels
parameter V_PIXELS_MSB  = 8'h08;
//720p60
`elsif VIDEO_1280_720
parameter PIXEL_CLK_LSB = 8'h01; //74.25Mhz/10,000 
parameter PIXEL_CLK_MSB = 8'h1D;

parameter V_CLK_LSB = 8'h3C; //60Hz
parameter V_CLK_MSB = 8'h00;

parameter H_PIXELS_LSB = 8'h00; //1280 horizontal pixels
parameter H_PIXELS_MSB  = 8'h05;

parameter V_PIXELS_LSB = 8'hD0; //720 vertical pixels
parameter V_PIXELS_MSB  = 8'h02;
//480p60
`elsif VIDEO_640_480
parameter PIXEL_CLK_LSB = 8'hD5; //25.175Mhz/10,000 
parameter PIXEL_CLK_MSB = 8'h09;

parameter V_CLK_LSB = 8'h3C; //60Hz
parameter V_CLK_MSB = 8'h00;

parameter H_PIXELS_LSB = 8'h80; //640 horizontal pixels
parameter H_PIXELS_MSB  = 8'h02;

parameter V_PIXELS_LSB = 8'hE0; //480 vertical pixels
parameter V_PIXELS_MSB  = 8'h01;
// Default to 640x480
`else
parameter PIXEL_CLK_LSB = 8'hD5; //25.175Mhz/10,000 
parameter PIXEL_CLK_MSB = 8'h09;

parameter V_CLK_LSB = 8'h3C; //60Hz
parameter V_CLK_MSB = 8'h00;

parameter H_PIXELS_LSB = 8'h80; //640 horizontal pixels
parameter H_PIXELS_MSB  = 8'h02;

parameter V_PIXELS_LSB = 8'hE0; //480 vertical pixels
parameter V_PIXELS_MSB  = 8'h01;

`endif

always@(*)
begin
	case(lut_index)
	    //To be compatible with the 16bit register address, add 8'h00 -- Format is (i2c Address 1 byte (0x72 in our case) | Register Address 2 bytes (MSB is always 0x00) | Register Data 1 byte)
		8'd0 : lut_data <=  {8'h72,16'hC7, 8'h00}; 
		8'd1 : lut_data <=  {8'h72,16'hC7, 8'h00}; 
		8'd2 : lut_data <=  {8'h72,16'h1A, 8'h11}; 
		8'd3 : lut_data <=  {8'h72,16'h1E, 8'h00}; 
		8'd4 : lut_data <=  {8'h72,16'h00, 8'hD5}; 
		8'd5 : lut_data <=  {8'h72,16'h01, 8'h09}; 
		8'd6 : lut_data <=  {8'h72,16'h02, 8'h3C}; 
		8'd7 : lut_data <=  {8'h72,16'h03, 8'h00}; 
		8'd8 : lut_data <=  {8'h72,16'h04, 8'h80};
		8'd9 : lut_data <=  {8'h72,16'h05, 8'h02};
		8'd10: lut_data <=  {8'h72,16'h06, 8'hE0};
		8'd11: lut_data <=  {8'h72,16'h07, 8'h01};
		8'd12: lut_data <=  {8'h72,16'h08, 8'h60};
		8'd13: lut_data <=  {8'h72,16'h09, 8'h00};
		8'd14: lut_data <=  {8'h72,16'h0A, 8'h00};
		8'd15: lut_data <=  {8'h72,16'h1A, 8'h01};
		default:lut_data <= {8'hff,16'hff, 8'hff}; 
	endcase
end


endmodule