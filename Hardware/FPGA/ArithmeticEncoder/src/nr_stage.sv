//Latency: 8
module nr_stage (
    input         clk  ,
    input  [17:0] a_in ,
    input  [17:0] x_in ,
    output [17:0] o_out,
    output [17:0] a_out
);

//============================================
// First stage of x * (2 - x * a)
//============================================
wire [17:0] s1_a = a_in; //{2'b0, a_in};
wire [17:0] s1_b = x_in; //{2'b0, x_in};
wire [35:0] prod_ax;

//(A*B)
dsp_division_stage_1 dsp_stage_1_inst (
    .CLK(clk    ),  // input wire CLK
    .A  (s1_a   ),  // input wire [17 : 0] A
    .B  (s1_b   ),  // input wire [17 : 0] B
    .P  (prod_ax)   // output wire [35 : 0] P
);

//Shift register for x values so this is pipelined
reg  [3:0][17:0] x_pipe = 0;
always @(posedge clk) begin
    x_pipe[0] <= x_in;
    x_pipe[3:1] <= x_pipe[2:0];
end

//============================================
// Second stage of x * (2 - x * a)
//============================================
/*
wire [17:0] s2_a = prod_ax[33:16]; //{2'b0, prod_ax[31:16]};
reg  [17:0] s2_d = 18'h2_0000;
wire [17:0] s2_b = x_pipe[3]; //{2'b0, x_pipe[3]};
wire [36:0] prod_dab;

//(D-A)*B
dsp_division_stage_2 dsp_stage_2_inst (
    .CLK(clk     ),  // input wire CLK
    .A  (s2_a    ),  // input wire [17 : 0] A
    .B  (s2_b    ),  // input wire [17 : 0] B
    .D  (s2_d    ),  // input wire [17 : 0] D
    .P  (prod_dab)   // output wire [36 : 0] P
);
*/
wire [17:0] prod_ax_shft = prod_ax[33:16];
wire [17:0] s2_a = 18'h20000 - prod_ax_shft;
wire [17:0] s2_b = x_pipe[3];
wire [35:0] prod_dab;

dsp_division_stage_1 dsp_stage_2_inst (
    .CLK(clk     ),  // input wire CLK
    .A  (s2_a    ),  // input wire [17 : 0] A
    .B  (s2_b    ),  // input wire [17 : 0] B
    .P  (prod_dab)   // output wire [35 : 0] P
);

//============================================
// Output stuff
//============================================
reg [7:0][17:0] a_pipe = 0;
always @(posedge clk) begin
    a_pipe[0] <= a_in;
    a_pipe[7:1] <= a_pipe[6:0];
end

assign o_out = prod_dab[33:16];
assign a_out = a_pipe[7];

endmodule