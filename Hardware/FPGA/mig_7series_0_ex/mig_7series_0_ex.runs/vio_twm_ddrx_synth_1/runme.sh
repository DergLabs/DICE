#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
  PATH=C:/Xilinx/Xilinx2022/Vitis/2022.1/bin;C:/Xilinx/Xilinx2022/Vivado/2022.1/ids_lite/ISE/bin/nt64;C:/Xilinx/Xilinx2022/Vivado/2022.1/ids_lite/ISE/lib/nt64:C:/Xilinx/Xilinx2022/Vivado/2022.1/bin
else
  PATH=C:/Xilinx/Xilinx2022/Vitis/2022.1/bin;C:/Xilinx/Xilinx2022/Vivado/2022.1/ids_lite/ISE/bin/nt64;C:/Xilinx/Xilinx2022/Vivado/2022.1/ids_lite/ISE/lib/nt64:C:/Xilinx/Xilinx2022/Vivado/2022.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='c:/Users/johnh/Desktop/DICE-Project/mig_7series_0_ex/mig_7series_0_ex.runs/vio_twm_ddrx_synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log vio_twm_ddrx.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source vio_twm_ddrx.tcl
