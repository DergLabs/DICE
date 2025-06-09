module bounds_fifo_wrap (
    input         clk            ,
    input  [15:0] upper_bound_in ,
    input  [15:0] lower_bound_in ,
    input         valid_in       ,
    output [15:0] upper_bound_out,
    output [15:0] lower_bound_out,
    output        valid_out      ,
    input         read_en
);

wire fifo_rd_en = read_en;
wire fifo_wr_en = valid_in;
wire [31:0] fifo_din = {upper_bound_in, lower_bound_in};
wire [31:0] fifo_dout;
wire fifo_valid;

bounds_fifo your_instance_name (
  .clk  (clk       ), // input wire clk
  .srst (1'b0      ), // input wire srst
  .din  (fifo_din  ), // input wire [31 : 0] din
  .wr_en(fifo_wr_en), // input wire wr_en
  .rd_en(fifo_rd_en), // input wire rd_en
  .dout (fifo_dout ), // output wire [31 : 0] dout
  //.full (full      ), // output wire full
  //.empty(empty     ), // output wire empty
  .valid(fifo_valid)  // output wire valid
);

assign upper_bound_out = fifo_dout[31:16];
assign lower_bound_out = fifo_dout[15: 0];
assign valid_out = fifo_valid;

endmodule