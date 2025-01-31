

module ft600_stream_top (
    //input  wire         sysclk_p,            // main clock, connect to on-board crystal oscillator
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

assign ftdi_resetn = rst_n;  // 1=normal operation          , !!!!!! UnComment this line if this signal is connected to FPGA. !!!!!!
assign ftdi_wakeupn= 1'b0;  // 0=wake up                   , !!!!!! UnComment this line if this signal is connected to FPGA. !!!!!!
assign ftdi_oe_n = 1'b1;
assign ftdi_rd_n = 1'b1;

reg [15:0] data_0 = 16'h3130;
reg [15:0] data_1 = 16'h3332;
reg [15:0] data_2 = 16'h3534;
reg [15:0] data_3 = 16'h3736;
reg [15:0] data_4 = 16'h3938;
reg [15:0] data_5 = 16'h6261;
reg [15:0] data_6 = 16'h6463;
reg [15:0] data_7 = 16'h6665;


reg [2:0] count = 0;

reg reg_ftdi_wr_n = 1'b1;
assign ftdi_wr_n = reg_ftdi_wr_n;

reg [15:0] reg_ftdi_data = 16'h0000;
assign ftdi_data = reg_ftdi_data;

reg [2:0] reg_ftdi_be = 2'b00;
assign ftdi_be = reg_ftdi_be;

reg  [2:0] tdata_d = 3'h0;
assign LED[2:0] = tdata_d;

localparam [2:0] ZERO   = 3'b000,
                 ONE    = 3'b001,
                 TWO    = 3'b010,
                 THREE  = 3'b011,
                 FOUR   = 3'b100,
                 FIVE   = 3'b101,
                 SIX    = 3'b110,
                 SEVEN  = 3'b111;

always @ (negedge ftdi_clk or negedge rst_n) begin
    if(~rst_n) begin
        tdata_d <= 3'b000;
        count <= 3'b000;
    end else begin
        if(ftdi_txe_n == 1'b0) begin
            reg_ftdi_wr_n <= 1'b0;

            case (count)
                ZERO : begin
                    reg_ftdi_be <= 2'b11;
                    reg_ftdi_data <= data_0;
                    tdata_d <= data_0[2:0];
                end

                ONE : begin
                    reg_ftdi_be <= 2'b11;
                    reg_ftdi_data <= data_1;
                    tdata_d <= data_1[2:0];
                end

                TWO : begin
                    reg_ftdi_be <= 2'b11;
                    reg_ftdi_data <= data_2;
                    tdata_d <= data_2[2:0];
                end

                THREE : begin
                    reg_ftdi_be <= 2'b11;
                    reg_ftdi_data <= data_3;
                    tdata_d <= data_3[2:0];
                end

                FOUR : begin
                    reg_ftdi_be <= 2'b11;
                    reg_ftdi_data <= data_4;
                    tdata_d <= data_4[2:0];
                end

                FIVE : begin
                    reg_ftdi_be <= 2'b11;
                    reg_ftdi_data <= data_5;
                    tdata_d <= data_5[2:0];
                end

                SIX : begin
                    reg_ftdi_be <= 2'b11;
                    reg_ftdi_data <= data_6;
                    tdata_d <= data_6[2:0];
                end

                SEVEN : begin
                    reg_ftdi_be <= 2'b11;
                    reg_ftdi_data <= data_7;
                    tdata_d <= data_7[2:0];
                end
                
                default: begin
                    reg_ftdi_be <= 2'b00;
                    reg_ftdi_data <= 16'h0000;
                    tdata_d <= 3'b000;
                end

            endcase
            
            count <= count + 1;

            if(count > 7)
                count <= 3'b000;

        end else begin
            reg_ftdi_wr_n <= 1'b1;
            reg_ftdi_be <= 2'b00;
            count <= 3'b000;
        end
    end
end


clock_beat # (
    .CLK_FREQ              ( 66000000           ),
    .BEAT_FREQ             ( 5                  )
) u_ftdi_clk_beat (
    .clk                   ( ftdi_clk           ),
    .rst_n                 ( rst_n              ),
    .beat                  ( LED[3]             )
);


endmodule