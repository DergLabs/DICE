transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr "+incdir+../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/src" "+incdir+../../USB Compressor Test/usb_compressor_test/usb_compressor_test.gen/sources_1/ip/clk_wiz_0" -l xpm -l xil_defaultlib \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/src" "+incdir+../../USB Compressor Test/usb_compressor_test/usb_compressor_test.gen/sources_1/ip/clk_wiz_0" -l xpm -l xil_defaultlib \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/src/send_recieve_module.sv" \

vcom -work xil_defaultlib -2008  -incr \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/sources_1/imports/new/data_delay_reg.vhd" \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/sources_1/new/simd_4x12b_dsp.vhd" \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/sources_1/new/dct1d.vhd" \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/sources_1/new/sipo_reg.vhd" \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/sources_1/new/pixel_divider.vhd" \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/sources_1/new/transpose.vhd" \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/sources_1/new/quantization_table.vhd" \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/sources_1/new/quantizer.vhd" \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/sources_1/new/image_compressor.vhd" \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/sources_1/new/multi_core_test.vhd" \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/new/ultra_ram_buffer.vhd" \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/new/top.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/src" "+incdir+../../USB Compressor Test/usb_compressor_test/usb_compressor_test.gen/sources_1/ip/clk_wiz_0" -l xpm -l xil_defaultlib \
"../../USB Compressor Test/usb_compressor_test/usb_compressor_test.srcs/sources_1/imports/src/tb_send_recieve.sv" \

vlog -work xil_defaultlib \
"glbl.v"

