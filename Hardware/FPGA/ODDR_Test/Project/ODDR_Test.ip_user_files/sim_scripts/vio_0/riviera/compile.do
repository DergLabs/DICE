transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../../../ODDR_Test.gen/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../ODDR_Test.gen/sources_1/ip/vio_0/hdl" -l xpm -l xil_defaultlib \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../ODDR_Test.gen/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../ODDR_Test.gen/sources_1/ip/vio_0/hdl" -l xpm -l xil_defaultlib \
"../../../../ODDR_Test.gen/sources_1/ip/vio_0/sim/vio_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

