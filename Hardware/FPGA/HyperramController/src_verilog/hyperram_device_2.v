module hyperram_device_2 #(
    parameter LATENCY = 4
)(
    //System clock and reset
    input        clk         ,
    input        rst         ,
    //Winbond HyperRAM interface signals
    input        dram_clk_p  ,
    input        dram_clk_n  ,
    input        dram_cs     ,
    inout [15:0] dram_dq     ,
    inout [ 1:0] dram_rwds   
);

//HyperRAM data and strobing signals
wire [15:0] dram_dq_out;
wire [15:0] dram_dq_in ;
wire        dram_dq_oe ;

wire [ 1:0] dram_rwds_out;
wire [ 1:0] dram_rwds_in ;
wire        dram_rwds_oe ;

//Control registers
reg dram_dq_oe_reg = 0;
reg dram_rwds_oe_reg = 0;

assign dram_dq_oe = dram_dq_oe_reg;
assign dram_rwds_oe = dram_rwds_oe_reg;

//Output registers
reg [15:0] dram_dq_out_reg = 0;
reg [ 1:0] dram_rwds_out_reg = 0;

assign dram_dq_out = dram_dq_out_reg;
assign dram_rwds_out = dram_rwds_out_reg;

//=================================================
// Handles start and end of transaction
//=================================================
reg ca_stage = 0;
always @(negedge dram_cs) begin
    ca_stage <= 1'b1;
    dram_rwds_out_reg <= 2'b11;
    dram_rwds_oe_reg <= 1'b1;
end

always @(posedge dram_cs) begin
    ca_stage <= 1'b0;
    dram_rwds_out_reg <= 2'd0;
    dram_rwds_oe_reg <= 1'b0;
    dram_dq_out_reg <= 16'd0;
    dram_dq_oe_reg <= 1'b0;
end

//=================================================
// Command/Address FSM
//=================================================
reg [7:0] ca_counter = 0;
reg [7:0] ca_buffer [0:7];
reg       rd_or_wr = 0;
reg       reg_or_mem = 0;

wire rd_sel ;
wire wr_sel ;
wire mem_sel;
wire reg_sel;

assign rd_sel = rd_or_wr;
assign wr_sel = ~rd_or_wr;
assign mem_sel = ~reg_or_mem;
assign reg_sel = reg_or_mem;

reg       wait_stage = 0;
reg [7:0] latency_counter = 0;

always @(posedge dram_clk_p) begin
    if(ca_stage) begin
        ca_counter <= ca_counter + 1;
        ca_buffer[ca_counter] <= dram_dq_in;
        //Set flags for easy viewing in simulation
        if(ca_counter == 0) begin
            rd_or_wr <= dram_dq_in[7];
            reg_or_mem <= dram_dq_in[6];
        end
        //Start latency stage, aborts if reg write
        if(ca_counter == 2) begin
            latency_counter <= 2 * LATENCY;
            wait_stage <= 1'b1;
        end
    end
end

always @(negedge dram_clk_p) begin
    if(ca_stage) begin
        ca_counter <= ca_counter + 1;
        ca_buffer[ca_counter] <= dram_dq_in;
        //Handle register writes
        if(wr_sel && reg_sel) begin
            if(ca_counter == 7) begin
                ca_stage <= 1'b0;
                wait_stage <= 1'b0;
            end
        end
        else if(ca_counter == 5) begin
            ca_stage <= 1'b0;
            //Memory drives rwds low for read requests
            if(rd_sel) begin
                dram_rwds_out_reg <= 1'b00;
            end
            //Memory gives control of rwds to host for write requests
            if(wr_sel) begin
                dram_rwds_oe_reg <= 1'b0;
            end
        end
    end
end

//=================================================
// Latency FSM (2x)
//=================================================
reg read_stage = 0;
reg write_stage = 0;

always @(negedge dram_clk_p) begin
    if(wait_stage) begin
        //Simulate memory latency window during transaction
        if(latency_counter == 0) begin
            wait_stage <= 1'b0;
            read_stage <= rd_sel;
            write_stage <= wr_sel;
        end
        else begin
            latency_counter <= latency_counter - 1;
        end
    end
end

//=================================================
// Read FSM
//=================================================
reg send_first = 0;
reg send_second = 0;
always @(posedge dram_clk_p) begin
    //This flag must be set every cycle for another word to be output
    if(read_stage) begin
        send_first <= 1'b1;
    end
end

always @(posedge dram_cs) begin
    read_stage <= 1'b0;
end

//Data starts getting sent half a cycle past the posedge of CK according to datasheet
//This should align with the negedge of the system clock that's passed in from sim
always @(negedge clk) begin
    if(read_stage && send_first) begin
        send_first <= 1'b0;
        send_second <= 1'b1;
        //Ensure this stays active
        dram_rwds_out_reg <= 2'b11;
        dram_rwds_oe_reg <= 1'b1;
        //Some dummy data to output: 1337CAFE
        dram_dq_out_reg <= 16'h1337;
        dram_dq_oe_reg <= 1'b1;
    end
end

always @(posedge clk) begin
    if(read_stage && send_second) begin
        send_second <= 1'b0;
        //Ensure this stays active
        dram_rwds_out_reg <= 2'b00;
        dram_rwds_oe_reg <= 1'b1;
        //Some dummy data to output: 1337CAFE
        dram_dq_out_reg <= 16'hCAFE;
        dram_dq_oe_reg <= 1'b1;
    end
end

//=================================================
// Write FSM
//=================================================
/* TBD */
//Not really needed for validating waveforms for controller
//May write it later for unit testing...

//=================================================
// Model physical hyperbus signals
//=================================================
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

endmodule