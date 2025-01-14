

module top (
    input sysclk_p,
    input sysclk_n,
    input rst_n,

    output [3:0] LED,

    //HyperRam connections
    output CS,
    output HyperRam_rst_n,
    output CK,
    output CK_n,
    input [1:0] RWDS_port,
    inout [15:0] DQ

); // top

    wire clk;
    wire clk_delay;
    wire enable;

    wire [31:0] recieved_data;

    //tri-state buffer
    wire [15:0] o_DQ, i_DQ;
    wire        DQ_tx_en;

    assign DQ = DQ_tx_en ? o_DQ : 16'hzzzz;
    assign i_DQ = DQ;


    clk_wiz_0 clk_wiz (
        // Clock out ports
        .clk_out1(clk),     // output clk_out1
        .clk_out2(clk_delay),     // output clk_out2
        // Status and control signals
        .resetn(rst_n), // input resetn
    // Clock in ports
        .clk_in1_p(sysclk_p),    // input clk_in1_p
        .clk_in1_n(sysclk_n)    // input clk_in1_n
    );

    HyperRam_Register_Read HyperRam_Main_Module(
        .clk(clk),
        .clk_delay(clk_delay),
        .rst_n(rst_n),
        .enable(enable),
        .CS(CS),
        .HyperRam_rst_n(HyperRam_rst_n),
        .CK(CK),
        .CK_n(CK_n),
        .RWDS_i(RWDS_port),
        .i_DQ(i_DQ),
        .o_DQ(o_DQ),
        .DQ_tx_en(DQ_tx_en),
        .recieved_data(recieved_data)

    );

    vio_0 virtual_io_0 (
        .clk(clk),                // input wire clk
        .probe_in0(recieved_data),    // input wire [31 : 0] probe_in0
        .probe_out0(enable)  // output wire [0 : 0] probe_out0
    );

    reg [3:0] LED_out;
    assign LED = LED_out;

    always @ (posedge clk) begin
        LED_out <= recieved_data[3:0];
    end



endmodule
