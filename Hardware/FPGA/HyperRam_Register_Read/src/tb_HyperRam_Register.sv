
`timescale 1ps / 1fs

module tb_send_recieve #(
    `include "tb_parameters.vh"
) ();

    reg sysclk_p;
    reg rst_n = 1'b1;

    reg SR = 1'b0;

    reg enable = 1'b0;

    reg [15:0] mem_input = 16'h0000;
    reg [7:0] mem_output = 8'h00;

    
    reg [1:0] RWDS = 2'b00;

    wire [15:0] DQ;
    reg [15:0] DQ_data_i;
    wire [15:0] DQ_data_o;
    reg DQ_tx_en = 1'b0;

    assign DQ = DQ_tx_en ? DQ_data_i : 16'hZZZZ;
    assign DQ_data_o = DQ;

    wire CK;
    wire CK_n;


    clk_wiz_0 clk_wiz (
        // Clock out ports
        .clk_out1(ddr_clk_main),     // output clk_out1
        .clk_out2(ddr_clk_90_deg),     // output clk_out2
        // Status and control signals
        .resetn(rst_n), // input resetn
    // Clock in ports
        .clk_in1_p(sysclk_p),    // input clk_in1_p
        .clk_in1_n(~sysclk_p)    // input clk_in1_n
    );

    HyperRam_Register_Read HyperRam_Main_Module(
        .clk(sysclk_p),
        .clk_delay(ddr_clk_90_deg),
        .rst_n(rst_n),
        .enable(enable),
        .CS(),
        .HyperRam_rst_n(),
        .CK(CK),
        .CK_n(CK_n),
        .RWDS(RWDS),
        .DQ(DQ)

    );


    always begin
        sysclk_p = 1'b0;
        #(DDR_CLK_PERIOD/2) sysclk_p = 1'b1;
        #(DDR_CLK_PERIOD/2);
    end

    initial begin
        sysclk_p = 1'b0;
        SR = 1'b1;
        rst_n = 1'b0;
        DQ_tx_en = 1'b0;

        #10000

        SR = 1'b0;
        rst_n = 1'b1;

        #(200000)

        @ (posedge ddr_clk_main)

        #(200000)

        @ (posedge ddr_clk_main)

        enable = 1'b1;

        @ (posedge ddr_clk_90_deg)
        @ (negedge ddr_clk_90_deg)

        @ (posedge ddr_clk_90_deg)
        @ (negedge ddr_clk_90_deg)

        @ (posedge ddr_clk_90_deg)
        @ (negedge ddr_clk_90_deg)
        

        @ (negedge ddr_clk_main)
        @ (negedge ddr_clk_main)
        @ (negedge ddr_clk_main)
        @ (negedge ddr_clk_main)
        @ (negedge ddr_clk_main)
        @ (negedge ddr_clk_main)
        @ (negedge ddr_clk_main)
        
        
        @ (posedge ddr_clk_main)
        DQ_tx_en = 1'b1;
        DQ_data_i <= 16'b0000111101110110; //0F76
        RWDS <= 2'b11;
        @ (negedge ddr_clk_main)
        DQ_data_i <= 16'h0000;
        RWDS <= 2'b00;


        @ (posedge ddr_clk_main)
        DQ_data_i <= 16'b0000111101110110; //0F76
        RWDS <= 2'b11;
        @ (negedge ddr_clk_main)
        DQ_data_i <= 16'h0000;
        RWDS <= 2'b00;


        @ (posedge ddr_clk_main)
        DQ_data_i <= 16'h3f5f; //0F76
        RWDS <= 2'b11;
        @ (negedge ddr_clk_main)
        DQ_data_i <= 16'h0000;
        RWDS <= 2'b00;


        @ (posedge ddr_clk_main)
        DQ_data_i <= 16'b0000111101110110; //0F76
        RWDS <= 2'b11;
        @ (negedge ddr_clk_main)
        DQ_data_i <= 16'h0000;
        RWDS <= 2'b00;

        @ (posedge ddr_clk_main)
        DQ_data_i <= 16'h3f5f; //0F76
        RWDS <= 2'b11;
        @ (negedge ddr_clk_main)
        DQ_data_i <= 16'h0000;
        RWDS <= 2'b00;
        

    end


endmodule