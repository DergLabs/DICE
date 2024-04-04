vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu -sv "+incdir+../../../../mig_7series_0_ex.gen/sources_1/ip/ila_ddr2_axi/hdl/verilog" \
"C:/Xilinx/Xilinx2022/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Xilinx2022/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Xilinx2022/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -mfcu "+incdir+../../../../mig_7series_0_ex.gen/sources_1/ip/ila_ddr2_axi/hdl/verilog" \
"../../../../mig_7series_0_ex.gen/sources_1/ip/ila_ddr2_axi/sim/ila_ddr2_axi.v" \

vlog -work xil_defaultlib \
"glbl.v"

