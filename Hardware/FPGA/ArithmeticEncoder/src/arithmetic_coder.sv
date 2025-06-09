module arithmetic_coder (
    input         clk           ,
    input         rst           ,
    output        rst_done      ,
    input  [ 7:0] symbol_in     ,
    input         valid_in      ,
    input         wr_complete_in,
    input         next_in       ,
    output [ 7:0] data_out      ,
    output        valid_out     

    //output [15:0] s_bits_out         ,
    //output [ 4:0] s_bits_count_out   ,
    //output        s_bits_valid_out   ,
    //output [ 3:0] s_pending_out      ,
    //output        s_pending_valid_out,

    //output [15:0] s_upper_before     ,
    //output [15:0] s_lower_before     ,
    //output [16:0] s_range_inv        ,
    //output [15:0] s_prob_upper       ,
    //output [15:0] s_prob_lower       ,
    //output [15:0] s_upper_after      ,
    //output [15:0] s_lower_after      ,
    //output        s_before_valid     ,
    //output        s_after_valid      
);

//Internal parameters for the module
localparam NUM_CYCLES = 9;

//Developing pipeline
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

integer i;
initial begin
    for(i = 0; i < NUM_CYCLES; i++) begin
        working_upper_reg[i] = 16'hFFFF;
        working_lower_reg[i] = 16'h0000;
    end
end

//=========================================================
// Arithmetic coding pipeline
//=========================================================
wire [ 8:0] model_entry_count;
wire [23:0] model_entry;
wire        model_entry_valid;

reg         model_rd_en = 0;

