@echo off
REM ****************************************************************************
REM Vivado (TM) v2023.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : AMD Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Mon Jun 09 15:40:39 -0400 2025
REM SW Build 4029153 on Fri Oct 13 20:14:34 MDT 2023
REM
REM Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
REM Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim core_sim_behav -key {Behavioral:sim_1:Functional:core_sim} -tclbatch core_sim.tcl -view C:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/core_sim_behav.wcfg -view C:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/rgb_to_ycrcb_sim_behav.wcfg -view C:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/zigzag_sim_behav.wcfg -log simulate.log"
call xsim  core_sim_behav -key {Behavioral:sim_1:Functional:core_sim} -tclbatch core_sim.tcl -view C:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/core_sim_behav.wcfg -view C:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/rgb_to_ycrcb_sim_behav.wcfg -view C:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/zigzag_sim_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
