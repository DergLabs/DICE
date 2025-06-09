`timescale 1ns / 1ps

module stream_buffer_tb #(
    parameter CLK_PERIOD = 5
);

//Clocking and reset
reg clk = 0;
reg rst = 0;

always #CLK_PERIOD clk <= ~clk;

//Stream buffer test logic
reg  [15:0] bits_in = 0;
reg  [ 4:0] bits_count_in = 0;
reg         bits_valid = 0;

reg  [ 3:0] pending_bits_in = 0;
reg         pending_valid_in = 0;

reg         read_stream = 0;
wire [ 7:0] byte_out;
wire        valid_out;

stream_buffer stream_buffer_inst (
    .clk            (clk             ),
    .rst            (rst             ),
    .bits_in        (bits_in         ),
    .bits_count_in  (bits_count_in   ),
    .bits_valid     (bits_valid      ),
    .pending_bits_in(pending_bits_in ),
    .pending_valid  (pending_valid_in),
    .read_en        (read_stream     ),
    .byte_out       (byte_out        ),
    .valid_out      (valid_out      )
);

`define WAIT(num) for(int i = 0; i < num; i++) @(posedge clk);
initial begin
    //Let module settle
    for(int i = 0; i < 10; i++) @(posedge clk);

    //Write half word, full word set to show other values are ignored
    bits_in <= 16'b1010_1011_1100_1101;
    bits_count_in <= 5'd8;
    bits_valid <= 1'b1;
    `WAIT(1);

    //Write second half-word, full-word should go to BRAM
    bits_in <= 16'b1000_0001_0110_0000;
    bits_count_in <= 5'd8;
    bits_valid <= 1'b1;
    `WAIT(1);
    
    //Some delay between writes
    bits_valid <= 1'b0;
    `WAIT(1);

    //Write some more words
    bits_in <= 16'b0110_0000_0101_0000;
    bits_count_in <= 5'd16;
    bits_valid <= 1'b1;
    `WAIT(1);
    
    //Wait a bit for write to occur inside module
    bits_valid <= 1'b0;
    `WAIT(12);

    //Start reading stream
    read_stream <= 1'b1;
    `WAIT(1);
    
    read_stream <= 1'b0;
    `WAIT(2);

    read_stream <= 1'b1;
    `WAIT(5);

    read_stream <= 1'b0;
    `WAIT(12);

    $finish;
end

endmodule