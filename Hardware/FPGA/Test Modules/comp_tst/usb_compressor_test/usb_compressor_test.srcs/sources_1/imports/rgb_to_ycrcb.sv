`timescale 1ns / 1ps

module rgb_to_ycrcb (
    input clk_i,
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
    localparam [15:0] COEFF_Y_R  = 1052;
    localparam [15:0] COEFF_Y_G  = 2065;
    localparam [15:0] COEFF_Y_B  = 401;
    localparam [15:0] COEFF_CR_R = 1799;
    localparam [15:0] COEFF_CR_G = 1507;
    localparam [15:0] COEFF_CR_B = 292;
    localparam [15:0] COEFF_CB_R = 607;
    localparam [15:0] COEFF_CB_G = 1192;
    localparam [15:0] COEFF_CB_B = 1799;

    //Intermediate signals for multiplication
    reg [23:0] y_r;
    reg [23:0] y_g;
    reg [23:0] y_b;
    reg [23:0] cr_r;
    reg [23:0] cr_g;
    reg [23:0] cr_b;
    reg [23:0] cb_r;
    reg [23:0] cb_g;
    reg [23:0] cb_b;
    reg valid_r1;

    // Intermediate signals for sums
    reg [23:0] y_temp;
    reg [23:0] cr_temp;
    reg [23:0] cb_temp;
    reg valid_r2;

    assign r = rgb_i[23:16];
    assign g = rgb_i[15:8];
    assign b = rgb_i[7:0];

    always @(posedge clk_i) begin
        // Calculate intermediate values
        y_r <= (COEFF_Y_R * r);
        y_g <= (COEFF_Y_G * g);
        y_b <= (COEFF_Y_B * b);

        cr_r <= (COEFF_CR_R * r);
        cr_g <= (COEFF_CR_G * g);
        cr_b <= (COEFF_CR_B * b);

        cb_r <= (COEFF_CB_R * r);
        cb_g <= (COEFF_CB_G * g);
        cb_b <= (COEFF_CB_B * b);

        valid_r1 <= rgb_valid_i;

        y_temp <= y_r + y_g + y_b + 65536;
        cr_temp <= cr_r - cr_g - cr_b + 524288;
        cb_temp <= cb_b - cb_r - cb_g + 524288;
        valid_r2 <= valid_r1;

    end

    assign y = y_temp[19:12] + y_temp[11];
    assign cr = cr_temp[19:12] + cr_temp[11]; // Take the upper 8 bits for Cr
    assign cb = cb_temp[19:12] + cb_temp[11]; // Take the upper 8 bits for Cb
    assign ycrcb_o = {cb, y, cr};
    assign ycrcb_valid_o = valid_r2;

endmodule