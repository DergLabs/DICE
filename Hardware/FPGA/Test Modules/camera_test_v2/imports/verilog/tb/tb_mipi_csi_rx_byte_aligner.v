`timescale 1ns/1ns

module tb_rx_byte_aligner;
	
	reg clk;
	reg reset;
	reg  [15:0]byte_i;
	wire [15:0]byte_o;

GSR 
GSR_INST (
	.GSR_N(1'b1),
	.CLK(1'b0)
);

wire byte_synced;
mipi_csi_rx_byte_aligner byte_inst1(	.clk_i(clk),
									.reset_i(reset),
									.byte_i(byte_i),
									.byte_o(byte_o[15:0]),
									.byte_valid_o(byte_synced));

						
task sendbyte;
	input [15:0]byte;
	begin
	byte_i = byte;
	clk = 1'b1;
	#4
	clk = 1'b0;
	#4;
	end
endtask

initial begin
		clk = 1'b1;
		reset = 1'b1;
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50
		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h2577);  //B8 2B 11 72 16 11 83 11
		sendbyte(16'hCE42);
		sendbyte(16'h2222);
		sendbyte(16'h6222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50
		
		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h2BB8);	//B8 60 10
		sendbyte(16'h442E);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50
	

		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h5770);	//B8 60 10
		sendbyte(16'h4410);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50		

		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'hAEE0);	//B8 60 10
		sendbyte(16'h4400);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50
		
		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h5DC0);	//B8 60 10
		sendbyte(16'h4401);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50

		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'hBB80);	//B8 60 10
		sendbyte(16'h4402);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50
		
		
		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h7700);	//B8 60 10
		sendbyte(16'h4405);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
			sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
				sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2222);
		sendbyte(16'h2230);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		sendbyte(16'h2202);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50
		
		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'hEE00);	//B8 60 10
		sendbyte(16'h440A);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50
		
		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'hDC00);	//B8 60 10
		sendbyte(16'h4415);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50




		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'hB800);	//B8 60 10
		sendbyte(16'h442B);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50
		
		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h7000);	//B8 60 10
		sendbyte(16'h4457);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50


		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'hE000);	//B8 60 10
		sendbyte(16'h44AE);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50
		
		
		
		
		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'hC000);	//B8 60 10
		sendbyte(16'h415D);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50



		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h8000);	//B8 60 10
		sendbyte(16'h42BB);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50
		
		
		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h0000);	//B8 60 10
		sendbyte(16'h4577);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50



		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h0000);	//B8 60 10
		sendbyte(16'h4AEE);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50
		
		
		
		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h0000);	//B8 60 10
		sendbyte(16'h15DC);
		sendbyte(16'h88A9);
		sendbyte(16'h0888);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50
	
		
		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h0000);	//A packet with no sync
		sendbyte(16'h1500);
		sendbyte(16'h88A9);
		sendbyte(16'h0000);
		sendbyte(16'h0800);
		sendbyte(16'h0808);
		reset = 1'h1;
		#5
		clk = 1'b1;
		#4
		clk = 1'b0;
		#4;
		#50
		
		
		reset = 1'b0;
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h00);
		sendbyte(16'h82E0); 	//B8 60 11
		sendbyte(16'h4045);
		sendbyte(16'h45C4);
		sendbyte(16'h0840);
		sendbyte(16'h0817);
		sendbyte(16'h0808);
		reset = 1'h1;	
		
end

endmodule