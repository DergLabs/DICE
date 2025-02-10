transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+sys_clk_mmcm  -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.sys_clk_mmcm xil_defaultlib.glbl

do {sys_clk_mmcm.udo}

run 1000ns

endsim

quit -force
