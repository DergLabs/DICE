set_property PACKAGE_PIN D19 [get_ports clk_i]
set_property PACKAGE_PIN E22 [get_ports rst_i]

create_clock -period 5.000 -name clk_i -waveform {0.000 2.500} [get_ports clk_i]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk_i_IBUF_BUFG]

set_operating_conditions -board_layers 8to11
set_operating_conditions -board small
set_operating_conditions -heatsink low
set_switching_activity -default_toggle_rate 25.000
set_operating_conditions -voltage {vccint 0.875}
set_operating_conditions -voltage {vccint_io 0.875}
set_operating_conditions -voltage {vccbram 0.875}
