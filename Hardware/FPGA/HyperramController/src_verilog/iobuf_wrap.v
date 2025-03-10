module iobuf_wrap #(
    parameter BUS_WIDTH = 1
)(
    input  [BUS_WIDTH-1:0] din   ,
    output [BUS_WIDTH-1:0] dout  ,
    inout  [BUS_WIDTH-1:0] dio   ,
    input                  out_en
);

genvar i;
generate
    for(i = 0; i < BUS_WIDTH; i = i + 1) begin
        IOBUF IOBUF_inst (
            .O ( dout[i]  ), // 1-bit output: Buffer output
            .I ( din[i]   ), // 1-bit input: Buffer input
            .IO( dio[i]   ), // 1-bit inout: Buffer inout (connect directly to top-level port)
            .T (~out_en   )  // 1-bit input: 3-state enable input
        );
    end
endgenerate

endmodule