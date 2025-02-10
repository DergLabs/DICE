
module ft600_16B_loopback (
    //input  wire         sysclk_p,
    //input  wire         sysclk_n,
    input  wire         rst_n,
    //input wire clk,
    output wire  [ 3:0] LED,
    
    // USB3.0 (FT600 chip) ------------------------------------------------------------
    output wire         ftdi_resetn,    // to FT600's pin10 (RESET_N) , !!!!!! UnComment this line if this signal is connected to FPGA. !!!!!!
    output wire         ftdi_wakeupn,   // to FT600's pin11 (WAKEUP_N), !!!!!! UnComment this line if this signal is connected to FPGA. !!!!!!
    //output wire         ftdi_gpio0,     // to FT600's pin12 (GPIO0)   , !!!!!! UnComment this line if this signal is connected to FPGA. !!!!!!
    //output wire         ftdi_gpio1,     // to FT600's pin13 (GPIO1)   , !!!!!! UnComment this line if this signal is connected to FPGA. !!!!!!
    //output wire         ftdi_siwu,      // to FT600's pin6  (SIWU_N)  , !!!!!! UnComment this line if this signal is connected to FPGA. !!!!!!
    input  wire         ftdi_clk,       // to FT600's pin43 (CLK)
    input  wire         ftdi_rxf_n,     // to FT600's pin5  (RXF_N)
    input  wire         ftdi_txe_n,     // to FT600's pin4  (TXE_N)
    output wire         ftdi_oe_n,      // to FT600's pin9  (OE_N)
    output wire         ftdi_rd_n,      // to FT600's pin8  (RD_N)
    output wire         ftdi_wr_n,      // to FT600's pin7  (WR_N)
    inout        [15:0] ftdi_data,      // to FT600's pin56~53 (DATA_15~DATA_12) , pin48~45 (DATA_11~DATA_8) , pin42~39 (DATA_7~DATA4) and pin36~33 (DATA_3~DATA_0)
    inout        [ 1:0] ftdi_be         // to FT600's pin3 (BE_1) and pin2 (BE_0)

);

    wire [15:0] data_to_ft600;
    wire [1:0] be_to_ft600;

    wire [15:0] data_from_ft600;
    wire [1:0] be_from_ft600;

    wire ready_to_recieve;
    wire ready_to_send;

    wire full;
    wire empty;
    

    wire ila_clk;

    send_recieve_module send_recieve_module (
        .rst_n(rst_n),
        .LED_data(LED[3:1]),
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
        .data_from_ft600(data_from_ft600),
        .be_from_ft600(be_from_ft600),
        .ready_to_recieve(ready_to_recieve),
        .ready_to_send(ready_to_send)
    );

    custom_sync_fifo custom_sync_fifo (
        .clk(ftdi_clk),
        .rst_n(rst_n),
        .w_en(ready_to_send),
        .r_en(ready_to_recieve),
        .data_in({be_from_ft600, data_from_ft600}),
        .data_out({be_to_ft600, data_to_ft600}),
        .full(full),
        .empty(empty)
    );

    clock_beat # (
        .CLK_FREQ              ( 100000000          ),
        .BEAT_FREQ             ( 5                  )
    ) u_ftdi_clk_beat (
        .clk                   ( ftdi_clk           ),
        .rst_n                 ( rst_n              ),
        .beat                  ( LED[0]             )
    );   



endmodule

