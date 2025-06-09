module out_bits (
    input         clk           ,
    input  [15:0] data_upper_in ,
    input  [15:0] data_lower_in ,
    output [15:0] data_upper_out,
    output [15:0] data_lower_out,
    output [15:0] out_bits      ,
    output [15:0] out_bits_mask ,
    output [ 4:0] out_bits_count,
    input         valid_in      ,
    output        valid_out
);

reg  [15:0] pending = 0;
reg  [15:0] data_upper_temp = 0;
reg  [15:0] data_lower_temp = 0;

wire [15:0] overflow;

reg  [15:0] out_bits_reg = 0;
reg  [ 4:0] num_bits = 0;

reg         valid_reg;

assign out_bits = out_bits_reg;
assign out_bits_count = num_bits;

assign valid_out = valid_reg;

always @(posedge clk) begin
    out_bits_reg <= data_lower_in;
    valid_reg <= valid_in;
end

//Being explicit for now
assign overflow[ 0] = data_upper_in[ 0] == 0 || data_lower_in[ 0] == 1;
assign overflow[ 1] = data_upper_in[ 1] == 0 || data_lower_in[ 1] == 1;
assign overflow[ 2] = data_upper_in[ 2] == 0 || data_lower_in[ 2] == 1;
assign overflow[ 3] = data_upper_in[ 3] == 0 || data_lower_in[ 3] == 1;
assign overflow[ 4] = data_upper_in[ 4] == 0 || data_lower_in[ 4] == 1;
assign overflow[ 5] = data_upper_in[ 5] == 0 || data_lower_in[ 5] == 1;
assign overflow[ 6] = data_upper_in[ 6] == 0 || data_lower_in[ 6] == 1;
assign overflow[ 7] = data_upper_in[ 7] == 0 || data_lower_in[ 7] == 1;
assign overflow[ 8] = data_upper_in[ 8] == 0 || data_lower_in[ 8] == 1;
assign overflow[ 9] = data_upper_in[ 9] == 0 || data_lower_in[ 9] == 1;
assign overflow[10] = data_upper_in[10] == 0 || data_lower_in[10] == 1;
assign overflow[11] = data_upper_in[11] == 0 || data_lower_in[11] == 1;
assign overflow[12] = data_upper_in[12] == 0 || data_lower_in[12] == 1;
assign overflow[13] = data_upper_in[13] == 0 || data_lower_in[13] == 1;
assign overflow[14] = data_upper_in[14] == 0 || data_lower_in[14] == 1;
assign overflow[15] = data_upper_in[15] == 0 || data_lower_in[15] == 1;

//Explicit cases
wire shift_16 = overflow[15: 0] == 16'hFFFF;
wire shift_15 = overflow[15: 0] == 16'hFFFE;
wire shift_14 = overflow[15: 1] == 15'h7FFE;
wire shift_13 = overflow[15: 2] == 14'h3FFE;
wire shift_12 = overflow[15: 3] == 13'h1FFE;
wire shift_11 = overflow[15: 4] == 12'h0FFE;
wire shift_10 = overflow[15: 5] == 11'h07FE;
wire shift_9  = overflow[15: 6] == 10'h03FE;
wire shift_8  = overflow[15: 7] ==  9'h01FE;
wire shift_7  = overflow[15: 8] ==  8'h00FE;
wire shift_6  = overflow[15: 9] ==  7'h007E;
wire shift_5  = overflow[15:10] ==  6'h003E;
wire shift_4  = overflow[15:11] ==  5'h001E;
wire shift_3  = overflow[15:12] ==  4'h000E;
wire shift_2  = overflow[15:13] ==  3'h0006;
wire shift_1  = overflow[15:14] ==  2'h0002;
wire shift_0  = overflow[15:15] ==  1'h0000;

//Hopefully this meets timing for a single clock cycle
reg [15:0] new_upper = 0;
reg [15:0] new_lower = 0;

assign data_upper_out = new_upper;
assign data_lower_out = new_lower;

