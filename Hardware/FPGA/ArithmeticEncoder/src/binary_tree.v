//Skibidi rizz ohio gyatt

(* keep_hierarchy = "true" *)
module binary_tree (
    input         clk            ,
    input         rst            ,
    output        rst_done       ,
    input  [ 7:0] symbol_in      ,
    input         valid_in       ,
    output [15:0] lower_bound_out,
    output [15:0] upper_bound_out,
    output [15:0] range_out      ,
    output [ 7:0] symbol_out     ,
    output        valid_out
);

//TODO: Figure out a nice way of doing this with BRAM (impossible challenge).
//      This is difficult because of the read/write delay, especially given 
//      it is 2 cycles per read/write for dual port BRAM...

//Praying the Vivado synthesis gods have mercy on my soul for heavy use of LUTRAM
//(1kB per tree) + (all the pipeline registers)

//=========================================================
// Binary tree pipeline registers
//=========================================================
//Binary tree layers for storing the left_count and freq_count of each node
reg [31:0] level_1;
reg [31:0] level_2 [  1:0];
reg [31:0] level_3 [  3:0];
reg [31:0] level_4 [  7:0];
reg [31:0] level_5 [ 15:0];
reg [31:0] level_6 [ 31:0];
reg [31:0] level_7 [ 63:0];
reg [31:0] level_8 [127:0];
reg [31:0] level_9;

//Midpoint pipeline registers
reg [7:0] midpoint_1 = 128;
reg [7:0] midpoint_2 = 0;
reg [7:0] midpoint_3 = 0;
reg [7:0] midpoint_4 = 0;
reg [7:0] midpoint_5 = 0;
reg [7:0] midpoint_6 = 0;
reg [7:0] midpoint_7 = 0;
reg [7:0] midpoint_8 = 0;
reg [7:0] midpoint_9 = 0;

//Left bound pipeline registers
reg [15:0] left_bound_1 = 0;
reg [15:0] left_bound_2 = 0;
reg [15:0] left_bound_3 = 0;
reg [15:0] left_bound_4 = 0;
reg [15:0] left_bound_5 = 0;
reg [15:0] left_bound_6 = 0;
reg [15:0] left_bound_7 = 0;
reg [15:0] left_bound_8 = 0;
reg [15:0] left_bound_9 = 0;

//Symbol pipeline registers
reg [7:0] symbol_1 = 0;
reg [7:0] symbol_2 = 0;
reg [7:0] symbol_3 = 0;
reg [7:0] symbol_4 = 0;
reg [7:0] symbol_5 = 0;
reg [7:0] symbol_6 = 0;
reg [7:0] symbol_7 = 0;
reg [7:0] symbol_8 = 0;
reg [7:0] symbol_9 = 0;

reg [7:0] symbol_10 = 0;

reg symbol_valid_1 = 0;
reg symbol_valid_2 = 0;
reg symbol_valid_3 = 0;
reg symbol_valid_4 = 0;
reg symbol_valid_5 = 0;
reg symbol_valid_6 = 0;
reg symbol_valid_7 = 0;
reg symbol_valid_8 = 0;
reg symbol_valid_9 = 0;

//=========================================================
// Indexing into each level of the tree
//=========================================================
//Indexing into each layer of the tree
wire [0:0] index_2 = midpoint_2[7:7];
wire [1:0] index_3 = midpoint_3[7:6];
wire [2:0] index_4 = midpoint_4[7:5];
wire [3:0] index_5 = midpoint_5[7:4];
wire [4:0] index_6 = midpoint_6[7:3];
wire [5:0] index_7 = midpoint_7[7:2];
wire [6:0] index_8 = midpoint_8[7:1];

//=========================================================
// Current node values at each level of the tree
//=========================================================
//Nodes from each layer lookup
wire [31:0] node_1 = level_1;
wire [31:0] node_2 = level_2[index_2];
wire [31:0] node_3 = level_3[index_3];
wire [31:0] node_4 = level_4[index_4];
wire [31:0] node_5 = level_5[index_5];
wire [31:0] node_6 = level_6[index_6];
wire [31:0] node_7 = level_7[index_7];
wire [31:0] node_8 = level_8[index_8];
wire [31:0] node_9 = level_9;

//Left count values from each layer lookup
wire [15:0] left_count_1 = node_1[31:16];
wire [15:0] left_count_2 = node_2[31:16];
wire [15:0] left_count_3 = node_3[31:16];
wire [15:0] left_count_4 = node_4[31:16];
wire [15:0] left_count_5 = node_5[31:16];
wire [15:0] left_count_6 = node_6[31:16];
wire [15:0] left_count_7 = node_7[31:16];
wire [15:0] left_count_8 = node_8[31:16];
wire [15:0] left_count_9 = node_9[31:16];

