`timescale 1ns / 1ps

module adaptive_model_tb #(
    parameter CLK_PERIOD = 5,
    parameter NUM_SYMBOLS = 128
);

//Clocking and reset
reg clk = 0;
reg rst = 0;

always #CLK_PERIOD clk <= ~clk;

//Module testbench signals
reg  [ 7:0] symbol_in = 0;
reg         valid_in  = 0;

wire [15:0] upper_bound_out;
wire [15:0] lower_bound_out;
wire [15:0] range_out;
wire        valid_out;

reg         read_table_in   = 0;
wire [23:0] table_entry_out;
wire        entry_valid_out;

adaptive_model adaptive_model_inst (
    .clk            (clk            ),
    .rst            (rst            ),
    .symbol_in      (symbol_in      ),
    .upper_bound_out(upper_bound_out),
    .lower_bound_out(lower_bound_out),
    .range_out      (range_out      ),
    .valid_in       (valid_in       ),
    .valid_out      (valid_out      ),
    .read_table_in  (read_table_in  ),
    .table_entry_out(table_entry_out),
    .entry_valid_out(entry_valid_out)
);

//Symbol write logic
reg [7:0] symbols [NUM_SYMBOLS-1:0];
reg [7:0] index = 0;
reg       write_symbols = 0;

function void set_symbols(string text);
    for(int i = 0; i < NUM_SYMBOLS; i = i + 1) begin
        symbols[i] = i < text.len() ? text.getc(i) : 8'd0;
    end
endfunction

always @(posedge clk) begin
    if(write_symbols) begin
        symbol_in <= symbols[index];
        valid_in <= 1'b1;
        index <= index + 1;
    end
    else begin
        symbol_in <= 8'd0;
        valid_in <= 1'b0;
    end
end

initial begin
    set_symbols("aaaaabbbbbaaaaa");

    //Some padding in case module is broken
    for(int i = 0; i < 10; i++) @(posedge clk);

    //Write 15 symbols
    write_symbols <= 1'b1;
    for(int i = 0; i < 15; i++) @(posedge clk);

    write_symbols <= 1'b0;
    @(posedge clk);

    //Some padding in case module is broken
    for(int i = 0; i < 24; i++) @(posedge clk);
    $finish;
end

endmodule