transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../../FT600_245_Example.gen/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../FT600_245_Example.gen/sources_1/ip/vio_0/hdl" -l xpm -l xil_defaultlib \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../FT600_245_Example.gen/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../FT600_245_Example.gen/sources_1/ip/vio_0/hdl" -l xpm -l xil_defaultlib \
"../../../../FT600_245_Example.gen/sources_1/ip/vio_0/sim/vio_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

