transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xbip_dsp48_wrapper_v3_0_5
vlib activehdl/xbip_utils_v3_0_11
vlib activehdl/xbip_pipe_v3_0_7
vlib activehdl/dsp_macro_v1_0_4
vlib activehdl/xil_defaultlib

vmap xbip_dsp48_wrapper_v3_0_5 activehdl/xbip_dsp48_wrapper_v3_0_5
vmap xbip_utils_v3_0_11 activehdl/xbip_utils_v3_0_11
vmap xbip_pipe_v3_0_7 activehdl/xbip_pipe_v3_0_7
vmap dsp_macro_v1_0_4 activehdl/dsp_macro_v1_0_4
vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xbip_dsp48_wrapper_v3_0_5 -93  \
"../hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_utils_v3_0_11 -93  \
"../hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_7 -93  \
"../hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work dsp_macro_v1_0_4 -93  \
"../hdl/dsp_macro_v1_0_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../Gradient Core/gradient_core/gradient_core.gen/sources_1/ip/dsp_macro_add_22b/sim/dsp_macro_add_22b.vhd" \
"../../Gradient Core/gradient_core/gradient_core.srcs/sources_1/imports/new/data_delay_reg.vhd" \

vcom -work xil_defaultlib -2008  \
"../../Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/gradient_calc.vhd" \
"../../Gradient Core/gradient_core/gradient_core.srcs/sim_1/new/gradient_calc_sim.vhd" \

