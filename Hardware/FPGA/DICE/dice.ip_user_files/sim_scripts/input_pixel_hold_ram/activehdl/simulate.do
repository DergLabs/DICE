transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+input_pixel_hold_ram  -L xpm -L blk_mem_gen_v8_4_7 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O2 xil_defaultlib.input_pixel_hold_ram xil_defaultlib.glbl

do {input_pixel_hold_ram.udo}

run

endsim

quit -force
