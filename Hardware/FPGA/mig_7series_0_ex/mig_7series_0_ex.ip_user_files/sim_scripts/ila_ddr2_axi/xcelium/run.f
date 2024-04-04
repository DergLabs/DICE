-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Xilinx2022/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Xilinx2022/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Xilinx2022/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../mig_7series_0_ex.gen/sources_1/ip/ila_ddr2_axi/sim/ila_ddr2_axi.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

