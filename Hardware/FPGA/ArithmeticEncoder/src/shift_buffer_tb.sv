module shift_buffer_tb #(
    parameter CLK_PERIOD = 5
);

//Clocking and reset
reg clk = 0;
reg rst = 0;

always #CLK_PERIOD clk <= ~clk;

//Shift buffer test
reg [15:0] pieces [0:7] = {
    16'b1010_0000_0000_0000,
    16'b1110_0000_0000_0000,
    16'b0010_0000_0000_0000,
    16'b1010_1110_0000_0000,
    16'b0000_0000_0000_0000,
    16'b1010_0000_0000_0000,
    16'b1010_0000_0000_0000,
    16'b1010_0000_0000_0000
};

reg [4:0] counts [0:7] = {
     4,
     3,
     3,
     8,
     5,
    16,
     4,
     4
};

//Expected output:
//--------------------
//1010_1110_0110_1011
//1000_0001_0100_0000

//Expected buffer:
//--------------------
//0000_0001_0101_010

reg         write_piece = 0;
reg  [ 2:0] index = 0;
reg  [15:0] data_in = 0;
reg  [ 4:0] count_in = 0;
reg         valid_in = 0;
wire [15:0] data_out;
wire        valid_out;
always @(posedge clk) begin
    if(write_piece) begin
        valid_in <= 1;
        data_in <= pieces[index];
        count_in <= counts[index];
        index <= index + 1;
    end
    else begin
        valid_in <= 0;
    end
end

shift_buffer shift_buffer_inst (
    .clk      (clk      ),
    .data_in  (data_in  ),
    .count_in (count_in ),
    .valid_in (valid_in ),
    .data_out (data_out ),
    .valid_out(valid_out)
);

initial begin
    //Some cycles to see if initial states are all defined
    for(int i = 0; i < 10; i++) @(posedge clk);

    //Write some data to the module
    write_piece <= 1;
    for(int i = 0; i < 8; i++) @(posedge clk);
    write_piece <= 0;

    //Write a second one
    /*
    for(int i = 0; i < 10; i++) @(posedge clk);
    write_piece <= 1;
    for(int i = 0; i < 7; i++) @(posedge clk);
    write_piece <= 0;
    */

    //Some cycles to see what comes back
    for(int i = 0; i < 10; i++) @(posedge clk);

    $finish;
end

endmodule