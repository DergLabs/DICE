//Latency: 6
module bound_calc #(
    parameter SUB = 1
)(
    input         clk          ,
    input  [15:0] prob_upper_in,
    input  [15:0] prob_lower_in,
    input  [16:0] prob_range_in,
    input  [15:0] work_upper_in,
    input  [15:0] work_lower_in,
    input  [15:0] bound_in     ,
    output [15:0] bound_out    
);

//range = (upper - lower) + 1
//      = (upper + (~lower + 1)) + 1
//      = upper + ~lower + 2
//wire [15:0] inv_work_lower = ~work_lower_in;
wire [16:0] work_range = work_upper_in - work_lower_in + 1;
reg  [16:0] work_range_reg;

//(range * upper_bound)
reg  [15:0] bound_reg;
wire [31:0] prod1 = work_range_reg * bound_reg;
reg  [31:0] prod1_reg;

//(range * upper_bound) * inv_total
//prod1 = range * upper_bound
//prod1_upper = prod1[31:16]
//prod1_power = prod1[15:0]
//partial_upper = prod1_upper * inv_total
//partial_lower = prod1_lower * inv_total
//prod2 = ((partial_upper << 16) + partial_lower) >> 16
//      = partial_upper + (partial_lower >> 16)
//      = partial_upper + {8'd0, partial_lower[15:8]}

//        [31:16][15: 0] | {16'd0}
//        {16'd0}[31:16] | [15: 0]
//        <----kept---->   <drop>

reg  [16:0] prob_range_reg1;
reg  [16:0] prob_range_reg2;

wire [15:0] prod1_upper = prod1_reg[31:16];
wire [15:0] prod1_lower = prod1_reg[15: 0];

wire [31:0] prod2_upper = prod1_upper * prob_range_reg2;
wire [31:0] prod2_lower = prod1_lower * prob_range_reg2;

reg  [31:0] prod2_upper_reg;
reg  [31:0] prod2_lower_reg;

wire [15:0] prod2_lower_shift = {16'd0, prod2_lower_reg[31:16]};
wire [31:0] prod2 = prod2_upper_reg + prod2_lower_shift;

reg  [31:0] prod2_reg;

//(lower - 1) + ((range * upper_bound) * inv_total)
reg  [15:0] working_lower_reg1;
reg  [15:0] working_lower_reg2;
reg  [15:0] working_lower_reg3;

wire [15:0] lower_m1 = working_lower_reg3 - SUB;
reg  [15:0] lower_reg;

wire [15:0] final_sum = lower_reg + prod2_reg[15:0];
reg  [15:0] new_bound;

always @(posedge clk) begin
    //Step 1
    bound_reg <= bound_in;
    work_range_reg <= work_range;
    prob_range_reg1 <= prob_range_in;
    working_lower_reg1 <= work_lower_in;

    //Step 2
    prod1_reg <= prod1;
    prob_range_reg2 <= prob_range_reg1;
    working_lower_reg2 <= working_lower_reg1;

    //Step 3
    prod2_upper_reg <= prod2_upper;
    prod2_lower_reg <= prod2_lower;
    working_lower_reg3 <= working_lower_reg2;

    //Step 4
    prod2_reg <= prod2;
    lower_reg <= lower_m1;

    //Step 5
    new_bound <= final_sum;
end

assign bound_out = new_bound;

endmodule