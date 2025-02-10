vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_5
vlib modelsim_lib/msim/xbip_utils_v3_0_11
vlib modelsim_lib/msim/xbip_pipe_v3_0_7
vlib modelsim_lib/msim/dsp_macro_v1_0_4
vlib modelsim_lib/msim/xil_defaultlib

vmap xbip_dsp48_wrapper_v3_0_5 modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_5
vmap xbip_utils_v3_0_11 modelsim_lib/msim/xbip_utils_v3_0_11
vmap xbip_pipe_v3_0_7 modelsim_lib/msim/xbip_pipe_v3_0_7
vmap dsp_macro_v1_0_4 modelsim_lib/msim/dsp_macro_v1_0_4
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vcom -work xbip_dsp48_wrapper_v3_0_5  -93  \
"../hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_utils_v3_0_11  -93  \
"../hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_7  -93  \
"../hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work dsp_macro_v1_0_4  -93  \
"../hdl/dsp_macro_v1_0_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../Laplacian Core/laplacian_core/laplacian_core.gen/sources_1/ip/dsp_msub/sim/dsp_msub.vhd" \
"../../Laplacian Core/laplacian_core/laplacian_core.gen/sources_1/ip/dsp_acum/sim/dsp_acum.vhd" \
"../../Laplacian Core/laplacian_core/laplacian_core.gen/sources_1/ip/dsp_mac/sim/dsp_mac.vhd" \

vcom -work xil_defaultlib  -2008  \
"../../Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/data_delay_reg.vhd" \
"../../Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/variance_core.vhd" \
"../../Laplacian Core/laplacian_core/laplacian_core.srcs/sim_1/new/variance_sim.vhd" \

