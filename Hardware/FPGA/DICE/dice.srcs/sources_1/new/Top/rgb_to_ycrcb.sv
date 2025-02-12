`timescale 1ns / 1ps

module rgb_to_ycrcb (
    input clk_i,
    input rst_i,
    input wire [23:0] rgb_i,
    input wire rgb_valid_i,     // input valid signal
    output wire [23:0] ycrcb_o,  // Luma component
    output wire ycrcb_valid_o   // output valid signal
);

    wire [7:0] r;  // Red component
    wire [7:0] g;  // Green component
    wire [7:0] b;  // Blue component
    wire [7:0] y;  // Luma component
    wire [7:0] cr; // Red_difference chroma component
    wire [7:0] cb; // Blue_difference chroma component

    // Fixed-point coefficients for YCrCb conversion
    localparam [15:0] COEFF_Y_R  = 19595;
    localparam [15:0] COEFF_Y_G  = 38469;
    localparam [15:0] COEFF_Y_B  = 7471;

    localparam [15:0] COEFF_CR = 46727;
    localparam [15:0] COEFF_CB = 36926;

    //Intermediate signals for multiplication
    //reg [23:0] y;

    reg validr;

    // Intermediate signals for sums
    reg [23:0] y_mult_temp;
    reg [23:0] y_temp;

    reg [23:0] cr_temp;
    reg [23:0] cr_mult_temp;
    reg [23:0] cr_shift_temp;

    reg [23:0] cb_temp;
    reg [23:0] cb_mult_temp;
    reg [23:0] cb_shift_temp;

    reg [23:0] ry_temp;
    reg [23:0] by_temp;

    reg [7:0] r1; 
    reg [7:0] b1; 

    reg [7:0] r2;
    reg [7:0] b2;

    reg [7:0] yr;
    

    assign r = rgb_i[23:16];
    assign g = rgb_i[15:8];
    assign b = rgb_i[7:0];
    
    // Generate Y component with async reset
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            y_mult_temp <= 24'd0;
            y_temp <= 24'd0;
        end
        else begin
            y_mult_temp <= (COEFF_Y_R * r) + (COEFF_Y_G * g) + (COEFF_Y_B * b);
            y_temp <= y_mult_temp >> 16;
        end
    end

    // delay registers with async reset
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            r1 <= 8'd0;
            b1 <= 8'd0;
            r2 <= 8'd0;
            b2 <= 8'd0;
        end
        else begin
            r1 <= r;
            b1 <= b;
            r2 <= r1;
            b2 <= b1;
        end
    end

    data_delay_reg #(.SHIFT_DEPTH(6), .DATA_WIDTH(1)) valid_delay_reg (
        .clk_i(clk_i),
        .ce_i(1'b1),
        .rst_i(rst_i),
        .data_i(rgb_valid_i),
        .data_o(validr)
    );

    data_delay_reg #(.SHIFT_DEPTH(4), .DATA_WIDTH(8)) y_delay_reg (
        .clk_i(clk_i),
        .ce_i(1'b1),
        .rst_i(rst_i),
        .data_i(y_temp[7:0]),
        .data_o(yr)
    );
    
    // Generate Cr and Cb components with async reset
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            ry_temp <= 24'd0;
            by_temp <= 24'd0;
            cr_mult_temp <= 24'd0;
            cb_mult_temp <= 24'd0;
            cr_shift_temp <= 24'd0;
            cb_shift_temp <= 24'd0;
            cr_temp <= 24'd0;
            cb_temp <= 24'd0;
        end
        else begin
            ry_temp <= r2 - y_temp;
            by_temp <= b2 - y_temp;
            cr_mult_temp <= ry_temp * COEFF_CR;
            cb_mult_temp <= by_temp * COEFF_CB;
            cr_shift_temp <= cr_mult_temp >> 16;
            cb_shift_temp <= cb_mult_temp >> 16;
            cr_temp <= cr_shift_temp + 128;
            cb_temp <= cb_shift_temp + 128;
        end
    end

    assign y = yr;
    assign cr = cr_temp[7 : 0];
    assign cb = cb_temp[7 : 0];
    assign ycrcb_o = {cb, y, cr};
    assign ycrcb_valid_o = validr;

endmodule