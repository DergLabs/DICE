
module LZSS_Encoder #(parameter WORD_SIZE = 8, WINDOW_SIZE = 32, LOOK_AHEAD_SIZE = 4)
(
    input clk,
    input rst_n,
    input w_en,

    input [WORD_SIZE-1:0] data_i,

    output reg [WORD_SIZE:0] data_o, // 1 bit added to each word for reference identification
    output o_ready
);

    localparam MAX_LENGTH_BITS = WORD_SIZE - $clog2(WINDOW_SIZE);
    localparam MAX_LENGTH_VALUE = 2**MAX_LENGTH_BITS - 1;

    //stage 1 vars
    reg [(WORD_SIZE * WINDOW_SIZE)-1:0] shift_reg;
    wire [WINDOW_SIZE-1:0] input_compares_wire;
    reg [WINDOW_SIZE-1:0] input_compares;
    reg [WORD_SIZE-1:0] input_comp_data;

    reg input_comp_w_en;

    genvar i;
    for(i = 0; i < WINDOW_SIZE; i++) begin
        assign input_compares_wire[i] = ((data_i == shift_reg[(WORD_SIZE-1)+(i*WORD_SIZE) : i*WORD_SIZE]) && seq_init_timer[i]) ? 1'b1 : 1'b0;
    end

    reg [WORD_SIZE-1:0] comp_counter_data;
    reg [WINDOW_SIZE-1:0] comp_counter_and;
    reg comp_counter_or;

    //stage 2 vars
    wire [WINDOW_SIZE-1:0] seq_init_output;
    assign seq_init_output = input_compares;

    reg [WINDOW_SIZE-1:0] seq_init_timer = '0;


    reg comp_counter_w_en;

    wire [WINDOW_SIZE-1:0] and_input_one;
    wire [WINDOW_SIZE-1:0] and_output;
    wire or_output;

    wire enable_counter_selection;
    assign and_input_one = enable_counter_selection ? comp_counter_and : seq_init_output;
    assign or_output = | and_output;

    for(i = 0; i < WINDOW_SIZE; i++) begin
      assign and_output[i] = input_compares[i] & and_input_one[i];
    end

    //stage 3 vars
    integer c;
    reg [WORD_SIZE-1:0] counter_output_data;
    reg counter_output_w_en;

    reg [$clog2(WINDOW_SIZE)-1:0] counter_output_offset;
    reg [MAX_LENGTH_BITS-1:0] length_counter = '0;

    wire less_than_max_length;
    wire greater_than_one;

    assign enable_counter_selection = comp_counter_or & less_than_max_length;

    wire counter_rst;
    assign counter_rst = ~enable_counter_selection;

    wire valid_enable;
    assign valid_enable = ~enable_counter_selection;
    reg o_ready_stay_on_flag;



    //pipeline stage 1
    always @(posedge clk) begin
      if (!rst_n) begin
        shift_reg <= '0;
        input_compares <= '0;
        input_compares <= '0;
        seq_init_timer <= '0;
      end else begin
        if(w_en) begin
            shift_reg <= {shift_reg[((WORD_SIZE * WINDOW_SIZE)-1)-WORD_SIZE:0], data_i};
            input_comp_data <= data_i;
            input_compares <= input_compares_wire;
            input_comp_w_en <= 1'b1;

            seq_init_timer <= {seq_init_timer[WINDOW_SIZE-2:0], 1'b1};

        end else begin
            shift_reg <= shift_reg;
            input_comp_w_en <= 1'b0;
        end
      end
    end



    //pipeline stage 2
    always @(posedge clk ) begin
      if(input_comp_w_en) begin
        comp_counter_and <= and_output;
        comp_counter_or <= or_output;
        comp_counter_data <= input_comp_data;
        comp_counter_w_en <= 1'b1;

      end else begin
        comp_counter_w_en <= 1'b0;
      end
    end


    //pipeline stage 3
    always @(posedge clk ) begin
      if(comp_counter_w_en) begin
        counter_output_data <= comp_counter_data;
        counter_output_w_en <= 1'b1;

        //BAD?
        for(c = 0; c < WINDOW_SIZE; c++) begin
          if(comp_counter_and[c])
            counter_output_offset <= c;
        end

        if(counter_rst) begin
          length_counter <= '0;
        end

        if(enable_counter_selection) begin
          length_counter <= length_counter + 1;
        end

        if(valid_enable) begin
          o_ready_stay_on_flag <= 1'b1;
        end else begin
          o_ready_stay_on_flag <= 1'b0;
        end

      end else begin
        counter_output_w_en <= 1'b0;
      end
    end


    assign greater_than_one = (length_counter > 1) ? 1'b1 : 1'b0;
    assign less_than_max_length = (length_counter < MAX_LENGTH_VALUE) ? 1'b1 : 1'b0;

    //outputs
    assign o_ready = (valid_enable & counter_output_w_en) | o_ready_stay_on_flag;
    assign data_o[WORD_SIZE] = greater_than_one;
    assign data_o[WORD_SIZE-1:0] = greater_than_one ? {counter_output_offset, length_counter} : counter_output_data;
    
    
endmodule