//Freq count values from each layer lookup
wire [15:0] freq_count_1 = node_1[15:0];
wire [15:0] freq_count_2 = node_2[15:0];
wire [15:0] freq_count_3 = node_3[15:0];
wire [15:0] freq_count_4 = node_4[15:0];
wire [15:0] freq_count_5 = node_5[15:0];
wire [15:0] freq_count_6 = node_6[15:0];
wire [15:0] freq_count_7 = node_7[15:0];
wire [15:0] freq_count_8 = node_8[15:0];
wire [15:0] freq_count_9 = node_9[15:0];

//=========================================================
// Condition flags for each level of tree
//=========================================================
wire less_1 = symbol_1 < midpoint_1;
wire less_2 = symbol_2 < midpoint_2;
wire less_3 = symbol_3 < midpoint_3;
wire less_4 = symbol_4 < midpoint_4;
wire less_5 = symbol_5 < midpoint_5;
wire less_6 = symbol_6 < midpoint_6;
wire less_7 = symbol_7 < midpoint_7;
wire less_8 = symbol_8 < midpoint_8;

wire greater_1 = symbol_1 > midpoint_1;
wire greater_2 = symbol_2 > midpoint_2;
wire greater_3 = symbol_3 > midpoint_3;
wire greater_4 = symbol_4 > midpoint_4;
wire greater_5 = symbol_5 > midpoint_5;
wire greater_6 = symbol_6 > midpoint_6;
wire greater_7 = symbol_7 > midpoint_7;
wire greater_8 = symbol_8 > midpoint_8;

wire equal_1 = symbol_1 == midpoint_1;
wire equal_2 = symbol_2 == midpoint_2;
wire equal_3 = symbol_3 == midpoint_3;
wire equal_4 = symbol_4 == midpoint_4;
wire equal_5 = symbol_5 == midpoint_5;
wire equal_6 = symbol_6 == midpoint_6;
wire equal_7 = symbol_7 == midpoint_7;
wire equal_8 = symbol_8 == midpoint_8;
wire equal_9 = symbol_9 == midpoint_9;

//=========================================================
// New node values based on conditions
//=========================================================
//New left_count values if we have to step left of the current node
wire [15:0] new_left_count_1 = less_1 ? (left_count_1 + 1) : left_count_1;
wire [15:0] new_left_count_2 = less_2 ? (left_count_2 + 1) : left_count_2;
wire [15:0] new_left_count_3 = less_3 ? (left_count_3 + 1) : left_count_3;
wire [15:0] new_left_count_4 = less_4 ? (left_count_4 + 1) : left_count_4;
wire [15:0] new_left_count_5 = less_5 ? (left_count_5 + 1) : left_count_5;
wire [15:0] new_left_count_6 = less_6 ? (left_count_6 + 1) : left_count_6;
wire [15:0] new_left_count_7 = less_7 ? (left_count_7 + 1) : left_count_7;
wire [15:0] new_left_count_8 = less_8 ? (left_count_8 + 1) : left_count_8;

//New count values if node is a match for the symbol
wire [15:0] new_freq_count_1 = equal_1 ? (freq_count_1 + 1) : freq_count_1;
wire [15:0] new_freq_count_2 = equal_2 ? (freq_count_2 + 1) : freq_count_2;
wire [15:0] new_freq_count_3 = equal_3 ? (freq_count_3 + 1) : freq_count_3;
wire [15:0] new_freq_count_4 = equal_4 ? (freq_count_4 + 1) : freq_count_4;
wire [15:0] new_freq_count_5 = equal_5 ? (freq_count_5 + 1) : freq_count_5;
wire [15:0] new_freq_count_6 = equal_6 ? (freq_count_6 + 1) : freq_count_6;
wire [15:0] new_freq_count_7 = equal_7 ? (freq_count_7 + 1) : freq_count_7;
wire [15:0] new_freq_count_8 = equal_8 ? (freq_count_8 + 1) : freq_count_8;
wire [15:0] new_freq_count_9 = equal_9 ? (freq_count_9 + 1) : freq_count_9;

