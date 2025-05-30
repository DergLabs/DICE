
`timescale 1ns / 1ps

module core_sim #(
    parameter MAIN_CLK_PERIOD = 10, FT600_CLK_PERIOD = 10
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
    wire [1:0] ftdi_be;

    reg [15:0] tb_ftdi_data_i;
    wire [15:0] tb_ftdi_data_o;
    reg tb_data_tx_en = 1'b0;

    assign ftdi_data = tb_data_tx_en ? tb_ftdi_data_i : 16'hZZZZ;
    assign tb_ftdi_data_o = ftdi_data;

    reg [1:0] tb_ftdi_be_i;
    wire [1:0] tb_ftdi_be_o;
    reg tb_be_tx_en = 1'b0;

    assign ftdi_be = tb_be_tx_en ? tb_ftdi_be_i : 2'bZZ;
    assign tb_ftdi_be_o = ftdi_be;

    //reg [15:0] data_to_ft600;
    //reg [1:0] be_to_ft600;

    //wire [15:0] data_from_ft600;
    //wire [1:0] be_from_ft600;

    //wire ready_to_recieve;
    //wire ready_to_send;

    //wire full;
    //wire empty;
    reg core_clk;

    
    
    always #FT600_CLK_PERIOD    ftdi_clk = ~ftdi_clk;
    always #(MAIN_CLK_PERIOD + 0.1)   core_clk = ~core_clk;

    top #(
        .NUM_CHANNELS(3),
        .USE_SIM_MODEL(1),
        .ENABLE_ILA(0)
    )
    top_proc(
        .sim_clk(core_clk),
        //.sysclk_p(sysclk_p),
        //.sysclk_n(sysclk_n),
        .rst_i(rst_n),

        .ftdi_clk_i(ftdi_clk),
        .ftdi_rxf_n_i(ftdi_rxf_n),
        .ftdi_txe_n_i(ftdi_txe_n),

        .led_o(LED),

        .ftdi_rstn_o(ftdi_resetn),
        .ftdi_wakeup_o(ftdi_wakeupn),
        .ftdi_oe_n_o(ftdi_oe_n),
        .ftdi_rd_n_o(ftdi_rd_n),
        .ftdi_wr_n_o(ftdi_wr_n),

        .ftdi_data_io(ftdi_data),
        .ftdi_be_io(ftdi_be)
    );

    /*logic [15:0] DATA_ARRAY [0:63] = '{
    16'hA5B4, 16'h1234, 16'h789A, 16'hDEF0, 16'h3456, 16'h9ABC, 16'hF012, 16'h5678,
    16'hC356, 16'h5678, 16'hBC12, 16'h1234, 16'h7890, 16'hDEAB, 16'h3434, 16'h9090,
    16'hFEDC, 16'h9876, 16'h3210, 16'h7654, 16'h1098, 16'h5432, 16'h9876, 16'h3210,
    16'hBA54, 16'h5432, 16'h9876, 16'h3210, 16'h7654, 16'h1098, 16'h5454, 16'h9898,
    16'hAABB, 16'hDDEE, 16'h1122, 16'h4455, 16'h7788, 16'hAABB, 16'hDDEE, 16'h1122,
    16'hCCFF, 16'hFF33, 16'h3366, 16'h6699, 16'h99CC, 16'hCCFF, 16'hFF33, 16'h3333,
    16'h4567, 16'hABCD, 16'h1234, 16'h789A, 16'hDEF0, 16'h3456, 16'h9ABC, 16'hF012,
    16'h89EF, 16'hEF56, 16'h56BC, 16'hBC12, 16'h1278, 16'h7834, 16'hDECD, 16'h3434
    };*/

    // Transposed data
    /*logic [15:0] DATA_ARRAY [0:63] = '{
        16'hA5B4, 16'hC356, 16'hFEDC, 16'hBA54, 16'hAABB, 16'hCCFF, 16'h4567, 16'h89EF,
        16'h1234, 16'h5678, 16'h9876, 16'h5432, 16'hDDEE, 16'hFF33, 16'hABCD, 16'hEF56,
        16'h789A, 16'hBC12, 16'h3210, 16'h9876, 16'h1122, 16'h3366, 16'h1234, 16'h56BC,
        16'hDEF0, 16'h1234, 16'h7654, 16'h3210, 16'h4455, 16'h6699, 16'h789A, 16'hBC12,
        16'h3456, 16'h7890, 16'h1098, 16'h7654, 16'h7788, 16'h99CC, 16'hDEF0, 16'h1278,
        16'h9ABC, 16'hDEAB, 16'h5432, 16'h1098, 16'hAABB, 16'hCCFF, 16'h3456, 16'h7834,
        16'hF012, 16'h3434, 16'h9876, 16'h5454, 16'hDDEE, 16'hFF33, 16'h9ABC, 16'hDECD,
        16'h5678, 16'h9090, 16'h3210, 16'h9898, 16'h1122, 16'h3333, 16'hF012, 16'h3434
    };*/

    // Transposed data
    /*logic [15:0] DATA_ARRAY [0:255] = '{
        16'hA5B4, 16'h00A7, 16'hC356, 16'h00B9, 16'hFEDC, 16'h00C3, 16'hBA54, 16'h00D1, 16'hAABB, 16'h00E5, 16'hCCFF, 16'h00F8, 16'h4567, 16'h0084, 16'h89EF, 16'h0092,
        16'h1234, 16'h00A1, 16'h5678, 16'h00B4, 16'h9876, 16'h00C7, 16'h5432, 16'h00D2, 16'hDDEE, 16'h00E6, 16'hFF33, 16'h00F9, 16'hABCD, 16'h0085, 16'hEF56, 16'h0093,
        16'h789A, 16'h00A2, 16'hBC12, 16'h00B5, 16'h3210, 16'h00C8, 16'h9876, 16'h00D3, 16'h1122, 16'h00E7, 16'h3366, 16'h00FA, 16'h1234, 16'h0086, 16'h56BC, 16'h0094,
        16'hDEF0, 16'h00A3, 16'h1234, 16'h00B6, 16'h7654, 16'h00C9, 16'h3210, 16'h00D4, 16'h4455, 16'h00E8, 16'h6699, 16'h00FB, 16'h789A, 16'h0087, 16'hBC12, 16'h0095,
        16'h3456, 16'h00A4, 16'h7890, 16'h00B7, 16'h1098, 16'h00CA, 16'h7654, 16'h00D5, 16'h7788, 16'h00E9, 16'h99CC, 16'h00FC, 16'hDEF0, 16'h0088, 16'h1278, 16'h0096,
        16'h9ABC, 16'h00A5, 16'hDEAB, 16'h00B8, 16'h5432, 16'h00CB, 16'h1098, 16'h00D6, 16'hAABB, 16'h00EA, 16'hCCFF, 16'h00FD, 16'h3456, 16'h0089, 16'h7834, 16'h0097,
        16'hF012, 16'h00A6, 16'h3434, 16'h00B9, 16'h9876, 16'h00CC, 16'h5454, 16'h00D7, 16'hDDEE, 16'h00EB, 16'hFF33, 16'h00FE, 16'h9ABC, 16'h008A, 16'hDECD, 16'h0098,
        16'h5678, 16'h00A7, 16'h9090, 16'h00BA, 16'h3210, 16'h00CD, 16'h9898, 16'h00D8, 16'h1122, 16'h00EC, 16'h3333, 16'h00FF, 16'hF012, 16'h008B, 16'h3434, 16'h0099, 

        16'h5678, 16'h00A7, 16'h9090, 16'h00BA, 16'h3210, 16'h00CD, 16'h9898, 16'h00D8, 16'h1122, 16'h00EC, 16'h3333, 16'h00FF, 16'hF012, 16'h008B, 16'h3434, 16'h0099, 
        16'hF012, 16'h00A6, 16'h3434, 16'h00B9, 16'h9876, 16'h00CC, 16'h5454, 16'h00D7, 16'hDDEE, 16'h00EB, 16'hFF33, 16'h00FE, 16'h9ABC, 16'h008A, 16'hDECD, 16'h0098,
        16'h9ABC, 16'h00A5, 16'hDEAB, 16'h00B8, 16'h5432, 16'h00CB, 16'h1098, 16'h00D6, 16'hAABB, 16'h00EA, 16'hCCFF, 16'h00FD, 16'h3456, 16'h0089, 16'h7834, 16'h0097,
        16'h3456, 16'h00A4, 16'h7890, 16'h00B7, 16'h1098, 16'h00CA, 16'h7654, 16'h00D5, 16'h7788, 16'h00E9, 16'h99CC, 16'h00FC, 16'hDEF0, 16'h0088, 16'h1278, 16'h0096,
        16'hDEF0, 16'h00A3, 16'h1234, 16'h00B6, 16'h7654, 16'h00C9, 16'h3210, 16'h00D4, 16'h4455, 16'h00E8, 16'h6699, 16'h00FB, 16'h789A, 16'h0087, 16'hBC12, 16'h0095,
        16'h789A, 16'h00A2, 16'hBC12, 16'h00B5, 16'h3210, 16'h00C8, 16'h9876, 16'h00D3, 16'h1122, 16'h00E7, 16'h3366, 16'h00FA, 16'h1234, 16'h0086, 16'h56BC, 16'h0094,
        16'h1234, 16'h00A1, 16'h5678, 16'h00B4, 16'h9876, 16'h00C7, 16'h5432, 16'h00D2, 16'hDDEE, 16'h00E6, 16'hFF33, 16'h00F9, 16'hABCD, 16'h0085, 16'hEF56, 16'h0093,
        16'hA5B4, 16'h00A7, 16'hC356, 16'h00B9, 16'hFEDC, 16'h00C3, 16'hBA54, 16'h00D1, 16'hAABB, 16'h00E5, 16'hCCFF, 16'h00F8, 16'h4567, 16'h0084, 16'h89EF, 16'h0092

   };*/

    logic [15:0] DATA_ARRAY [0:511] = '{
        16'hA5B4, 16'h00A7, 16'hC356, 16'h00B9, 16'hFEDC, 16'h00C3, 16'hBA54, 16'h00D1, 16'hAABB, 16'h00E5, 16'hCCFF, 16'h00F8, 16'h4567, 16'h0084, 16'h89EF, 16'h0092,
        16'h1234, 16'h00A1, 16'h5678, 16'h00B4, 16'h9876, 16'h00C7, 16'h5432, 16'h00D2, 16'hDDEE, 16'h00E6, 16'hFF33, 16'h00F9, 16'hABCD, 16'h0085, 16'hEF56, 16'h0093,
        16'h789A, 16'h00A2, 16'hBC12, 16'h00B5, 16'h3210, 16'h00C8, 16'h9876, 16'h00D3, 16'h1122, 16'h00E7, 16'h3366, 16'h00FA, 16'h1234, 16'h0086, 16'h56BC, 16'h0094,
        16'hDEF0, 16'h00A3, 16'h1234, 16'h00B6, 16'h7654, 16'h00C9, 16'h3210, 16'h00D4, 16'h4455, 16'h00E8, 16'h6699, 16'h00FB, 16'h789A, 16'h0087, 16'hBC12, 16'h0095,
        16'h3456, 16'h00A4, 16'h7890, 16'h00B7, 16'h1098, 16'h00CA, 16'h7654, 16'h00D5, 16'h7788, 16'h00E9, 16'h99CC, 16'h00FC, 16'hDEF0, 16'h0088, 16'h1278, 16'h0096,
        16'h9ABC, 16'h00A5, 16'hDEAB, 16'h00B8, 16'h5432, 16'h00CB, 16'h1098, 16'h00D6, 16'hAABB, 16'h00EA, 16'hCCFF, 16'h00FD, 16'h3456, 16'h0089, 16'h7834, 16'h0097,
        16'hF012, 16'h00A6, 16'h3434, 16'h00B9, 16'h9876, 16'h00CC, 16'h5454, 16'h00D7, 16'hDDEE, 16'h00EB, 16'hFF33, 16'h00FE, 16'h9ABC, 16'h008A, 16'hDECD, 16'h0098,
        16'h5678, 16'h00A7, 16'h9090, 16'h00BA, 16'h3210, 16'h00CD, 16'h9898, 16'h00D8, 16'h1122, 16'h00EC, 16'h3333, 16'h00FF, 16'hF012, 16'h008B, 16'h3434, 16'h0099, 
       
        16'hA5B4, 16'h00A7, 16'hC356, 16'h00B9, 16'hFEDC, 16'h00C3, 16'hBA54, 16'h00D1, 16'hAABB, 16'h00E5, 16'hCCFF, 16'h00F8, 16'h4567, 16'h0084, 16'h89EF, 16'h0092,
        16'h1234, 16'h00A1, 16'h5678, 16'h00B4, 16'h9876, 16'h00C7, 16'h5432, 16'h00D2, 16'hDDEE, 16'h00E6, 16'hFF33, 16'h00F9, 16'hABCD, 16'h0085, 16'hEF56, 16'h0093,
        16'h789A, 16'h00A2, 16'hBC12, 16'h00B5, 16'h3210, 16'h00C8, 16'h9876, 16'h00D3, 16'h1122, 16'h00E7, 16'h3366, 16'h00FA, 16'h1234, 16'h0086, 16'h56BC, 16'h0094,
        16'hDEF0, 16'h00A3, 16'h1234, 16'h00B6, 16'h7654, 16'h00C9, 16'h3210, 16'h00D4, 16'h4455, 16'h00E8, 16'h6699, 16'h00FB, 16'h789A, 16'h0087, 16'hBC12, 16'h0095,
        16'h3456, 16'h00A4, 16'h7890, 16'h00B7, 16'h1098, 16'h00CA, 16'h7654, 16'h00D5, 16'h7788, 16'h00E9, 16'h99CC, 16'h00FC, 16'hDEF0, 16'h0088, 16'h1278, 16'h0096,
        16'h9ABC, 16'h00A5, 16'hDEAB, 16'h00B8, 16'h5432, 16'h00CB, 16'h1098, 16'h00D6, 16'hAABB, 16'h00EA, 16'hCCFF, 16'h00FD, 16'h3456, 16'h0089, 16'h7834, 16'h0097,
        16'hF012, 16'h00A6, 16'h3434, 16'h00B9, 16'h9876, 16'h00CC, 16'h5454, 16'h00D7, 16'hDDEE, 16'h00EB, 16'hFF33, 16'h00FE, 16'h9ABC, 16'h008A, 16'hDECD, 16'h0098,
        16'h5678, 16'h00A7, 16'h9090, 16'h00BA, 16'h3210, 16'h00CD, 16'h9898, 16'h00D8, 16'h1122, 16'h00EC, 16'h3333, 16'h00FF, 16'hF012, 16'h008B, 16'h3434, 16'h0099, 

        16'hA5B4, 16'h00A7, 16'hC356, 16'h00B9, 16'hFEDC, 16'h00C3, 16'hBA54, 16'h00D1, 16'hAABB, 16'h00E5, 16'hCCFF, 16'h00F8, 16'h4567, 16'h0084, 16'h89EF, 16'h0092,
        16'h1234, 16'h00A1, 16'h5678, 16'h00B4, 16'h9876, 16'h00C7, 16'h5432, 16'h00D2, 16'hDDEE, 16'h00E6, 16'hFF33, 16'h00F9, 16'hABCD, 16'h0085, 16'hEF56, 16'h0093,
        16'h789A, 16'h00A2, 16'hBC12, 16'h00B5, 16'h3210, 16'h00C8, 16'h9876, 16'h00D3, 16'h1122, 16'h00E7, 16'h3366, 16'h00FA, 16'h1234, 16'h0086, 16'h56BC, 16'h0094,
        16'hDEF0, 16'h00A3, 16'h1234, 16'h00B6, 16'h7654, 16'h00C9, 16'h3210, 16'h00D4, 16'h4455, 16'h00E8, 16'h6699, 16'h00FB, 16'h789A, 16'h0087, 16'hBC12, 16'h0095,
        16'h3456, 16'h00A4, 16'h7890, 16'h00B7, 16'h1098, 16'h00CA, 16'h7654, 16'h00D5, 16'h7788, 16'h00E9, 16'h99CC, 16'h00FC, 16'hDEF0, 16'h0088, 16'h1278, 16'h0096,
        16'h9ABC, 16'h00A5, 16'hDEAB, 16'h00B8, 16'h5432, 16'h00CB, 16'h1098, 16'h00D6, 16'hAABB, 16'h00EA, 16'hCCFF, 16'h00FD, 16'h3456, 16'h0089, 16'h7834, 16'h0097,
        16'hF012, 16'h00A6, 16'h3434, 16'h00B9, 16'h9876, 16'h00CC, 16'h5454, 16'h00D7, 16'hDDEE, 16'h00EB, 16'hFF33, 16'h00FE, 16'h9ABC, 16'h008A, 16'hDECD, 16'h0098,
        16'h5678, 16'h00A7, 16'h9090, 16'h00BA, 16'h3210, 16'h00CD, 16'h9898, 16'h00D8, 16'h1122, 16'h00EC, 16'h3333, 16'h00FF, 16'hF012, 16'h008B, 16'h3434, 16'h0099, 

        16'hA5B4, 16'h00A7, 16'hC356, 16'h00B9, 16'hFEDC, 16'h00C3, 16'hBA54, 16'h00D1, 16'hAABB, 16'h00E5, 16'hCCFF, 16'h00F8, 16'h4567, 16'h0084, 16'h89EF, 16'h0092,
        16'h1234, 16'h00A1, 16'h5678, 16'h00B4, 16'h9876, 16'h00C7, 16'h5432, 16'h00D2, 16'hDDEE, 16'h00E6, 16'hFF33, 16'h00F9, 16'hABCD, 16'h0085, 16'hEF56, 16'h0093,
        16'h789A, 16'h00A2, 16'hBC12, 16'h00B5, 16'h3210, 16'h00C8, 16'h9876, 16'h00D3, 16'h1122, 16'h00E7, 16'h3366, 16'h00FA, 16'h1234, 16'h0086, 16'h56BC, 16'h0094,
        16'hDEF0, 16'h00A3, 16'h1234, 16'h00B6, 16'h7654, 16'h00C9, 16'h3210, 16'h00D4, 16'h4455, 16'h00E8, 16'h6699, 16'h00FB, 16'h789A, 16'h0087, 16'hBC12, 16'h0095,
        16'h3456, 16'h00A4, 16'h7890, 16'h00B7, 16'h1098, 16'h00CA, 16'h7654, 16'h00D5, 16'h7788, 16'h00E9, 16'h99CC, 16'h00FC, 16'hDEF0, 16'h0088, 16'h1278, 16'h0096,
        16'h9ABC, 16'h00A5, 16'hDEAB, 16'h00B8, 16'h5432, 16'h00CB, 16'h1098, 16'h00D6, 16'hAABB, 16'h00EA, 16'hCCFF, 16'h00FD, 16'h3456, 16'h0089, 16'h7834, 16'h0097,
        16'hF012, 16'h00A6, 16'h3434, 16'h00B9, 16'h9876, 16'h00CC, 16'h5454, 16'h00D7, 16'hDDEE, 16'h00EB, 16'hFF33, 16'h00FE, 16'h9ABC, 16'h008A, 16'hDECD, 16'h0098,
        16'h5678, 16'h00A7, 16'h9090, 16'h00BA, 16'h3210, 16'h00CD, 16'h9898, 16'h00D8, 16'h1122, 16'h00EC, 16'h3333, 16'h00FF, 16'hF012, 16'h008B, 16'h3434, 16'h0099

   };


    initial begin
        //intial setup
        ftdi_clk = 1'b0;
        core_clk = 1'b0;
        rst_n = 1'b0;
        ftdi_txe_n = 1'b1;
        ftdi_rxf_n = 1'b1;
        tb_data_tx_en = 1'b0;

        #50
        rst_n = 1'b1;

        //write data to module

        #200

        for (int i = 0; i < 200; i = i + 1) begin
            #50
            ftdi_txe_n = 1'b1;
            ftdi_rxf_n = 1'b1;
            tb_data_tx_en = 1'b0;
            tb_data_tx_en = 1'b1;
            tb_be_tx_en = 1'b1;
            #500
            ftdi_rxf_n = 1'b0;


            @ (negedge ftdi_oe_n)
            @ (negedge ftdi_rd_n)

            for(int i = 0; i < 1; i = i + 1) begin
                for (int i = 0; i < 512; i = i + 1) begin
                    tb_ftdi_data_i = DATA_ARRAY[i];
                    tb_ftdi_be_i = 2'b11;
                    #1
                    @ (negedge ftdi_clk);
                end
            end


            #1
            ftdi_rxf_n = 1'b1;
            @ (negedge ftdi_clk)

            //finish sending things
            
            tb_ftdi_data_i = 16'h0000;
            tb_ftdi_be_i = 2'b00;

            //read data from module
          #100000
            tb_data_tx_en = 1'b0;
            tb_be_tx_en = 1'b0;
            //rst_n = 1'b1;
            #8
            @ (negedge ftdi_clk)
            ftdi_txe_n = 1'b0;

            @ (negedge ftdi_wr_n)

            for(int i = 0; i < 1; i = i + 1) begin
                for (int i = 0; i < 512; i = i + 1) begin
                    @ (posedge ftdi_clk);
                end
            end

            @ (negedge ftdi_clk)
            ftdi_txe_n = 1'b1;
        end
    end
endmodule

