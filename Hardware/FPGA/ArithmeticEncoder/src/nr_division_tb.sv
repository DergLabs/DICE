`timescale 1ns / 1ps

module nr_division_tb #(
    parameter CLK_PERIOD = 5
)();

reg sys_clk = 0;
reg rest = 0;

always #CLK_PERIOD sys_clk <= ~sys_clk;

reg  [15:0] number = 91;
reg  [15:0] divisor = 1;
wire [15:0] result;

nr_division nr_division_inst (
    .clk        (sys_clk),
    .numerator  (number ),
    .denominator(divisor),
    .result     (result )
);

initial begin
    for(int i = 0; i < 50; i++) @(posedge sys_clk);

    $finish;
end

endmodule