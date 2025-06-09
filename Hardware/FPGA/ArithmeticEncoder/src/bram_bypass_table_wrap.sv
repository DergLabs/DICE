module bram_bypass_table_wrap (
    input         clk         ,
    input  [ 7:0] wr_addr_in  ,
    input  [23:0] wr_data_in  ,
    input         wr_enable_in,
    input  [ 7:0] rd_addr_in  ,
    input         rd_enable_in,
    output [23:0] rd_data_out ,
    output        rd_valid_out
);

//Read valid
//reg [1:0] pipe_valid = 0;
reg       pipe_valid = 0;

always @(posedge clk) begin
    //pipe_valid[0] <= rd_enable_in;
    //pipe_valid[1:1] <= pipe_valid[0:0];

    pipe_valid <= rd_enable_in;
end

assign rd_valid_out = pipe_valid;

//BRAM signals
wire        bram_en    = rd_enable_in | wr_enable_in;
wire        bram_wr_en = wr_enable_in;
wire [ 7:0] bram_addr  = wr_enable_in ? wr_addr_in : rd_addr_in;

bram_bypass_table bram_bypass_table_inst (
  .clka (clk        ), // input wire clka
  .ena  (bram_en    ), // input wire ena
  .wea  (bram_wr_en ), // input wire [0 : 0] wea
  .addra(bram_addr  ), // input wire [7 : 0] addra
  .dina (wr_data_in ), // input wire [23 : 0] dina
  .douta(rd_data_out)  // output wire [23 : 0] douta
);

endmodule