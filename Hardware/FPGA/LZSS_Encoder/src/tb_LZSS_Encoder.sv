
module tb_LZSS_Encoder ();

    localparam WORD_SIZE = 4;
    localparam WINDOW_SIZE = 16;
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


    initial begin
        //start in reset
        rst_n <= 1'b0;
        w_en <= 1'b0;


        #30

        //release reset
        rst_n <= 1'b1;
        //enable
        w_en <= 1'b1;

        @(negedge clk)
        data_i <= 4'h0;
        @(negedge clk)
        data_i <= 4'h1;
        @(negedge clk)
        data_i <= 4'h2;
        @(negedge clk)
        data_i <= 4'h3;
        @(negedge clk)
        data_i <= 4'h4;
        @(negedge clk)
        data_i <= 4'h5;
        @(negedge clk)
        data_i <= 4'h6;
        @(negedge clk)
        data_i <= 4'h7;
        @(negedge clk)
        data_i <= 4'h8;
        @(negedge clk)
        data_i <= 4'h9;
        @(negedge clk)
        data_i <= 4'hA;
        @(negedge clk)
        data_i <= 4'hB;
        @(negedge clk)
        data_i <= 4'hC;
        @(negedge clk)
        data_i <= 4'hD;
        @(negedge clk)
        data_i <= 4'hE;
        @(negedge clk)
        data_i <= 4'hF;

    end
    
endmodule