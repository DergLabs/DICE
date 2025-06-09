//Produces 17 bit inverse with 1 integer bit and 16 fraction bits
//Writing everything ad-hoc for now
module radix_inverse (
    input         clk        ,
    input  [15:0] divisor_in ,
    output [16:0] inverse_out,
    input         valid_in   ,
    output        valid_out
);

//===============================================
// Division pipeline for (1 / divisor)
//===============================================
//Latency: 17
reg  [31:0] stage_reg   [15:0];
reg  [31:0] divisor_reg [15:0];
reg  [16:0] result_reg  [16:0];

initial begin
    for(int i = 0; i < 16; i++) stage_reg[i] <= 0;
    for(int i = 0; i < 16; i++) divisor_reg[i] <= 0;
    for(int i = 0; i < 17; i++) result_reg[i] <= 0;
end

wire [32:0] sub_1  =       33'h10000 - {divisor_in, 16'd0};
wire [32:0] sub_2  = {1'd0, stage_reg[ 0]} - divisor_reg[ 0];
wire [32:0] sub_3  = {1'd0, stage_reg[ 1]} - divisor_reg[ 1];
wire [32:0] sub_4  = {1'd0, stage_reg[ 2]} - divisor_reg[ 2];
wire [32:0] sub_5  = {1'd0, stage_reg[ 3]} - divisor_reg[ 3];
wire [32:0] sub_6  = {1'd0, stage_reg[ 4]} - divisor_reg[ 4];
wire [32:0] sub_7  = {1'd0, stage_reg[ 5]} - divisor_reg[ 5];
wire [32:0] sub_8  = {1'd0, stage_reg[ 6]} - divisor_reg[ 6];
wire [32:0] sub_9  = {1'd0, stage_reg[ 7]} - divisor_reg[ 7];
wire [32:0] sub_10 = {1'd0, stage_reg[ 8]} - divisor_reg[ 8];
wire [32:0] sub_11 = {1'd0, stage_reg[ 9]} - divisor_reg[ 9];
wire [32:0] sub_12 = {1'd0, stage_reg[10]} - divisor_reg[10];
wire [32:0] sub_13 = {1'd0, stage_reg[11]} - divisor_reg[11];
wire [32:0] sub_14 = {1'd0, stage_reg[12]} - divisor_reg[12];
wire [32:0] sub_15 = {1'd0, stage_reg[13]} - divisor_reg[13];
wire [32:0] sub_16 = {1'd0, stage_reg[14]} - divisor_reg[14];
wire [32:0] sub_17 = {1'd0, stage_reg[15]} - divisor_reg[15];

wire positive_1  = ~sub_1 [32];
wire positive_2  = ~sub_2 [32];
wire positive_3  = ~sub_3 [32];
wire positive_4  = ~sub_4 [32];
wire positive_5  = ~sub_5 [32];
wire positive_6  = ~sub_6 [32];
wire positive_7  = ~sub_7 [32];
wire positive_8  = ~sub_8 [32];
wire positive_9  = ~sub_9 [32];
wire positive_10 = ~sub_10[32];
wire positive_11 = ~sub_11[32];
wire positive_12 = ~sub_12[32];
wire positive_13 = ~sub_13[32];
wire positive_14 = ~sub_14[32];
wire positive_15 = ~sub_15[32];
wire positive_16 = ~sub_16[32];
wire positive_17 = ~sub_17[32];

always @(posedge clk) begin
    divisor_reg[ 0] <= {1'd0, divisor_in, 15'd0};
    divisor_reg[ 1] <= divisor_reg[ 0] >> 1;
    divisor_reg[ 2] <= divisor_reg[ 1] >> 1;
    divisor_reg[ 3] <= divisor_reg[ 2] >> 1;
    divisor_reg[ 4] <= divisor_reg[ 3] >> 1;
    divisor_reg[ 5] <= divisor_reg[ 4] >> 1;
    divisor_reg[ 6] <= divisor_reg[ 5] >> 1;
    divisor_reg[ 7] <= divisor_reg[ 6] >> 1;
    divisor_reg[ 8] <= divisor_reg[ 7] >> 1;
    divisor_reg[ 9] <= divisor_reg[ 8] >> 1;
    divisor_reg[10] <= divisor_reg[ 9] >> 1;
    divisor_reg[11] <= divisor_reg[10] >> 1;
    divisor_reg[12] <= divisor_reg[11] >> 1;
    divisor_reg[13] <= divisor_reg[12] >> 1;
    divisor_reg[14] <= divisor_reg[13] >> 1;
    divisor_reg[15] <= divisor_reg[14] >> 1;
end

always @(posedge clk) begin
    //If subtraction result is negative, skip
    stage_reg[0 ] <= positive_1  ? sub_1 [31:0] : {32'h10000};
    stage_reg[1 ] <= positive_2  ? sub_2 [31:0] : stage_reg[0 ];
    stage_reg[2 ] <= positive_3  ? sub_3 [31:0] : stage_reg[1 ];
    stage_reg[3 ] <= positive_4  ? sub_4 [31:0] : stage_reg[2 ];
    stage_reg[4 ] <= positive_5  ? sub_5 [31:0] : stage_reg[3 ];
    stage_reg[5 ] <= positive_6  ? sub_6 [31:0] : stage_reg[4 ];
    stage_reg[6 ] <= positive_7  ? sub_7 [31:0] : stage_reg[5 ];
    stage_reg[7 ] <= positive_8  ? sub_8 [31:0] : stage_reg[6 ];
    stage_reg[8 ] <= positive_9  ? sub_9 [31:0] : stage_reg[7 ];
    stage_reg[9 ] <= positive_10 ? sub_10[31:0] : stage_reg[8 ];
    stage_reg[10] <= positive_11 ? sub_11[31:0] : stage_reg[9 ];
    stage_reg[11] <= positive_12 ? sub_12[31:0] : stage_reg[10];
    stage_reg[12] <= positive_13 ? sub_13[31:0] : stage_reg[11];
    stage_reg[13] <= positive_14 ? sub_14[31:0] : stage_reg[12];
    stage_reg[14] <= positive_15 ? sub_15[31:0] : stage_reg[13];
    stage_reg[15] <= positive_16 ? sub_16[31:0] : stage_reg[14];
end

always @(posedge clk) begin
    result_reg[ 0] <= positive_1  ? 17'h10000 : 17'h00000;
    result_reg[ 1] <= positive_2  ? result_reg[ 0] | 17'h08000 : result_reg[ 0];
    result_reg[ 2] <= positive_3  ? result_reg[ 1] | 17'h04000 : result_reg[ 1];
    result_reg[ 3] <= positive_4  ? result_reg[ 2] | 17'h02000 : result_reg[ 2];
    result_reg[ 4] <= positive_5  ? result_reg[ 3] | 17'h01000 : result_reg[ 3];
    result_reg[ 5] <= positive_6  ? result_reg[ 4] | 17'h00800 : result_reg[ 4];
    result_reg[ 6] <= positive_7  ? result_reg[ 5] | 17'h00400 : result_reg[ 5];
    result_reg[ 7] <= positive_8  ? result_reg[ 6] | 17'h00200 : result_reg[ 6];
    result_reg[ 8] <= positive_9  ? result_reg[ 7] | 17'h00100 : result_reg[ 7];
    result_reg[ 9] <= positive_10 ? result_reg[ 8] | 17'h00080 : result_reg[ 8];
    result_reg[10] <= positive_11 ? result_reg[ 9] | 17'h00040 : result_reg[ 9];
    result_reg[11] <= positive_12 ? result_reg[10] | 17'h00020 : result_reg[10];
    result_reg[12] <= positive_13 ? result_reg[11] | 17'h00010 : result_reg[11];
    result_reg[13] <= positive_14 ? result_reg[12] | 17'h00008 : result_reg[12];
    result_reg[14] <= positive_15 ? result_reg[13] | 17'h00004 : result_reg[13];
    result_reg[15] <= positive_16 ? result_reg[14] | 17'h00002 : result_reg[14];
    result_reg[16] <= positive_17 ? result_reg[15] | 17'h00001 : result_reg[15];
end

assign inverse_out = result_reg[16];

//===============================================
// shift value for normalization
//===============================================
//TODO: I don't think I need to shift because there's no normalization step
/*
wire [15:0] lower = divisor_reg[15][15:0];

reg  [ 3:0] shift_reg = 0;

//TODO: See if this should be replaced with a casez statement
always @(posedge clk) begin
    if(lower[15:15] == 1) shift_reg <= 4'd0;
    if(lower[15:14] == 1) shift_reg <= 4'd1;
    if(lower[15:13] == 1) shift_reg <= 4'd2;
    if(lower[15:12] == 1) shift_reg <= 4'd3;
    if(lower[15:11] == 1) shift_reg <= 4'd4;
    if(lower[15:10] == 1) shift_reg <= 4'd5;
    if(lower[15: 9] == 1) shift_reg <= 4'd6;
    if(lower[15: 8] == 1) shift_reg <= 4'd7;
    if(lower[15: 7] == 1) shift_reg <= 4'd8;
    if(lower[15: 6] == 1) shift_reg <= 4'd9;
    if(lower[15: 5] == 1) shift_reg <= 4'd10;
    if(lower[15: 4] == 1) shift_reg <= 4'd11;
    if(lower[15: 3] == 1) shift_reg <= 4'd12;
    if(lower[15: 2] == 1) shift_reg <= 4'd13;
    if(lower[15: 1] == 1) shift_reg <= 4'd14;
    if(lower[15: 0] == 1) shift_reg <= 4'd15;
end

assign shift_out = shift_reg;
*/

reg [16:0] pipe_valid = 17'd0;

always @(posedge clk) begin
    pipe_valid[0] <= valid_in;
    pipe_valid[16:1] <= pipe_valid[15:0];
end

assign valid_out = pipe_valid[16];

endmodule