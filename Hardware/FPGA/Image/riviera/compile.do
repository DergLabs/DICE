transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xbip_utils_v3_0_11
vlib riviera/c_reg_fd_v12_0_7
vlib riviera/xbip_dsp48_wrapper_v3_0_5
vlib riviera/xbip_pipe_v3_0_7
vlib riviera/xbip_dsp48_addsub_v3_0_7
vlib riviera/xbip_addsub_v3_0_7
vlib riviera/c_addsub_v12_0_16
vlib riviera/xbip_bram18k_v3_0_7
vlib riviera/mult_gen_v12_0_19
vlib riviera/axi_utils_v2_0_7
vlib riviera/cordic_v6_0_20
vlib riviera/xil_defaultlib
vlib riviera/dsp_macro_v1_0_4

vmap xbip_utils_v3_0_11 riviera/xbip_utils_v3_0_11
vmap c_reg_fd_v12_0_7 riviera/c_reg_fd_v12_0_7
vmap xbip_dsp48_wrapper_v3_0_5 riviera/xbip_dsp48_wrapper_v3_0_5
vmap xbip_pipe_v3_0_7 riviera/xbip_pipe_v3_0_7
vmap xbip_dsp48_addsub_v3_0_7 riviera/xbip_dsp48_addsub_v3_0_7
vmap xbip_addsub_v3_0_7 riviera/xbip_addsub_v3_0_7
vmap c_addsub_v12_0_16 riviera/c_addsub_v12_0_16
vmap xbip_bram18k_v3_0_7 riviera/xbip_bram18k_v3_0_7
vmap mult_gen_v12_0_19 riviera/mult_gen_v12_0_19
vmap axi_utils_v2_0_7 riviera/axi_utils_v2_0_7
vmap cordic_v6_0_20 riviera/cordic_v6_0_20
vmap xil_defaultlib riviera/xil_defaultlib
vmap dsp_macro_v1_0_4 riviera/dsp_macro_v1_0_4

vcom -work xbip_utils_v3_0_11 -93  -incr \
"../hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_7 -93  -incr \
"../hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_5 -93  -incr \
"../hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_7 -93  -incr \
"../hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_7 -93  -incr \
"../hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_7 -93  -incr \
"../hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_16 -93  -incr \
"../hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work xbip_bram18k_v3_0_7 -93  -incr \
"../hdl/xbip_bram18k_v3_0_vh_rfs.vhd" \

vcom -work mult_gen_v12_0_19 -93  -incr \
"../hdl/mult_gen_v12_0_vh_rfs.vhd" \

vcom -work axi_utils_v2_0_7 -93  -incr \
"../hdl/axi_utils_v2_0_vh_rfs.vhd" \

vcom -work cordic_v6_0_20 -93  -incr \
"../hdl/cordic_v6_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../Image Stats/image_statistics/image_statistics.gen/sources_1/ip/sqrt_cordic/sim/sqrt_cordic.vhd" \

vcom -work dsp_macro_v1_0_4 -93  -incr \
"../hdl/dsp_macro_v1_0_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_msub/sim/dsp_msub.vhd" \
"../../Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_acum/sim/dsp_acum.vhd" \
"../../Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_mac/sim/dsp_mac.vhd" \
"../../Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_add_22b/sim/dsp_macro_add_22b.vhd" \
"../../Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_simd/sim/dsp_macro_simd.vhd" \

vcom -work xil_defaultlib -2008  -incr \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/rgb_to_grayscale.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/imports/new/data_delay_reg.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/data_delay_reg.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/laplacian_core.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/gradient_calc.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/new/sipo_reg.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/statistics_core.vhd" \
"../../Image Stats/image_statistics/image_statistics.srcs/sources_1/new/image_statistics_top.vhd" \

