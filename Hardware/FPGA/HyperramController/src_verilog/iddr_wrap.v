module iddr_wrap #(
   parameter BUS_WIDTH = 1
)(
    input                  clk,
    input  [BUS_WIDTH-1:0] din,
    output [BUS_WIDTH-1:0] dout_rise,
    output [BUS_WIDTH-1:0] dout_fall
);

genvar i;

generate
   for(i = 0; i < BUS_WIDTH; i = i + 1) begin
      IDDR #(
         .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"), // "OPPOSITE_EDGE", "SAME_EDGE", or "SAME_EDGE_PIPELINED"
         .INIT_Q1     (1'b0                 ), // Initial value of Q1: 1'b0 or 1'b1
         .INIT_Q2     (1'b0                 ), // Initial value of Q2: 1'b0 or 1'b1
         .SRTYPE      ("ASYNC"              )  // Set/Reset type: "SYNC" or "ASYNC"
      ) IDDR_inst (
         .Q1(dout_rise[i]), // 1-bit output for positive edge of clock
         .Q2(dout_fall[i]), // 1-bit output for negative edge of clock
         .C (clk         ), // 1-bit clock input
         .CE(1'b1        ), // 1-bit clock enable input
         .D (din      [i]), // 1-bit DDR data input
         .R (1'b0        ), // 1-bit reset
         .S (1'b0        )  // 1-bit set
      );
   end
endgenerate

endmodule