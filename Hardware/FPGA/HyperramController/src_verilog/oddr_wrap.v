module oddr_wrap #(
   parameter BUS_WIDTH = 1
)(
   input                  clk,
   input  [BUS_WIDTH-1:0] din_rise,
   input  [BUS_WIDTH-1:0] din_fall,
   output [BUS_WIDTH-1:0] dout
);

genvar i;

generate
   for(i = 0; i < BUS_WIDTH; i = i + 1) begin
      ODDR #(
         .DDR_CLK_EDGE("SAME_EDGE"), // "OPPOSITE_EDGE" or "SAME_EDGE"
         .INIT        (1'b0       ), // Initial value of Q: 1'b0 or 1'b1
         .SRTYPE      ("ASYNC"    )  // Set/Reset type: "SYNC" or "ASYNC"
      ) ODDR_inst (
         .Q (dout[i]    ), // 1-bit DDR output
         .C (clk        ), // 1-bit clock input
         .CE(1'b1       ), // 1-bit clock enable input
         .D1(din_rise[i]), // 1-bit data input (positive edge)
         .D2(din_fall[i]), // 1-bit data input (negative edge)
         .R (1'b0       ), // 1-bit reset
         .S (1'b0       )  // 1-bit set
      );
   end
endgenerate

endmodule