adaptive_model adaptive_model_inst (
    .clk            (clk             ),
    .rst            (rst             ),
    .rst_done       (rst_done        ),
    .symbol_in      (symbol_in       ),
    .valid_in       (valid_in        ),
    .upper_bound_out(prob_upper_bound),
    .lower_bound_out(prob_lower_bound),
    .range_out      (prob_range      ),
    .valid_out      (prob_valid      ),

    .read_en        (model_rd_en      ),
    .entry_out      (model_entry      ),
    .entry_valid_out(model_entry_valid),

    .entry_count_out(model_entry_count)
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
    if(rst) begin
        //Bounds registers
        upper_bound <= 16'hFFFF;
        lower_bound <= 16'h0000;

        for(int i = 0; i < NUM_CYCLES; i++) begin
            working_upper_reg[i] <= 16'hFFFF;
            working_lower_reg[i] <= 16'h0000;
        end

        //Index registers
        rd_index <= 1;
        wr_index <= 0;
    end
    else begin
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
end

//assign s_bits_out = out_bits;
//assign s_bits_count_out = out_bits_count;
//assign s_bits_valid_out = out_bits_valid;

//assign s_pending_out = pending_out;
//assign s_pending_valid_out = pending_valid;

//assign s_upper_before     = upper_bound;
//assign s_lower_before     = lower_bound;
//assign s_range_inv        = prob_range_inv_reg;
//assign s_prob_upper       = prob_upper_out;
//assign s_prob_lower       = prob_lower_out;
//assign s_upper_after      = adjusted_upper_1;
//assign s_lower_after      = adjusted_lower_1;
//assign s_before_valid     = inverse_valid_reg;
//assign s_after_valid      = calc_valid;

//=========================================================
// Stream buffer logic
//=========================================================

//Stream buffer signaling
//Maybe could be removed, but it won't hurt for now
reg [ 3:0] ob_index = 0;
reg [15:0] out_bits_buff = 0;
reg [ 4:0] out_bits_count_buff = 0;
reg        out_bits_valid_buff [NUM_CYCLES-1:0];

wire [3:0] new_ob_index = (ob_index == (NUM_CYCLES - 1)) ? 4'd0 : ob_index + 1;

reg [ 3:0] pb_index = 0;
reg [ 3:0] pending_buff = 0;
reg        pending_valid_buff [NUM_CYCLES-1:0];

wire [3:0] new_pb_index = (pb_index == (NUM_CYCLES - 1)) ? 4'd0 : pb_index + 1;

initial begin
    for(i = 0; i < NUM_CYCLES; i = i + 1) begin
        out_bits_valid_buff[i] = 0;
        pending_valid_buff[i] = 0;
    end
end

always @(posedge clk) begin
    for(i = 0; i < NUM_CYCLES; i++) begin
        if(out_bits_valid_buff[i]) begin
            out_bits_valid_buff[i] <= 1'b0;
        end

        if(pending_valid_buff[i]) begin
            pending_valid_buff[i] <= 1'b0;
        end
    end

    //Output bits propogation
    if(out_bits_valid) begin
        out_bits_valid_buff[ob_index] <= 1'b1;
        ob_index <= new_ob_index;
    end

    out_bits_buff <= out_bits;
    out_bits_count_buff <= out_bits_count;

    //Pending bits propogation
    if(pending_valid) begin
        pending_valid_buff[pb_index] <= 1'b1;
        pb_index <= new_pb_index;
    end

    pending_buff <= pending_out;
end

reg         stream_read_en    [NUM_CYCLES-1:0];
wire [ 7:0] stream_byte_out   [NUM_CYCLES-1:0];
wire        stream_valid_out  [NUM_CYCLES-1:0];
wire [15:0] stream_byte_count [NUM_CYCLES-1:0];

genvar j;
generate
    for(j = 0; j < NUM_CYCLES; j = j + 1) begin
        stream_buffer stream_buffer_inst (
            .clk            (clk                   ),
            .rst            (rst                   ),
            .bits_in        (out_bits_buff         ),
            .bits_count_in  (out_bits_count_buff   ),
            .bits_valid     (out_bits_valid_buff[j]),
            .pending_bits_in(pending_buff          ),
            .pending_valid  (pending_valid_buff[j] ),
            .byte_count     (stream_byte_count[j]  ),
            .read_en        (stream_read_en[j]     ),
            .byte_out       (stream_byte_out[j]    ),
            .valid_out      (stream_valid_out[j]   )
        );
    end
endgenerate

//=========================================================
// Final output logic
//=========================================================
//Output signals
reg [15:0] out_count_reg = 0;
reg [ 7:0] out_buffer_reg [NUM_CYCLES-1:0];
reg [ 7:0] out_byte_reg = 0;
reg        out_valid_reg = 0;

reg [ 3:0] out_index = 0;

wire       reached_max = (out_index == (NUM_CYCLES - 1));
wire [3:0] next_out_index = reached_max ? 4'd0 : out_index + 1;

//Model output state machine signals
reg  [23:0] entry_buffer_1 = 0;
reg  [23:0] entry_buffer_2 = 0;
reg         wr_toggle = 0;
reg         rd_toggle = 0;
reg  [ 8:0] entry_count = 0;

reg  [ 2:0] entry_byte_index = 3'b001;
reg         entry_byte_index_prev = 0;
wire [23:0] entry_value = rd_toggle ? entry_buffer_2 : entry_buffer_1;

wire        last_entry_byte = entry_byte_index_prev && (entry_count == model_entry_count);

//Output state machine signals
localparam STATE_WAIT = 0;
localparam STATE_COUNT = 1;
localparam STATE_PRELOAD = 2;
localparam STATE_OUTPUT_COUNT = 3;
localparam STATE_OUTPUT_BYTES = 4;
localparam STATE_IDLE = 5;
localparam STATE_OUTPUT_ENTRIES = 6;

reg [2:0] out_state = STATE_IDLE;

initial begin
    for(i = 0; i < NUM_CYCLES; i = i + 1) begin
        out_buffer_reg[i] <= 8'd0;
        stream_read_en[i] <= 1'b0;
    end
end

always @(posedge clk) begin
    if(rst) begin
        out_index <= 0;
        out_count_reg <= 0;
        out_valid_reg <= 0;
        out_byte_reg <= 0;
        out_state <= STATE_IDLE;

        wr_toggle <= 0;
        rd_toggle <= 0;
        entry_count <= 0;
        entry_byte_index <= 3'b100;
        entry_byte_index_prev <= 1'b0;
    end
    else begin
        for(i = 0; i < NUM_CYCLES; i = i + 1) begin
            //Update buffer value when new data is available
            if(stream_valid_out[i]) begin
                out_buffer_reg[i] <= stream_byte_out[i];
            end

            //Sets itself low again
            if(stream_read_en[i]) begin
                stream_read_en[i] <= 1'b0;
            end
        end

        //Entry output logic state machine
        if(model_rd_en) begin
            model_rd_en <= 1'b0;
        end

        if(model_entry_valid) begin
            if(wr_toggle) begin
                entry_buffer_2 <= model_entry;
            end
            else begin
                entry_buffer_1 <= model_entry;
            end
            wr_toggle <= ~wr_toggle;
            entry_count <= entry_count + 1;
        end

        //Output state machine
        case(out_state)
            STATE_IDLE: begin
                //TODO: Wait for other modules to finish their write complete process
                if(wr_complete_in) begin
                    out_state <= STATE_COUNT;

                    //Start model entry state machine
                    model_rd_en <= 1'b1;
                end
            end
            STATE_COUNT: begin
                //Sum up all the bytes in each stream
                out_count_reg <= out_count_reg + stream_byte_count[out_index];

                //Update index
                out_index <= next_out_index;

                //We're done after this first pass
                if(reached_max) begin
                    out_state <= STATE_PRELOAD;
                end
            end
            STATE_PRELOAD: begin
                //Poll first set of bytes
                stream_read_en[out_index] <= 1'b1;

                //Update index
                out_index <= next_out_index;

                //We're done after this first pass, start output stages
                if(reached_max) begin
                    //Model entry count asserted here
                    //No separate stage because it's just one byte (count = byte + 1)
                    out_byte_reg <= (model_entry_count - 1);
                    out_valid_reg <= 1'b1;

                    out_state <= STATE_OUTPUT_ENTRIES;
                end
            end
            STATE_OUTPUT_ENTRIES: begin
                if(next_in) begin
                    if(entry_byte_index[0] && !last_entry_byte) begin
                        //Symbol byte
                        out_byte_reg <= entry_value[23:16];
                        entry_byte_index <= 3'b010;

                        //Start read here because it should take 2 cycles
                        model_rd_en <= 1'b1;
                    end
                    if(entry_byte_index[1]) begin
                        //Upper first_seen byte
                        out_byte_reg <= entry_value[15: 8];
                        entry_byte_index <= 3'b100;
                    end
                    if(entry_byte_index[2]) begin
                        //Lower firstr_seen byte
                        out_byte_reg <= entry_value[ 7: 0];
                        entry_byte_index <= 3'b001;

                        //Now we read from the other one
                        rd_toggle <= ~rd_toggle;
                    end

                    //This signal exists because last_entry_byte must go high one cycle AFTER the third byte is written
                    entry_byte_index_prev <= entry_byte_index[2];

                    //Moved this to a wire to reduce logic levels
                    if(last_entry_byte) begin
                        //Load first byte of count
                        out_byte_reg <= out_count_reg[15:8];
                        out_valid_reg <= 1'b1;

                        out_state <= STATE_OUTPUT_COUNT;
                    end
                end
            end
            STATE_OUTPUT_COUNT: begin
                if(next_in) begin
                    //Load up second byte of count
                    out_byte_reg <= out_count_reg[7:0];

                    out_state <= STATE_OUTPUT_BYTES;
                end
            end
            STATE_OUTPUT_BYTES: begin
                for(i = 0; i < NUM_CYCLES; i = i + 1) begin
                    if(next_in) begin
                        stream_read_en[i] <= (out_index == i);
                    end
                end

                if(next_in) begin
                    out_index <= next_out_index;
                    out_byte_reg <= out_buffer_reg[out_index];
                end
            end
        endcase
    end
end

assign data_out = out_byte_reg;
assign valid_out = out_valid_reg;

endmodule