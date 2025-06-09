module nr_division (
    input         clk        ,
    input  [15:0] numerator  ,
    input  [15:0] denominator,
    output [15:0] result
);

wire [17:0] inverse;
wire [ 3:0] shift;

nr_inverse nr_inverse_inst (
    .clk        (clk),
    .divisor_in (denominator),
    .inverse_out(inverse),
    .shift_out  (shift)
);

wire [31:0] wide_1 = {16'd0, numerator};
wire [31:0] wide_2 = {14'd0, inverse  };
reg  [31:0] temp_1 = 0;
reg  [15:0] result_reg = 0;
always @(posedge clk) begin
    temp_1 = wide_1 * wide_2;
    result_reg <= (temp_1[31:16] >> (16 - shift));
end

assign result = result_reg;

endmodule