

module HyperRam_Register_Read (
    input clk,
    input clk_delay,
    input rst_n,
    input enable,

    //HyperRam connections
    output CS,
    output HyperRam_rst_n,
    output CK,
    output CK_n,
    input [1:0] RWDS_i,
    input [15:0] i_DQ,
    output [15:0] o_DQ,
    output DQ_tx_en,

    output [31:0] recieved_data

); // module HyperRam_Register_Read

    assign CK = clk_delay;
    assign CK_n = ~clk_delay;


    reg o_CS;
    assign CS = o_CS;

    //reg o_HyperRam_rst_n;
    //assign o_HyperRam_rst_n = HyperRam_rst_n;

    assign HyperRam_rst_n = rst_n;


    reg [31:0] recieved_data_o = 32'h00000000;
    assign recieved_data = recieved_data_o;

    reg [15:0] o_DQ_o = 16'h0000;
    assign o_DQ = o_DQ_o;

    reg  DQ_tx_en_o = 1'b0;
    assign DQ_tx_en = DQ_tx_en_o;


    reg [31:0] o_sdr_DQ = 32'h00000000;
    wire [31:0] i_sdr_DQ ;


    reg [4:0] counter = 2'b00000;

    reg already_been_enabled = 1'b0;
    reg double_latency = 1'b0;

    reg [47:0] address_to_send = 48'hC00000000000;
    //reg [47:0] address_to_send = 48'h3f5f063f6f24;
    
    
    reg byte_zero_read = 1'b0;
    reg byte_one_read = 1'b0;


    always @ (posedge clk) begin
        if(~rst_n) begin
            DQ_tx_en_o <= 1'b0;
            o_DQ_o <= 16'h0000;
            already_been_enabled <= 1'b0;
            counter <= 2'b00;
            o_sdr_DQ <= 32'h00000000;
            o_CS <= 1'b0;
            recieved_data_o <= 32'h00000000;
            //double_latency <= 1'b0;
            byte_zero_read <= 1'b0;
            byte_one_read <= 1'b0;
        end else begin
            if(enable) begin
                if(already_been_enabled == 1'b0) begin
                    already_been_enabled <= 1'b1;
                    DQ_tx_en_o <= 1'b1;
                end

                if(already_been_enabled == 1'b1) begin
                    o_CS <= 0;
                    

                    case(counter)

                        5'b00000 : begin
                            o_sdr_DQ[7:0] <= address_to_send[47:40];;
                            o_sdr_DQ[15:8] <= 8'h00;
                            o_sdr_DQ[23:16] <= address_to_send[39:32];
                            o_sdr_DQ[31:24] <= 8'h00;
                            

                            //if(RWDS_i == 2'b11) begin
                            //    double_latency <= 1'b1;
                            //end
                            //counter <= counter + 1;
                        end

                        5'b00001 : begin
                            o_sdr_DQ[7:0] <= address_to_send[31:24];
                            o_sdr_DQ[15:8] <= 8'h00;
                            o_sdr_DQ[23:16] <= address_to_send[23:16];
                            o_sdr_DQ[31:24] <= 8'h00;
                            //counter <= counter + 1;
                        end

                        5'b00010 : begin
                            o_sdr_DQ[7:0] <= address_to_send[15:8];
                            o_sdr_DQ[15:8] <= 8'h00;
                            o_sdr_DQ[23:16] <= address_to_send[7:0];
                            o_sdr_DQ[31:24] <= 8'h00;
                            //counter <= counter + 1;

                        end

                        5'b00011 : begin
                            //counter <= counter + 1;
                            o_sdr_DQ <= 32'h00000000;

                        end

                        5'b00100 : begin
                            DQ_tx_en_o <= 1'b0;
                        end


                        default : begin

                        end

                    endcase

                    counter <= counter + 1;

                    if(counter > 5'b00100) begin
                        counter <= 5'b00100;
                    end

                end

            end else begin
                already_been_enabled <= 1'b0;
                DQ_tx_en_o <= 1'b0;
            end
        end
    end


    always @ (negedge clk_delay) begin

        if (byte_zero_read) begin
            recieved_data_o[15:0] <= i_sdr_DQ[15:0];
            byte_zero_read = 1'b0;

        end

        if(byte_one_read) begin
            recieved_data_o[31:16] <= i_sdr_DQ[31:16];
            byte_one_read = 1'b0;
        end

    end

    
    always @ (posedge RWDS_i[0]) begin
        if(DQ_tx_en != 16'hffff) begin
            byte_zero_read = 1'b1;
        end
    end

    always @ (posedge RWDS_i[1]) begin
        if(DQ_tx_en != 16'hffff) begin
            byte_one_read = 1'b1;
        end
    end

    genvar i;
    for ( i = 0; i < 16; i=i+1) begin
        ODDRE1 #(
            .IS_C_INVERTED(1'b0),           // Optional inversion for C
            .IS_D1_INVERTED(1'b0),          // Unsupported, do not use
            .IS_D2_INVERTED(1'b0),          // Unsupported, do not use
            .SIM_DEVICE("ULTRASCALE_PLUS"), // Set the device version for simulation functionality (ULTRASCALE,
                                            // ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
            .SRVAL(1'b0)                    // Initializes the ODDRE1 Flip-Flops to the specified value (1'b0, 1'b1)
        )
        ODDRE1_inst (
            .Q(o_DQ_o[i]),   // 1-bit output: Data output to IOB
            .C(clk),   // 1-bit input: High-speed clock input
            .D1(o_sdr_DQ[i]), // 1-bit input: Parallel data input 1
            .D2(o_sdr_DQ[i+16]), // 1-bit input: Parallel data input 2
            .SR(~rst_n)  // 1-bit input: Active-High Async Reset
        );


        IDDRE1 #(
            .DDR_CLK_EDGE("OPPOSITE_EDGE"), // IDDRE1 mode (OPPOSITE_EDGE, SAME_EDGE, SAME_EDGE_PIPELINED)
            .IS_CB_INVERTED(1'b0),          // Optional inversion for CB
            .IS_C_INVERTED(1'b0)            // Optional inversion for C
        )
        IDDRE1_inst (
            .Q1(i_sdr_DQ[i]), // 1-bit output: Registered parallel output 1
            .Q2(i_sdr_DQ[i+16]), // 1-bit output: Registered parallel output 2
            .C(clk_delay),   // 1-bit input: High-speed clock
            .CB(1'b0), // 1-bit input: Inversion of High-speed clock C
            .D(i_DQ[i]),   // 1-bit input: Serial Data Input
            .R(~rst_n)    // 1-bit input: Active-High Async Reset
        );

    end

endmodule