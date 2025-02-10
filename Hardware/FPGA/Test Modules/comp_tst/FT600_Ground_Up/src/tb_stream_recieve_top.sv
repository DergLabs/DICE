`timescale 1ns / 1ps

module tb_stream_recieve_top #(
    `include "tb_parameters.vh"
) ();

    reg ftdi_clk;
    reg rst_n;
    wire [3:0] LED;
    wire ftdi_resetn;
    wire ftdi_wakeupn;
    reg ftdi_rxf_n;
    reg ftdi_txe_n;
    wire ftdi_oe_n;
    wire ftdi_rd_n;
    wire ftdi_wr_n;
    wire [15:0] ftdi_data;
    reg [15:0] reg_ftdi_data_i = 16'h0000;
    wire [1:0] ftdi_be;
    reg [1:0] reg_ftdi_be_i = 2'b00;

    assign ftdi_data = reg_ftdi_data_i;
    assign ftdi_be = reg_ftdi_be_i;


    always #FT600_CLK_PERIOD    ftdi_clk = ~ftdi_clk;

    ft600_stream_recieve_top ft600_stream_recieve_top (
    .rst_n(rst_n),
    .LED(LED),
    .ftdi_resetn(ftdi_resetn),   
    .ftdi_wakeupn(ftdi_wakeupn),
    .ftdi_clk(ftdi_clk),
    .ftdi_rxf_n(ftdi_rxf_n),   
    .ftdi_txe_n(ftdi_txe_n),   
    .ftdi_oe_n(ftdi_oe_n),    
    .ftdi_rd_n(ftdi_rd_n),    
    .ftdi_wr_n(ftdi_wr_n),    
    .ftdi_data(ftdi_data),   
    .ftdi_be(ftdi_be)
    );

    //always @ (negedge ftdi_clk or negedge rst_n) begin
    //    if (rst_n) begin
    //        ftdi_data = reg_ftdi_data_i;
    //        ftdi_be = reg_ftdi_be_i;
    //    end
    //end

    initial begin
        ftdi_clk = 1'b0;
        rst_n = 1'b0;
        ftdi_txe_n = 1'b1;
        ftdi_rxf_n = 1'b1;
        
        #15
        rst_n = 1'b1;
        #5
        ftdi_rxf_n = 1'b0;

        @ (negedge ftdi_oe_n)
        @ (negedge ftdi_rd_n)

        reg_ftdi_data_i = 16'h3130;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h3332;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h3534;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h3736;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h3938;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h6261;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h6463;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h6665;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)

        reg_ftdi_data_i = 16'h3130;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h3332;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h3534;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h3736;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h3938;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h6261;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h6463;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h6665;
        reg_ftdi_be_i = 2'b11;
        #1
        @ (negedge ftdi_clk)

        //finish sending things
        ftdi_rxf_n = 1'b1;
        reg_ftdi_data_i = 16'h0000;
        reg_ftdi_be_i = 2'b00;


        //#50

        //ftdi_txe_n = 1'b1;
        //rst_n = 1'b1;

        //$display("end testbench");
        //$finish;
    end

endmodule