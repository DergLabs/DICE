transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+variance_sim  -L xbip_dsp48_wrapper_v3_0_5 -L xbip_utils_v3_0_11 -L xbip_pipe_v3_0_7 -L dsp_macro_v1_0_4 -L xil_defaultlib -L secureip -O5 xil_defaultlib.variance_sim

do {variance_sim.udo}

run 1000ns

endsim

quit -force
