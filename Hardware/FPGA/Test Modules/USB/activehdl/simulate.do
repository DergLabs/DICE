transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+tb_send_recieve  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.tb_send_recieve xil_defaultlib.glbl

do {tb_send_recieve.udo}

run 1000ns

endsim

quit -force
