module memory_controller (
    //Clocking
    input         clk          ,
    input         clk_90o      ,
    //Hyperbus signals
    output        dram_clk_p   ,
    output        dram_clk_n   ,
    output        dram_cs      ,
    inout  [ 1:0] dram_rwds    ,
    inout  [15:0] dram_dq      ,
    //Control signals
    //input         cs           ,
    //input         rd_sel       ,
    //input         wr_sel       ,
    //input         mem_sel      ,
    //input         reg_sel      ,
    //input  [ 7:0] num_words    ,
    //input  [ 2:0] latency      ,
    //input  [31:0] addr_in      ,
    //input  [31:0] wr_data_in   ,
    //output        wr_data_next ,
    //output [31:0] rd_data_out  ,
    //output        rd_data_valid,
    //Configuration signals
    input         diag_cs      ,
    input         diag_wr      ,
    input         diag_rd      ,
    input  [31:0] diag_addr    ,
    input  [31:0] diag_wr_data ,
    output [31:0] diag_rd_data ,
    output        diag_rd_valid
);

reg [31:0] rd_data_reg;
assign diag_rd_data = rd_data_reg;

reg  cs           ;
reg  rd_sel       ;
reg  wr_sel       ;
reg  mem_sel      ;
reg  reg_sel      ;
reg  num_words    ;
reg  latency      ;
reg  addr_in      ;
reg  wr_data_in   ;
reg  wr_data_next ;
wire rd_data_out  ;
wire rd_data_valid;
wire busy         ;

//===================================================
// Ctrl register space
//===================================================
reg [31:0] scratch_data = 0;
reg [31:0] scratch_addr = 0;
reg [ 2:0] dram_latency = 0;
reg [ 7:0] burst_length = 0;

reg write_scratch_to_reg;
reg read_reg_to_scratch;
reg write_scratch_to_mem;
reg read_mem_to_scratch;
always @(posedge clk) begin
    if(diag_cs) begin
        if(diag_wr) begin
            case(diag_addr)
                8'h00: scratch_data <= diag_wr_data;
                8'h04: scratch_addr <= diag_wr_data;
                8'h08: dram_latency <= diag_wr_data[2:0];
                8'h0C: burst_length <= diag_wr_data[7:0];
                8'h10: write_scratch_to_reg <= 1'b1;
                8'h14: read_reg_to_scratch <= 1'b1;
            endcase
        end
        if(diag_rd) begin
            case(diag_addr) 
                8'h00: rd_data_reg <= scratch_data;
                8'h04: rd_data_reg <= scratch_addr;
            endcase
        end
    end
end

//
reg [3:0] fsm_write_reg = 0;
always @(posedge clk) begin
    if(fsm_write_reg == 0) begin
        cs <= 1'b1;
        wr_sel <= 1'b1;
        reg_sel <= 1'b1;
        addr_in <= scratch_addr;
        wr_data_in <= scratch_data;

        fsm_write_reg <= fsm_write_reg + 1;
    end
    if(fsm_write_reg[1]) begin
        cs <= 1'b0;

        fsm_write_reg <= fsm_write_reg + 1;
    end
    if(fsm_write[3]) begin
        if(busy) begin

        end
    end
end

//===================================================
// HyperRAM controller
//===================================================
hyperram_controller hyperram_controller_inst (
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
    .ctrl_rd_sel       (rd_sel       ),
    .ctrl_wr_sel       (wr_sel       ),
    .ctrl_mem_sel      (mem_sel      ),
    .ctrl_reg_sel      (reg_sel      ),
    .ctrl_num_words    (num_words    ),
    .ctrl_latency      (latency      ),
    .ctrl_addr_in      (addr_in      ),
    .ctrl_wr_data_in   (wr_data_in   ),
    .ctrl_wr_data_next (wr_data_next ),
    .ctrl_rd_data_out  (rd_data_out  ),
    .ctrl_rd_data_valid(rd_data_valid),
    .ctrl_busy         (busy         )
);

endmodule