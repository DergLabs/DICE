module hyperram_top_2 (
    //Clocking
    input         sys_clk      ,
    //Hyperbus signals
    output        dram_clk_p   ,
    output        dram_clk_n   ,
    output        dram_cs      ,
    inout  [ 1:0] dram_rwds    ,
    inout  [15:0] dram_dq      ,
    //Control signals
    input         cs           ,
    input         rd_sel       ,
    input         wr_sel       ,
    input         mem_sel      ,
    input         reg_sel      ,
    input  [31:0] num_words    ,
    input  [ 2:0] latency      ,
    input  [31:0] addr_in      ,
    input  [31:0] wr_data_in   ,
    output        wr_data_next ,
    output [31:0] rd_data_out  ,
    output        rd_data_valid,
    //Status signals
    output        mmcm_locked  ,
    input         reset_in
);

//===================================================
// Clocking and reset
//===================================================
wire reset;
assign reset = reset_in;

wire clk;
wire clk_90o;

clk_gen clk_gen_inst (
    .clk_out_200m    (clk        ),
    .clk_out_200m_90o(clk_90o    ),
    .reset           (reset      ),
    .locked          (mmcm_locked),
    .clk_in          (sys_clk    )
);

//===================================================
// Configuration
//===================================================
always @(posedge clk) begin
    //TODO
end

//===================================================
// HyperRAM controller
//===================================================
wire [1:0] mode;
assign mode = {reg_sel, rd_sel};

hyperram_intf_impl hyperram_intf_inst (
    //Clocking
    .clk               (clk          ),
    .clk_90o           (clk_90o      ),
    //Hyperbus interface
    .dram_clk_p        (dram_clk_p   ),
    .dram_clk_n        (dram_clk_n   ),
    .dram_cs           (dram_cs      ),
    .dram_rwds         (dram_rwds    ),
    .dram_dq           (dram_dq      ),
    //Driver interface
    .ctrl_cs           (cs           ),
    /*
    .ctrl_rd_sel       (rd_sel       ),
    .ctrl_wr_sel       (wr_sel       ),
    .ctrl_mem_sel      (mem_sel      ),
    .ctrl_reg_sel      (reg_sel      ),
    */
    .ctrl_mode         (mode         ),
    .ctrl_num_words    (num_words    ),
    .ctrl_latency      (latency      ),
    .ctrl_addr_in      (addr_in      ),
    .ctrl_wr_data_in   (wr_data_in   ),
    .ctrl_wr_data_next (wr_data_next ),
    .ctrl_rd_data_out  (rd_data_out  ),
    .ctrl_rd_data_valid(rd_data_valid)
);

endmodule