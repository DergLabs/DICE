
module equality_check #(
    parameter WORD_SIZE = 8
) (
    //input clk,
    input [WORD_SIZE-1:0] data_i_0,
    input [WORD_SIZE-1:0] data_i_1,

    output comparison

);

    wire comparison_o;
    assign comparison = comparison_o;

    always_comb begin
        comparison_o = data_i_0 & data_i_1;
    end
    

    
endmodule