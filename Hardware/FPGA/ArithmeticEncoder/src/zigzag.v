module zigzag (
    input         clk     ,
    input         rst     ,
    input  [31:0] data_in ,
    output [31:0] data_out
);

reg  [2:0] x_pos = 0;
reg  [2:0] y_pos = 0;
wire [5:0] index;
assign index = {y_pos, x_pos};

reg [5:0] counter = 0;

reg [5:0] mem_addr_1 = 0;
reg [5:0] mem_addr_2 = 0;

reg       mem_rd_1 = 0;
reg       mem_rd_2 = 0;

wire [31:0] mem_dout_1;
wire [31:0] mem_dout_2;
reg         mem_dout = 0;
assign data_out = mem_dout;

reg [31:0] mem_data_in = 0;

localparam RIGHT_UP_1  = 0;
localparam LEFT_DOWN_1 = 1;
localparam RIGHT_UP_2  = 2;
localparam LEFT_DOWN_2 = 3;

reg [1:0] scan_state = RIGHT_UP_1;

reg flip = 0;

always @(posedge clk) begin
    if(rst) begin
        x_pos <= 0;
        y_pos <= 0;
        out_index <= 0;
        scan_state <= RIGHT_UP_1;
        flip <= 0;
        
        mem_addr_1 <= 0;
        mem_addr_2 <= 0;
        mem_rd_1 <= 0;
        mem_rd_2 <= 0;
        mem_data_in <= 0;
        mem_dout <= 0;
    end
    else begin
        //Regular index counter
        counter <= counter + 1;

        //Swap buffers
        if(counter == 6'h3F) begin
            flip <= ~flip;
        end

        //Pipe out output index
        if(flip == 0) begin
            mem_addr_1 <= counter;
            mem_addr_2 <= index;
        end
        else begin
            mem_addr_1 <= index;
            mem_addr_2 <= counter;
        end

        mem_rd_1 <=  flip;
        mem_rd_2 <= ~flip;

        if(mem_rd_1) begin
            mem_dout <= mem_dout_1;
        end
        else begin
            mem_dout <= mem_dout_2;
        end

        //State machine for index
        case(scan_state)
            RIGHT_UP_1: begin
                x_pos <= x_pos + 1;

                if(y_pos != 0) begin
                    y_pos <= y_pos - 1;
                end
                else begin
                    scan_state <= LEFT_DOWN_1;
                end
            end
            LEFT_DOWN_1: begin
                if(y_pos != 3'h7) begin
                    y_pos <= y_pos + 1;
                end
                
                if(x_pos != 0) begin
                    x_pos <= x_pos - 1;
                end
                else begin
                    if(y_pos == 3'h7) begin
                        scan_state <= RIGHT_UP_2;
                        x_pos <= x_pos + 1;
                    end
                    else begin
                        scan_state <= RIGHT_UP_1;
                    end
                end
            end
            RIGHT_UP_2: begin
                if(x_pos == 3'h7 && y_pos == 3'h7) begin
                    x_pos <= 0;
                    y_pos <= 0;
                    scan_state <= RIGHT_UP_1;
                end
                else begin
                    if(x_pos != 3'h7) begin
                        y_pos <= y_pos - 1;
                        x_pos <= x_pos + 1;
                    end
                    else begin
                        scan_state <= LEFT_DOWN_2;
                        y_pos <= y_pos + 1;
                    end
                end
            end
            LEFT_DOWN_2: begin
                if(y_pos != 3'h7) begin
                    y_pos <= y_pos + 1;
                    x_pos <= x_pos - 1;
                end
                else begin
                    scan_state <= RIGHT_UP_2;
                    x_pos <= x_pos + 1;
                end
            end
        endcase
    end
end

zigzag_blk_mem zigzag_blk_mem_inst_1 (
  .clka ( clk        ), // input wire clka
  .ena  ( mem_rd_1   ), // input wire ena
  .wea  (~mem_rd_1   ), // input wire [0 : 0] wea
  .addra( mem_addr_1 ), // input wire [5 : 0] addra
  .dina ( mem_data_in), // input wire [31 : 0] dina
  .douta( mem_dout_1 )  // output wire [31 : 0] douta
);

zigzag_blk_mem zigzag_blk_mem_inst_2 (
  .clka ( clk        ), // input wire clka
  .ena  ( mem_rd_2   ), // input wire ena
  .wea  (~mem_rd_2   ), // input wire [0 : 0] wea
  .addra( mem_addr_2 ), // input wire [5 : 0] addra
  .dina ( mem_data_in), // input wire [31 : 0] dina
  .douta( mem_dout_2 )  // output wire [31 : 0] douta
);

endmodule