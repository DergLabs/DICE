module hyperram_top (
    //Clocking
    input         sys_clk_p  ,
    input         sys_clk_n  ,
    //HyperRAM interface
    output        dram_clk_p ,
    output        dram_clk_n ,
    output        dram_cs    ,
    inout  [ 1:0] dram_rwds  ,
    inout  [15:0] dram_dq    ,
    //Status
    output        mmcm_locked
);

//===================================================
// Clocking and reset
//===================================================
wire sys_clk;
wire clk;
wire clk_90o;

IBUFDS IBUFDS_inst (
   .O (sys_clk  ),   // 1-bit output: Buffer output
   .I (sys_clk_p),   // 1-bit input: Diff_p buffer input (connect directly to top-level port)
   .IB(sys_clk_n)    // 1-bit input: Diff_n buffer input (connect directly to top-level port)
);

clk_gen clk_gen_inst (
    .clk_out_200m    (clk        ),
    .clk_out_200m_90o(clk_90o    ),
    .reset           (1'b0       ),
    .locked          (mmcm_locked),
    .clk_in          (sys_clk    )
);

//===================================================
// Controller stuff
//===================================================
reg cs      = 0;
reg rd_sel  = 0;
reg wr_sel  = 0;
reg mem_sel = 0;
reg reg_sel = 0;

wire [31:0] rd_data_tmp;
wire        rd_data_valid;

wire        rd_or_wr;
wire        mem_or_reg;
wire [31:0] addr;
wire [31:0] wr_data;
reg  [31:0] rd_data = 0;
wire [ 2:0] latency;
reg  [ 7:0] num_words = 1;
wire [ 1:0] start_op = 0;

reg toggle = 0;
always @(posedge clk) begin
    if(start_op != 0 && toggle == 0) begin
        rd_sel  <=  rd_or_wr;
        wr_sel  <= !rd_or_wr;
        mem_sel <= !mem_or_reg;
        reg_sel <=  mem_or_reg;
        cs      <= 1'b1;
        toggle  <= 1'b1;
    end
    else begin
        cs      <= 1'b0;
        toggle  <= 1'b0;
    end

    if(rd_data_valid) begin
        rd_data <= rd_data_tmp;
    end
end

hyperram_vio your_instance_name (
  .clk       (clk       ),  // input wire clk
  .probe_in0 (addr      ),  // input wire [31 : 0] probe_in0
  .probe_in1 (rd_data   ),  // input wire [31 : 0] probe_in1
  .probe_in2 (latency   ),  // input wire [2 : 0] probe_in2
  .probe_in3 (start_op  ),  // input wire [1 : 0] probe_in3
  .probe_in4 (rd_or_wr  ),  // input wire [0 : 0] probe_in4
  .probe_in5 (mem_or_reg),  // input wire [0 : 0] probe_in5
  .probe_out0(addr      ),  // output wire [31 : 0] probe_out0
  .probe_out1(wr_data   ),  // output wire [31 : 0] probe_out1
  .probe_out2(latency   ),  // output wire [2 : 0] probe_out2
  .probe_out3(start_op  ),  // output wire [1 : 0] probe_out3
  .probe_out4(rd_or_wr  ),  // output wire [0 : 0] probe_out4
  .probe_out5(mem_or_reg)   // output wire [0 : 0] probe_out5
);

hyperram_controller hyperram_controller_inst (
    //Clocking input
    .clk               (clk        ),
    .clk_90o           (clk_90o    ),
    //HyperRAM bus signals
    .dram_clk_p        (dram_clk_p ),
    .dram_clk_n        (dram_clk_n ),
    .dram_cs           (dram_cs    ),
    .dram_dq           (dram_rwds  ),
    .dram_rwds         (dram_dq    ),
    //Read/write interface
    .ctrl_cs           (cs         ),
    .ctrl_rd_sel       (rd_sel     ),
    .ctrl_wr_sel       (wr_sel     ),
    .ctrl_mem_sel      (mem_sel    ),
    .ctrl_reg_sel      (reg_sel    ),
    .ctrl_num_words    (num_words  ),
    .ctrl_latency      (latency    ),
    .ctrl_addr_in      (addr       ),
    .ctrl_wr_data_in   (wr_data    ),
    .ctrl_wr_data_next (),
    .ctrl_rd_data_out  (rd_data_tmp  ),
    .ctrl_rd_data_valid(rd_data_valid),
    .ctrl_busy         ()
);

endmodule