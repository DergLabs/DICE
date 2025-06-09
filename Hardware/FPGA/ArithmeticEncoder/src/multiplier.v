module (
    input         clk            ,
    input  [15:0] lower_bound    ,
    input  [15:0] upper_bound    ,
    input  [15:0] total_count_inv,
    input  [15:0] range_lower_in ,
    input  [15:0] range_upper_in ,
    output [15:0] range_lower_out,
    output [15:0] range_upper_out
);

reg [15:0] range_diff;

reg [31:0] upper_div_result;
reg [31:0] lower_div_result;

wire [15:0] upper_shifted;
wire [15:0] lower_shifted;

assign upper_shifted = upper_div_result[31:16];
assign lower_shifted = lower_div_result[31:16];

reg [15:0] upper_mul_result;
reg [15:0] lower_mul_result;

reg [15:0] upper_add_result;
reg [15:0] lower_add_result;

assign range_lower_out = lower_add_result;
assign range_upper_out = upper_add_result;

always @(posedge clk) begin
    //Stage one
    range_diff <= range_upper - range_lower;

    upper_div_result <= upper_bound * total_count_inv;
    lower_div_result <= lower_bound * total_count_inv;

    //Stage 2
    upper_mul_result <= upper_shifted * range_diff;
    lower_mul_result <= lower_shifted * range_diff;

    //Stage 3
    upper_add_reuslt <= upper_mul_result + range_lower;
    lower_add_result <= lower_mul_result + range_lower;
end

endmodule