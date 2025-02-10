
module ft600_stream_recieve_top (
    input  wire         sysclk_p,            // main clock, connect to on-board crystal oscillator
    input  wire         sysclk_n,
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

assign ftdi_resetn = rst_n;  // 1=normal operation          , !!!!!! UnComment this line if this signal is connected to FPGA. !!!!!!
assign ftdi_wakeupn= 1'b0;  // 0=wake up                   , !!!!!! UnComment this line if this signal is connected to FPGA. !!!!!!
assign ftdi_wr_n = 1'b1;

wire ila_clk;

reg  [2:0] reg_LED_data = 3'h0;
assign LED[2:0] = reg_LED_data;

reg reg_ftdi_oe_n = 1'b1;
assign ftdi_oe_n = reg_ftdi_oe_n;

reg reg_ftdi_rd_n = 1'b1;
assign ftdi_rd_n = reg_ftdi_rd_n;

reg [15:0]  reg_ftdi_data_i = 16'h0000;
reg [1:0]   reg_ftdi_be_i = 2'b00;



reg [7:0] read_0 = 8'h00;
reg [7:0] read_1 = 8'h00;
reg [7:0] read_2 = 8'h00;
reg [7:0] read_3 = 8'h00;
reg [7:0] read_4 = 8'h00;
reg [7:0] read_5 = 8'h00;
reg [7:0] read_6 = 8'h00;
reg [7:0] read_7 = 8'h00;
reg [7:0] read_8 = 8'h00;
reg [7:0] read_9 = 8'h00;
reg [7:0] read_10 = 8'h00;
reg [7:0] read_11 = 8'h00;
reg [7:0] read_12 = 8'h00;
reg [7:0] read_13 = 8'h00;
reg [7:0] read_14 = 8'h00;
reg [7:0] read_15 = 8'h00;


always @ (negedge ftdi_clk or negedge rst_n) begin
    if(~rst_n) begin
        reg_ftdi_oe_n <= 1'b1;
        reg_ftdi_rd_n <= 1'b1;
    end else begin
        if(ftdi_rxf_n == 1'b0) begin
            reg_ftdi_oe_n <= 1'b0;
        end else begin
            reg_ftdi_oe_n <= 1'b1;
            reg_ftdi_rd_n <= 1'b1;
        end
        
        if(ftdi_oe_n == 1'b0) begin
            reg_ftdi_rd_n <= 1'b0;
        end
        
    end
end

always @ (posedge ftdi_clk) begin
    if(ftdi_rd_n == 1'b0) begin
        reg_ftdi_data_i <= ftdi_data;
        reg_ftdi_be_i <= ftdi_be;

        if(reg_ftdi_be_i == 2'b11) begin
            read_0  <= read_2;
            read_1  <= read_3;
            read_2  <= read_4;
            read_3  <= read_5;
            read_4  <= read_6;
            read_5  <= read_7;
            read_6  <= read_8;
            read_7  <= read_9;
            read_8  <= read_10;
            read_9  <= read_11;
            read_10 <= read_12;
            read_11 <= read_13;
            read_12 <= read_14;
            read_13 <= read_15;
            read_14 <= reg_ftdi_data_i[7:0];
            read_15 <= reg_ftdi_data_i[15:8];
            reg_LED_data <= reg_ftdi_data_i[2:0];
        end else if(reg_ftdi_be_i == 2'b01) begin
            read_0  <= read_1;
            read_1  <= read_2;
            read_2  <= read_3;
            read_3  <= read_4;
            read_4  <= read_5;
            read_5  <= read_6;
            read_6  <= read_7;
            read_7  <= read_8;
            read_8  <= read_9;
            read_9  <= read_10;
            read_10 <= read_11;
            read_11 <= read_12;
            read_12 <= read_13;
            read_13 <= read_14;
            read_14 <= read_15;
            read_15 <= reg_ftdi_data_i[7:0];
            reg_LED_data <= reg_ftdi_data_i[2:0];
        end else if(reg_ftdi_be_i == 2'b10) begin
            read_0  <= read_1; 
            read_1  <= read_2; 
            read_2  <= read_3; 
            read_3  <= read_4; 
            read_4  <= read_5; 
            read_5  <= read_6; 
            read_6  <= read_7; 
            read_7  <= read_8; 
            read_8  <= read_9; 
            read_9  <= read_10;
            read_10 <= read_11;
            read_11 <= read_12;
            read_12 <= read_13;
            read_13 <= read_14;
            read_14 <= read_15;
            read_15 <= reg_ftdi_data_i[15:8];
            reg_LED_data <= reg_ftdi_data_i[10:8];
        end
    end
end

clk_wiz_0 clk_wiz_0 (
    // Clock out ports
    .clk_out1(ila_clk),     // output clk_out1
    // Status and control signals
    .reset(~rst_n), // input reset
   // Clock in ports
    .clk_in1_p(sysclk_p),    // input clk_in1_p
    .clk_in1_n(sysclk_n)    // input clk_in1_n
);

ila_0 ila_0 (
	.clk(ila_clk), // input wire clk

    .probe0(ftdi_clk),
	.probe1(ftdi_rxf_n),
	.probe2(reg_ftdi_oe_n),
	.probe3(reg_ftdi_rd_n), 
	.probe4(reg_ftdi_data_i), 
	.probe5(reg_ftdi_be_i),
	.probe6({read_14, read_13, read_12, read_11, read_10, read_9, read_8, read_7, read_6, read_5, read_4, read_3, read_2, read_1, read_0}) // input wire [127:0]  probe5
);

clock_beat # (
    .CLK_FREQ              ( 100000000          ),
    .BEAT_FREQ             ( 5                  )
) u_ftdi_clk_beat (
    .clk                   ( ftdi_clk           ),
    .rst_n                 ( rst_n              ),
    .beat                  ( LED[3]             )
);



endmodule