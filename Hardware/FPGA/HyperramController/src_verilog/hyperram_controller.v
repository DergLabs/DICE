module hyperram_controller (
    //Clocking input
    input         clk       ,
    input         clk_90o   ,
    //HyperRAM bus signals
    output        dram_clk_p,
    output        dram_clk_n,
    output        dram_cs   ,
    inout  [15:0] dram_dq   ,
    inout  [ 1:0] dram_rwds ,
    //Read/write interface
    input         ctrl_cs           ,
    input         ctrl_rd_sel       ,
    input         ctrl_wr_sel       ,
    input         ctrl_mem_sel      ,
    input         ctrl_reg_sel      ,
    input  [ 7:0] ctrl_num_words    ,
    input  [ 2:0] ctrl_latency      ,
    input  [31:0] ctrl_addr_in      ,
    input  [31:0] ctrl_wr_data_in   ,
    output        ctrl_wr_data_next ,
    output [31:0] ctrl_rd_data_out  ,
    output        ctrl_rd_data_valid,
    output        ctrl_busy
);

reg dram_clk_en = 0;
reg dram_cs_reg = 1;
assign dram_cs = dram_cs_reg;

//Hyperbus signals
wire dram_clk;

wire [15:0] dram_dq_in   ;
wire [15:0] dram_dq_out  ;
wire        dram_dq_oe   ;

wire [ 1:0] dram_rwds_in ;
wire [ 1:0] dram_rwds_out;
wire        dram_rwds_oe ;

//DDR inputs from HyperRAM
wire [15:0] dram_dq_in_rise;
wire [15:0] dram_dq_in_fall;

wire [ 1:0] dram_rwds_in_rise;
wire [ 1:0] dram_rwds_in_fall;

//DDR outputs to HyperRAM
reg [15:0] dram_dq_out_rise = 0;
reg [15:0] dram_dq_out_fall = 0;
reg        dram_dq_oe_reg   = 0;
assign dram_dq_oe = dram_dq_oe_reg;

reg [ 1:0] dram_rwds_out_rise = 0;
reg [ 1:0] dram_rwds_out_fall = 0;
reg        dram_rwds_oe_reg   = 0;
assign dram_rwds_oe = dram_rwds_oe_reg;

//=================================================
// Simple read/write interface state machine
//=================================================
reg [31:0] addr_reg      = 0;
reg        wr_sel_reg    = 0;
reg        rd_sel_reg    = 0;
reg        mem_sel_reg   = 0;
reg        reg_sel_reg   = 0;
reg [ 7:0] num_words_reg = 0;
reg [ 2:0] latency_reg   = 0;
reg        busy_reg      = 0;
reg [ 7:0] fsm_ca        = 0;

assign ctrl_busy = busy_reg;

always @(posedge clk) begin
    //Cannot perform read or write while busy
    if(ctrl_cs && !busy_reg) begin
        //Gather relavent settings
        addr_reg      <= ctrl_addr_in;
        mem_sel_reg   <= ctrl_mem_sel;
        reg_sel_reg   <= ctrl_reg_sel;
        rd_sel_reg    <= ctrl_rd_sel;
        wr_sel_reg    <= ctrl_wr_sel;
        busy_reg      <= 1'b1;
        num_words_reg <= ctrl_num_words - 1;
        latency_reg   <= ctrl_latency;
        //Start command/address FSM
        fsm_ca[0] <= 1'b1;
    end
end

//=================================================
// Command/Address state machine
//=================================================
reg [47:0] ca_data_reg = 0;
reg        fsm_wait    = 0;
reg [ 3:0] latency_counter = 0;

