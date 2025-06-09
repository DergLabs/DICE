module out_bits_manager (
    input         clk         ,
    input  [15:0] out_bits    ,
    input  [ 4:0] pending_bits,
    input         valid
);

reg  [31:0] out_bits_reg;
reg  [ 4:0] index;

wire [31:0] shift_0  = out_bits_reg;
wire [31:0] shift_1  = index[0] ? shift_0 <<  1 : shift_0;
wire [31:0] shift_2  = index[1] ? shift_1 <<  2 : shift_1;
wire [31:0] shift_4  = index[2] ? shift_2 <<  4 : shift_2;
wire [31:0] shift_8  = index[3] ? shift_4 <<  8 : shift_4;
wire [31:0] shift_16 = index[4] ? shift_8 << 16 : shift_8;

reg  [31:0] shifted_reg;

always @(posedge clk) begin
    if(valid) begin
        out_bits_reg <= out_bits;
    end

    shifted_reg <= shifted_16;
end



endmodule