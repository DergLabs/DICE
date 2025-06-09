module shift_buffer (
    input         clk      ,
    input  [15:0] data_in  ,
    input  [ 4:0] count_in ,
    input         valid_in ,
    output [15:0] data_out ,
    output        valid_out
);

//Update index value
reg  [ 4:0] index_reg = 0;
reg  [ 1:0] pipe_overflow = 0;

wire [ 4:0] index_up = index_reg + count_in;
wire        overflow = index_up > 15;
wire [ 4:0] new_index = overflow ? (index_up - 16) : index_up;

reg  [ 4:0] index_reg_2 = 0;

//Shift input data to the correct offset
reg  [15:0] data_reg = 0;

//Manual shift for now
wire [ 4:0] index = index_reg_2;
wire [31:0] shift_0 = {data_reg, 16'd0};
wire [31:0] shift_1  = index[0] ? { 1'd0, shift_0[31: 1]} : shift_0;
wire [31:0] shift_2  = index[1] ? { 2'd0, shift_1[31: 2]} : shift_1;
wire [31:0] shift_4  = index[2] ? { 4'd0, shift_2[31: 4]} : shift_2;
wire [31:0] shift_8  = index[3] ? { 8'd0, shift_4[31: 8]} : shift_4;
wire [31:0] shift_16 = index[4] ? {16'd0, shift_8[31:16]} : shift_8;

reg  [31:0] shift_reg = 0;
reg  [15:0] buffer_reg = 0;

//Push buffer value when it is full
wire [15:0] shift_upper = shift_reg[31:16];
wire [15:0] shift_lower = shift_reg[15: 0];

wire [15:0] buffer_concat = buffer_reg | shift_upper;
wire [15:0] new_buffer_val = pipe_overflow[1] ? shift_lower : buffer_concat;

reg  [15:0] data_out_reg = 0;
reg         valid_out_reg = 0;

reg  [ 1:0] pipe_valid = 0;

always @(posedge clk) begin
    pipe_valid[0] <= valid_in;
    pipe_valid[1] <= pipe_valid[0];

    //Step 1
    if(valid_in) begin
        data_reg <= data_in;
        index_reg <= new_index;
        index_reg_2 <= index_reg;
        pipe_overflow[0] <= overflow;
    end
    else begin
        pipe_overflow[0] <= 1'b0;
    end

    //Step 2
    shift_reg <= shift_16;
    pipe_overflow[1:1] <= pipe_overflow[0:0];

    //Step 3
    if(pipe_valid[1]) begin
        buffer_reg <= new_buffer_val;

        if(pipe_overflow[1]) begin
            data_out_reg <= buffer_concat;
        end
    end

    //Only output valid signal when overflow causes buffer flush
    valid_out_reg <= pipe_overflow[1];
end

assign data_out = data_out_reg;
assign valid_out = valid_out_reg;


endmodule