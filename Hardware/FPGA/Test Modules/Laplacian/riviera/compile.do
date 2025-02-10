transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xbip_dsp48_wrapper_v3_0_5
vlib riviera/xbip_utils_v3_0_11
vlib riviera/xbip_pipe_v3_0_7
vlib riviera/dsp_macro_v1_0_4
vlib riviera/xil_defaultlib

vmap xbip_dsp48_wrapper_v3_0_5 riviera/xbip_dsp48_wrapper_v3_0_5
vmap xbip_utils_v3_0_11 riviera/xbip_utils_v3_0_11
vmap xbip_pipe_v3_0_7 riviera/xbip_pipe_v3_0_7
vmap dsp_macro_v1_0_4 riviera/dsp_macro_v1_0_4
vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xbip_dsp48_wrapper_v3_0_5 -93  -incr \
"../hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_utils_v3_0_11 -93  -incr \
"../hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_7 -93  -incr \
"../hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work dsp_macro_v1_0_4 -93  -incr \
"../hdl/dsp_macro_v1_0_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../Laplacian Core/laplacian_core/laplacian_core.gen/sources_1/ip/dsp_msub/sim/dsp_msub.vhd" \
"../../Laplacian Core/laplacian_core/laplacian_core.gen/sources_1/ip/dsp_acum/sim/dsp_acum.vhd" \
"../../Laplacian Core/laplacian_core/laplacian_core.gen/sources_1/ip/dsp_mac/sim/dsp_mac.vhd" \

vcom -work xil_defaultlib -2008  -incr \
"../../Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/data_delay_reg.vhd" \
"../../Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/variance_core.vhd" \
"../../Laplacian Core/laplacian_core/laplacian_core.srcs/sim_1/new/variance_sim.vhd" \