always @(posedge clk) begin
    //Begin CA transaction
    fsm_ca[7:1] <= fsm_ca[6:0];

    //Set data to be output
    if(fsm_ca[0]) begin
        fsm_ca[0] <= 1'b0;
        //Latch CA data to be written out
        ca_data_reg[47] <= rd_sel_reg;        //1=read, 0=write
        ca_data_reg[46] <= reg_sel_reg;       //1=reg, 0=mem
        ca_data_reg[45] <= 1'b1;              //1=linear, 0=wrap
        ca_data_reg[44:16] <= addr_reg[31:3]; //Row and upper-column bits
        ca_data_reg[15: 3] <= 13'd0;          //Reserved
        ca_data_reg[ 2: 0] <= addr_reg[ 2:0]; //Lower-column bits
    end

    //Output CA data
    if(fsm_ca[1]) begin
        dram_cs_reg <= 1'b0;
        //Bytes 5 and 6
        dram_dq_out_rise <= {8'h00, ca_data_reg[47:40]};
        dram_dq_out_fall <= {8'h00, ca_data_reg[40:32]};
    end
    if(fsm_ca[2]) begin
        dram_dq_oe_reg <= 1'b1;
        dram_clk_en <= 1'b1;
        //Bytes 4 and 3
        dram_dq_out_rise <= {8'h00, ca_data_reg[31:24]};
        dram_dq_out_fall <= {8'h00, ca_data_reg[23:16]};
    end
    if(fsm_ca[3]) begin
        //Bytes 2 and 1
        dram_dq_out_rise <= {8'h00, ca_data_reg[15: 8]};
        dram_dq_out_fall <= {8'h00, ca_data_reg[ 7: 0]};
    end

    //No latency on register writes
    if(wr_sel_reg && reg_sel_reg) begin
        if(fsm_ca[4]) begin
            dram_dq_out_rise <= {8'h00, ctrl_wr_data_in[15: 8]};
            dram_dq_out_fall <= {8'h00, ctrl_wr_data_in[ 7: 0]};
        end
        if(fsm_ca[5]) begin
            //Zero dq output for sim validation
            dram_dq_out_rise <= 16'h0000;
            dram_dq_out_fall <= 16'h0000;
        end
        if(fsm_ca[6]) begin
            //Disable dq output
            dram_dq_oe_reg <= 1'b0;
            //End transaction
            dram_cs_reg <= 1'b1;
            dram_clk_en <= 1'b0;
            busy_reg <= 1'b0;
        end
    end
    //Regular behavior otherwise
    else begin
        if(fsm_ca[4]) begin
            //Zero dq output to make it clear when transaction ends
            dram_dq_out_rise <= 16'h0000;
            dram_dq_out_fall <= 16'h0000;
            //Start latency counter
            fsm_wait <= 1'b1;
            if(dram_rwds_in_rise[0]) begin
                latency_counter <= {latency_reg, 1'b0};
            end
            else begin
                latency_counter <= {1'b0, latency_reg};
            end
        end
        if(fsm_ca[5]) begin
            //Disable dq output
            dram_dq_oe_reg <= 1'b0;
        end
    end
end

//=================================================
// Latency state machine
//=================================================
reg [ 3:0] fsm_read  = 0;
reg [ 3:0] fsm_write = 0;
always @(posedge clk) begin
    if(fsm_wait) begin
        if(latency_counter != 0) begin
            latency_counter <= latency_counter - 1;
        end
        else begin
            fsm_wait <= 1'b0;
        end
    end
end

//When to start the read and write stages
//Being lazy for now
//The latency can be between 5 and 7 cycles, so this should be okay
reg [31:0] data_reg  = 0;
reg        data_next_reg = 0;
assign ctrl_wr_data_next = data_next_reg;
always @(posedge clk) begin
    if(latency_counter == 1) begin
        fsm_read[0] <= rd_sel_reg;
    end
    if(latency_counter == 3) begin
        data_reg      <= ctrl_wr_data_in;
        data_next_reg <= 1'b1;
        fsm_write[0]  <= wr_sel_reg;
    end
end

//=================================================
// Read state machine
//=================================================
reg [31:0] rd_data_out_reg = 0;
reg        rd_data_valid_reg = 0;

assign rd_data_out = rd_data_out_reg;
assign rd_data_valid = rd_data_valid_reg;

//Handles multiple word reads
always @(posedge clk) begin
    fsm_read[3:1] <= fsm_read[2:0];

    if(fsm_read[0]) begin
        if(num_words_reg == 0) begin
            fsm_read[0] <= 1'b0;
            dram_clk_en <= 1'b0;
        end
        else begin
            num_words_reg <= num_words_reg - 1;
        end
    end

    //Disable cs signal one cycle later
    if(fsm_read[1] && !fsm_read[0]) begin
        dram_cs_reg <= 1'b1;
    end
end

//Data out pipeline
//RWDS is ignored because the datasheet does not specify any potential stalling during reads
reg [15:0] read_buffer = 0;
always @(posedge clk) begin
    if(fsm_read[1]) begin
        read_buffer <= dram_dq_in_fall;
    end
    if(fsm_read[2]) begin
        rd_data_out_reg <= {read_buffer, dram_dq_in_rise};
        rd_data_valid_reg <= 1'b1;
    end
    if(fsm_read[3] && !fsm_read[2]) begin
        rd_data_out_reg <= 32'd0;
        rd_data_valid_reg <= 1'b0;
        //Not busy anymore
        busy_reg <= 1'b0;
    end
end

//=================================================
// Write state machine
//=================================================
always @(posedge clk) begin
    fsm_write[3:1] <= fsm_write[2:0];
    if(fsm_write[0]) begin
        if(num_words_reg == 0) begin
            fsm_write[0] <= 1'b0;
            data_next_reg <= 1'b0;
        end
        else begin
            num_words_reg <= num_words_reg - 1;
        end
    end
    if(fsm_write[2] && !fsm_write[1]) begin
        dram_clk_en <= 1'b0;
    end
    if(fsm_write[3] && !fsm_write[2]) begin
        dram_cs_reg <= 1'b1;
    end
end

//Currently no support for data masking
always @(posedge clk) begin
    if(fsm_write[0]) begin
        data_reg <= ctrl_wr_data_in;
        dram_dq_out_rise <= data_reg[31:16];
        dram_dq_out_fall <= data_reg[15: 0];
    end
    if(fsm_write[1]) begin
        //Enable output one cycle later
        dram_dq_oe_reg <= 1'b1;
        dram_rwds_oe_reg <= 1'b1;
    end
    if(fsm_write[2] && !fsm_write[1]) begin
        dram_cs_reg <= 1'b1;
        //Disable output to ensure only one cycle
        dram_dq_oe_reg <= 1'b0;
        dram_rwds_oe_reg <= 1'b0;
        //Not busy anymore
        busy_reg <= 1'b0;
    end
end

//=================================================
// Reset stage, will be removed to cut latency
//=================================================
/*
always @(posedge clk) begin
    if(fsm_reset) begin
        fsm_reset   <= 1'b0;
        addr_reg    <= 1'b0;
        data_reg    <= 1'b0;
        wr_sel_reg  <= 1'b0;
        rd_sel_reg  <= 1'b0;
        mem_sel_reg <= 1'b0;
        reg_sel_reg <= 1'b0;
        busy_reg    <= 1'b0;
    end
end
*/

//=================================================
// HyperRAM bus management
//=================================================
genvar i;

//HyperRAM inputs from IOBUF at top
iddr_wrap #(
    .BUS_WIDTH(16)
) iddr_wrap_inst_dq (
    .clk      (clk_90o        ),
    .din      (dram_dq_in     ),
    .dout_rise(dram_dq_in_rise),
    .dout_fall(dram_dq_in_fall)
);

iddr_wrap #(
    .BUS_WIDTH(2)
) iddr_wrap_inst_rwds (
    .clk      (clk_90o          ),
    .din      (dram_rwds_in     ),
    .dout_rise(dram_rwds_in_rise),
    .dout_fall(dram_rwds_in_fall)
);

//HyperRAM outputs from IOBUF at top
oddr_wrap #(
    .BUS_WIDTH(16)
) oddr_wrap_inst_dq (
    .clk     (clk             ),
    .din_rise(dram_dq_out_rise),
    .din_fall(dram_dq_out_fall),
    .dout    (dram_dq_out     )
);

oddr_wrap #(
    .BUS_WIDTH(2)
) oddr_wrap_inst_rwds (
    .clk     (clk               ),
    .din_rise(dram_rwds_out_rise),
    .din_fall(dram_rwds_out_fall),
    .dout    (dram_rwds_out     )
);

//Neat trick for outputting 90 degree delayed clock
oddr_wrap oddr_wrap_inst_clk (
    .clk     (clk_90o    ),
    .din_rise(dram_clk_en),
    .din_fall(1'b0       ),
    .dout    (dram_clk   )
);

//Connect hyperram dq and rwds
iobuf_wrap #(
    .BUS_WIDTH(16)
) iobuf_wrap_inst_dq (
    .din   (dram_dq_out),
    .dout  (dram_dq_in ),
    .dio   (dram_dq    ),
    .out_en(dram_dq_oe )
);

iobuf_wrap #(
    .BUS_WIDTH(2)
) iobuf_wrap_inst_rwds (
    .din   (dram_rwds_out),
    .dout  (dram_rwds_in ),
    .dio   (dram_rwds    ),
    .out_en(dram_rwds_oe )
);

//Generate differential clock
obufds_wrap obufds_wrap_inst (
    .clk  (dram_clk  ),
    .clk_p(dram_clk_p),
    .clk_n(dram_clk_n)
);

endmodule