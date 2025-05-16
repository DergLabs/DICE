module oddr_test_top(
    input wire sysclk_p,
    input wire sysclk_n,

    input wire rst_n,
    inout wire fpga_output,
    output wire oddr2_output,
    output wire straight_clock


);

    wire clk_100m;
    wire enable;

    vio_0 vio_0 (
        .clk(clk_100m),                // input wire clk
        .probe_out0(enable)  // output wire [0 : 0] probe_out0
    );


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
        .module_output(fpga_output),
        .oddr2_output(oddr2_output)

    );

    assign straight_clock = clk_100m;


endmodule