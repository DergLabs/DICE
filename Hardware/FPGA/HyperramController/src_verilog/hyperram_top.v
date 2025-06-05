module hyperram_top (
    input         sys_clk_p  ,
    input         sys_clk_n  ,
    output        dram_clk_p ,
    output        dram_clk_n ,
    output        dram_cs    ,
    inout  [ 1:0] dram_rwds  ,
    inout  [15:0] dram_dq    ,
    output        mmcm_locked,
    input         reset_in   ,
    output        reset_out
);

wire reset;
assign reset = ~reset_in;
assign reset_out = ~reset_in;
wire sys_clk_200m;

IBUFDS IBUFDS_inst (
   .O(sys_clk_200m),   // 1-bit output: Buffer output
   .I(sys_clk_p),   // 1-bit input: Diff_p buffer input (connect directly to top-level port)
   .IB(sys_clk_n)  // 1-bit input: Diff_n buffer input (connect directly to top-level port)
);

reg start_read = 0;

wire clk_200m;
wire clk_200m_90o;
wire clk_locked;

clk_gen clk_gen_inst (
    .clk_out_200m    (clk_200m    ),
    .clk_out_200m_90o(clk_200m_90o),
    .reset           (reset       ),
    .locked          (clk_locked  ),
    .clk_in          (sys_clk_200m)
);

assign mmcm_locked = clk_locked;

wire        dram_clk;

wire        dram_dq_oe;
wire [15:0] dram_dq_in;
wire [15:0] dram_dq_out;

wire        dram_rwds_oe;
wire [ 1:0] dram_rwds_in;
wire [ 1:0] dram_rwds_out;

hyperram_intf_2 hyperram_intf_inst (
    //Clocking
    .clk          (clk_200m     ),
    .clk_90o      (clk_200m_90o ),
    //Hyperbus interface
    .dram_clk     (dram_clk     ),
    .dram_cs      (dram_cs      ),
    .dram_dq_in   (dram_dq_in   ),
    .dram_dq_out  (dram_dq_out  ),
    .dram_dq_oe   (dram_dq_oe   ),
    .dram_rwds_in (dram_rwds_in ),
    .dram_rwds_out(dram_rwds_out),
    .dram_rwds_oe (dram_rwds_oe ),
    //Driver interface
    .rd_sel       (),
    .wr_sel       (),
    .mem_sel      (),
    .reg_sel      (),
    .addr_in      (),
    .wr_data_in   (),
    .rd_data_out  (),
    .rd_data_valid()
);

genvar i;

//Connect hyperram dq
iobuf_wrap #(
    .BUS_WIDTH(16)
) iobuf_wrap_inst_dq (
    .din   (dram_dq_out),
    .dout  (dram_dq_in ),
    .dio   (dram_dq    ),
    .out_en(dram_dq_oe )
);

//Connect hyperram rwds
iobuf_wrap #(
    .BUS_WIDTH(2)
) iobuf_wrap_inst_rwds (
    .din   (dram_rwds_out),
    .dout  (dram_rwds_in ),
    .dio   (dram_rwds    ),
    .out_en(dram_rwds_oe )
);

obufds_wrap obufds_wrap_inst (
    .clk  (dram_clk  ),
    .clk_p(dram_clk_p),
    .clk_n(dram_clk_n)
);

wire read_in;
wire read_status;
assign read_status = start_read;
reg start_read_latch = 0;

hyperram_vio hyperram_vio_inst (
  .clk(clk_200m),                // input wire clk
  .probe_in0(read_status),    // input wire [0 : 0] probe_in0
  .probe_out0(read_set)  // output wire [0 : 0] probe_out0
);

always @(posedge clk_200m) begin
    start_read_latch <= read_set;
    if(start_read_latch == 0) start_read <= read_set;
    if(start_read) start_read <= 0;
end

endmodule