//Lookup table for shifting values
always @(posedge clk) begin
    if(shift_16) new_upper <= 16'hFFFF;
    if(shift_15) new_upper <= {data_upper_in[ 0:0], 15'h7FFF};
    if(shift_14) new_upper <= {data_upper_in[ 1:0], 14'h3FFF};
    if(shift_13) new_upper <= {data_upper_in[ 2:0], 13'h1FFF};
    if(shift_12) new_upper <= {data_upper_in[ 3:0], 12'h0FFF};
    if(shift_11) new_upper <= {data_upper_in[ 4:0], 11'h07FF};
    if(shift_10) new_upper <= {data_upper_in[ 5:0], 10'h03FF};
    if(shift_9 ) new_upper <= {data_upper_in[ 6:0],  9'h01FF};
    if(shift_8 ) new_upper <= {data_upper_in[ 7:0],  8'h00FF};
    if(shift_7 ) new_upper <= {data_upper_in[ 8:0],  7'h007F};
    if(shift_6 ) new_upper <= {data_upper_in[ 9:0],  6'h003F};
    if(shift_5 ) new_upper <= {data_upper_in[10:0],  5'h001F};
    if(shift_4 ) new_upper <= {data_upper_in[11:0],  4'h000F};
    if(shift_3 ) new_upper <= {data_upper_in[12:0],  3'h0007};
    if(shift_2 ) new_upper <= {data_upper_in[13:0],  2'h0003};
    if(shift_1 ) new_upper <= {data_upper_in[14:0],  1'h0001};
    if(shift_0 ) new_upper <= data_upper_in;
end

always @(posedge clk) begin
    if(shift_16) new_lower <= 16'h0000;
    if(shift_15) new_lower <= {data_lower_in[ 0:0], 15'h0000};
    if(shift_14) new_lower <= {data_lower_in[ 1:0], 14'h0000};
    if(shift_13) new_lower <= {data_lower_in[ 2:0], 13'h0000};
    if(shift_12) new_lower <= {data_lower_in[ 3:0], 12'h0000};
    if(shift_11) new_lower <= {data_lower_in[ 4:0], 11'h0000};
    if(shift_10) new_lower <= {data_lower_in[ 5:0], 10'h0000};
    if(shift_9 ) new_lower <= {data_lower_in[ 6:0],  9'h0000};
    if(shift_8 ) new_lower <= {data_lower_in[ 7:0],  8'h0000};
    if(shift_7 ) new_lower <= {data_lower_in[ 8:0],  7'h0000};
    if(shift_6 ) new_lower <= {data_lower_in[ 9:0],  6'h0000};
    if(shift_5 ) new_lower <= {data_lower_in[10:0],  5'h0000};
    if(shift_4 ) new_lower <= {data_lower_in[11:0],  4'h0000};
    if(shift_3 ) new_lower <= {data_lower_in[12:0],  3'h0000};
    if(shift_2 ) new_lower <= {data_lower_in[13:0],  2'h0000};
    if(shift_1 ) new_lower <= {data_lower_in[14:0],  1'h0000};
    if(shift_0 ) new_lower <= data_lower_in;
end

always @(posedge clk) begin
    if(shift_16) num_bits <= 5'd16;
    if(shift_15) num_bits <= 5'd15;
    if(shift_14) num_bits <= 5'd14;
    if(shift_13) num_bits <= 5'd13;
    if(shift_12) num_bits <= 5'd12;
    if(shift_11) num_bits <= 5'd11;
    if(shift_10) num_bits <= 5'd10;
    if(shift_9 ) num_bits <= 5'd9;
    if(shift_8 ) num_bits <= 5'd8;
    if(shift_7 ) num_bits <= 5'd7;
    if(shift_6 ) num_bits <= 5'd6;
    if(shift_5 ) num_bits <= 5'd5;
    if(shift_4 ) num_bits <= 5'd4;
    if(shift_3 ) num_bits <= 5'd3;
    if(shift_2 ) num_bits <= 5'd2;
    if(shift_1 ) num_bits <= 5'd1;
    if(shift_0 ) num_bits <= 5'd0;
end

endmodule