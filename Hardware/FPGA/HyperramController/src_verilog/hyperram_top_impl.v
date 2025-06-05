module hyperram_top_impl (
    input         sys_clk_p  ,
    input         sys_clk_n  ,

    output        dram_0_clk_p ,
    output        dram_0_clk_n ,
    output        dram_0_cs    ,
    inout  [ 1:0] dram_0_rwds  ,
    inout  [15:0] dram_0_dq    ,
    output        dram_0_rst   ,

    output        dram_1_clk_p ,
    output        dram_1_clk_n ,
    output        dram_1_cs    ,
    inout  [ 1:0] dram_1_rwds  ,
    inout  [15:0] dram_1_dq    ,
    output        dram_1_rst   ,

    output        dram_2_clk_p ,
    output        dram_2_clk_n ,
    output        dram_2_cs    ,
    inout  [ 1:0] dram_2_rwds  ,
    inout  [15:0] dram_2_dq    ,
    output        dram_2_rst   ,

    output        dram_3_clk_p ,
    output        dram_3_clk_n ,
    output        dram_3_cs    ,
    inout  [ 1:0] dram_3_rwds  ,
    inout  [15:0] dram_3_dq    ,
    output        dram_3_rst   ,

    output        mmcm_locked
);

//=================================================
// Clocking and reset
//=================================================
wire sys_clk;
wire clk;
wire clk_90o;
wire clk_400m_90o;

wire reset_vio;
reg [3:0] reset_reg;
assign dram_0_rst = reset_reg[0];
assign dram_1_rst = reset_reg[1];
assign dram_2_rst = reset_reg[2];
assign dram_3_rst = reset_reg[3];

IBUFDS IBUFDS_inst (
    .O (sys_clk  ),
    .I (sys_clk_p),
    .IB(sys_clk_n)
);

