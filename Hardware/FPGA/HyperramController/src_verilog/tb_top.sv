`timescale 1ns / 1ps

module tb_top #(
    parameter CLK_PERIOD = 5
);

reg         sys_clk = 0;
wire        dram_clk_p ;
wire        dram_clk_n ;
wire        dram_cs    ;
wire [ 1:0] dram_rwds  ;
wire [15:0] dram_dq    ;
wire        mmcm_locked;

reg         cs            = 0;
reg         rd_sel        = 0;
reg         wr_sel        = 1;
reg         mem_sel       = 1;
reg         reg_sel       = 0;
reg  [31:0] num_words     = 4;
reg  [ 2:0] latency       = 4;
reg  [31:0] addr_in       = 32'h00000004;
reg  [31:0] wr_data_in    = 32'h1337CAFE;
wire        wr_data_next ;
wire [31:0] rd_data_out  ;
wire        rd_data_valid;

always #CLK_PERIOD sys_clk = ~sys_clk;

hyperram_top_2 hyperram_top_inst (
    //Clocking signals
    .sys_clk      (sys_clk      ),
    //Hardware hyperbus interface
    .dram_clk_p   (dram_clk_p   ),
    .dram_clk_n   (dram_clk_n   ),
    .dram_cs      (dram_cs      ),
    .dram_rwds    (dram_rwds    ),
    .dram_dq      (dram_dq      ),
    //Control signals
    .cs           (cs           ),
    .rd_sel       (rd_sel       ),
    .wr_sel       (wr_sel       ),
    .mem_sel      (mem_sel      ),
    .reg_sel      (reg_sel      ),
    .num_words    (num_words    ),
    .latency      (latency      ),
    .addr_in      (addr_in      ),
    .wr_data_in   (wr_data_in   ),
    .wr_data_next (wr_data_next ),
    .rd_data_out  (rd_data_out  ),
    .rd_data_valid(rd_data_valid),
    //Status signals
    .mmcm_locked  (mmcm_locked  ),
    .reset_in     (1'b0         )
);

hyperram_device_2 hyperram_device_inst (
    .clk       (sys_clk   ),
    .rst       (1'b0      ),
    .dram_clk_p(dram_clk_p),
    .dram_clk_n(dram_clk_n),
    .dram_cs   (dram_cs   ),
    .dram_dq   (dram_dq   ),
    .dram_rwds (dram_rwds )
);

initial begin
    //Wait for clocks to be valid
    @(posedge mmcm_locked);
    for(int i = 0; i < 4; i++) @(posedge sys_clk);

    //Kick off read
    cs <= 1;
    @(posedge sys_clk);
    cs <= 0;
    @(posedge sys_clk);

    //Some extra cycles to observe
    for(int i = 0; i < 24; i++) @(posedge sys_clk);

    $finish;
end

endmodule