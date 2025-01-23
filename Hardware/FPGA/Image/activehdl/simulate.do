transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+compressor_sim  -L xil_defaultlib -L secureip -O5 xil_defaultlib.compressor_sim

do {compressor_sim.udo}

run 1000ns

endsim

quit -force
