
module LZSS_Encoder #(parameter WORD_SIZE = 8, WINDOW_SIZE = 16, LOOK_AHEAD_SIZE = 4)
(
    input clk,
    input rst_n,
    input w_en,

    input [WORD_SIZE-1:0] data_i,

    output reg [WORD_SIZE:0] data_o, // 1 bit added to each word for reference identification
    output o_ready
);


    reg weh;

    reg [(WORD_SIZE * WINDOW_SIZE)-1:0] shift_reg;
    wire [WINDOW_SIZE-1:0] input_compares_wire;
    reg [WINDOW_SIZE-1:0] input_compares;

    genvar i;
    for(i = 0; i < WINDOW_SIZE; i++) begin
        assign input_compares_wire[i] = (data_i == shift_reg[(WORD_SIZE-1)+(i*WORD_SIZE) : i*WORD_SIZE]) ? 1'b1 : 1'b0;
    end

    always @(posedge clk) begin
      if (!rst_n) begin
        weh <= 1'b0;
        shift_reg <= '0;
        input_compares <= '0;
        //input_compares <= '0;
      end else begin
        if(w_en) begin
            shift_reg <= {shift_reg[((WORD_SIZE * WINDOW_SIZE)-1)-WORD_SIZE:0], data_i};
            input_compares <= input_compares_wire;

        end else begin
            shift_reg <= shift_reg;
        end


        

      end
    end



    
endmodule