//Latency: 1
module nr_init (
    input         clk  ,
    input  [15:0] d_in ,
    output [15:0] a_out,
    output [15:0] x_out,
    output [ 3:0] s_out
);

reg [15:0] d_norm = 0;
reg [ 5:0] init_guess = 0;
reg [ 3:0] shift = 0;

//Shift divisor into 0.5 to 1 range where 16 bits are after the radix point
always @(posedge clk) begin
    if(d_in[15: 0] == 1) d_norm <= d_in << 15;
    if(d_in[15: 1] == 1) d_norm <= d_in << 14;
    if(d_in[15: 2] == 1) d_norm <= d_in << 13;
    if(d_in[15: 3] == 1) d_norm <= d_in << 12;
    if(d_in[15: 4] == 1) d_norm <= d_in << 11;
    if(d_in[15: 5] == 1) d_norm <= d_in << 10;
    if(d_in[15: 6] == 1) d_norm <= d_in <<  9;
    if(d_in[15: 7] == 1) d_norm <= d_in <<  8;
    if(d_in[15: 8] == 1) d_norm <= d_in <<  7;
    if(d_in[15: 9] == 1) d_norm <= d_in <<  6;
    if(d_in[15:10] == 1) d_norm <= d_in <<  5;
    if(d_in[15:11] == 1) d_norm <= d_in <<  4;
    if(d_in[15:12] == 1) d_norm <= d_in <<  3;
    if(d_in[15:13] == 1) d_norm <= d_in <<  2;
    if(d_in[15:14] == 1) d_norm <= d_in <<  1;
end

//Initial value lookup table listed in: https://hardwaredescriptions.com/conquer-the-divide/
always @(posedge clk) begin
    case(d_in[14:10])
        5'd00: init_guess <= 6'd63;
        5'd01: init_guess <= 6'd61;
        5'd02: init_guess <= 6'd59;
        5'd03: init_guess <= 6'd57;
        5'd04: init_guess <= 6'd56;
        5'd05: init_guess <= 6'd54;
        5'd06: init_guess <= 6'd53;
        5'd07: init_guess <= 6'd52;
        5'd08: init_guess <= 6'd50;
        5'd09: init_guess <= 6'd49;
        5'd10: init_guess <= 6'd48;
        5'd11: init_guess <= 6'd47;
        5'd12: init_guess <= 6'd46;
        5'd13: init_guess <= 6'd45;
        5'd14: init_guess <= 6'd44;
        5'd15: init_guess <= 6'd43;
        5'd16: init_guess <= 6'd42;
        5'd17: init_guess <= 6'd41;
        5'd18: init_guess <= 6'd40;
        5'd19: init_guess <= 6'd39;
        5'd20: init_guess <= 6'd39;
        5'd21: init_guess <= 6'd38;
        5'd22: init_guess <= 6'd37;
        5'd23: init_guess <= 6'd37;
        5'd24: init_guess <= 6'd36;
        5'd25: init_guess <= 6'd36;
        5'd26: init_guess <= 6'd35;
        5'd27: init_guess <= 6'd34;
        5'd28: init_guess <= 6'd34;
        5'd29: init_guess <= 6'd33;
        5'd30: init_guess <= 6'd32;
        5'd31: init_guess <= 6'd32;
    endcase
end

//Shift value based on normalization
always @(posedge clk) begin
    if(d_in[15: 0] == 1) shift <= 4'd15;
    if(d_in[15: 1] == 1) shift <= 4'd14;
    if(d_in[15: 2] == 1) shift <= 4'd13;
    if(d_in[15: 3] == 1) shift <= 4'd12;
    if(d_in[15: 4] == 1) shift <= 4'd11;
    if(d_in[15: 5] == 1) shift <= 4'd10;
    if(d_in[15: 6] == 1) shift <= 4'd9;
    if(d_in[15: 7] == 1) shift <= 4'd8;
    if(d_in[15: 8] == 1) shift <= 4'd7;
    if(d_in[15: 9] == 1) shift <= 4'd6;
    if(d_in[15:10] == 1) shift <= 4'd5;
    if(d_in[15:11] == 1) shift <= 4'd4;
    if(d_in[15:12] == 1) shift <= 4'd3;
    if(d_in[15:13] == 1) shift <= 4'd2;
    if(d_in[15:14] == 1) shift <= 4'd1;
end

//Output
assign a_out = d_norm;
assign x_out = {init_guess, 10'd0};
assign s_out = shift;

endmodule