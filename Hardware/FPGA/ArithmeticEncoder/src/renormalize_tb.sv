module renormalize_tb #(
    parameter CLK_PERIOD = 5
);

reg clk = 0;
reg rst = 0;

always #CLK_PERIOD clk <= ~clk;

//Before: 1100011011101111 0110000111011000
//After:  1100011011101111 0110000111011000
reg [15:0] upper_bound_in = 16'b1100011011101111;
reg [15:0] lower_bound_in = 16'b0110000111011000;

wire [15:0] upper_bound_out;
wire [15:0] lower_bound_out;
wire [ 4:0] pending_out; // 0 => 2

renormalize renormalize_inst (
    .clk           (clk            ),
    .data_upper_in (upper_bound_in ),
    .data_lower_in (lower_bound_in ),
    .data_upper_out(upper_bound_out),
    .data_lower_out(lower_bound_out),
    .pending_out   (pending_out    )
);

initial begin
    for(int i = 0; i < 10; i++) @(posedge clk);

    $finish;
end

endmodule