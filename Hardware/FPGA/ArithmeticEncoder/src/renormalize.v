module renormalize (
    input         clk           ,
    input  [15:0] data_upper_in ,
    input  [15:0] data_lower_in ,
    output [15:0] data_upper_out,
    output [15:0] data_lower_out,
    output [ 3:0] pending_out   ,
    input         valid_in      ,
    output        valid_out
);

wire [15:0] overflow;

assign overflow[ 0] = data_upper_in[ 0] == 0 && data_lower_in[ 0] == 1;
assign overflow[ 1] = data_upper_in[ 1] == 0 && data_lower_in[ 1] == 1;
assign overflow[ 2] = data_upper_in[ 2] == 0 && data_lower_in[ 2] == 1;
assign overflow[ 3] = data_upper_in[ 3] == 0 && data_lower_in[ 3] == 1;
assign overflow[ 4] = data_upper_in[ 4] == 0 && data_lower_in[ 4] == 1;
assign overflow[ 5] = data_upper_in[ 5] == 0 && data_lower_in[ 5] == 1;
assign overflow[ 6] = data_upper_in[ 6] == 0 && data_lower_in[ 6] == 1;
assign overflow[ 7] = data_upper_in[ 7] == 0 && data_lower_in[ 7] == 1;
assign overflow[ 8] = data_upper_in[ 8] == 0 && data_lower_in[ 8] == 1;
assign overflow[ 9] = data_upper_in[ 9] == 0 && data_lower_in[ 9] == 1;
assign overflow[10] = data_upper_in[10] == 0 && data_lower_in[10] == 1;
assign overflow[11] = data_upper_in[11] == 0 && data_lower_in[11] == 1;
assign overflow[12] = data_upper_in[12] == 0 && data_lower_in[12] == 1;
assign overflow[13] = data_upper_in[13] == 0 && data_lower_in[13] == 1;
assign overflow[14] = data_upper_in[14] == 0 && data_lower_in[14] == 1;
assign overflow[15] = data_upper_in[15] == 0 && data_lower_in[15] == 1;

wire shift_15 = overflow[14: 0] == 15'h7FFF;
wire shift_14 = overflow[14: 0] == 15'h7FFE;
wire shift_13 = overflow[14: 1] == 14'h3FFE;
wire shift_12 = overflow[14: 2] == 13'h1FFE;
wire shift_11 = overflow[14: 3] == 12'h0FFE;
wire shift_10 = overflow[14: 4] == 11'h07FE;
wire shift_9  = overflow[14: 5] == 10'h03FE;
wire shift_8  = overflow[14: 6] ==  9'h01FE;
wire shift_7  = overflow[14: 7] ==  8'h00FE;
wire shift_6  = overflow[14: 8] ==  7'h007E;
wire shift_5  = overflow[14: 9] ==  6'h003E;
wire shift_4  = overflow[14:10] ==  5'h001E;
wire shift_3  = overflow[14:11] ==  4'h000E;
wire shift_2  = overflow[14:12] ==  3'h0006;
wire shift_1  = overflow[14:13] ==  2'h0002;
wire shift_0  = overflow[14:14] ==  1'h0000;

reg [15:0] new_upper;
reg [15:0] new_lower;

assign data_upper_out = new_upper;
assign data_lower_out = new_lower;

