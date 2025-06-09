//Latency: 25
module nr_inverse (
    input         clk        ,
    input  [15:0] divisor_in ,
    output [17:0] inverse_out,
    output [ 3:0] shift_out  ,
    input         valid_in   ,
    output        valid_out
);

//===============================================
// Pipeline: Two iterations of  x * (2 - x * a)
//===============================================

//Normalize divisor into range [0.5, 1] with 16 bits left of radix point (1)
//Produce initial guess for x
//Also gives amount shifted to be pipelined
wire [15:0] a_norm;
wire [15:0] x_init;
wire [ 3:0] s;

nr_init step_1_inst (
    .clk  (clk       ),
    .d_in (divisor_in),
    .a_out(a_norm    ),
    .x_out(x_init    ),
    .s_out(s         )
);

reg [23:0][3:0] s_pipe;
always @(posedge clk) begin
    s_pipe[0] <= s;
    s_pipe[23:1] <= s_pipe[22:0];
end

//First Newton-Raphson iteration (8)
wire [17:0] a_norm_ext = {2'd0, a_norm};
wire [17:0] x_init_ext = {2'd0, x_init};

wire [17:0] x_1;
wire [17:0] a_1;

nr_stage iteration_1 (
    .clk  (clk       ),
    .a_in (a_norm_ext),
    .x_in (x_init_ext),
    .o_out(x_1       ),
    .a_out(a_1       )
);

//Second Newton-Raphson iteration (8)
wire [17:0] x_2;
wire [17:0] a_2;

nr_stage iteration_2 (
    .clk  (clk),
    .a_in (a_1),
    .x_in (x_1),
    .o_out(x_2),
    .a_out(a_2)
);

//Third Newton-Raphson iteration (8)
wire [17:0] x_3;
wire [17:0] a_3;

nr_stage iteration_3 (
    .clk  (clk),
    .a_in (a_2),
    .x_in (x_2),
    .o_out(x_3),
    .a_out(a_3)
);

assign inverse_out = x_3;
assign shift_out = s_pipe[23];

endmodule