onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib vio_twm_ddrx_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {vio_twm_ddrx.udo}

run -all

quit -force
