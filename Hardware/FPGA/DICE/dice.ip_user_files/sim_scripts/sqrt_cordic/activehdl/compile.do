transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xpm
vlib activehdl/xbip_utils_v3_0_11
vlib activehdl/c_reg_fd_v12_0_7
vlib activehdl/xbip_dsp48_wrapper_v3_0_5
vlib activehdl/xbip_pipe_v3_0_7
vlib activehdl/xbip_dsp48_addsub_v3_0_7
vlib activehdl/xbip_addsub_v3_0_7
vlib activehdl/c_addsub_v12_0_16
vlib activehdl/xbip_bram18k_v3_0_7
vlib activehdl/mult_gen_v12_0_19
vlib activehdl/axi_utils_v2_0_7
vlib activehdl/cordic_v6_0_20
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xbip_utils_v3_0_11 activehdl/xbip_utils_v3_0_11
vmap c_reg_fd_v12_0_7 activehdl/c_reg_fd_v12_0_7
vmap xbip_dsp48_wrapper_v3_0_5 activehdl/xbip_dsp48_wrapper_v3_0_5
vmap xbip_pipe_v3_0_7 activehdl/xbip_pipe_v3_0_7
vmap xbip_dsp48_addsub_v3_0_7 activehdl/xbip_dsp48_addsub_v3_0_7
vmap xbip_addsub_v3_0_7 activehdl/xbip_addsub_v3_0_7
vmap c_addsub_v12_0_16 activehdl/c_addsub_v12_0_16
vmap xbip_bram18k_v3_0_7 activehdl/xbip_bram18k_v3_0_7
vmap mult_gen_v12_0_19 activehdl/mult_gen_v12_0_19
vmap axi_utils_v2_0_7 activehdl/axi_utils_v2_0_7
vmap cordic_v6_0_20 activehdl/cordic_v6_0_20
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 -l xpm -l xbip_utils_v3_0_11 -l c_reg_fd_v12_0_7 -l xbip_dsp48_wrapper_v3_0_5 -l xbip_pipe_v3_0_7 -l xbip_dsp48_addsub_v3_0_7 -l xbip_addsub_v3_0_7 -l c_addsub_v12_0_16 -l xbip_bram18k_v3_0_7 -l mult_gen_v12_0_19 -l axi_utils_v2_0_7 -l cordic_v6_0_20 -l xil_defaultlib \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xbip_utils_v3_0_11 -93  \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_7 -93  \
"../../../ipstatic/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_5 -93  \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_7 -93  \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_7 -93  \
"../../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_7 -93  \
"../../../ipstatic/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_16 -93  \
"../../../ipstatic/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_7 -93  \
"../../../ipstatic/hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_19 -93  \
"../../../ipstatic/hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_7 -93  \
"../../../ipstatic/hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work cordic_v6_0_20 -93  \
"../../../ipstatic/hdl/cordic_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../../dice.gen/sources_1/ip/sqrt_cordic/sim/sqrt_cordic.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

