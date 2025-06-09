module pending_bits_tb #(
    parameter CLK_PERIOD = 5
);

//Clocking and reset
reg clk = 0;
reg rst = 0;

always #CLK_PERIOD clk <= ~clk;

//Test pending bits buffer module
//Expects there to be a few cycles between each data input
reg  [15:0] bits_reg = 0;
reg  [ 4:0] bits_count_reg = 0;
reg         bits_valid_reg = 0;

reg  [ 3:0] pending_reg = 0;
reg         pending_valid_reg = 0;

wire [15:0] bits_out;
wire [ 4:0] bits_count_out;
wire        bits_valid_out;

pending_bits_buffer pending_bits_buffer_inst (
    .clk             (clk              ),
    .bits_in         (bits_reg         ),
    .bits_count_in   (bits_count_reg   ),
    .bits_valid_in   (bits_valid_reg   ),
    .pending_in      (pending_reg      ),
    .pending_valid_in(pending_valid_reg),
    .bits_out        (bits_out         ),
    .bits_count_out  (bits_count_out   ),
    .bits_valid_out  (bits_valid_out   )
);

initial begin
    //Let the module settle
    for(int i = 0; i < 10; i++) @(posedge clk);

    //Assert some pending bits
    pending_reg <= 4'd10;
    pending_valid_reg <= 1'b1;
    @(posedge clk);
    pending_valid_reg <= 1'b0;

    //Assert some more pending bits
    pending_reg <= 4'd10;
    pending_valid_reg <= 1'b1;
    @(posedge clk);
    pending_valid_reg <= 1'b0;

    //Assert some data
    bits_reg <= 16'b1101_0000_0000_0000;
    bits_count_reg <= 5'd5;
    bits_valid_reg <= 1'b1;
    @(posedge clk);
    bits_valid_reg <= 1'b0;

    for(int i = 0; i < 10; i++) @(posedge clk);

    $finish;
end

endmodule