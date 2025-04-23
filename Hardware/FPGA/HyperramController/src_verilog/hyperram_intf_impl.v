module hyperram_intf_impl (
    //Clocking input
    input         clk               ,
    input         clk_90o           ,
    input         clk_400m_90o      ,
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
    output        ctrl_wr_data_next ,
    output [31:0] ctrl_rd_data_out  ,
    output        ctrl_rd_data_valid
);

//State management stuff
localparam IDLE = 0;
localparam COMMAND_ADDRESS = 1;
localparam WAIT = 2;
localparam READ = 3;
localparam WRITE = 4;

reg [ 2:0] state_reg = 0;

//Data input buffer (for now)
reg [ 1:0] mode_reg = 0;
reg [31:0] addr_reg = 0;
reg [31:0] data_reg = 0;

reg data_next_reg = 0;
assign ctrl_wr_data_next = data_next_reg;

reg [ 2:0] latency_reg = 0;
reg [31:0] num_words_reg = 0;

//Helpful signals
wire rd_sel;
wire wr_sel;
wire reg_sel;
wire mem_sel;

assign rd_sel  =  ctrl_mode[0];
assign wr_sel  = ~ctrl_mode[0];
assign reg_sel =  ctrl_mode[1];
assign mem_sel = ~ctrl_mode[1];

//Command/Address FSM
localparam CA_INIT    = 0;
localparam CA_STAGE_1 = 1;
localparam CA_STAGE_2 = 2;
localparam CA_STAGE_3 = 3;
localparam CA_STAGE_4 = 4;
localparam CA_STAGE_5 = 5;

localparam RW_STAGE_1 = 6;
localparam RW_STAGE_2 = 7;
localparam RW_STAGE_3 = 8;

reg [ 3:0] ca_state = 0;
reg [47:0] ca_data_reg = 0;

//Wait FSM
reg [3:0] latency_counter = 0;

//Read FSM
reg [ 3:0] fsm_read = 0;
reg [31:0] rd_data_out_reg = 0;
reg        rd_data_valid_reg = 0;

reg [15:0] read_buffer = 0;

assign ctrl_rd_data_out = rd_data_out_reg;
assign ctrl_rd_data_valid = rd_data_valid_reg;

//Write FSM
reg [3:0] fsm_write = 0;

//DRAM signals
wire dram_clk;

wire [15:0] dram_dq_in;
wire [15:0] dram_dq_out;
wire        dram_dq_oe;

wire [ 1:0] dram_rwds_in;
wire [ 1:0] dram_rwds_out;
wire        dram_rwds_oe;

reg [15:0] dram_dq_out_rise = 0;
reg [15:0] dram_dq_out_fall = 0;
reg        dram_dq_oe_reg   = 0;
assign dram_dq_oe = dram_dq_oe_reg;

reg [ 1:0] dram_rwds_out_rise = 0;
reg [ 1:0] dram_rwds_out_fall = 0;
reg        dram_rwds_oe_reg   = 0;
assign dram_rwds_oe = dram_rwds_oe_reg;

reg dram_clk_en = 0;
reg dram_cs_reg = 1;
assign dram_cs = dram_cs_reg;

wire [15:0] dram_dq_in_rise;
wire [15:0] dram_dq_in_fall;

wire [ 1:0] dram_rwds_in_rise;
wire [ 1:0] dram_rwds_in_fall;

