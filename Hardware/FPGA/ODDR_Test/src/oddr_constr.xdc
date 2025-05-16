set_property PACKAGE_PIN E22 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports fpga_output]
set_property IOSTANDARD LVDS [get_ports sysclk_p]
set_property SLEW FAST [get_ports fpga_output]

set_property PACKAGE_PIN F8 [get_ports fpga_output]
set_property PACKAGE_PIN D19 [get_ports sysclk_p]

set_property IOSTANDARD LVCMOS18 [get_ports oddr2_output]
set_property IOSTANDARD LVCMOS18 [get_ports straight_clock]
set_property SLEW FAST [get_ports straight_clock]
set_property SLEW FAST [get_ports oddr2_output]
set_property PACKAGE_PIN H8 [get_ports oddr2_output]
set_property PACKAGE_PIN F9 [get_ports straight_clock]

