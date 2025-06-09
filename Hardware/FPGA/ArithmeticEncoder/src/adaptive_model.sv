module adaptive_model (
    input         clk            ,
    input         rst            ,
    output        rst_done       ,
    input  [ 7:0] symbol_in      ,
    output [15:0] upper_bound_out,
    output [15:0] lower_bound_out,
    output [15:0] range_out      ,
    input         valid_in       ,
    output        valid_out      ,

    input         read_en        ,
    output [23:0] entry_out      ,
    output        entry_valid_out,
    output [ 8:0] entry_count_out
);

reg  [255:0] seen = 0;

wire [15:0] tree_upper_bound;
wire [15:0] tree_lower_bound;
wire [15:0] tree_range;
wire [ 7:0] tree_symbol;
wire        tree_valid;

//Tree rst_done takes multiple cycles to go high, so just passing it up
binary_tree binary_tree_inst (
    .clk            (clk             ),
    .rst            (rst             ),
    .rst_done       (rsrt_done       ),
    .symbol_in      (symbol_in       ),
    .upper_bound_out(tree_upper_bound),
    .lower_bound_out(tree_lower_bound),
    .range_out      (tree_range      ),
    .symbol_out     (tree_symbol     ),
    .valid_in       (valid_in        ),
    .valid_out      (tree_valid      )
);

//Mux values for bypass tree
wire [15:0] upper_bound_mux = seen[tree_symbol] ? tree_upper_bound : tree_lower_bound + 1;
wire [15:0] lower_bound_mux = tree_lower_bound; //Keeping label, but no need for mux
wire [15:0] range_mux = seen[tree_symbol] ? tree_range : tree_range + 1;

reg  [15:0] upper_bound_reg = 0;
reg  [15:0] lower_bound_reg = 0;
reg  [15:0] range_reg = 0;
reg         valid_reg = 0;

wire new_symbol = ~seen[tree_symbol] & tree_valid;

//Registers for writing to BRAM
reg  [ 8:0] wr_index = 0;
wire [23:0] table_entry = {tree_symbol, tree_range};

always @(posedge clk) begin
    if(rst) begin
        seen <= 256'd0;
        wr_index <= 9'd0;
    end
    else begin
        if(new_symbol) begin
            seen[tree_symbol] <= 1'b1;
            wr_index <= wr_index + 1;
        end
    end

    //Propagate pipeline signals
    upper_bound_reg <= upper_bound_mux;
    lower_bound_reg <= lower_bound_mux;
    range_reg <= range_mux;
    valid_reg <= tree_valid;
end

assign upper_bound_out = upper_bound_reg;
assign lower_bound_out = lower_bound_reg;
assign range_out = range_reg;
assign valid_out = valid_reg;

assign entry_count_out = wr_index;

//Decided to have the model output a byte stream to make arithmetic coder output pipeline simpler
/*
reg  [ 8:0] rd_index = 0;
reg  [ 2:0] rd_toggle = 3'b001;
reg  [23:0] rd_data_buffer = 0;

reg         rd_toggle;
wire        bram_rd_en = rd_toggle[2] & read_en;
wire [23:0] bram_rd_data;
wire        bram_rd_valid;

always @(posedge clk) begin
    if(rst) begin
        rd_toggle <= 3'b001;
        rd_index <= 9'd0;
    end
    else begin
        //Preload first entry to negate latency
        if(new_symbol && wr_index == 0) begin
            rd_data_buffer <= table_entry;
        end
        if(read_en) begin
            if(bram_rd_en) begin
                rd_data_buffer <= bram_rd_data;
                rd_index <= rd_index + 1;
            end
            else begin
                rd_data_buffer[15:0] <= rd_data_buffer[23:8];
            end
            rd_toggle[2:1] <= rd_toggle[1:0];
        end
    end
end
*/

//Changed my mind and decided to have arithmetic coder module handle output strobing
reg [ 8:0] rd_index = 0;

always @(posedge clk) begin
    if(rst) begin
        rd_index <= 9'd0;
    end
    else begin
        if(read_en) begin
            rd_index <= rd_index + 1;
        end
    end
end

bram_bypass_table_wrap bram_bypass_table_wrap_inst (
    .clk         (clk            ),
    .wr_addr_in  (wr_index[7:0]  ),
    .wr_data_in  (table_entry    ),
    .wr_enable_in(new_symbol     ),
    .rd_addr_in  (rd_index[7:0]  ),
    .rd_enable_in(read_en        ),
    .rd_data_out (entry_out      ),
    .rd_valid_out(entry_valid_out)
);

endmodule