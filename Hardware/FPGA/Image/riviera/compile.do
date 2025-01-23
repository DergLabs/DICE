transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xil_defaultlib -2008  -incr \
"../../Image Compressor/image_dct/image_dct.srcs/sources_1/new/sipo_reg.vhd" \
"../../Image Compressor/image_dct/image_dct.srcs/sources_1/new/simd_4x12b_dsp.vhd" \
"../../Image Compressor/image_dct/image_dct.srcs/sources_1/imports/new/data_delay_reg.vhd" \
"../../Image Compressor/image_dct/image_dct.srcs/sources_1/new/dct1d.vhd" \
"../../Image Compressor/image_dct/image_dct.srcs/sources_1/new/pixel_divider.vhd" \
"../../Image Compressor/image_dct/image_dct.srcs/sources_1/new/transpose.vhd" \
"../../Image Compressor/image_dct/image_dct.srcs/sources_1/new/quantization_table.vhd" \
"../../Image Compressor/image_dct/image_dct.srcs/sources_1/new/quantizer.vhd" \
"../../Image Compressor/image_dct/image_dct.srcs/sources_1/new/image_compressor.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../Image Compressor/image_dct/image_dct.srcs/sim_1/new/compressor_sim.vhd" \

