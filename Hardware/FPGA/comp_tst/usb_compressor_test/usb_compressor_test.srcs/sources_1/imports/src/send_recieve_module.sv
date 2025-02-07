
// V1.5
module send_recieve_module (
    //input  wire         sysclk_p,            // main clock, connect to on-board crystal oscillator
    //input  wire         sysclk_n,
    input  wire         rst_n,
    output wire  [3:0] LED_data,
    
    // USB3.0 (FT600 chip) ------------------------------------------------------------
    output wire         ftdi_resetn,    // to FT600's pin10 (RESET_N)
    output wire         ftdi_wakeupn,   // to FT600's pin11 (WAKEUP_N)
    input  wire         ftdi_clk,       // to FT600's pin43 (CLK)
    input  wire         ftdi_rxf_n,     // to FT600's pin5  (RXF_N)
    input  wire         ftdi_txe_n,     // to FT600's pin4  (TXE_N)
    output wire         ftdi_oe_n,      // to FT600's pin9  (OE_N)
    output wire         ftdi_rd_n,      // to FT600's pin8  (RD_N)
    output wire         ftdi_wr_n,      // to FT600's pin7  (WR_N)
    inout        [15:0] ftdi_data,      // to FT600's pin56~53 (DATA_15~DATA_12) , pin48~45 (DATA_11~DATA_8) , pin42~39 (DATA_7~DATA4) and pin36~33 (DATA_3~DATA_0)
    inout        [ 1:0] ftdi_be,        // to FT600's pin3 (BE_1) and pin2 (BE_0)


    // to FPGA
    input  wire  [15:0] data_to_ft600,
    input  wire  [ 1:0] be_to_ft600,

    output wire  [15:0] data_from_ft600,
    output wire  [ 1:0] be_from_ft600,

    output wire         ready_to_recieve,
    output wire         ready_to_send

);

    assign  ftdi_resetn     = rst_n;
    assign  ftdi_wakeupn    = 1'b0;

    // output registers
    reg     reg_ftdi_oe_n = 1'b1;
    assign  ftdi_oe_n = reg_ftdi_oe_n;

    reg     reg_ftdi_rd_n = 1'b1;
    assign  ftdi_rd_n = reg_ftdi_rd_n;

    reg     reg_ftdi_wr_n = 1'b1;
    assign  ftdi_wr_n = reg_ftdi_wr_n;

    //reg  [3:0] reg_LED_data_out = 4'b0000;
    //assign LED_data = reg_LED_data_out;

    reg [15:0] led_update_counter = 16'd0;  // 7 bits to count to 100
    reg  [3:0] reg_LED_data_out = 4'b0000;
    reg  [3:0] temp_LED_data = 4'b0000;         // Temporary register to store LED value
    assign LED_data = reg_LED_data_out;



    // tri state buffers for data and byte enable
    reg         ftdi_data_tx_en = 1'b0;
    reg  [15:0] reg_ftdi_data_output = 16'h0000;
    wire [15:0]  ft600_data_input;

    assign      ftdi_data = ftdi_data_tx_en ? reg_ftdi_data_output : 16'hZZZZ;
    assign      ft600_data_input = ftdi_data;
    
    reg         ftdi_be_tx_en = 1'b0;
    reg  [1:0]  reg_ftdi_be_output = 2'b00;
    wire [1:0]  ft600_be_input;

    assign      ftdi_be = ftdi_be_tx_en ? reg_ftdi_be_output : 2'bZZ;
    assign      ft600_be_input = ftdi_be;



    reg write_rd_delay_flag = 1'b0;
    reg end_write_delay_flag = 1'b0;
    reg ready_to_recieve_delay_flag = 1'b0;

    reg ready_to_recieve_o = 1'b0;
    assign ready_to_recieve = ready_to_recieve_o;

    reg ready_to_send_posedge_o = 1'b0;
    //reg ready_to_send_negedge_o = 1'b0;
    assign ready_to_send = ready_to_send_posedge_o;

    // control signals on negative edge
    always @ (negedge ftdi_clk or negedge rst_n) begin
        if(~rst_n) begin
            reg_ftdi_oe_n <= 1'b1;
            reg_ftdi_rd_n <= 1'b1;
            reg_ftdi_wr_n <= 1'b1;
            ftdi_data_tx_en <= 1'b0;
            ftdi_be_tx_en <= 1'b0;
            write_rd_delay_flag <= 1'b0;
            end_write_delay_flag <= 1'b0;
            ready_to_recieve_delay_flag <= 1'b0;
            ready_to_recieve_o <= 1'b0;
            //ready_to_send_negedge_o <= 1'b0;
            reg_LED_data_out <= 4'b0000;
            temp_LED_data <= 4'b0000;
            led_update_counter <= 16'd0;
            reg_ftdi_data_output <= 16'h0000;
            reg_ftdi_be_output <= 2'b00;
        end else begin

            if(~ftdi_rxf_n) begin
                // read control signals
                if(write_rd_delay_flag == 1'b0) begin
                    reg_ftdi_oe_n <= 1'b0;
                    write_rd_delay_flag <= 1'b1;
                end else if(reg_ftdi_oe_n == 1'b0) begin
                    reg_ftdi_rd_n <= 1'b0;
                    //ready_to_send_negedge_o <= 1'b1;
                end else
                    write_rd_delay_flag <= 1'b0;
            end else begin
                if(end_write_delay_flag == 1'b0) begin
                    reg_ftdi_oe_n <= 1'b1;
                    reg_ftdi_rd_n <= 1'b1;
                    end_write_delay_flag <= 1'b1;
                end else if(end_write_delay_flag == 1'b1) begin
                    //ready_to_send_negedge_o <= 1'b0;
                    end_write_delay_flag <= 1'b0;
                end
            end
            
            if(~ftdi_txe_n) begin
                // write control signals

                if(ready_to_recieve_delay_flag == 1'b0) begin
                    ready_to_recieve_delay_flag <= 1'b1;
                    ready_to_recieve_o <= 1'b1;
                    ftdi_data_tx_en <= 1'b1;
                    ftdi_be_tx_en <= 1'b1;
                end else if(ready_to_recieve_delay_flag == 1'b1) begin

                    if(led_update_counter == 16'd25000) begin
                        led_update_counter <= 16'd0;
                        reg_LED_data_out <= temp_LED_data;  // Update LED output
                    end else begin
                        led_update_counter <= led_update_counter + 1'b1;
                    end
                    
                    reg_ftdi_wr_n <= 1'b0;

                    //write data
                    reg_ftdi_be_output <= be_to_ft600;
                    reg_ftdi_data_output <= data_to_ft600;
                    temp_LED_data <= data_to_ft600[3:0]; 
                    //reg_LED_data_out <= data_to_ft600[3:0];
                end

            end else begin
                reg_ftdi_wr_n <= 1'b1;
                reg_ftdi_be_output <= 2'b00;
                ftdi_data_tx_en <= 1'b0;
                ftdi_be_tx_en <= 1'b0;
                ready_to_recieve_delay_flag <= 1'b0;
                ready_to_recieve_o <= 1'b0;
            end
        end
    end


    reg [15:0] reg_ftdi_data_i = 16'h0000;
    assign data_from_ft600 = reg_ftdi_data_i;

    reg [1:0] reg_ftdi_be_i  = 2'b00;
    assign be_from_ft600 = reg_ftdi_be_i;

    // read data on postive edge of clock
    always @ (posedge ftdi_clk) begin

        if(ftdi_rxf_n == 1'b1) begin
            ready_to_send_posedge_o <= 1'b0;
        end else if(reg_ftdi_rd_n == 1'b0) begin
            ready_to_send_posedge_o <= 1'b1;
        end

        if(reg_ftdi_rd_n == 1'b0) begin
            if(ft600_be_input == 2'b11) begin
                reg_ftdi_data_i <= ft600_data_input;
                reg_ftdi_be_i <= 2'b11;
            end else if(ft600_be_input == 2'b01) begin
                reg_ftdi_data_i[7:0] <= ft600_data_input[7:0];
                reg_ftdi_be_i <= 2'b01;
            end else if(ft600_be_input == 2'b10) begin
                reg_ftdi_data_i[15:8] <= ft600_data_input[15:8];
                reg_ftdi_be_i <= 2'b10;
            end
        end
    end


endmodule
