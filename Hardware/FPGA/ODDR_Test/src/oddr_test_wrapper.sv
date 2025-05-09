module oddr_test_wrapper (
    input wire rst_n,
    input wire enable,
    input wire clk,
    inout wire module_output


);

   wire oddr_output;
   reg [1:0] data_counter = 2'b0;


   always @(posedge clk) begin
      if(~rst_n) begin
         data_counter <= 2'b0;
      end else if(enable) begin
         data_counter <= data_counter + 1;
      end

   end


   // ODDRE1: Dedicated Double Data Rate (DDR) Output Register
   //         Kintex UltraScale
   // Xilinx HDL Language Template, version 2023.2

   ODDRE1 #(
      .IS_C_INVERTED(1'b0),      // Optional inversion for C
      .IS_D1_INVERTED(1'b0),     // Unsupported, do not use
      .IS_D2_INVERTED(1'b0),     // Unsupported, do not use
      .SIM_DEVICE("ULTRASCALE_PLUS"), // Set the device version for simulation functionality (ULTRASCALE)
      .SRVAL(1'b0)               // Initializes the ODDRE1 Flip-Flops to the specified value (1'b0, 1'b1)
   )
   ODDRE1_inst (
      .Q(oddr_output),   // 1-bit output: Data output to IOB
      .C(clk),   // 1-bit input: High-speed clock input
      .D1(data_counter[0]), // 1-bit input: Parallel data input 1
      .D2(data_counter[1]), // 1-bit input: Parallel data input 2
      .SR(~rst_n)  // 1-bit input: Active-High Async Reset
   );

   IOBUF IOBUF_inst (
            .O ( O             ), // 1-bit output: Buffer output
            .I ( oddr_output   ), // 1-bit input: Buffer input
            .IO( module_output ), // 1-bit inout: Buffer inout
            .T (~enable        )  // 1-bit input: 3-state enable input
        );

   // End of ODDRE1_inst instantiation

endmodule