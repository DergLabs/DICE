transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+output_mem_ila  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.output_mem_ila xil_defaultlib.glbl

do {output_mem_ila.udo}

run 1000ns

endsim

quit -force
