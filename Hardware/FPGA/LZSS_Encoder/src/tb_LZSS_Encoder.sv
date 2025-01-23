
module tb_LZSS_Encoder ();

    localparam WORD_SIZE = 8;
    localparam WINDOW_SIZE = 32;
    localparam LOOK_AHEAD_SIZE = 4;

    localparam MAIN_CLK_PERIOD = 10;

    reg clk;
    reg rst_n;
    reg w_en;

    reg [WORD_SIZE-1:0] data_i;

    wire [WORD_SIZE:0] data_o; // 1 bit added to each word for reference identification
    wire o_ready;

    LZSS_Encoder #(.WORD_SIZE(WORD_SIZE), .WINDOW_SIZE(WINDOW_SIZE), .LOOK_AHEAD_SIZE(LOOK_AHEAD_SIZE)) LZSS_encoder_0 (
        .clk(clk),
        .rst_n(rst_n),
        .w_en(w_en),
        .data_i(data_i),
        .data_o(data_o),
        .o_ready(o_ready)
    );


    always begin
        clk = 1'b0;
        #(MAIN_CLK_PERIOD/2) clk = 1'b1;
        #(MAIN_CLK_PERIOD/2);
    end

    
    int written_file = $fopen("C:\\Users\\micha\\OneDrive\\Desktop\\DICE\\Hardware\\FPGA\\LZSS_Encoder\\src\\LZSS_Output.txt", "w");

    always @ (negedge clk) begin
        if(o_ready) begin
            $fwrite(written_file, "%x\n", data_o);
        end
    end


    initial begin
        //start in reset
        rst_n <= 1'b0;
        w_en <= 1'b0;

        #30

        //release reset
        rst_n <= 1'b1;
        //enable
        w_en <= 1'b1;

        //row by row
        //@(negedge clk)
        //data_i <= 8'h3A;
        //@(negedge clk)
        //data_i <= 8'h35;
        //@(negedge clk)
        //data_i <= 8'hFE;
        //@(negedge clk)
        //data_i <= 8'hF1;
        //@(negedge clk)
        //data_i <= 8'h01;
        //@(negedge clk)
        //data_i <= 8'h11;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'hFF;
        //@(negedge clk)
        //data_i <= 8'hDC;
        //@(negedge clk)
        //data_i <= 8'hFC;
        //@(negedge clk)
        //data_i <= 8'h16;
        //@(negedge clk)
        //data_i <= 8'h01;
        //@(negedge clk)
        //data_i <= 8'h02;
        //@(negedge clk)
        //data_i <= 8'h01;
        //@(negedge clk)
        //data_i <= 8'h01;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'hFE;
        //@(negedge clk)
        //data_i <= 8'hF9;
        //@(negedge clk)
        //data_i <= 8'hFE;
        //@(negedge clk)
        //data_i <= 8'h06;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h01;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h01;
        //@(negedge clk)
        //data_i <= 8'h09;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'hFC;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h01;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'hFF;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'hFD;
        //@(negedge clk)
        //data_i <= 8'hFF;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'hFF;
        //@(negedge clk)
        //data_i <= 8'hFC;
        //@(negedge clk)
        //data_i <= 8'hFF;
        //@(negedge clk)
        //data_i <= 8'hFF;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h01;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'hFF;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h01;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;
        //@(negedge clk)
        //data_i <= 8'h00;

        //@(negedge clk)
        //data_i <= 8'hFF;

        //zig-zag
        @(negedge clk)
        data_i <= 8'h3A;
        @(negedge clk)
        data_i <= 8'h35;
        @(negedge clk)
        data_i <= 8'hDC;
        @(negedge clk)
        data_i <= 8'hFE;
        @(negedge clk)
        data_i <= 8'hFC;
        @(negedge clk)
        data_i <= 8'hFE;
        @(negedge clk)
        data_i <= 8'hF1;
        @(negedge clk)
        data_i <= 8'h16;
        @(negedge clk)
        data_i <= 8'hF9;
        @(negedge clk)
        data_i <= 8'h09;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'hFE;
        @(negedge clk)
        data_i <= 8'h01;
        @(negedge clk)
        data_i <= 8'h01;
        @(negedge clk)
        data_i <= 8'h01;
        @(negedge clk)
        data_i <= 8'h02;
        @(negedge clk)
        data_i <= 8'h06;
        @(negedge clk)
        data_i <= 8'hFC;
        @(negedge clk)
        data_i <= 8'hFD;
        @(negedge clk)
        data_i <= 8'hFC;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'hFF;
        @(negedge clk)
        data_i <= 8'hFF;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h01;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'hFF;
        @(negedge clk)
        data_i <= 8'h01;
        @(negedge clk)
        data_i <= 8'h01;
        @(negedge clk)
        data_i <= 8'h01;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'hFF;
        @(negedge clk)
        data_i <= 8'hFF;
        @(negedge clk)
        data_i <= 8'h01;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h01;
        @(negedge clk)
        data_i <= 8'hFF;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h01;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'hFF;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;
        @(negedge clk)
        data_i <= 8'h00;

        @(negedge clk)
        data_i <= 8'hFF;
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        @(negedge clk)
        $fclose(written_file);
        //$finish;
    end

    
    
endmodule