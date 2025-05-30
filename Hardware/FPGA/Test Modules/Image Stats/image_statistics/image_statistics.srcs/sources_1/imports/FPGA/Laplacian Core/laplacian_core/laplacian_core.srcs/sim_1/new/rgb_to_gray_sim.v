`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/07/2025 05:54:45 PM
// Design Name: 
// Module Name: rgb_to_gray_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rgb_to_gray_sim;
    reg clk;
    reg reset;
    reg valid_i;
    reg [23:0] pixel_i;
    wire valid_o;
    wire [7:0] pixel_o;


    rgb_to_gray inst1(
        .clk_i(clk),
        .rst_i(reset),
        .valid_i(valid_i),
        .pixel_i(pixel_i),
        .valid_o(valid_o),
        .pixel_o(pixel_o)
    );

    task sendpixel;
        input [23:0] pixel;
        begin
        pixel_i = pixel;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        end
    endtask

    initial begin
        reset = 1'b0;
        clk = 1'b1;
        valid_i = 1'b0;
        #50

        valid_i = 1'b1;
        sendpixel(24'hFFFFFF);
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        valid_i = 1'b0;
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        valid_i = 1'b1;
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;

        sendpixel(24'h00FF00);
        clk = 1'b0;
        #4
        clk = 1'b1;

        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;

        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;

        sendpixel(24'hFF0000);
        clk = 1'b0;
        #4
        clk = 1'b1;

        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;

        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;

        sendpixel(24'h000000);
        clk = 1'b0;
        #4
        clk = 1'b1;

        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;

        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;

        sendpixel(24'hFFFFFF);
        clk = 1'b0;
        #4
        clk = 1'b1;

        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;

        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;

        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;

        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        
        #4;
        clk = 1'b0;
        #4
        clk = 1'b1;
        #4;
    end 

endmodule
