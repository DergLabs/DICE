`timescale 1ns / 1ps

module out_bits_tb #(
    parameter CLK_PERIOD = 5
);

//Clocking and reset
reg clk = 0;
reg rst = 0;

always #CLK_PERIOD clk <= ~clk;

//Test signals
//Before: 0111000110111011 0101100001110110
//After:  1100011011101111 0110000111011000
reg  [15:0] upper_bound = 16'b0111000110111011;
reg  [15:0] lower_bound = 16'b0101100001110110;

wire [15:0] new_upper_bound;
wire [15:0] new_lower_bound;

wire [15:0] out_bits;
wire [15:0] out_bits_mask;
wire [ 4:0] out_bits_count;

out_bits out_bits_inst (
    .clk           (clk            ),
    .data_upper_in (upper_bound    ),
    .data_lower_in (lower_bound    ),
    .data_upper_out(new_upper_bound),
    .data_lower_out(new_lower_bound),
    .out_bits      (out_bits       ),
    .out_bits_mask (out_bits_mask  ),
    .out_bits_count(out_bits_count )
);

initial begin
    for(int i = 0; i < 50; i++) @(posedge clk);

    $finish;
end

endmodule