always @(posedge clk) begin
    //Doing this part outside the state machine should be okay
    //Read/write stages should let this run to zero before finishing for next transaction
    if(latency_counter != 0) begin
        latency_counter <= latency_counter - 1;
    end

    //Main state machine
    case(state_reg)
        IDLE: begin
            if(ctrl_cs) begin
                mode_reg <= ctrl_mode;
                addr_reg <= ctrl_addr_in;
                //data_reg <= ctrl_wr_data_in;

                latency_reg <= ctrl_latency;
                num_words_reg <= ctrl_num_words - 1;

                state_reg <= COMMAND_ADDRESS;
            end
        end

        //=================================================
        // Command/Address state machine
        //=================================================
        COMMAND_ADDRESS: begin
            case(ca_state)
                CA_INIT: begin
                    //Allign all the data for CA transaction (could be done a cycle earlier)
                    ca_data_reg[47] <= rd_sel;            //1=read, 0=write
                    ca_data_reg[46] <= reg_sel;           //1=reg, 0=mem
                    ca_data_reg[45] <= 1'b1;              //1=linear, 0=wrap
                    ca_data_reg[44:16] <= addr_reg[31:3]; //Row and upper-column bits
                    ca_data_reg[15: 3] <= 13'd0;          //Reserved
                    ca_data_reg[ 2: 0] <= addr_reg[ 2:0]; //Lower-column bits

                    ca_state <= CA_STAGE_1;
                end
                CA_STAGE_1: begin
                    //Drop chip select to initiate transaction
                    dram_cs_reg <= 1'b0;
                    //Enable some cycles early to settle bus
                    dram_dq_oe_reg <= 1'b1;

                    //Bytes 6 and 5
                    dram_dq_out_rise <= {8'h00, ca_data_reg[47:40]};
                    dram_dq_out_fall <= {8'h00, ca_data_reg[39:32]};

                    ca_state <= CA_STAGE_2;
                end
                CA_STAGE_2: begin
                    //Enable clock and data output
                    //dram_dq_oe_reg <= 1'b1;
                    dram_clk_en <= 1'b1;

                    //Bytes 4 and 3
                    dram_dq_out_rise <= {8'h00, ca_data_reg[31:24]};
                    dram_dq_out_fall <= {8'h00, ca_data_reg[23:16]};

                    ca_state <= CA_STAGE_3;
                end
                CA_STAGE_3: begin
                    //Bytes 2 and 1
                    dram_dq_out_rise <= {8'h00, ca_data_reg[15: 8]};
                    dram_dq_out_fall <= {8'h00, ca_data_reg[ 7: 0]};

                    //Special case for register writes
                    if(reg_sel && wr_sel) begin
                        ca_state <= RW_STAGE_1;
                        data_reg <= ctrl_wr_data_in;
                        data_next_reg <= 1'b1;
                    end
                    else begin
                        ca_state <= CA_STAGE_4;
                    end
                end
                CA_STAGE_4: begin
                    //Zero dq output to validate behavior in sim
                    dram_dq_out_rise <= 16'h0000;
                    dram_dq_out_fall <= 16'h0000;

                    //Set up latency counter
                    if(dram_rwds_in_rise[0]) begin
                        latency_counter <= {latency_reg, 1'b0};
                    end
                    else begin
                        latency_counter <= {1'b0, latency_reg};
                    end

                    ca_state <= CA_STAGE_5;
                end
                CA_STAGE_5: begin
                    //Disable data output
                    dram_dq_oe_reg <= 1'b0;

                    ca_state <= CA_INIT;
                    state_reg <= WAIT;
                end
                //Pipeline for register writes
                RW_STAGE_1: begin
                    data_next_reg <= 1'b0;

                    dram_dq_out_rise <= {8'h00, data_reg[15: 8]};
                    dram_dq_out_fall <= {8'h00, data_reg[ 7: 0]};

                    ca_state <= RW_STAGE_2;
                end
                RW_STAGE_2: begin
                    dram_dq_out_rise <= 16'h0000;
                    dram_dq_out_fall <= 16'h0000;

                    ca_state <= RW_STAGE_3;
                end
                RW_STAGE_3: begin
                    //Disable data output
                    dram_dq_oe_reg <= 1'b0;

                    //End transaction
                    dram_cs_reg <= 1'b1;
                    dram_clk_en <= 1'b0;

                    //Back to idle state
                    ca_state <= CA_INIT;
                    state_reg <= IDLE;
                end
            endcase
        end

        //=================================================
        // Latency state machine
        //=================================================
        WAIT: begin
            //Read/write state machines have slightly different timing
            //Start read state machine
            if(latency_counter == 1 && rd_sel) begin
                fsm_read[0] <= 1'b1;
                state_reg <= READ;
            end
            //Start write state machine
            if(latency_counter == 3 && wr_sel) begin
                data_reg <= ctrl_wr_data_in;
                data_next_reg <= 1'b1;
                fsm_write[0] <= 1'b1;
                state_reg <= WRITE;
            end
        end

        //=================================================
        // Read state machine
        //=================================================
        READ: begin
            fsm_read[3:1] <= fsm_read[2:0];

            //Handles timing for reading input
            if(fsm_read[0]) begin
                if(num_words_reg == 0) begin
                    fsm_read[0] <= 1'b0;
                    dram_clk_en <= 1'b0;
                end
                else begin
                    num_words_reg <= num_words_reg - 1;
                end
            end

            //Dusabke cs signal one cycle later
            if(fsm_read[1] && !fsm_read[0]) begin
                dram_cs_reg <= 1'b1;
            end

            //Read pipeline
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
            end

            //Back to idle state
            if(fsm_read == 4'b1000) begin
                state_reg <= IDLE;
            end
        end

        //=================================================
        // Write state machine
        //=================================================
        WRITE: begin
            fsm_write[3:1] <= fsm_write[2:0];

            //Handles write counter timing
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

            //Handles data output timing
            if(fsm_write[0]) begin
                dram_dq_out_rise <= data_reg[31:16];
                dram_dq_out_fall <= data_reg[15: 0];
                data_reg <= ctrl_wr_data_in;
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
            end

            //Back to idle state
            if(fsm_write == 4'b1000) begin
                state_reg <= IDLE;
            end
        end
    endcase
end

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

//=================================================
// HyperRAM debug
//=================================================
inside_hyperram_ila your_instance_name (
	.clk   (clk_400m_90o), // input wire clk
	.probe0(clk         ), // input wire [0:0]  probe0  
	.probe1(dram_cs     ), // input wire [0:0]  probe1 
	.probe2(dram_dq_in  ), // input wire [14:0]  probe2 
	.probe3(dram_rwds_in), // input wire [1:0]  probe3 
	.probe4(state_reg   ) // input wire [2:0]  probe4
);

endmodule