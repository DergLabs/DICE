module hyperram_intf_impl_wrap (
    //Clocking input
    input         clk               ,
    input         clk_90o           ,
    input         clk_400m_90o      ,
    input         rst               ,
    output        ready             ,
    //HyperRAM bus signals
    output        dram_clk_p        ,
    output        dram_clk_n        ,
    output        dram_cs           ,
    inout  [15:0] dram_dq           ,
    inout  [ 1:0] dram_rwds         ,
    //Read/write interface
    input         ctrl_cs           ,
    input  [ 1:0] ctrl_mode         ,
    input  [31:0] ctrl_num_words    ,
    input  [ 2:0] ctrl_latency      ,
    input  [31:0] ctrl_addr_in      ,
    input  [31:0] ctrl_wr_data_in   ,
    input         ctrl_wr_data_valid,
    output [31:0] ctrl_rd_data_out  ,
    output        ctrl_rd_data_valid
);

wire wr_rst_busy;
wire rd_rst_busy;

assign ready = ~(wr_rst_busy | rd_rst_busy);

wire        fifo_rd_en;
wire [31:0] fifo_dout;

hyperram_fifo hyperram_fifo_inst (
  .clk        (clk               ),  // input wire clk
  .srst       (rst               ),  // input wire srst
  .din        (ctrl_wr_data_in   ),  // input wire [31 : 0] din
  .wr_en      (ctrl_wr_data_valid),  // input wire wr_en
  .rd_en      (fifo_rd_en        ),  // input wire rd_en
  .dout       (fifo_dout         ),  // output wire [31 : 0] dout
  .full       (),                    // output wire full
  .empty      (),                    // output wire empty
  .wr_rst_busy(wr_rst_busy       ),  // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy       )   // output wire rd_rst_busy
);

hyperram_intf_impl hyperram_intf_impl_inst (
    .clk               (clk               ),
    .clk_90o           (clk_90o           ),
    .clk_400m_90o      (clk_400m_90o      ),
    .dram_clk_p        (dram_clk_p        ),
    .dram_clk_n        (dram_clk_n        ),
    .dram_cs           (dram_cs           ),
    .dram_dq           (dram_dq           ),
    .dram_rwds         (dram_rwds         ),
    .ctrl_cs           (ctrl_cs           ),
    .ctrl_mode         (ctrl_mode         ),
    .ctrl_num_words    (ctrl_num_words    ),
    .ctrl_latency      (ctrl_latency      ),
    .ctrl_addr_in      (ctrl_addr_in      ),
    .ctrl_wr_data_in   (fifo_dout         ),
    .ctrl_wr_data_next (fifo_rd_en        ),
    .ctrl_rd_data_out  (ctrl_rd_data_out  ),
    .ctrl_rd_data_valid(ctrl_rd_data_valid)
);

endmodule