`timescale 1ns / 1ps

module tb_stream_top #(
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
    //reg [15:0] reg_ftdi_data_to_module;
    //reg [15:0] reg_ftdi_data_from_module;
    //reg [15:0] reg_ftdi_data_i;
    wire [15:0] ftdi_data;
    //reg flag_ftdi_data_to_module;
    //reg [1:0] reg_ftdi_be_to_module;
    //reg [1:0] reg_ftdi_be_from_module;
    wire [1:0] ftdi_be;
    //reg flag_ftdi_be_to_module;

    //assign reg_ftdi_data_from_module = ftdi_data;
    //assign ftdi_data = (flag_ftdi_data_to_module==1'b1)? reg_ftdi_data_to_module : 16'hZZZZ;

    //assign reg_ftdi_be_from_module = ftdi_be;
    //assign ftdi_be = (flag_ftdi_be_to_module==1'b1)? reg_ftdi_be_to_module : 2'bZZ;


    always #FT600_CLK_PERIOD    ftdi_clk = ~ftdi_clk;

    ft600_stream_top ft600_stream_top (
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

    initial begin
        ftdi_clk = 1'b0;
        rst_n = 1'b0;
        ftdi_txe_n = 1'b1;
        ftdi_rxf_n = 1'b1;
        
        #15
        rst_n = 1'b1;
        #5
        ftdi_txe_n = 1'b0;

        //#50

        //ftdi_txe_n = 1'b1;
        //rst_n = 1'b1;

        //$display("end testbench");
        //$finish;
    end

endmodule