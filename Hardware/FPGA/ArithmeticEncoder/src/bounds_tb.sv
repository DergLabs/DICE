module bounds_tb #(
    parameter CLK_PERIOD = 5
)();

//Clocking and reset
reg sys_clk = 0;
reg rst = 0;

always #CLK_PERIOD sys_clk <= ~sys_clk;

wire clk = sys_clk;

//Test signals
reg [15:0] prob_upper_bound = 2;
reg [15:0] prob_lower_bound = 0;
reg [15:0] prob_range = 4;

reg [15:0] working_upper_bound = 16'hFFFF;
reg [15:0] working_lower_bound = 16'h0000;

reg valid_in = 0;

//Connective signals
wire [15:0] inverse_out;

wire [15:0] new_upper_bound;
wire [15:0] new_lower_bound;
wire        valid_out;

//Current pipeline
wire inverse_valid;

radix_inverse radix_inverse_inst (
    .clk        (clk          ),
    .divisor_in (prob_range   ),
    .inverse_out(inverse_out  ),
    .valid_in   (valid_in     ),
    .valid_out  (inverse_valid)
);

bounds_calc bounds_calc_inst (
    .clk           (clk                ),
    .prob_upper_in (prob_upper_bound   ),
    .prob_lower_in (prob_lower_bound   ),
    .prob_range_in (inverse_out        ),
    .work_upper_in (working_upper_bound),
    .work_lower_in (working_lower_bound),
    .work_upper_out(new_upper_bound    ),
    .work_lower_out(new_lower_bound    ),
    .valid_in      (inverse_valid      ),
    .valid_out     (valid_out          )
);

initial begin
    for(int i = 0; i < 10; i++) @(posedge clk);

    valid_in <= 1'b1;
    @(posedge clk);
    valid_in <= 1'b0;

    for(int i = 0; i < 32; i++) @(posedge clk);

    $finish;
end

endmodule