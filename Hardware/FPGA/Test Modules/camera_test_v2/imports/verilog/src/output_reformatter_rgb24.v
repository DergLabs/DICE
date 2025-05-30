`timescale 1ns/1ns

/*
MIPI CSI RX to Parallel Bridge (c) by Gaurav Singh www.CircuitValley.com

MIPI CSI RX to Parallel Bridge is licensed under a
Creative Commons Attribution 3.0 Unported License.

You should have received a copy of the license along with this
work.  If not, see <http://creativecommons.org/licenses/by/3.0/>.
*/

/*
Takes 32bit 2pixel to 128bit 8pixel yuv input from rgb2yuv module @ mipi byte clock outputs 32bit 2pixel yuv output @output_clk_i , 
output_clk_i can be totoally independnt phease and frequency of mipi_byte_clock, but frequnecy be fast enough to have full line transmitted before next line comes.
This implementation of Output reformatter outputs data which which meant to send out of the system to a 32bit receiver
depending on requirement this will be need to be adapted as per the receiver 
*/

module  output_reformatter #(parameter PIXEL_WIDTH=14 , parameter PIXEL_PER_CLK=8 )(
						  clk_i, //data changes on negedge 
						  //output_clk_i, //output clock
						  pixel_clk_slow_i,
						  pixel_clk_fast_i,
						  data_i,
						  data_in_valid_i, //expected active high
						  line_sync_i, //expected active high
						  frame_sync_i,  //expected active low
						  output_o,
						  output_valid_o //active high
						  );

localparam INPUT_WIDTH = PIXEL_WIDTH * PIXEL_PER_CLK * 3; 

input line_sync_i;
input frame_sync_i;
input clk_i;
input data_in_valid_i; 
input pixel_clk_slow_i;
input pixel_clk_fast_i;


input [(INPUT_WIDTH - 1 ):0]data_i;
output reg output_valid_o;
output reg [23:0]output_o;
//input output_clk_i;

reg [11:0] write_address;
reg [11:0] read_address;


wire [119:0] ram_even_o;
wire [119:0] ram_odd_o;
wire [119:0] pixel_reg_1x;
reg [119:0] pixel_reg_x;


reg [10:0] input_pixel_count_clk_i; //under clk_i domain
reg [10:0] input_pixel_count_meta1;
reg [10:0] input_pixel_count_meta2;
reg [10:0] input_pixel_count_out_clk;

reg line_even_nodd_clk_i;				//select between two different RAM
reg line_even_nodd_meta1;
reg line_even_nodd_meta2;
reg line_even_nodd_meta3;
reg line_even_nodd_meta4;
reg line_even_nodd_out_clk; 

reg last_line_sync;				//helps to determine edge of line sync for write address reset
reg last_line_even_nodd;		//helps to determine edge of line sync for read address reset

//ebr ram_dp write address and data is latched on same rising edge of write clock
//read address is latached on rising edge of read clock and data outputed on same rising edge but after tCO_EBR so should be sampled on comming fallsing or next rising edge

// Convert input data to 24bit


/*full_dp_mem #(INPUT_WIDTH, 12) odd_line (
	.clka_i(clk_i),            // input wire clka
	.rsta_i(frame_sync_i),            // input wire rsta
	.ena_i(data_in_valid_i),              // input wire ena
	.wea_i(!line_even_nodd_clk_i),              // input wire [0 : 0] wea
	.addra_i(write_address),          // input wire [10 : 0] addra
	.dina_i(data_i),            // input wire [39 : 0] dina
	.douta_o(),          // output wire [39 : 0] douta

	.clkb_i(pixel_clk_slow_i),            // input wire clkb
	.rstb_i(frame_sync_i),            // input wire rstb
	.enb_i(line_even_nodd_out_clk),              // input wire enb
	.web_i(1'b0),              // input wire [0 : 0] web
	.addrb_i(read_address),          // input wire [10 : 0] addrb
	.dinb_i(),            // input wire [39 : 0] dinb
	.doutb_o(ram_odd_o)          // output wire [39 : 0] doutb
);

full_dp_mem #(INPUT_WIDTH, 12) even_line (
	.clka_i(clk_i),            // input wire clka
	.rsta_i(frame_sync_i),            // input wire rsta
	.ena_i(data_in_valid_i),              // input wire ena
	.wea_i(line_even_nodd_clk_i),              // input wire [0 : 0] wea
	.addra_i(write_address),          // input wire [10 : 0] addra
	.dina_i(data_i),            // input wire [39 : 0] dina
	.douta_o(),          // output wire [39 : 0] douta

	.clkb_i(pixel_clk_slow_i),            // input wire clkb
	.rstb_i(frame_sync_i),            // input wire rstb
	.enb_i(!line_even_nodd_out_clk),              // input wire enb
	.web_i(1'b0),              // input wire [0 : 0] web
	.addrb_i(read_address),          // input wire [10 : 0] addrb
	.dinb_i(),            // input wire [39 : 0] dinb
	.doutb_o(ram_even_o)          // output wire [39 : 0] doutb
);*/


blk_mem_gen_1 odd_line (
  .clka(clk_i),            // input wire clka
  .rsta(frame_sync_i),            // input wire rsta
  .ena(data_in_valid_i),              // input wire ena
  .wea(!line_even_nodd_clk_i),              // input wire [0 : 0] wea
  .addra(write_address),          // input wire [10 : 0] addra
  .dina(data_i),            // input wire [119 : 0] dina
  .douta(),          // output wire [119 : 0] douta

  .clkb(pixel_clk_slow_i),            // input wire clkb
  .rstb(frame_sync_i),            // input wire rstb
  .enb(line_even_nodd_out_clk),              // input wire enb
  .web(1'b0),              // input wire [0 : 0] web
  .addrb(read_address),          // input wire [10 : 0] addrb
  .dinb(0),            // input wire [119 : 0] dinb
  .doutb(ram_odd_o),          // output wire [119 : 0] doutb
  .rsta_busy(),  // output wire rsta_busy
  .rstb_busy()  // output wire rstb_busy
);

blk_mem_gen_1 even_line (
  .clka(clk_i),            // input wire clka
  .rsta(frame_sync_i),            // input wire rsta
  .ena(data_in_valid_i),              // input wire ena
  .wea(line_even_nodd_clk_i),              // input wire [0 : 0] wea
  .addra(write_address),          // input wire [10 : 0] addra
  .dina(data_i),            // input wire [119 : 0] dina
  .douta(),          // output wire [119 : 0] douta

  .clkb(pixel_clk_slow_i),            // input wire clkb
  .rstb(frame_sync_i),            // input wire rstb
  .enb(!line_even_nodd_out_clk),              // input wire enb
  .web(1'b0),              // input wire [0 : 0] web
  .addrb(read_address),          // input wire [10 : 0] addrb
  .dinb(0),            // input wire [119 : 0] dinb
  .doutb(ram_even_o),          // output wire [119 : 0] doutb
  .rsta_busy(),  // output wire rsta_busy
  .rstb_busy()  // output wire rstb_busy
);


//assign output_o = line_even_nodd? ram_odd_o[((read_address[0])?6'd32:6'd0) +:32]: ram_even_o[((read_address[0])?6'd32:6'd0) +:32]; //depeding on line select even or odd ram , also select correct 32bit word from 64 bit ramoutput

assign pixel_reg_1x = line_even_nodd_out_clk? ram_odd_o:ram_even_o; //depeding on line select even or odd ram 


always @(posedge clk_i or posedge frame_sync_i)
begin
	if (frame_sync_i)
	begin
		line_even_nodd_clk_i <= 0;
		last_line_sync <= 0;
		input_pixel_count_clk_i <= 0;
		write_address <= 0;
	end
	else
	begin
		last_line_sync <= line_sync_i;
		
		if (!last_line_sync && line_sync_i) // on rising edge of line_sync_i
		begin
			write_address <= 9'b0;
			
			input_pixel_count_clk_i <= write_address << (PIXEL_PER_CLK >> 2) ; //x4 or x2 or also x1 write_address as each write_address has 128 bit or 64 bit or 32 bit while output width is 32bit
			line_even_nodd_clk_i <= !line_even_nodd_clk_i;
		end
		else
		begin
			write_address <= write_address + data_in_valid_i; 
		end
	end
end


always @(posedge pixel_clk_slow_i)
begin
		line_even_nodd_meta1 <= line_even_nodd_clk_i;		//This is Sync signal need to have more flip-flops to get more delay to make sure sync always arrive after pixel count is already setlled
		line_even_nodd_meta2 <= line_even_nodd_meta1;
		line_even_nodd_meta3 <= line_even_nodd_meta2;
		line_even_nodd_meta4 <= line_even_nodd_meta3;
		line_even_nodd_out_clk <= line_even_nodd_meta4;
		
		
		input_pixel_count_meta1 <= input_pixel_count_clk_i;
		input_pixel_count_meta2 <= input_pixel_count_meta1;

		last_line_even_nodd <= line_even_nodd_out_clk;

		
		if (last_line_even_nodd != line_even_nodd_out_clk)	//reset read address for each new line
		begin
			 read_address <= 12'b0;
			 output_valid_o <= 1'b0;
			 input_pixel_count_out_clk <= input_pixel_count_meta2;
		end
		else
			begin
			if (read_address < input_pixel_count_out_clk)
			begin
				read_address <= read_address + 1'b1;
				output_valid_o <= 1'b1;
			end
			else
			begin
				output_valid_o <= 1'b0;
			end 
		end
end

always @ (posedge pixel_clk_slow_i) begin
	pixel_reg_x <= pixel_reg_1x;
end

reg [1:0] pixel_select;
always @ (posedge pixel_clk_fast_i) begin
	pixel_select <= pixel_select + 1'b1;
end

// Wire arrays to make pixel handling clearer
wire [29:0] pixel_array [3:0];
assign pixel_array[0] = pixel_reg_x[29:0];    // First pixel
assign pixel_array[1] = pixel_reg_x[59:30];   // Second pixel
assign pixel_array[2] = pixel_reg_x[89:60];   // Third pixel
assign pixel_array[3] = pixel_reg_x[119:90];  // Fourth pixel

// Selected 30-bit pixel
wire [29:0] selected_pixel;
assign selected_pixel = pixel_array[pixel_select];

// Saturating conversion logic for each color component
wire [7:0] red, green, blue;

// Red (bits 29:20)
assign red = (&selected_pixel[29:24]) ? 
				8'hFF : 
				selected_pixel[29:22] + selected_pixel[21];

// Green (bits 19:10)
assign green = (&selected_pixel[19:14]) ? 
				8'hFF : 
				selected_pixel[19:12] + selected_pixel[11];

// Blue (bits 9:0)
assign blue = (&selected_pixel[9:4]) ? 
				8'hFF : 
				selected_pixel[9:2] + selected_pixel[1];

always @ (posedge pixel_clk_fast_i) begin
	output_o <= {red, green, blue};
end


endmodule