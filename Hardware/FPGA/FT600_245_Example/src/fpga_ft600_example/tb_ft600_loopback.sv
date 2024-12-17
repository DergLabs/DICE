
`timescale 1ns / 1ps

module tb_ft600_loopback #(
    `include "tb_parameters.vh"
) ();

    reg ftdi_clk;
    reg clk;
    reg rst_n;
    wire [3:0] LED;
    wire ftdi_resetn;
    wire ftdi_wakeupn;
    reg ftdi_rxf_n;
    reg ftdi_txe_n;
    wire ftdi_oe_n;
    wire ftdi_rd_n;
    wire ftdi_wr_n;
    reg [15:0] reg_ftdi_data_to_module;
    reg [15:0] reg_ftdi_data_from_module;
    reg [15:0] reg_ftdi_data_i;
    wire [15:0] ftdi_data;
    reg flag_ftdi_data_to_module;
    reg [1:0] reg_ftdi_be_to_module;
    reg [1:0] reg_ftdi_be_from_module;
    wire [1:0] ftdi_be;
    reg flag_ftdi_be_to_module;

    assign reg_ftdi_data_from_module = ftdi_data;
    assign ftdi_data = (flag_ftdi_data_to_module==1'b1)? reg_ftdi_data_to_module : 16'hZZZZ;

    assign reg_ftdi_be_from_module = ftdi_be;
    assign ftdi_be = (flag_ftdi_be_to_module==1'b1)? reg_ftdi_be_to_module : 2'bZZ;

    always #FT600_CLK_PERIOD    ftdi_clk = ~ftdi_clk;
    always #MAIN_CLK_PERIOD     clk = ~clk;

    always @ (negedge ftdi_clk or negedge rst_n) begin
        if (rst_n) begin
            if(flag_ftdi_data_to_module == 1'b1) begin
                reg_ftdi_data_to_module <= reg_ftdi_data_i;
                reg_ftdi_be_to_module <= 2'b11;
            end
        end
    end

    fpga_top_ft600_loopback ft600_loopback(
        .clk(clk),
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
        clk = 1'b0;
        ftdi_clk = 1'b0;
        flag_ftdi_data_to_module = 1'b1;
        flag_ftdi_be_to_module = 1'b1;
        reg_ftdi_data_to_module = 16'h0000;
        reg_ftdi_be_to_module = 2'b00;
        //reg_ftdi_data_from_module = 16'h0000;
        //reg_ftdi_be_from_module = 2'b00;
        
        //reset starts enabled
        rst_n = 1'b0;
        #5

        //active low, keep high at start
        ftdi_rxf_n = 1'b1;
        ftdi_txe_n = 1'b1;


        //disable reset then activate rxf to start simulation
        rst_n = 1'b1;
        #10
        ftdi_rxf_n = 1'b0;

        @(negedge ftdi_oe_n)
        @(negedge ftdi_rd_n)
        
        reg_ftdi_data_i = 16'h3031;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h3031;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h3233;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h3435;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h3637;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h3839;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h6162;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h6364;
        #1
        @ (negedge ftdi_clk)
        reg_ftdi_data_i = 16'h6566;
        #1

        //finish sending things
        ftdi_rxf_n = 1'b1;

        flag_ftdi_data_to_module = 1'b0;
        flag_ftdi_be_to_module = 1'b0;

        #150

        ftdi_txe_n = 1'b0;

        //#15000 //wait 100 sysclk cycles

        //$display("end testbench");
        //$finish;
    end
endmodule