module bounds_calc (
    input         clk           ,
    input  [15:0] prob_upper_in ,
    input  [15:0] prob_lower_in ,
    input  [16:0] prob_range_in ,
    input  [15:0] work_upper_in ,
    input  [15:0] work_lower_in ,
    output [15:0] work_upper_out,
    output [15:0] work_lower_out,
    input         valid_in      ,
    output        valid_out
);

//Valid signal propogation
reg [4:0] valid_reg = 0;

always @(posedge clk) begin
    valid_reg[0] <= valid_in;
    valid_reg[4:1] <= valid_reg[3:0];
end

assign valid_out = valid_reg[4];

//Bounds calculations, should take 5 cycles
wire [15:0] new_upper_bound;
wire [15:0] new_lower_bound;

bound_calc #(
    .SUB(1)
)
upper_bound_calc_inst (
    .clk          (clk            ),
    .prob_upper_in(prob_upper_in  ),
    .prob_lower_in(prob_lower_in  ),
    .prob_range_in(prob_range_in  ),
    .work_upper_in(work_upper_in  ),
    .work_lower_in(work_lower_in  ),
    .bound_in     (prob_upper_in  ),
    .bound_out    (new_upper_bound)
);

bound_calc #(
    .SUB(0)
)
lower_bound_calc_inst (
    .clk          (clk            ),
    .prob_upper_in(prob_upper_in  ),
    .prob_lower_in(prob_lower_in  ),
    .prob_range_in(prob_range_in  ),
    .work_upper_in(work_upper_in  ),
    .work_lower_in(work_lower_in  ),
    .bound_in     (prob_lower_in  ),
    .bound_out    (new_lower_bound)
);

assign work_upper_out = new_upper_bound;
assign work_lower_out = new_lower_bound;

endmodule