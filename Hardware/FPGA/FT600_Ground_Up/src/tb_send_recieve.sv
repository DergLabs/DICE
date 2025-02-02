
`timescale 1ns / 1ps

module tb_send_recieve #(
    `include "tb_parameters.vh"
) ();

    reg ftdi_clk;
    reg rst_n;
    //wire [3:0] LED;
    wire ftdi_resetn;
    wire ftdi_wakeupn;
    reg ftdi_rxf_n;
    reg ftdi_txe_n;
    wire ftdi_oe_n;
    wire ftdi_rd_n;
    wire ftdi_wr_n;
    wire [15:0] ftdi_data;
    wire [1:0] ftdi_be;

    reg [15:0] tb_ftdi_data_i = '0;
    wire [15:0] tb_ftdi_data_o;
    reg tb_data_tx_en = 1'b0;

    assign ftdi_data = tb_data_tx_en ? tb_ftdi_data_i : 16'hZZZZ;
    assign tb_ftdi_data_o = ftdi_data;

    reg [1:0] tb_ftdi_be_i = '0;
    wire [1:0] tb_ftdi_be_o;
    reg tb_be_tx_en = 1'b0;

    assign ftdi_be = tb_be_tx_en ? tb_ftdi_be_i : 2'bZZ;
    assign tb_ftdi_be_o = ftdi_be;

    reg [15:0] data_to_ft600;
    reg [1:0] be_to_ft600;

    wire [15:0] data_from_ft600;
    wire [1:0] be_from_ft600;

    wire ready_to_recieve;
    wire ready_to_send;

    wire full;
    wire empty;

    reg data_in_valid;
    
    
    always #FT600_CLK_PERIOD    ftdi_clk = ~ftdi_clk;


    v1_5_send_recieve_module v1_5_send_recieve_module (
        .rst_n(rst_n),
        .ftdi_resetn(ftdi_resetn),    // to FT600's pin10 (RESET_N)
        .ftdi_wakeupn(ftdi_wakeupn),   // to FT600's pin11 (WAKEUP_N)
        .ftdi_clk(ftdi_clk),       // to FT600's pin43 (CLK)
        .ftdi_rxf_n(ftdi_rxf_n),     // to FT600's pin5  (RXF_N)
        .ftdi_txe_n(ftdi_txe_n),     // to FT600's pin4  (TXE_N)
        .ftdi_oe_n(ftdi_oe_n),      // to FT600's pin9  (OE_N)
        .ftdi_rd_n(ftdi_rd_n),      // to FT600's pin8  (RD_N)
        .ftdi_wr_n(ftdi_wr_n),      // to FT600's pin7  (WR_N)
        .ftdi_data(ftdi_data),      // to FT600's pin56~53 (DATA_15~DATA_12) , pin48~45 (DATA_11~DATA_8) , pin42~39 (DATA_7~DATA4) and pin36~33 (DATA_3~DATA_0)
        .ftdi_be(ftdi_be),        // to FT600's pin3 (BE_1) and pin2 (BE_0)
        .data_to_ft600(data_to_ft600),
        .be_to_ft600(be_to_ft600),
        //.data_in_valid(1'b1),
        .data_from_ft600(data_from_ft600),
        .be_from_ft600(be_from_ft600),
        .ready_to_recieve(ready_to_recieve),
        .ready_to_send(ready_to_send)
    );

    custom_sync_fifo #(.DEPTH(128), .DATA_WIDTH(18)) custom_sync_fifo (
        .clk(ftdi_clk),
        .rst_n(rst_n),
        .w_en(ready_to_send),
        .r_en(ready_to_recieve),
        .data_in({be_from_ft600, data_from_ft600}),
        .data_out({be_to_ft600, data_to_ft600}),
        .full(full),
        .empty(empty)
    );


    initial begin
        //intial setup
        ftdi_clk = 1'b0;
        rst_n = 1'b0;
        ftdi_txe_n = 1'b1;
        ftdi_rxf_n = 1'b1;
        data_in_valid = 1'b0;

        tb_data_tx_en = 1'b0;

        //write data to module

        #15
        rst_n = 1'b1;
        tb_data_tx_en = 1'b1;
        tb_be_tx_en = 1'b1;
        #5
        ftdi_rxf_n = 1'b0;

        @ (negedge ftdi_oe_n)
        @ (negedge ftdi_rd_n)

        tb_ftdi_data_i = 16'h3130;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h3332;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h3534;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h3736;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h3938;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h6261;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h6463;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h6665;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)

        //finish sending things
        ftdi_rxf_n = 1'b1;
        tb_ftdi_data_i = 16'h0000;
        tb_ftdi_be_i = 2'b00;

        //read data from module
        #30
        tb_data_tx_en = 1'b0;
        tb_be_tx_en = 1'b0;
        #5
        //rst_n = 1'b1;
        @ (negedge ftdi_clk)
        ftdi_txe_n = 1'b0;

        //@ (negedge ftdi_clk)
        //@ (negedge ftdi_clk)
        //@ (negedge ftdi_clk)
        //@ (posedge ftdi_clk)
        //data_in_valid = 1'b1;


        @ (negedge ftdi_wr_n)



        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)

        @ (negedge ftdi_clk)
        ftdi_txe_n = 1'b1;

        #8

        tb_data_tx_en = 1'b1;
        tb_be_tx_en = 1'b1;
        #5
        ftdi_rxf_n = 1'b0;

        @ (negedge ftdi_oe_n)
        @ (negedge ftdi_rd_n)

        tb_ftdi_data_i = 16'h3130;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h3332;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h3534;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h3736;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h3938;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h6261;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h6463;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        tb_ftdi_data_i = 16'h6665;
        tb_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)

        //finish sending things
        ftdi_rxf_n = 1'b1;
        tb_ftdi_data_i = 16'h0000;
        tb_ftdi_be_i = 2'b00;

        //read data from module
        #30
        tb_data_tx_en = 1'b0;
        tb_be_tx_en = 1'b0;
        #5
        //rst_n = 1'b1;
        @ (negedge ftdi_clk)
        ftdi_txe_n = 1'b0;


        @ (negedge ftdi_wr_n)

        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)
        @ (posedge ftdi_clk)

        @ (negedge ftdi_clk)
        ftdi_txe_n = 1'b1;

    end
endmodule