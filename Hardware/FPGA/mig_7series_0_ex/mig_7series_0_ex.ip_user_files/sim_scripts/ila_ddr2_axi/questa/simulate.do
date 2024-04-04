onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib ila_ddr2_axi_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {ila_ddr2_axi.udo}

run -all

quit -force
