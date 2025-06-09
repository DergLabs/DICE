`timescale 1ns / 1ps

module binary_tree_tb #(
    parameter CLK_PERIOD  =   5,
    parameter NUM_SYMBOLS = 128
)();

reg sys_clk = 0;
reg rst     = 0;

always #CLK_PERIOD sys_clk = ~sys_clk;

reg [7:0] symbol_in = 0;
reg       symbol_in_valid = 0;

wire [15:0] lower_bound_out;
wire [15:0] upper_bound_out;
wire [15:0] range_out;
wire        valid_out;

reg       write_symbols = 0;
reg [7:0] index = 0;

binary_tree binary_tree_inst (
    .clk            (sys_clk        ),
    .rst            (rst            ),
    .symbol_in      (symbol_in      ),
    .valid_in       (symbol_in_valid),
    .lower_bound_out(lower_bound_out),
    .upper_bound_out(upper_bound_out),
    .range_out      (range_out      ),
    .valid_out      (valid_out      )
);

reg [7:0] symbols [NUM_SYMBOLS-1:0];

function void set_symbols(string text);
    for(int i = 0; i < NUM_SYMBOLS; i = i + 1) begin
        symbols[i] = i < text.len() ? text.getc(i) : 8'd0;
    end
endfunction

always @(posedge sys_clk) begin
    if(write_symbols) begin
        symbol_in <= symbols[index];
        symbol_in_valid <= 1'b1;
        index <= index + 1;
    end
    else begin
        symbol_in <= 8'd0;
        symbol_in_valid <= 1'b0;
    end
end

initial begin
    set_symbols("aaaaabbbbbaaaaa");

    for(int i = 0; i < 10; i++) @(posedge sys_clk);

    write_symbols <= 1'b1;
    //@(posedge sys_clk);

    for(int i = 0; i < 15; i++) @(posedge sys_clk);

    write_symbols <= 1'b0;
    @(posedge sys_clk);

    for(int i = 0; i < 24; i++) @(posedge sys_clk);
    $finish;
end

endmodule