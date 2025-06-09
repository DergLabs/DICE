`timescale 1ns / 1ps

module arithmetic_coder_tb #(
    parameter CLK_PERIOD = 5,
    parameter NUM_CYCLES = 9,
    parameter NUM_SYMBOLS = 128
);

//Clocking and reset
reg clk = 0;
reg rst = 0;

always #CLK_PERIOD clk <= ~clk;

//Developing pipeline
reg  [ 7:0] symbol_reg = 0;
reg         valid_reg  = 0;

reg  [15:0] upper_bound = 16'hFFFF;
reg  [15:0] lower_bound = 16'h0000;

wire [15:0] prob_upper_bound;
wire [15:0] prob_lower_bound;
wire [15:0] prob_range;
wire        prob_valid;

//Arithmetic coding working bounds logic
reg [15:0] working_upper_reg [NUM_CYCLES-1:0];
reg [15:0] working_lower_reg [NUM_CYCLES-1:0];
reg [ 3:0] rd_index = 1;
reg [ 3:0] wr_index = 0;

initial begin
    for(int i = 0; i < NUM_CYCLES; i++) begin
        working_upper_reg[i] = 16'hFFFF;
        working_lower_reg[i] = 16'h0000;
    end
end

//Arithmetic coding pipeline
adaptive_model adaptive_model_inst (
    .clk            (clk             ),
    .rst            (rst             ),
    .symbol_in      (symbol_reg      ),
    .valid_in       (valid_reg       ),
    .upper_bound_out(prob_upper_bound),
    .lower_bound_out(prob_lower_bound),
    .range_out      (prob_range      ),
    .valid_out      (prob_valid      )
);

wire [16:0] prob_range_inv;
wire        inverse_valid;

radix_inverse radix_inverse_inst (
    .clk        (clk           ),
    .divisor_in (prob_range    ),
    .inverse_out(prob_range_inv),
    .valid_in   (prob_valid    ),
    .valid_out  (inverse_valid )
);

wire [15:0] prob_upper_out;
wire [15:0] prob_lower_out;
wire        fifo_valid;

bounds_fifo_wrap bounds_fifo_inst (
    .clk            (clk             ),
    .upper_bound_in (prob_upper_bound),
    .lower_bound_in (prob_lower_bound),
    .valid_in       (prob_valid      ),
    .upper_bound_out(prob_upper_out  ),
    .lower_bound_out(prob_lower_out  ),
    .valid_out      (fifo_valid      ),
    .read_en        (inverse_valid   )
);

//NOTE: Using inverse_valid for reading since that'll signal that the inverse calculation is done
reg  [16:0] prob_range_inv_reg = 0;
reg         inverse_valid_reg = 0;

always @(posedge clk) begin
    prob_range_inv_reg <= prob_range_inv;
    inverse_valid_reg <= inverse_valid;
end

wire [15:0] adjusted_upper_1;
wire [15:0] adjusted_lower_1;
wire        calc_valid;

//Latency: 5
bounds_calc bounds_calc_inst (
    .clk           (clk               ),
    .prob_upper_in (prob_upper_out    ),
    .prob_lower_in (prob_lower_out    ),
    .prob_range_in (prob_range_inv_reg),
    .work_upper_in (upper_bound       ),
    .work_lower_in (lower_bound       ),
    .work_upper_out(adjusted_upper_1  ),
    .work_lower_out(adjusted_lower_1  ),
    .valid_in      (inverse_valid_reg ),
    .valid_out     (calc_valid        )
);

wire [15:0] adjusted_upper_2;
wire [15:0] adjusted_lower_2;

wire [15:0] out_bits;
wire [15:0] out_bits_mask;
wire [ 4:0] out_bits_count;
wire        out_bits_valid;

//Latency: 1
out_bits out_bits_inst (
    .clk           (clk             ),
    .data_upper_in (adjusted_upper_1),
    .data_lower_in (adjusted_lower_1),
    .data_upper_out(adjusted_upper_2),
    .data_lower_out(adjusted_lower_2),
    .out_bits      (out_bits        ),
    .out_bits_mask (out_bits_mask   ),
    .out_bits_count(out_bits_count  ),
    .valid_in      (calc_valid      ),
    .valid_out     (out_bits_valid  )
);

wire [15:0] adjusted_upper_3;
wire [15:0] adjusted_lower_3;
wire [ 3:0] pending_out;
wire        pending_valid;

//Latency: 1
renormalize renormalize_inst (
    .clk           (clk ),
    .data_upper_in (adjusted_upper_2),
    .data_lower_in (adjusted_lower_2),
    .data_upper_out(adjusted_upper_3),
    .data_lower_out(adjusted_lower_3),
    .pending_out   (pending_out     ),
    .valid_in      (out_bits_valid  ),
    .valid_out     (pending_valid   )
);

always @(posedge clk) begin
    if(inverse_valid_reg) begin
        upper_bound <= working_upper_reg[rd_index];
        lower_bound <= working_lower_reg[rd_index];
        rd_index <= (rd_index == (NUM_CYCLES - 1)) ? 4'd0 : rd_index + 1;
    end

    if(pending_valid) begin
        working_upper_reg[wr_index] <= adjusted_upper_3;
        working_lower_reg[wr_index] <= adjusted_lower_3;
        wr_index <= (wr_index == (NUM_CYCLES - 1)) ? 4'd0 : wr_index + 1;
    end
end

//Total latency: 7 cycles (8 including writeback).
//This is total latency of the path for the data dependency of the working bounds values.
//This means there should be at least 7 encoding streams.
//TODO: Write stream buffer module that handles output of the last two modules in the pipeline.

//Some logic for feeding symbols into the encoder
reg [7:0] symbol_arr [NUM_SYMBOLS-1:0];
reg [7:0] index = 0;

function void set_symbols(string text);
    for(int i = 0; i < NUM_SYMBOLS; i = i + 1) begin
        symbol_arr[i] = i < text.len() ? text.getc(i) : 8'd0;
    end
endfunction

reg next = 0;
always @(posedge clk) begin
    if(next) begin
        symbol_reg <= symbol_arr[index];
        valid_reg <= 1'b1;
        index <= index + 1;
    end
    else begin
        symbol_reg <= 8'd0;
        valid_reg <= 1'b0;
    end
end

string message = "This is a message encoded using arithmetic coding, which is a statistical entropy encoding scheme!";
initial begin
    set_symbols(message);

    for(int i = 0; i < 10; i++) @(posedge clk);

    next <= 1'b1;
    for(int i = 0; i < message.len(); i++) @(posedge clk);
    next <= 1'b0;

    for(int i = 0; i < 50; i++) @(posedge clk);
end

endmodule