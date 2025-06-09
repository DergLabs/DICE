module stream_buffer (
    input         clk            ,
    input         rst            ,
    input  [15:0] bits_in        ,
    input  [ 4:0] bits_count_in  ,
    input         bits_valid     ,
    input  [ 3:0] pending_bits_in,
    input         pending_valid  ,
    output [15:0] byte_count     ,
    input         read_en        ,
    output [ 7:0] byte_out       ,
    output        valid_out
);

//Current assumption: There are enough cycles to handle pending bits
//If assumption is wrong: Add FIFO and potential stalling signaling

wire [15:0] p_bits_out;
wire [ 4:0] p_bits_count_out;
wire        p_valid_out;

pending_bits_buffer pending_bits_buffer_inst (
    .clk             (clk             ),
    .bits_in         (bits_in         ),
    .bits_count_in   (bits_count_in   ),
    .bits_valid_in   (bits_valid      ),
    .pending_in      (pending_bits_in ),
    .pending_valid_in(pending_valid   ),
    .bits_out        (p_bits_out      ),
    .bits_count_out  (p_bits_count_out),
    .bits_valid_out  (p_valid_out     )
);

wire [15:0] s_data_out;
wire        s_valid_out;

shift_buffer shift_buffer_inst (
    .clk      (clk             ),
    .data_in  (p_bits_out      ),
    .count_in (p_bits_count_out),
    .valid_in (p_valid_out     ),
    .data_out (s_data_out      ),
    .valid_out(s_valid_out     )
);

//State machine for reading/writing buffer BRAM
reg  [10:0] wr_index = 0;
reg  [10:0] rd_index = 0;
reg  [10:0] bf_index = 0;

reg  [ 7:0] byte_out_reg = 0;
reg  [ 7:0] byte_buff_reg = 0;

reg         rd_toggle = 1;
wire        bram_rd_en = read_en & rd_toggle;
wire        bram_rd_valid;
wire [15:0] bram_rd_data;

//Switch to outputting zeros when end of stream has been reached
wire [15:0] rd_data = (bf_index != wr_index) ? bram_rd_data : 16'd0;

reg  [ 1:0] pipe_read_en = 0;
reg         out_toggle = 1;

//Switch between high and low byte
//High byte should be first out since stream bit order is reversed
//wire [ 7:0] read_byte = bram_rd_valid ? read_buffer[ 7:0] : read_buffer[15:8];

always @(posedge clk) begin
    if(rst) begin
        wr_index <= 0;
        rd_index <= 0;
        bf_index <= 0;
    end
    else begin
        if(s_valid_out) begin
            wr_index <= wr_index + 1;
        end

        //Read every other cycle read_en is high
        if(read_en) begin
            rd_toggle <= ~rd_toggle;
        end

        //Only increment up to write index
        if(bram_rd_en && (rd_index != wr_index)) begin
            rd_index <= rd_index + 1;
        end

        if(pipe_read_en[0]) begin
            if(out_toggle) begin
                byte_out_reg <= rd_data[15:8];
                byte_buff_reg <= rd_data[ 7:0];
            end
            else begin
                byte_out_reg <= byte_buff_reg;
                bf_index <= bf_index + 1;
            end
            out_toggle <= ~out_toggle;
        end

        pipe_read_en[0] <= read_en;
        pipe_read_en[1:1] <= pipe_read_en[0:0];
    end
end

assign byte_out = byte_out_reg;
assign valid_out = pipe_read_en[1];
assign byte_count = {4'd0, wr_index, 1'd0};

bram_stream_buffer_wrap bram_wrap_inst (
    .clk         (clk          ),
    .wr_addr_in  (wr_index     ),
    .wr_data_in  (s_data_out   ),
    .wr_enable_in(s_valid_out  ),
    .rd_addr_in  (rd_index     ),
    .rd_enable_in(bram_rd_en   ),
    .rd_data_out (bram_rd_data ),
    .rd_valid_out(bram_rd_valid)
);

endmodule