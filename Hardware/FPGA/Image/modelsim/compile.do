vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xbip_utils_v3_0_11
vlib modelsim_lib/msim/c_reg_fd_v12_0_7
vlib modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_5
vlib modelsim_lib/msim/xbip_pipe_v3_0_7
vlib modelsim_lib/msim/xbip_dsp48_addsub_v3_0_7
vlib modelsim_lib/msim/xbip_addsub_v3_0_7
vlib modelsim_lib/msim/c_addsub_v12_0_16
vlib modelsim_lib/msim/xbip_bram18k_v3_0_7
vlib modelsim_lib/msim/mult_gen_v12_0_19
vlib modelsim_lib/msim/axi_utils_v2_0_7
vlib modelsim_lib/msim/cordic_v6_0_20
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/dsp_macro_v1_0_4

vmap xbip_utils_v3_0_11 modelsim_lib/msim/xbip_utils_v3_0_11
vmap c_reg_fd_v12_0_7 modelsim_lib/msim/c_reg_fd_v12_0_7
vmap xbip_dsp48_wrapper_v3_0_5 modelsim_lib/msim/xbip_dsp48_wrapper_v3_0_5
vmap xbip_pipe_v3_0_7 modelsim_lib/msim/xbip_pipe_v3_0_7
vmap xbip_dsp48_addsub_v3_0_7 modelsim_lib/msim/xbip_dsp48_addsub_v3_0_7
vmap xbip_addsub_v3_0_7 modelsim_lib/msim/xbip_addsub_v3_0_7
vmap c_addsub_v12_0_16 modelsim_lib/msim/c_addsub_v12_0_16
vmap xbip_bram18k_v3_0_7 modelsim_lib/msim/xbip_bram18k_v3_0_7
vmap mult_gen_v12_0_19 modelsim_lib/msim/mult_gen_v12_0_19
vmap axi_utils_v2_0_7 modelsim_lib/msim/axi_utils_v2_0_7
vmap cordic_v6_0_20 modelsim_lib/msim/cordic_v6_0_20
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap dsp_macro_v1_0_4 modelsim_lib/msim/dsp_macro_v1_0_4

vcom -work xbip_utils_v3_0_11  -93  \
"../hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_7  -93  \
"../hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_5  -93  \
"../hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_7  -93  \
"../hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_7  -93  \
"../hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_7  -93  \
"../hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_16  -93  \
"../hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_7  -93  \
"../hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_19  -93  \
"../hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_7  -93  \
"../hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work cordic_v6_0_20  -93  \
"../hdl/cordic_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../Image Stats/image_statistics/image_statistics.gen/sources_1/ip/sqrt_cordic/sim/sqrt_cordic.vhd" \

vcom -work dsp_macro_v1_0_4  -93  \
"../hdl/dsp_macro_v1_0_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_msub/sim/dsp_msub.vhd" \
"../../Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_acum/sim/dsp_acum.vhd" \
"../../Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_mac/sim/dsp_mac.vhd" \
"../../Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_add_22b/sim/dsp_macro_add_22b.vhd" \
"../../Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_simd/sim/dsp_macro_simd.vhd" \

vcom -work xil_defaultlib  -2008  \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/rgb_to_grayscale.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/imports/new/data_delay_reg.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/data_delay_reg.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/laplacian_core.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/gradient_calc.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/new/sipo_reg.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/statistics_core.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/new/image_statistics_top.vhd" \

