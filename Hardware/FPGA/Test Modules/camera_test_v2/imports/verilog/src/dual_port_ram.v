
// Dual port RAM module

module full_dp_ram #(parameter DATA_WIDTH = 8, ADDR_WIDTH = 8)
    (
        reset_i,
        // Port A
        clk_a_i,
        data_a_i,
        addr_a_i,
        data_a_o,
        wr_en_a_i,
        clk_a_en_i,
        // Port B
        clk_b_i,
        data_b_i,
        addr_b_i,
        data_b_o,
        wr_en_b_i,
        clk_b_en_i
    );

input reset_i;
input clk_a_i;
input [DATA_WIDTH-1:0] data_a_i;
input [ADDR_WIDTH-1:0] addr_a_i;
output [DATA_WIDTH-1:0] data_a_o;
input wr_en_a_i;

input clk_b_i;
input [DATA_WIDTH-1:0] data_b_i;
input [ADDR_WIDTH-1:0] addr_b_i;
output [DATA_WIDTH-1:0] data_b_o;
input wr_en_b_i;

reg [data_width-1:0] memory[0:2**ADDR_WIDTH-1];
reg [data_width-1:0] data_a_o;
reg [data_width-1:0] data_b_o;

// Port A implementation
always @ ( posedge clk_a_i )
begin
    if (reset_i)
    begin
        data_a_o <= 0;
    end
    else
    begin
        data_a_o <= memory[addr_a_i];
        if (wr_en_a_i)
        begin
            data_a_o <= data_a_i;
            memory[addr_a_i] <= data_a_i;
        end
    end
end



always @ ( posedge clk_a_i )
begin
    data_a_o <= memory[addr_a_i];
    if (wr_en_a_i)
    begin
        data_a_o <= data_a_i;
        memory[addr_a_i] <= data_a_i;
    end
end

// Port B implementation
always @ ( posedge clk_b_i )
begin
    data_b_o <= memory[addr_b_i];
    if (wr_en_b_i)
    begin
        data_b_o <= data_b_i;
        memory[addr_b_i] <= data_b_i;
    end
end

endmodule