clk_gen clk_gen_inst (
    .clk_out_200m    (clk         ),
    .clk_out_200m_90o(clk_90o     ),
    .clk_out_400m_90o(clk_400m_90o),
    .reset           (1'b0        ),
    .locked          (mmcm_locked ),
    .clk_in          (sys_clk     )
);

//=================================================
// Controller stuff
//=================================================
wire [31:0] address_vio;
wire [31:0] num_words_vio;
wire [ 2:0] latency_vio;
wire [ 1:0] mode_sel_vio;
wire        rd_sel_vio;
wire        wr_sel_vio;
wire        start_vio;
wire [ 1:0] chip_sel;
wire [31:0] write_val_vio;

assign rd_sel_vio =  mode_sel_vio[0];
assign wr_sel_vio = ~rd_sel_vio;

wire fifo_ready_0;
wire fifo_ready_1;
wire fifo_ready_2;
wire fifo_ready_3;

hyperram_vio hyperram_vio_inst (
    .clk       (clk          ),  // input wire clk

    .probe_out0(address_vio  ),  // output wire [31 : 0] probe_out0
    .probe_out1(num_words_vio),  // output wire [31 : 0] probe_out1
    .probe_out2(latency_vio  ),  // output wire [2  : 0] probe_out2
    .probe_out3(mode_sel_vio ),  // output wire [1  : 0] probe_out3
    .probe_out4(start_vio    ),  // output wire [0  : 0] probe_out4
    .probe_out5(chip_sel     ),  // output wire [1  : 0] probe_out5
    .probe_out6(reset_vio    ),  // output wire [0  : 0] probe_out6
    .probe_out7(write_val_vio),  // output wire [31 : 0] probe_out7

    .probe_in0(fifo_ready_0  ),    // input wire [0 : 0] probe_in0
    .probe_in1(fifo_ready_1  ),    // input wire [0 : 0] probe_in1
    .probe_in2(fifo_ready_2  ),    // input wire [0 : 0] probe_in2
    .probe_in3(fifo_ready_3  )     // input wire [0 : 0] probe_in3
);

localparam IDLE  = 0;
localparam READ  = 1;
localparam WRITE = 2;

reg        start_prev = 0;
reg [31:0] word_counter = 0;
reg [ 1:0] state_reg = 0;
reg [ 3:0] hram_sel = 0;

wire [31:0] rd_data       [3:0];
wire        rd_data_valid [3:0];

reg [31:0] wr_data = 0;
reg        wr_data_valid = 0;

wire [3:0] packed_rd_valid;
assign packed_rd_valid = {rd_data_valid[0], rd_data_valid[1], rd_data_valid[2], rd_data_valid[3]};

always @(posedge clk) begin
    reset_reg[3:0] <= {reset_vio, reset_vio, reset_vio, reset_vio};

    case(state_reg)
        IDLE: begin
            start_prev <= start_vio;
            //Start read/write if this toggles because VIO signals are persistent
            if(start_prev != start_vio) begin
                word_counter <= 32'd0;
                if(rd_sel_vio) state_reg <= READ;
                if(wr_sel_vio) state_reg <= WRITE;
                hram_sel[chip_sel] <= 1'b1;
            end
        end
        READ: begin
            hram_sel <= 4'h0;
            if(word_counter == num_words_vio) begin
                state_reg <= IDLE;
            end
            if(packed_rd_valid != 0) begin
                word_counter <= word_counter + 1;
            end
        end
        WRITE: begin
            hram_sel <= 4'h0;
            if(word_counter == num_words_vio) begin
                wr_data_valid <= 1'b0;
                state_reg <= IDLE;
            end
            else begin
                word_counter <= word_counter + 1;
                //This chaining is redundant, but it helps timing
                //wr_data <= word_counter;
                wr_data <= write_val_vio;
                wr_data_valid <= 1'b1;
            end
        end
    endcase
end

//=================================================
// HyperRAM controller
//=================================================
hyperram_intf_impl_wrap hyperram_intf_inst_0 (
    .clk               ( clk          ),
    .clk_90o           ( clk_90o      ),
    .clk_400m_90o      ( clk_400m_90o ),
    .rst               (~reset_reg[0] ),
    .ready             (fifo_ready_0  ),
    .dram_clk_p        ( dram_0_clk_p ),
    .dram_clk_n        ( dram_0_clk_n ),
    .dram_cs           ( dram_0_cs    ),
    .dram_dq           ( dram_0_dq    ),
    .dram_rwds         ( dram_0_rwds  ),
    .ctrl_cs           ( hram_sel[0]  ),
    .ctrl_mode         ( mode_sel_vio ),
    .ctrl_num_words    ( num_words_vio),
    .ctrl_latency      ( latency_vio  ),
    .ctrl_addr_in      ( address_vio  ),
    .ctrl_wr_data_in   ( wr_data      ),
    .ctrl_wr_data_valid( wr_data_valid),
    .ctrl_rd_data_out  ( rd_data      [0]),
    .ctrl_rd_data_valid( rd_data_valid[0])
);

hyperram_intf_impl_wrap hyperram_intf_inst_1 (
    .clk               ( clk          ),
    .clk_90o           ( clk_90o      ),
    .clk_400m_90o      ( clk_400m_90o ),
    .rst               (~reset_reg[1] ),
    .ready             (fifo_ready_1  ),
    .dram_clk_p        ( dram_1_clk_p ),
    .dram_clk_n        ( dram_1_clk_n ),
    .dram_cs           ( dram_1_cs    ),
    .dram_dq           ( dram_1_dq    ),
    .dram_rwds         ( dram_1_rwds  ),
    .ctrl_cs           ( hram_sel[1]  ),
    .ctrl_mode         ( mode_sel_vio ),
    .ctrl_num_words    ( num_words_vio),
    .ctrl_latency      ( latency_vio  ),
    .ctrl_addr_in      ( address_vio  ),
    .ctrl_wr_data_in   ( wr_data      ),
    .ctrl_wr_data_valid( wr_data_valid),
    .ctrl_rd_data_out  ( rd_data      [1]),
    .ctrl_rd_data_valid( rd_data_valid[1])
);

hyperram_intf_impl_wrap hyperram_intf_inst_2 (
    .clk               ( clk          ),
    .clk_90o           ( clk_90o      ),
    .clk_400m_90o      ( clk_400m_90o ),
    .rst               (~reset_reg[2] ),
    .ready             (fifo_ready_2  ),
    .dram_clk_p        ( dram_2_clk_p ),
    .dram_clk_n        ( dram_2_clk_n ),
    .dram_cs           ( dram_2_cs    ),
    .dram_dq           ( dram_2_dq    ),
    .dram_rwds         ( dram_2_rwds  ),
    .ctrl_cs           ( hram_sel[2]  ),
    .ctrl_mode         ( mode_sel_vio ),
    .ctrl_num_words    ( num_words_vio),
    .ctrl_latency      ( latency_vio  ),
    .ctrl_addr_in      ( address_vio  ),
    .ctrl_wr_data_in   ( wr_data      ),
    .ctrl_wr_data_valid( wr_data_valid),
    .ctrl_rd_data_out  ( rd_data      [2]),
    .ctrl_rd_data_valid( rd_data_valid[2])
);

hyperram_intf_impl_wrap hyperram_intf_inst_3 (
    .clk               ( clk          ),
    .clk_90o           ( clk_90o      ),
    .clk_400m_90o      ( clk_400m_90o ),
    .rst               (~reset_reg[3] ),
    .ready             (fifo_ready_3  ),
    .dram_clk_p        ( dram_3_clk_p ),
    .dram_clk_n        ( dram_3_clk_n ),
    .dram_cs           ( dram_3_cs    ),
    .dram_dq           ( dram_3_dq    ),
    .dram_rwds         ( dram_3_rwds  ),
    .ctrl_cs           ( hram_sel[3]  ),
    .ctrl_mode         ( mode_sel_vio ),
    .ctrl_num_words    ( num_words_vio),
    .ctrl_latency      ( latency_vio  ),
    .ctrl_addr_in      ( address_vio  ),
    .ctrl_wr_data_in   ( wr_data      ),
    .ctrl_wr_data_valid( wr_data_valid),
    .ctrl_rd_data_out  ( rd_data      [3]),
    .ctrl_rd_data_valid( rd_data_valid[3])
);

endmodule