always @(posedge clk) begin
    if(shift_15) new_upper <= 16'hFFFF;
    if(shift_14) new_upper <= {1'b1, data_upper_in[ 0: 0], 14'h3FFF};
    if(shift_13) new_upper <= {1'b1, data_upper_in[ 1: 0], 13'h1FFF};
    if(shift_12) new_upper <= {1'b1, data_upper_in[ 2: 0], 12'h0FFF};
    if(shift_11) new_upper <= {1'b1, data_upper_in[ 3: 0], 11'h07FF};
    if(shift_10) new_upper <= {1'b1, data_upper_in[ 4: 0], 10'h03FF};
    if(shift_9 ) new_upper <= {1'b1, data_upper_in[ 5: 0],  9'h01FF};
    if(shift_8 ) new_upper <= {1'b1, data_upper_in[ 6: 0],  8'h00FF};
    if(shift_7 ) new_upper <= {1'b1, data_upper_in[ 7: 0],  7'h007F};
    if(shift_6 ) new_upper <= {1'b1, data_upper_in[ 8: 0],  6'h003F};
    if(shift_5 ) new_upper <= {1'b1, data_upper_in[ 9: 0],  5'h001F};
    if(shift_4 ) new_upper <= {1'b1, data_upper_in[10: 0],  4'h000F};
    if(shift_3 ) new_upper <= {1'b1, data_upper_in[11: 0],  3'h0007};
    if(shift_2 ) new_upper <= {1'b1, data_upper_in[12: 0],  2'h0003};
    if(shift_1 ) new_upper <= {1'b1, data_upper_in[13: 0],  1'h0001};
    if(shift_0 ) new_upper <= {1'b1, data_upper_in[14: 0]};
end

always @(posedge clk) begin
    if(shift_15) new_lower <= 16'h0000;
    if(shift_14) new_lower <= {1'b0, data_lower_in[ 0: 0], 14'h0000};
    if(shift_13) new_lower <= {1'b0, data_lower_in[ 1: 0], 13'h0000};
    if(shift_12) new_lower <= {1'b0, data_lower_in[ 2: 0], 12'h0000};
    if(shift_11) new_lower <= {1'b0, data_lower_in[ 3: 0], 11'h0000};
    if(shift_10) new_lower <= {1'b0, data_lower_in[ 4: 0], 10'h0000};
    if(shift_9 ) new_lower <= {1'b0, data_lower_in[ 5: 0],  9'h0000};
    if(shift_8 ) new_lower <= {1'b0, data_lower_in[ 6: 0],  8'h0000};
    if(shift_7 ) new_lower <= {1'b0, data_lower_in[ 7: 0],  7'h0000};
    if(shift_6 ) new_lower <= {1'b0, data_lower_in[ 8: 0],  6'h0000};
    if(shift_5 ) new_lower <= {1'b0, data_lower_in[ 9: 0],  5'h0000};
    if(shift_4 ) new_lower <= {1'b0, data_lower_in[10: 0],  4'h0000};
    if(shift_3 ) new_lower <= {1'b0, data_lower_in[11: 0],  3'h0000};
    if(shift_2 ) new_lower <= {1'b0, data_lower_in[12: 0],  2'h0000};
    if(shift_1 ) new_lower <= {1'b0, data_lower_in[13: 0],  1'h0000};
    if(shift_0 ) new_lower <= {1'b0, data_lower_in[14: 0]};
end

reg [3:0] pending = 0;
assign pending_out = pending;

always @(posedge clk) begin
    if(shift_15) pending <= 4'd15;
    if(shift_14) pending <= 4'd14;
    if(shift_13) pending <= 4'd13;
    if(shift_12) pending <= 4'd12;
    if(shift_11) pending <= 4'd11;
    if(shift_10) pending <= 4'd10;
    if(shift_9 ) pending <= 4'd9;
    if(shift_8 ) pending <= 4'd8;
    if(shift_7 ) pending <= 4'd7;
    if(shift_6 ) pending <= 4'd6;
    if(shift_5 ) pending <= 4'd5;
    if(shift_4 ) pending <= 4'd4;
    if(shift_3 ) pending <= 4'd3;
    if(shift_2 ) pending <= 4'd2;
    if(shift_1 ) pending <= 4'd1;
    if(shift_0 ) pending <= 4'd0;
end

//Valid signal
reg valid_reg = 0;

always @(posedge clk) begin
    valid_reg <= valid_in;
end

assign valid_out = valid_reg;

endmodule