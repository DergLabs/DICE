
set_property IOSTANDARD LVDS [get_ports sysclk_p]

set_property PACKAGE_PIN D19 [get_ports sysclk_p]
set_property PACKAGE_PIN C19 [get_ports sysclk_n]
set_property IOSTANDARD LVDS [get_ports sysclk_n]

set_property PACKAGE_PIN E13 [get_ports ftdi_clk_i]
set_property IOSTANDARD LVCMOS18 [get_ports ftdi_clk_i]

#create_clock -period 5.000 -name sysclk -waveform {0.000 2.500} -add [get_ports {sysclk_n sysclk_p}]
create_clock -period 10.000 -name ftdi_clk -waveform {0.000 5.000} -add [get_ports ftdi_clk_i]
set_clock_groups -name fifo_to_sys -asynchronous -group [get_clocks {ftdi_clk sysclk}]
set_clock_groups -name core_to_fifo -asynchronous -group [get_clocks [list ftdi_clk [get_clocks -of_objects [get_pins clocking_gen.sys_clk/inst/mmcme4_adv_inst/CLKOUT1]]]]

set_property PACKAGE_PIN E22 [get_ports rst_i]
set_property PACKAGE_PIN D11 [get_ports ftdi_wr_n_o]
set_property PACKAGE_PIN C9 [get_ports ftdi_wakeup_o]
set_property PACKAGE_PIN B11 [get_ports ftdi_txe_n_i]
set_property PACKAGE_PIN C11 [get_ports ftdi_rxf_n_i]
set_property PACKAGE_PIN E10 [get_ports ftdi_rstn_o]
set_property PACKAGE_PIN A10 [get_ports ftdi_rd_n_o]
set_property PACKAGE_PIN B10 [get_ports ftdi_oe_n_o]

set_property PACKAGE_PIN H11 [get_ports {led_o[0]}]
set_property PACKAGE_PIN J11 [get_ports {led_o[1]}]
set_property PACKAGE_PIN J10 [get_ports {led_o[2]}]
set_property PACKAGE_PIN F12 [get_ports {ftdi_be_io[1]}]
set_property PACKAGE_PIN E11 [get_ports {ftdi_be_io[0]}]
set_property PACKAGE_PIN D9 [get_ports {ftdi_data_io[15]}]
set_property PACKAGE_PIN C8 [get_ports {ftdi_data_io[14]}]
set_property PACKAGE_PIN D8 [get_ports {ftdi_data_io[13]}]
set_property PACKAGE_PIN E8 [get_ports {ftdi_data_io[12]}]
set_property PACKAGE_PIN B12 [get_ports {ftdi_data_io[11]}]
set_property PACKAGE_PIN A12 [get_ports {ftdi_data_io[10]}]
set_property PACKAGE_PIN C12 [get_ports {ftdi_data_io[9]}]
set_property PACKAGE_PIN F13 [get_ports {ftdi_data_io[8]}]
set_property PACKAGE_PIN C13 [get_ports {ftdi_data_io[7]}]
set_property PACKAGE_PIN D13 [get_ports {ftdi_data_io[6]}]
set_property PACKAGE_PIN A14 [get_ports {ftdi_data_io[5]}]
set_property PACKAGE_PIN B14 [get_ports {ftdi_data_io[4]}]
set_property PACKAGE_PIN B15 [get_ports {ftdi_data_io[3]}]
set_property PACKAGE_PIN A15 [get_ports {ftdi_data_io[2]}]
set_property PACKAGE_PIN D15 [get_ports {ftdi_data_io[1]}]
set_property PACKAGE_PIN E15 [get_ports {ftdi_data_io[0]}]

set_property IOSTANDARD LVCMOS18 [get_ports ftdi_oe_n_o]
set_property IOSTANDARD LVCMOS18 [get_ports ftdi_rd_n_o]
set_property IOSTANDARD LVCMOS18 [get_ports ftdi_rstn_o]
set_property IOSTANDARD LVCMOS18 [get_ports ftdi_rxf_n_i]
set_property IOSTANDARD LVCMOS18 [get_ports ftdi_txe_n_i]
set_property IOSTANDARD LVCMOS18 [get_ports ftdi_wr_n_o]
set_property IOSTANDARD LVCMOS18 [get_ports rst_i]
set_property IOSTANDARD LVCMOS18 [get_ports ftdi_wakeup_o]
set_property IOSTANDARD LVCMOS18 [get_ports {led_o[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_o[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_o[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[15]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[14]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[13]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[12]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[11]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[10]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[9]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[8]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_data_io[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_be_io[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {ftdi_be_io[0]}]




set_property PACKAGE_PIN G11 [get_ports {led_o[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {led_o[3]}]


set_input_delay -clock [get_clocks ftdi_clk] -clock_fall -add_delay 0.25 [get_ports {ftdi_rxf_n_i ftdi_txe_n_i}]
set_input_delay -clock [get_clocks ftdi_clk] -clock_fall -add_delay 0.25 [get_ports -filter { NAME =~  "*" && DIRECTION == "INOUT" }]
set_output_delay -clock [get_clocks ftdi_clk] -clock_fall -add_delay 0.25 [get_ports {ftdi_oe_n_o ftdi_rd_n_o ftdi_rstn_o ftdi_wakeup_o ftdi_wr_n_o}]
set_output_delay -clock [get_clocks ftdi_clk] -clock_fall -add_delay 0.25 [get_ports -filter { NAME =~  "*" && DIRECTION == "INOUT" }]


set_property OFFCHIP_TERM NONE [get_ports ftdi_oe_n_o]
set_property OFFCHIP_TERM NONE [get_ports ftdi_rd_n_o]
set_property OFFCHIP_TERM NONE [get_ports ftdi_rstn_o]
set_property OFFCHIP_TERM NONE [get_ports ftdi_wakeup_o]
set_property OFFCHIP_TERM NONE [get_ports ftdi_wr_n_o]
set_property OFFCHIP_TERM NONE [get_ports ftdi_be_io[1]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_be_io[0]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[15]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[14]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[13]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[12]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[11]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[10]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[9]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[8]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[7]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[6]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[5]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[4]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[3]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[2]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[1]]
set_property OFFCHIP_TERM NONE [get_ports ftdi_data_io[0]]
set_property OFFCHIP_TERM NONE [get_ports led_o[3]]
set_property OFFCHIP_TERM NONE [get_ports led_o[2]]
set_property OFFCHIP_TERM NONE [get_ports led_o[1]]
set_property OFFCHIP_TERM NONE [get_ports led_o[0]]
