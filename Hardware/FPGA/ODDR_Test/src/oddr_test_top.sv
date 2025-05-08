module oddr_test_top(
    input wire sysclk_p,
    input wire sysclk_n,

    input wire rst_n


);

    wire clk_100m;
    wire enable;

    //VIO


    clk_wiz_0 clk_wiz_0
    (
        // Clock out ports
        .clk_out1(clk_100m),     // output clk_out1
        // Status and control signals
        .resetn(rst_n), // input resetn
        .locked(),       // output locked
        // Clock in ports
        .clk_in1_p(sysclk_p),    // input clk_in1_p
        .clk_in1_n(sysclk_n)    // input clk_in1_n
    );

    oddr_test_wrapper oddr_test_wrapper(
        .rst_n(rst_n),
        .enable(enable),
        .clk(clk_100m),



    );




endmodule