transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+input_data_fifo  -L xpm -L fifo_generator_v13_2_9 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.input_data_fifo xil_defaultlib.glbl

do {input_data_fifo.udo}

run 1000ns

endsim

quit -force
