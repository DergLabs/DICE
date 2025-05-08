module oddr_test_sim();

    reg rst_n;
    reg enable;
    reg clk_100m;
    reg module_output;

    always #5   clk_100m = ~clk_100m;
    
    
    oddr_test_wrapper oddr_test_wrapper(
        .rst_n(rst_n),
        .enable(enable),
        .clk(clk_100m),
        .module_output(module_output)



    );

    initial begin
        rst_n <= 1'b0;
        clk_100m <= 1'b0;
        enable <= 1'b0;
        
        #10

        //un reset
        rst_n <= 1'b1;

        #10

        //enable
        enable <= 1'b1;

        #1000

        enable <= 1'b0;
        rst_n <= 1'b1;

    end

endmodule