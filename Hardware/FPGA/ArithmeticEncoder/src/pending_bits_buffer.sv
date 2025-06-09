module pending_bits_buffer (
    input         clk             ,
    input  [15:0] bits_in         ,
    input  [ 4:0] bits_count_in   ,
    input         bits_valid_in   ,
    input  [ 3:0] pending_in      ,
    input         pending_valid_in,
    output [15:0] bits_out        ,
    output [ 4:0] bits_count_out  ,
    output        bits_valid_out
);

//Praying there isn't 6+ cycles of pending bits to flush in the real world

//Please be LUTRAM please be LUTRAM please be LUTRAM
reg  [15:0] p_mask_lookup [0:15] = {
    16'h0000,
    16'h4000,
    16'h6000,
    16'h7000,
    16'h7800,
    16'h7C00,
    16'h7E00,
    16'h7F00,
    16'h7F80,
    16'h7FC0,
    16'h7FE0,
    16'h7FF0,
    16'h7FF8,
    16'h7FFC,
    16'h7FFE,
    16'h7FFF
};

reg [15:0] b_mask_lookup [0:16] = {
    16'h0000,
    16'h8000,
    16'hC000,
    16'hE000,
    16'hF000,
    16'hF800,
    16'hFC00,
    16'hFE00,
    16'hFF00,
    16'hFF80,
    16'hFFC0,
    16'hFFE0,
    16'hFFF0,
    16'hFFF8,
    16'hFFFC,
    16'hFFFE,
    16'hFFFF
};

//==========================================
// Logic for pushing output bits
//==========================================
reg  [ 7:0] pending_reg = 0;
reg  [15:0] bits_reg = 0;
reg  [ 4:0] count_reg = 0;

//Had to move this here because I had two always statements
reg  [ 7:0] pending_in_reg = 0;
wire        pending_flag = pending_in_reg > 0;
wire        count_flag = bits_count_in != 0;

//Flag for pending bits exceeding what can be put out in a single clock cycle
wire        overflow = pending_reg > 15;

//Capped at outputting 15 bits at a time to try saving a little logic
//Might split this up if it doesn't meet timing
wire [ 3:0] pending_count = overflow ? 4'd15 : pending_reg[3:0];
wire [15:0] pending_mask = p_mask_lookup[pending_count];

wire [15:0] pending_value = bits_reg[15] ? 16'h0000 : 16'hFFFF;
wire [15:0] pending_bits = pending_value & pending_mask;

//Forgot the bit mask for output
wire [15:0] bits_mask = b_mask_lookup[count_reg];

//Values that should be latched to output
wire [15:0] value_1 = {bits_reg[15], pending_bits[14:0]};
wire [15:0] value_2 = {pending_bits, 1'b0};
wire [15:0] value_3 = bits_reg & bits_mask;

//Output and control registers
reg [15:0] data_out_reg  = 0;
reg [15:0] count_out_reg = 0;
reg        valid_out_reg = 0;

reg stage_1 = 0;
reg stage_2 = 0;
reg stage_3 = 0;

wire not_valid = (~stage_1) & (~stage_2) & (~stage_3);

//Maybe I could've just kept the pipeline, but this feels nicer
always @(posedge clk) begin
    //Bit 15 and the first batch of pending
    if(stage_1) begin
        //Assert outputs
        data_out_reg <= value_1;
        count_out_reg <= pending_count + 1;
        valid_out_reg <= 1'b1;

        pending_reg <= pending_reg - pending_count;

        //Only go to stage 2 if there are more pending bits
        if(overflow) begin
            stage_2 <= 1'b1;
        end
        else begin
            //Shift bits left 1 because MSB outputted with pending bits
            bits_reg <= {bits_reg[14:0], 1'b0};
            count_reg <= count_reg - 1;

            stage_3 <= 1'b1;
        end

        stage_1 <= 1'b0;
    end

    //Remaining pending bits
    if(stage_2) begin
        //Assert outputs
        data_out_reg <= value_2;
        count_out_reg <= pending_count;
        valid_out_reg <= 1'b1;

        pending_reg <= pending_reg - pending_count;

        //Only go to stage 3 if all pending bits flushed
        if(~overflow) begin
            bits_reg <= {bits_reg[14:0], 1'b0};
            count_reg <= count_reg - 1;

            stage_3 <= 1'b1;
            stage_2 <= 1'b0;
        end
    end

    //Output the rest of the bits
    if(stage_3) begin
        data_out_reg <= value_3;
        count_out_reg <= count_reg;
        valid_out_reg <= 1'b1;

        stage_3 <= 1'b0;
    end

    //No output cuh
    if(not_valid) begin
        valid_out_reg <= 1'b0;
    end

    //Logic for handling input
    //Moved from separate always block
    if(bits_valid_in) begin
        //Write direct
        bits_reg <= bits_in;
        count_reg <= bits_count_in;

        //Queue up current pending bit count
        pending_reg <= pending_in_reg;
        if(count_flag) begin
            pending_in_reg <= 8'd0;
        end

        //Jump to pending bits stage unless there are none
        if(pending_flag && count_flag) begin
            stage_1 <= 1'b1;
        end
        else begin
            stage_3 <= 1'b1;
        end
    end

    if(pending_valid_in) begin
        pending_in_reg <= pending_in_reg + {4'd0, pending_in};
    end
end

//Assign outputs
assign bits_out = data_out_reg;
assign bits_count_out = count_out_reg;
assign bits_valid_out = valid_out_reg;

endmodule