//Inshallah this meets timing
wire [31:0] new_node_1 = {new_left_count_1, new_freq_count_1};
wire [31:0] new_node_2 = {new_left_count_2, new_freq_count_2};
wire [31:0] new_node_3 = {new_left_count_3, new_freq_count_3};
wire [31:0] new_node_4 = {new_left_count_4, new_freq_count_4};
wire [31:0] new_node_5 = {new_left_count_5, new_freq_count_5};
wire [31:0] new_node_6 = {new_left_count_6, new_freq_count_6};
wire [31:0] new_node_7 = {new_left_count_7, new_freq_count_7};
wire [31:0] new_node_8 = {new_left_count_8, new_freq_count_8};
wire [31:0] new_node_9 = {           16'd0, new_freq_count_9};

//Condition for writing back new node values
wire write_node_1 = (equal_1 | less_1) & symbol_valid_1;
wire write_node_2 = (equal_2 | less_2) & symbol_valid_2;
wire write_node_3 = (equal_3 | less_3) & symbol_valid_3;
wire write_node_4 = (equal_4 | less_4) & symbol_valid_4;
wire write_node_5 = (equal_5 | less_5) & symbol_valid_5;
wire write_node_6 = (equal_6 | less_6) & symbol_valid_6;
wire write_node_7 = (equal_7 | less_7) & symbol_valid_7;
wire write_node_8 = (equal_8 | less_8) & symbol_valid_8;
wire write_node_9 = (equal_9         ) & symbol_valid_9;

//=========================================================
// Left bound values as tree is traversed
//=========================================================
//New left bounds
wire [15:0] new_left_bound_2 = greater_1 ? (left_bound_1 + left_count_1 + freq_count_1) : left_bound_1;
wire [15:0] new_left_bound_3 = greater_2 ? (left_bound_2 + left_count_2 + freq_count_2) : left_bound_2;
wire [15:0] new_left_bound_4 = greater_3 ? (left_bound_3 + left_count_3 + freq_count_3) : left_bound_3;
wire [15:0] new_left_bound_5 = greater_4 ? (left_bound_4 + left_count_4 + freq_count_4) : left_bound_4;
wire [15:0] new_left_bound_6 = greater_5 ? (left_bound_5 + left_count_5 + freq_count_5) : left_bound_5;
wire [15:0] new_left_bound_7 = greater_6 ? (left_bound_6 + left_count_6 + freq_count_6) : left_bound_6;
wire [15:0] new_left_bound_8 = greater_7 ? (left_bound_7 + left_count_7 + freq_count_7) : left_bound_7;

//Update midpoints
wire [7:0] new_midpoint_2 = less_1 ? midpoint_1 - 8'd64 : midpoint_1 + 8'd64;
wire [7:0] new_midpoint_3 = less_2 ? midpoint_2 - 8'd32 : midpoint_2 + 8'd32;
wire [7:0] new_midpoint_4 = less_3 ? midpoint_3 - 8'd16 : midpoint_3 + 8'd16;
wire [7:0] new_midpoint_5 = less_4 ? midpoint_4 - 8'd08 : midpoint_4 + 8'd08;
wire [7:0] new_midpoint_6 = less_5 ? midpoint_5 - 8'd04 : midpoint_5 + 8'd04;
wire [7:0] new_midpoint_7 = less_6 ? midpoint_6 - 8'd02 : midpoint_6 + 8'd02;
wire [7:0] new_midpoint_8 = less_7 ? midpoint_7 - 8'd01 : midpoint_7 + 8'd01;

//=========================================================
// Output pipeline registers when symbol's node is found
//=========================================================
//Discovered lower bound pipeline registers (for the output)
reg [15:0] lower_1 = 0;
reg [15:0] lower_2 = 0;
reg [15:0] lower_3 = 0;
reg [15:0] lower_4 = 0;
reg [15:0] lower_5 = 0;
reg [15:0] lower_6 = 0;
reg [15:0] lower_7 = 0;
reg [15:0] lower_8 = 0;
reg [15:0] lower_9 = 0;

reg [15:0] count_1 = 0;
reg [15:0] count_2 = 0;
reg [15:0] count_3 = 0;
reg [15:0] count_4 = 0;
reg [15:0] count_5 = 0;
reg [15:0] count_6 = 0;
reg [15:0] count_7 = 0;
reg [15:0] count_8 = 0;
reg [15:0] count_9 = 0;

reg valid_1 = 0;
reg valid_2 = 0;
reg valid_3 = 0;
reg valid_4 = 0;
reg valid_5 = 0;
reg valid_6 = 0;
reg valid_7 = 0;
reg valid_8 = 0;
reg valid_9 = 0;

reg [15:0] range_counter = 0;

//=========================================================
// Output pipeline comb logic
//=========================================================
wire [15:0] new_lower_1 = equal_1 ? (left_bound_1 + left_count_1) : 15'd0;
wire [15:0] new_lower_2 = equal_2 ? (left_bound_2 + left_count_2) : lower_1;
wire [15:0] new_lower_3 = equal_3 ? (left_bound_3 + left_count_3) : lower_2;
wire [15:0] new_lower_4 = equal_4 ? (left_bound_4 + left_count_4) : lower_3;
wire [15:0] new_lower_5 = equal_5 ? (left_bound_5 + left_count_5) : lower_4;
wire [15:0] new_lower_6 = equal_6 ? (left_bound_6 + left_count_6) : lower_5;
wire [15:0] new_lower_7 = equal_7 ? (left_bound_7 + left_count_7) : lower_6;
wire [15:0] new_lower_8 = equal_8 ? (left_bound_8 + left_count_8) : lower_7;
wire [15:0] new_lower_9 = equal_9 ? (left_bound_9 + left_count_9) : lower_8;

wire [15:0] new_count_1 = equal_1 ? freq_count_1 : 15'd0;
wire [15:0] new_count_2 = equal_2 ? freq_count_2 : count_1;
wire [15:0] new_count_3 = equal_3 ? freq_count_3 : count_2;
wire [15:0] new_count_4 = equal_4 ? freq_count_4 : count_3;
wire [15:0] new_count_5 = equal_5 ? freq_count_5 : count_4;
wire [15:0] new_count_6 = equal_6 ? freq_count_6 : count_5;
wire [15:0] new_count_7 = equal_7 ? freq_count_7 : count_6;
wire [15:0] new_count_8 = equal_8 ? freq_count_8 : count_7;
wire [15:0] new_count_9 = equal_9 ? freq_count_9 : count_8;

wire new_valid_1 = (equal_1 & symbol_valid_1)          ;
wire new_valid_2 = (equal_2 & symbol_valid_2) | valid_1;
wire new_valid_3 = (equal_3 & symbol_valid_3) | valid_2;
wire new_valid_4 = (equal_4 & symbol_valid_4) | valid_3;
wire new_valid_5 = (equal_5 & symbol_valid_5) | valid_4;
wire new_valid_6 = (equal_6 & symbol_valid_6) | valid_5;
wire new_valid_7 = (equal_7 & symbol_valid_7) | valid_6;
wire new_valid_8 = (equal_8 & symbol_valid_8) | valid_7;
wire new_valid_9 = (equal_9 & symbol_valid_9) | valid_8;

//=========================================================
// Final output calculation stuff
//=========================================================
//Final output
reg [15:0] lower_bound_reg = 0;
reg [15:0] upper_bound_reg = 0;
reg [15:0] range_reg       = 0;
reg        valid_reg       = 0;
reg [ 7:0] symbol_ca_reg   = 0;

//=========================================================
// Initialize table
//=========================================================
integer i;
initial begin
    level_1 = 0;
    for(i = 0; i <   2; i = i + 1) level_2[i] = 0;
    for(i = 0; i <   4; i = i + 1) level_3[i] = 0;
    for(i = 0; i <   8; i = i + 1) level_4[i] = 0;
    for(i = 0; i <  16; i = i + 1) level_5[i] = 0;
    for(i = 0; i <  32; i = i + 1) level_6[i] = 0;
    for(i = 0; i <  64; i = i + 1) level_7[i] = 0;
    for(i = 0; i < 128; i = i + 1) level_8[i] = 0;
    level_9 = 0;
end

//=========================================================
// Reset table signals
//=========================================================
reg [7:0] rst_index = 0;
reg       rst_done_reg = 0;

assign rst_done = rst_done_reg;

//=========================================================
// Layer updates
//=========================================================
always @(posedge clk) begin
    if(rst) begin
        //Table reset logic
        level_1            <= 32'd0;
        level_2[rst_index] <= 32'd0;
        level_3[rst_index] <= 32'd0;
        level_4[rst_index] <= 32'd0;
        level_5[rst_index] <= 32'd0;
        level_6[rst_index] <= 32'd0;
        level_7[rst_index] <= 32'd0;
        level_8[rst_index] <= 32'd0;
        level_9            <= 32'd0;
        
        if(rst_index != 128) begin
            rst_index <= rst_index + 1;
        end
        else begin
            rst_done_reg <= 1'b1;
        end

        //Disable inputs, will propogate throughout pipeline
        symbol_1 <= 8'd0;
        symbol_valid_1 <= 1'b0;

        //Range counter
        range_counter <= 16'd0;
    end
    else begin
        //Write back node values
        //Only update node if the symbol is still being processed
        if(write_node_1) level_1          <= new_node_1;
        if(write_node_2) level_2[index_2] <= new_node_2;
        if(write_node_3) level_3[index_3] <= new_node_3;
        if(write_node_4) level_4[index_4] <= new_node_4;
        if(write_node_5) level_5[index_5] <= new_node_5;
        if(write_node_6) level_6[index_6] <= new_node_6;
        if(write_node_7) level_7[index_7] <= new_node_7;
        if(write_node_8) level_8[index_8] <= new_node_8;
        if(write_node_9) level_9          <= new_node_9;

        //Set reset index to initial value
        rst_index <= 8'd0;
        rst_done_reg <= 1'b0;

        //Symbol input
        symbol_1 <= symbol_in;
        symbol_valid_1 <= valid_in;

        //Range counter
        if(valid_9) begin
            range_counter <= range_counter + 1;
        end
    end

    //Propogate symbol pipeline
    symbol_2 <= symbol_1;
    symbol_3 <= symbol_2;
    symbol_4 <= symbol_3;
    symbol_5 <= symbol_4;
    symbol_6 <= symbol_5;
    symbol_7 <= symbol_6;
    symbol_8 <= symbol_7;
    symbol_9 <= symbol_8;

    symbol_10 <= symbol_9;

    //Propogate symbol valid signal
    symbol_valid_2 <= symbol_valid_1 & ~equal_1;
    symbol_valid_3 <= symbol_valid_2 & ~equal_2;
    symbol_valid_4 <= symbol_valid_3 & ~equal_3;
    symbol_valid_5 <= symbol_valid_4 & ~equal_4;
    symbol_valid_6 <= symbol_valid_5 & ~equal_5;
    symbol_valid_7 <= symbol_valid_6 & ~equal_6;
    symbol_valid_8 <= symbol_valid_7 & ~equal_7;
    symbol_valid_9 <= symbol_valid_8 & ~equal_8;

    //Propogate midpoint pipeline
    midpoint_2 <= new_midpoint_2;
    midpoint_3 <= new_midpoint_3;
    midpoint_4 <= new_midpoint_4;
    midpoint_5 <= new_midpoint_5;
    midpoint_6 <= new_midpoint_6;
    midpoint_7 <= new_midpoint_7;
    midpoint_8 <= new_midpoint_8;

    //Propogate left bound pipeline
    left_bound_2 <= new_left_bound_2;
    left_bound_3 <= new_left_bound_3;
    left_bound_4 <= new_left_bound_4;
    left_bound_5 <= new_left_bound_5;
    left_bound_6 <= new_left_bound_6;
    left_bound_7 <= new_left_bound_7;
    left_bound_8 <= new_left_bound_8;

    //Propogate lower bound and count pipelines
    lower_1 <= new_lower_1;
    lower_2 <= new_lower_2;
    lower_3 <= new_lower_3;
    lower_4 <= new_lower_4;
    lower_5 <= new_lower_5;
    lower_6 <= new_lower_6;
    lower_7 <= new_lower_7;
    lower_8 <= new_lower_8;
    lower_9 <= new_lower_9;

    count_1 <= new_count_1;
    count_2 <= new_count_2;
    count_3 <= new_count_3;
    count_4 <= new_count_4;
    count_5 <= new_count_5;
    count_6 <= new_count_6;
    count_7 <= new_count_7;
    count_8 <= new_count_8;
    count_9 <= new_count_9;

    valid_1 <= new_valid_1;
    valid_2 <= new_valid_2;
    valid_3 <= new_valid_3;
    valid_4 <= new_valid_4;
    valid_5 <= new_valid_5;
    valid_6 <= new_valid_6;
    valid_7 <= new_valid_7;
    valid_8 <= new_valid_8;
    valid_9 <= new_valid_9;

    //Assign output
    lower_bound_reg <= lower_9;
    upper_bound_reg <= lower_9 + count_9;
    range_reg       <= range_counter;
    valid_reg       <= valid_9;
    symbol_ca_reg   <= symbol_10;
end

assign lower_bound_out = lower_bound_reg;
assign upper_bound_out = upper_bound_reg;
assign range_out       = range_reg;
assign valid_out       = valid_reg;
assign symbol_out      = symbol_ca_reg;

endmodule