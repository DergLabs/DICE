`timescale 1ns / 1ps

module radix_division_tb #(
    parameter CLK_PERIOD = 5
);

//Clocking and reset
reg clk = 0;
reg rst = 0;

always #CLK_PERIOD clk <= ~clk;

//Inverse division test
reg [15:0] number = 16'd128;
reg [15:0] divisor = 16'd3;

wire [16:0] inverse;

radix_inverse radix_inverse_inst (
    .clk        (clk    ),
    .divisor_in (divisor),
    .inverse_out(inverse)
);

wire [31:0] wide_inverse = {15'd0, inverse};
wire [31:0] wide_number = {16'd0, number};

reg  [31:0] product = 0;

reg  [15:0] final_result = 0;

initial begin
    //Give values time to flow through inverse module
    for(int i = 0; i < 32; i++) @(posedge clk);

    //Multiply by inverse for division
    product <= wide_inverse * wide_number;
    @(posedge clk);

    final_result <= product[31:16];
    @(posedge clk);

    //Pad out end of simulation
    for(int i = 0; i < 10; i++) @(posedge clk);

    $finish;
end

endmodule