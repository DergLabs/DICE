module obufds_wrap (
    input  clk  ,
    output clk_p,
    output clk_n
);

OBUFDS #(
   .IOSTANDARD("DEFAULT"), // Specify the output I/O standard
   .SLEW("SLOW")           // Specify the output slew rate
) OBUFDS_inst (
   .O (clk_p), // Diff_p output (connect directly to top-level port)
   .OB(clk_n), // Diff_n output (connect directly to top-level port)
   .I (clk)    // Buffer input
);

endmodule