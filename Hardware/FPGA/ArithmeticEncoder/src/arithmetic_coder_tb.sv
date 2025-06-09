`timescale 1ns / 1ps

module arithmetic_coder_tb #(
    parameter CLK_PERIOD  =   5,
    parameter NUM_SYMBOLS = 128
);

//Clocking and reset
reg clk = 0;
reg rst = 0;

always #CLK_PERIOD clk <= ~clk;

//Module test
reg  [ 7:0] symbol = 0;
reg         valid  = 0;
reg         wr_complete = 0;
reg         next = 0;

wire [ 7:0] data_out;
wire        valid_out;

wire [15:0] s_bits_out         ;
wire [ 4:0] s_bits_count_out   ;
wire        s_bits_valid_out   ;
wire [ 3:0] s_pending_out      ;
wire        s_pending_valid_out;

wire [15:0] s_upper_before;
wire [15:0] s_lower_before;
wire [16:0] s_range_inv   ;
wire [15:0] s_prob_upper  ;
wire [15:0] s_prob_lower  ;
wire [15:0] s_upper_after ;
wire [15:0] s_lower_after ;
wire        s_before_valid;
wire        s_after_valid ;

arithmetic_coder arithmetic_coder_inst(
    .clk           (clk        ),
    .rst           (rst        ),
    .symbol_in     (symbol     ),
    .valid_in      (valid      ),
    .wr_complete_in(wr_complete),
    .next_in       (next       ),
    .data_out      (data_out   ),
    .valid_out     (valid_out  )

    //.s_bits_out         (s_bits_out         ),
    //.s_bits_count_out   (s_bits_count_out   ),
    //.s_bits_valid_out   (s_bits_valid_out   ),
    //.s_pending_out      (s_pending_out      ),
    //.s_pending_valid_out(s_pending_valid_out),

    //.s_upper_before(s_upper_before),
    //.s_lower_before(s_lower_before),
    //.s_range_inv   (s_range_inv   ),
    //.s_prob_upper  (s_prob_upper  ),
    //.s_prob_lower  (s_prob_lower  ),
    //.s_upper_after (s_upper_after ),
    //.s_lower_after (s_lower_after ),
    //.s_before_valid(s_before_valid),
    //.s_after_valid (s_after_valid )
);

//Some logic for feeding symbols into the encoder
reg [7:0] symbol_arr [NUM_SYMBOLS-1:0];
reg [7:0] index = 0;

function void set_symbols(string text);
    $display("Original length: %0d\n", text.len());
    for(int i = 0; i < NUM_SYMBOLS; i = i + 1) begin
        symbol_arr[i] = i < text.len() ? text.getc(i) : 8'd0;
    end
endfunction

reg [7:0] output_arr [0:2*NUM_SYMBOLS-1];

reg [15:0] bits_arr       [0:NUM_SYMBOLS-1];
reg [ 4:0] bits_count_arr [0:NUM_SYMBOLS-1];
reg [ 3:0] pending_arr    [0:NUM_SYMBOLS-1];

reg [15:0] upper_before_arr [0:NUM_SYMBOLS-1];
reg [15:0] lower_before_arr [0:NUM_SYMBOLS-1];
reg [16:0] range_inv_arr    [0:NUM_SYMBOLS-1];
reg [15:0] prob_upper_arr   [0:NUM_SYMBOLS-1];
reg [15:0] prob_lower_arr   [0:NUM_SYMBOLS-1];
reg [15:0] upper_after_arr  [0:NUM_SYMBOLS-1];
reg [15:0] lower_after_arr  [0:NUM_SYMBOLS-1];

reg [15:0] b_index = 0;
reg [15:0] p_index = 0;

reg [15:0] before_index = 0;
reg [15:0] after_index = 0;

string out_path;
string out_file_name;
int out_file;
int num_entries;
int length_upper;
int length_lower;
int length;
int i;
function void write_output(string file_name);
    //Write file
    out_path = "/home/phaedrus/Documents/project/arithmetic-coder-fpga/tb_output/";
    out_file_name = {out_path, file_name, ".out.txt"};
    out_file = $fopen(out_file_name, "w");

    //Check spikes file
    if(out_file) $display("INFO::OUTPUT: %s was successfully opened", out_file_name);
    else begin
        $display("ERROR::OUTPUT: %s could not be opened", out_file_name);
        $finish;
    end

    //Print number of table entries
    num_entries = output_arr[0];
    num_entries = num_entries + 1;
    $display("Table entries: %0d\n", num_entries);

    //Write out table entry data
    $fwrite(out_file, "%b\n", output_arr[0]);

    for(i = 1; i <= num_entries * 3;) begin
        $fwrite(out_file, "%b\n", output_arr[i++]);
        $fwrite(out_file, "%b\n", output_arr[i++]);
        $fwrite(out_file, "%b\n", output_arr[i++]);
    end

    //Print length of stream
    length_upper = output_arr[i];
    length_lower = output_arr[i + 1];
    length = (length_upper << 8) | length_lower;
    $display("Compressed length: %0d\n", length);

    for (; i < 2 * NUM_SYMBOLS - 1; i++) begin
        $fwrite(out_file, "%b\n", output_arr[i]);
    end

    $fclose(out_file);
endfunction

function void write_side_channel_output(string file_name);
    //Write file
    out_path = "/home/phaedrus/Documents/project/arithmetic-coder-fpga/tb_output/";
    out_file_name = {out_path, file_name, ".out.txt"};
    out_file = $fopen(out_file_name, "w");

    //Check spikes file
    if(out_file) $display("INFO::OUTPUT: %s was successfully opened", out_file_name);
    else begin
        $display("ERROR::OUTPUT: %s could not be opened", out_file_name);
        $finish;
    end

    for (i = 0; i < b_index; i++) begin
        $fwrite(out_file, "%b %0d %0d\n", bits_arr[i], bits_count_arr[i], pending_arr[i]);
    end

    $fclose(out_file);
endfunction

function void write_bounds_output(string file_name);
    //Write file
    out_path = "/home/phaedrus/Documents/project/arithmetic-coder-fpga/tb_output/";
    out_file_name = {out_path, file_name, ".out.txt"};
    out_file = $fopen(out_file_name, "w");

    //Check spikes file
    if(out_file) $display("INFO::OUTPUT: %s was successfully opened", out_file_name);
    else begin
        $display("ERROR::OUTPUT: %s could not be opened", out_file_name);
        $finish;
    end

    for (i = 0; i < before_index; i++) begin
        $fwrite(out_file, "%b %b %b %b %b %b %b\n", upper_before_arr[i], lower_before_arr[i], upper_after_arr[i], lower_after_arr[i], prob_upper_arr[i], prob_lower_arr[i], range_inv_arr[i]);
    end

    $fclose(out_file);
endfunction

reg wr_symbols = 0;
reg [7:0] out_index = 0;
always @(posedge clk) begin
    if(wr_symbols) begin
        symbol <= symbol_arr[index];
        valid <= 1'b1;
        index <= index + 1;
    end
    else begin
        symbol <= 8'd0;
        valid <= 1'b0;
    end

    if(valid_out) begin
        next <= 1'b1;
    end

    if(next) begin
        output_arr[out_index] <= data_out;
        out_index <= out_index + 1;
    end

//    if(s_bits_valid_out) begin
//        bits_arr[b_index] <= s_bits_out;
//        bits_count_arr[b_index] <= s_bits_count_out;
//        b_index <= b_index + 1;
//    end
//
//    if(s_pending_valid_out) begin
//        pending_arr[p_index] <= s_pending_out;
//        p_index <= p_index + 1;
//    end
//
//    if(s_before_valid) begin
//        upper_before_arr[before_index] <= s_upper_before;
//        lower_before_arr[before_index] <= s_lower_before;
//        range_inv_arr[before_index] <= s_range_inv;
//        prob_upper_arr[before_index] <= s_prob_upper;
//        prob_lower_arr[before_index] <= s_prob_lower;
//        before_index <= before_index + 1;
//    end
//
//    if(s_after_valid) begin
//        upper_after_arr[after_index] <= s_upper_after;
//        lower_after_arr[after_index] <= s_lower_after;
//        after_index <= after_index + 1;
//    end
end

string message = "This is a message encoded using arithmetic coding, which is a statistical entropy encoding scheme!";
initial begin
    set_symbols(message);

    for(int i = 0; i < 10; i++) @(posedge clk);

    wr_symbols <= 1'b1;
    for(int i = 0; i < message.len(); i++) @(posedge clk);
    wr_symbols <= 1'b0;

    for(int i = 0; i < 50; i++) @(posedge clk);

    //Signal we're done writing data to the encoder
    wr_complete <= 1'b1;

    //Wait for arithmetic coder to signal it's ready to output data
    @(posedge valid_out);
    @(posedge clk);

    //Start reading back data
    next <= 1'b1;

    //Wait a bit for the model side-channel information to come out
    for(int i = 0; i < 128; i++) @(posedge clk);

    //Wait for at least as long as lessage length
    for(int i = 0; i < message.len() + (9 - message.len() % 9); i++) @(posedge clk);

    next <= 1'b0;
    @(posedge clk);

    write_output("skibidi");
    //write_side_channel_output("side_channel_data");
    //write_bounds_output("bounds_data");
    $finish;
end

endmodule