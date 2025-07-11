`timescale 1ns/1ns

module tb_mipi_rx_raw_depacker();
	
		reg clk;
	reg bytes_valid;
	reg  [15:0]bytes_i;
	wire [23:0]bytes_o;
	wire synced;
	reg [2:0]packet_type;
wire reset_g;
wire raw_line_valid;


mipi_csi_rx_raw_depacker_8b2lane_2ppc #(.PIXEL_WIDTH(12)) ins1(	.clk_i(clk),
						.data_valid_i(bytes_valid),
						.data_i(bytes_i),
						.packet_type_i(packet_type),
						.output_valid_o(synced),
						.raw_line_o(raw_line_valid),
						.output_o(bytes_o));

task sendbytes;
	input [16:0]bytes;
	begin
	bytes_i = bytes;
	clk = 1'b0;
	#4
	clk = 1'b1;
	#4;
	end
endtask

initial begin
		clk = 1'b0;
		bytes_valid = 4'h0;
		packet_type = 3;
		#50
		sendbytes(16'h0);
		sendbytes(16'h0);
		sendbytes(16'h0);
		sendbytes(16'h0);
		bytes_valid = 1'h1;
		sendbytes( 16'h0201);
		sendbytes( 16'h0403);
		sendbytes( 16'h0500);
		sendbytes( 16'h0706);
		sendbytes( 16'h0008);
		sendbytes( 16'h0A09);
		sendbytes( 16'h0C0B);
		sendbytes( 16'h0D00);
		sendbytes( 16'h0F0E);
		sendbytes( 16'h0000);
		sendbytes( 16'h0201);
		sendbytes( 16'h0403);
		sendbytes( 16'h0500);
		sendbytes( 16'h0706);
		sendbytes( 16'h0008);
		sendbytes( 16'h0A09);
		sendbytes( 16'h0C0B);
		sendbytes( 16'h0D00);
		sendbytes( 16'h0F0E);
		sendbytes( 16'h0000);
		
		
		bytes_valid = 1'h0;
		sendbytes(16'h0000);
		sendbytes(16'h0000);
		sendbytes(16'h0000);
		sendbytes(16'h0000);
		sendbytes(16'h0000);
		sendbytes(16'h0000);
		sendbytes(16'h0000);
		sendbytes(16'h0000);
		
		
		
		$finish;
end
endmodule