
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:052

00:00:052	
488.7972	
176.473Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental {C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/utils_1/imports/synth_1/laplacian_core.dcp}Z12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/utils_1/imports/synth_1/laplacian_core.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
r
Command: %s
53*	vivadotcl2A
?synth_design -top image_statistics_top -part xcku3p-ffva676-2-iZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
y
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2
xcku3pZ17-347h px� 
i
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2
xcku3pZ17-349h px� 
G
Loading part %s157*device2
xcku3p-ffva676-2-iZ21-403h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
25232Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:04 . Memory (MB): peak = 1992.484 ; gain = 420.215
h px� 
�
synthesizing module '%s'638*oasys2
image_statistics_top2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/new/image_statistics_top.vhd2
588@Z8-638h px� 
�
synthesizing module '%s'638*oasys2
rgb_to_gray2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/rgb_to_grayscale.vhd2
288@Z8-638h px� 
J
%s
*synth22
0	Parameter INIT bound to: 16'b0000000000000000 
h p
x
� 
E
%s
*synth2-
+	Parameter IS_CLK_INVERTED bound to: 1'b0 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2
SRL16E_inst2
SRL16E2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/rgb_to_grayscale.vhd2
818@Z8-113h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
dsp_macro_simd2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_macro_simd_stub.vhdl2
62
dsp_pre_add2
dsp_macro_simd2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/rgb_to_grayscale.vhd2
1588@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
dsp_macro_simd2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_macro_simd_stub.vhdl2
198@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
dsp_macro_simd2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_macro_simd_stub.vhdl2
62
dsp_final_add2
dsp_macro_simd2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/rgb_to_grayscale.vhd2
1748@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
rgb_to_gray2
02
12�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/rgb_to_grayscale.vhd2
288@Z8-256h px� 
�
synthesizing module '%s'638*oasys2

sipo_reg2�
C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/new/sipo_reg.vhd2
538@Z8-638h px� 
K
%s
*synth23
1	Parameter IN_WIDTH bound to: 8 - type: integer 
h p
x
� 
K
%s
*synth23
1	Parameter OUT_TAPS bound to: 9 - type: integer 
h p
x
� 
J
%s
*synth22
0	Parameter TAP_END bound to: 0 - type: integer 
h p
x
� 
H
%s
*synth20
.	Parameter DEPTH bound to: 9 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2

sipo_reg2
02
12�
C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/new/sipo_reg.vhd2
538@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
laplacian_core2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/laplacian_core.vhd2
328@Z8-638h px� 
Z
%s
*synth2B
@	Parameter INIT bound to: 32'b00000000000000000000000000000000 
h p
x
� 
E
%s
*synth2-
+	Parameter IS_CLK_INVERTED bound to: 1'b0 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2
SRLC32E_inst2	
SRLC32E2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/laplacian_core.vhd2
638@Z8-113h px� 
�
synthesizing module '%s'638*oasys2
data_delay_reg2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/imports/new/data_delay_reg.vhd2
488@Z8-638h px� 
N
%s
*synth26
4	Parameter SHIFT_DEPTH bound to: 4 - type: integer 
h p
x
� 
M
%s
*synth25
3	Parameter DATA_WIDTH bound to: 8 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
data_delay_reg2
02
12�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/imports/new/data_delay_reg.vhd2
488@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
dsp_macro_simd2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_macro_simd_stub.vhdl2
62
dsp_add1_11b2
dsp_macro_simd2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/laplacian_core.vhd2
1498@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
dsp_macro_simd2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_macro_simd_stub.vhdl2
62
dsp_add2_11b2
dsp_macro_simd2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/laplacian_core.vhd2
1608@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
laplacian_core2
02
12�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Laplacian Core/laplacian_core/laplacian_core.srcs/sources_1/new/laplacian_core.vhd2
328@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
gradient_calc2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/gradient_calc.vhd2
518@Z8-638h px� 
Z
%s
*synth2B
@	Parameter INIT bound to: 32'b00000000000000000000000000000000 
h p
x
� 
E
%s
*synth2-
+	Parameter IS_CLK_INVERTED bound to: 1'b0 
h p
x
� 
�
,binding component instance '%s' to cell '%s'113*oasys2
SRLC32E_inst2	
SRLC32E2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/gradient_calc.vhd2
1108@Z8-113h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
dsp_macro_add_22b2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_macro_add_22b_stub.vhdl2
62
sobel_x_dsp12
dsp_macro_add_22b2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/gradient_calc.vhd2
2008@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
dsp_macro_add_22b2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_macro_add_22b_stub.vhdl2
198@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
dsp_macro_add_22b2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_macro_add_22b_stub.vhdl2
62
sobel_x_dsp22
dsp_macro_add_22b2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/gradient_calc.vhd2
2118@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
dsp_macro_add_22b2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_macro_add_22b_stub.vhdl2
62
sobel_y_dsp12
dsp_macro_add_22b2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/gradient_calc.vhd2
2228@Z8-3491h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
dsp_macro_add_22b2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_macro_add_22b_stub.vhdl2
62
sobel_y_dsp22
dsp_macro_add_22b2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/gradient_calc.vhd2
2338@Z8-3491h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
gradient_calc2
02
12�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/gradient_calc.vhd2
518@Z8-256h px� 
�
synthesizing module '%s'638*oasys2
statistics_core2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/statistics_core.vhd2
378@Z8-638h px� 
Q
%s
*synth29
7	Parameter variance_depth bound to: 8 - type: integer 
h p
x
� 
N
%s
*synth26
4	Parameter data_width bound to: 11 - type: integer 
h p
x
� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2	
valid_x2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/statistics_core.vhd2
1438@Z8-614h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2	
dsp_mac2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_mac_stub.vhdl2
62
dsp_vsum_mac2	
dsp_mac2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/statistics_core.vhd2
1958@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2	
dsp_mac2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_mac_stub.vhdl2
178@Z8-638h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

dsp_acum2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_acum_stub.vhdl2
62
dsp_hsum_acum2

dsp_acum2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/statistics_core.vhd2
2058@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

dsp_acum2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_acum_stub.vhdl2
178@Z8-638h px� 
�
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2	
valid_x2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/statistics_core.vhd2
2158@Z8-614h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

dsp_msub2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_msub_stub.vhdl2
62
dsp_var_msub2

dsp_msub2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/statistics_core.vhd2
2328@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2

dsp_msub2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/dsp_msub_stub.vhdl2
188@Z8-638h px� 
�
synthesizing module '%s'638*oasys2 
data_delay_reg__parameterized02�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/imports/new/data_delay_reg.vhd2
488@Z8-638h px� 
N
%s
*synth26
4	Parameter SHIFT_DEPTH bound to: 7 - type: integer 
h p
x
� 
N
%s
*synth26
4	Parameter DATA_WIDTH bound to: 16 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2 
data_delay_reg__parameterized02
02
12�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/imports/new/data_delay_reg.vhd2
488@Z8-256h px� 
�
synthesizing module '%s'638*oasys2 
data_delay_reg__parameterized12�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/imports/new/data_delay_reg.vhd2
488@Z8-638h px� 
N
%s
*synth26
4	Parameter SHIFT_DEPTH bound to: 3 - type: integer 
h p
x
� 
N
%s
*synth26
4	Parameter DATA_WIDTH bound to: 16 - type: integer 
h p
x
� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2 
data_delay_reg__parameterized12
02
12�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/imports/new/data_delay_reg.vhd2
488@Z8-256h px� 
�
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2
sqrt_cordic2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/sqrt_cordic_stub.vhdl2
62
std_dev_sqrt2
sqrt_cordic2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/statistics_core.vhd2
2688@Z8-3491h px� 
�
synthesizing module '%s'638*oasys2
sqrt_cordic2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/.Xil/Vivado-23764-DESKTOP-U9NB2CD/realtime/sqrt_cordic_stub.vhdl2
198@Z8-638h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
statistics_core2
02
12�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/statistics_core.vhd2
378@Z8-256h px� 
�
%done synthesizing module '%s' (%s#%s)256*oasys2
image_statistics_top2
02
12�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/new/image_statistics_top.vhd2
588@Z8-256h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
vaid_counter_x_reg2�
C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/new/sipo_reg.vhd2
988@Z8-6014h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
valid_counter_reg2�
�C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/FPGA/Gradient Core/gradient_core/gradient_core.srcs/sources_1/new/statistics_core.vhd2
2848@Z8-6014h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 2108.793 ; gain = 536.523
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 2126.719 ; gain = 554.449
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 2126.719 ; gain = 554.449
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0222

2138.7152
0.000Z17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_add_22b/dsp_macro_add_22b/dsp_macro_add_22b_in_context.xdc2
gradient_core/sobel_x_dsp1	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_add_22b/dsp_macro_add_22b/dsp_macro_add_22b_in_context.xdc2
gradient_core/sobel_x_dsp1	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_add_22b/dsp_macro_add_22b/dsp_macro_add_22b_in_context.xdc2
gradient_core/sobel_x_dsp2	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_add_22b/dsp_macro_add_22b/dsp_macro_add_22b_in_context.xdc2
gradient_core/sobel_x_dsp2	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_add_22b/dsp_macro_add_22b/dsp_macro_add_22b_in_context.xdc2
gradient_core/sobel_y_dsp1	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_add_22b/dsp_macro_add_22b/dsp_macro_add_22b_in_context.xdc2
gradient_core/sobel_y_dsp1	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_add_22b/dsp_macro_add_22b/dsp_macro_add_22b_in_context.xdc2
gradient_core/sobel_y_dsp2	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_add_22b/dsp_macro_add_22b/dsp_macro_add_22b_in_context.xdc2
gradient_core/sobel_y_dsp2	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/sqrt_cordic/sqrt_cordic/sqrt_cordic_in_context.xdc2*
&statistics_core_laplacian/std_dev_sqrt	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/sqrt_cordic/sqrt_cordic/sqrt_cordic_in_context.xdc2*
&statistics_core_laplacian/std_dev_sqrt	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/sqrt_cordic/sqrt_cordic/sqrt_cordic_in_context.xdc2)
%statistics_core_gradient/std_dev_sqrt	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/sqrt_cordic/sqrt_cordic/sqrt_cordic_in_context.xdc2)
%statistics_core_gradient/std_dev_sqrt	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_acum/dsp_acum/dsp_acum_in_context.xdc2+
'statistics_core_laplacian/dsp_hsum_acum	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_acum/dsp_acum/dsp_acum_in_context.xdc2+
'statistics_core_laplacian/dsp_hsum_acum	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_acum/dsp_acum/dsp_acum_in_context.xdc2*
&statistics_core_gradient/dsp_hsum_acum	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_acum/dsp_acum/dsp_acum_in_context.xdc2*
&statistics_core_gradient/dsp_hsum_acum	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_mac/dsp_mac/dsp_mac_in_context.xdc2*
&statistics_core_laplacian/dsp_vsum_mac	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_mac/dsp_mac/dsp_mac_in_context.xdc2*
&statistics_core_laplacian/dsp_vsum_mac	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_mac/dsp_mac/dsp_mac_in_context.xdc2)
%statistics_core_gradient/dsp_vsum_mac	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_mac/dsp_mac/dsp_mac_in_context.xdc2)
%statistics_core_gradient/dsp_vsum_mac	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_simd/dsp_macro_simd/dsp_macro_simd_in_context.xdc2
rgb_to_gray/dsp_pre_add	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_simd/dsp_macro_simd/dsp_macro_simd_in_context.xdc2
rgb_to_gray/dsp_pre_add	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_simd/dsp_macro_simd/dsp_macro_simd_in_context.xdc2
rgb_to_gray/dsp_final_add	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_simd/dsp_macro_simd/dsp_macro_simd_in_context.xdc2
rgb_to_gray/dsp_final_add	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_simd/dsp_macro_simd/dsp_macro_simd_in_context.xdc2
laplacian_core/dsp_add1_11b	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_simd/dsp_macro_simd/dsp_macro_simd_in_context.xdc2
laplacian_core/dsp_add1_11b	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_simd/dsp_macro_simd/dsp_macro_simd_in_context.xdc2
laplacian_core/dsp_add2_11b	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_simd/dsp_macro_simd/dsp_macro_simd_in_context.xdc2
laplacian_core/dsp_add2_11b	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_msub/dsp_msub/dsp_msub_in_context.xdc2*
&statistics_core_laplacian/dsp_var_msub	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_msub/dsp_msub/dsp_msub_in_context.xdc2*
&statistics_core_laplacian/dsp_var_msub	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_msub/dsp_msub/dsp_msub_in_context.xdc2)
%statistics_core_gradient/dsp_var_msub	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_msub/dsp_msub/dsp_msub_in_context.xdc2)
%statistics_core_gradient/dsp_var_msub	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[15]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1018@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[14]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1028@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[13]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1038@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[12]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1048@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[11]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1058@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[10]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1068@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[9]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1078@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[8]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1088@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[7]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1098@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[6]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1108@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[5]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1118@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[4]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1128@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[3]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1138@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[2]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1148@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[1]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1158@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[0]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1168@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[15]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1178@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[14]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1188@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[13]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1198@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[12]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1208@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[11]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1218@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[10]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1228@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[9]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1238@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[8]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1248@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[7]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1258@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[6]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1268@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[5]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1278@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[4]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1288@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[3]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1298@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[2]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1308@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[1]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1318@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[0]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1328@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[15]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1338@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[14]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1348@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[13]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1358@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[12]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1368@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[11]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1378@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[10]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1388@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[9]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1398@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[8]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1408@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[7]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1418@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[6]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1428@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[5]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1438@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[4]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1448@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[3]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1458@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[2]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1468@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[1]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1478@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[0]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1488@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[15]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1738@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[14]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1748@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[13]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1758@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[12]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1768@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[11]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1778@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[10]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1788@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[9]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1798@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[8]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1808@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[7]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1818@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[6]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1828@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[5]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1838@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[4]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1848@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[3]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1858@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[2]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1868@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[1]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1878@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_mean_o[0]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1888@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[15]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1898@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[14]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1908@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[13]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1918@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[12]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1928@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[11]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1938@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[10]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1948@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[9]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1958@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[8]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1968@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[7]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1978@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[6]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1988@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[5]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
1998@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[4]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2008@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[3]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2018@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[2]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2028@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[1]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2038@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_std_dev_o[0]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2048@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[15]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2058@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[14]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2068@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[13]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2078@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[12]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2088@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[11]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2098@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[10]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2108@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[9]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2118@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[8]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2128@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[7]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2138@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[6]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2148@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[5]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2158@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[4]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2168@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[3]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2178@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[2]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2188@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[1]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2198@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_var_o[0]2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2208@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_valid_o2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2228@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
lapplacian_valid_o2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2
2258@Z12-584h px�
�
Finished Parsing XDC File [%s]
178*designutils2~
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc8Z20-178h px� 
�
�One or more constraints failed evaluation while reading constraint file [%s] and the design contains unresolved black boxes. These constraints will be read post-synthesis (as long as their source constraint file is marked as used_in_implementation) and should be applied correctly then. You should review the constraints listed in the file [%s] and check the run log file to verify that these constraints were correctly applied.301*project2|
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2(
&.Xil/image_statistics_top_propImpl.xdcZ1-498h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2|
zC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/constrs_1/new/constraints.xdc2(
&.Xil/image_statistics_top_propImpl.xdcZ1-236h px� 
�
Parsing XDC File [%s]
179*designutils2w
sC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/dont_touch.xdc8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2w
sC:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/dont_touch.xdc8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

2248.8912
0.000Z17-268h px� 
l
!Unisim Transformation Summary:
%s111*project2'
%No Unisim elements were transformed.
Z1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
 Constraint Validation Runtime : 2

00:00:002
00:00:00.0092

2248.8912
0.000Z17-268h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002
gradient_core/sobel_x_dsp12
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002
gradient_core/sobel_x_dsp22
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002
gradient_core/sobel_y_dsp12
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002
gradient_core/sobel_y_dsp22
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002
laplacian_core/dsp_add1_11b2
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002
laplacian_core/dsp_add2_11b2
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002
rgb_to_gray/dsp_final_add2
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002
rgb_to_gray/dsp_pre_add2
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002(
&statistics_core_gradient/dsp_hsum_acum2
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002'
%statistics_core_gradient/dsp_var_msub2
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002'
%statistics_core_gradient/dsp_vsum_mac2
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2

1000.0002'
%statistics_core_gradient/std_dev_sqrt2
aclk2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002)
'statistics_core_laplacian/dsp_hsum_acum2
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002(
&statistics_core_laplacian/dsp_var_msub2
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
10.0002(
&statistics_core_laplacian/dsp_vsum_mac2
CLK2
5.000Z38-316h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2

1000.0002(
&statistics_core_laplacian/std_dev_sqrt2
aclk2
5.000Z38-316h px� 

VNo compile time benefit to using incremental synthesis; A full resynthesis will be run2353*designutilsZ20-5440h px� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 2248.891 ; gain = 676.621
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
D
%s
*synth2,
*Start Loading Part and Timing Information
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Loading part: xcku3p-ffva676-2-i
h p
x
� 
B
 Reading net delay rules and data4578*oasysZ8-6742h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 2248.891 ; gain = 676.621
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
%s
*synth20
.Start Applying 'set_property' XDC Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 2248.891 ; gain = 676.621
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
!inferring latch for variable '%s'327*oasys2

data_o_reg2�
C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/new/sipo_reg.vhd2
1148@Z8-327h px� 
�
!inferring latch for variable '%s'327*oasys2
valid_o_reg2�
C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.srcs/sources_1/imports/new/sipo_reg.vhd2
1188@Z8-327h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:15 ; elapsed = 00:00:16 . Memory (MB): peak = 2248.891 ; gain = 676.621
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Detailed RTL Component Info : 
h p
x
� 
(
%s
*synth2
+---Adders : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit       Adders := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   14 Bit       Adders := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit       Adders := 2     
h p
x
� 
+
%s
*synth2
+---Registers : 
h p
x
� 
H
%s
*synth20
.	               72 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	               48 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	               24 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               18 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               16 Bit    Registers := 7     
h p
x
� 
H
%s
*synth20
.	               14 Bit    Registers := 7     
h p
x
� 
H
%s
*synth20
.	               12 Bit    Registers := 10    
h p
x
� 
H
%s
*synth20
.	               11 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	                8 Bit    Registers := 12    
h p
x
� 
H
%s
*synth20
.	                7 Bit    Registers := 32    
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 16    
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 32    
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 19    
h p
x
� 
'
%s
*synth2
+---Muxes : 
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   11 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    8 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 6     
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Finished RTL Component Statistics 
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
r
%s
*synth2Z
XPart Resources:
DSPs: 1368 (col length:96)
BRAMs: 720 (col length: RAMB18 96 RAMB36 48)
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Part Resource Summary
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
E
%s
*synth2-
+Start Cross Boundary and Area Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:17 ; elapsed = 00:00:18 . Memory (MB): peak = 2248.891 ; gain = 676.621
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
@
%s
*synth2(
&Start Applying XDC Timing Constraints
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:24 ; elapsed = 00:00:26 . Memory (MB): peak = 2553.129 ; gain = 980.859
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
4
%s
*synth2
Start Timing Optimization
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
~Finished Timing Optimization : Time (s): cpu = 00:00:24 ; elapsed = 00:00:26 . Memory (MB): peak = 2575.273 ; gain = 1003.004
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
3
%s
*synth2
Start Technology Mapping
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2
}Finished Technology Mapping : Time (s): cpu = 00:00:24 ; elapsed = 00:00:26 . Memory (MB): peak = 2575.273 ; gain = 1003.004
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
-
%s
*synth2
Start IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
?
%s
*synth2'
%Start Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
B
%s
*synth2*
(Finished Flattening Before IO Insertion
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
6
%s
*synth2
Start Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Finished Final Netlist Cleanup
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2y
wFinished IO Insertion : Time (s): cpu = 00:00:28 ; elapsed = 00:00:30 . Memory (MB): peak = 2585.113 ; gain = 1012.844
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
=
%s
*synth2%
#Start Renaming Generated Instances
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:28 ; elapsed = 00:00:30 . Memory (MB): peak = 2585.113 ; gain = 1012.844
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
:
%s
*synth2"
 Start Rebuilding User Hierarchy
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:28 ; elapsed = 00:00:30 . Memory (MB): peak = 2585.113 ; gain = 1012.844
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Renaming Generated Ports
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:28 ; elapsed = 00:00:30 . Memory (MB): peak = 2585.113 ; gain = 1012.844
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
;
%s
*synth2#
!Start Handling Custom Attributes
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:28 ; elapsed = 00:00:30 . Memory (MB): peak = 2585.113 ; gain = 1012.844
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
8
%s
*synth2 
Start Renaming Generated Nets
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:28 ; elapsed = 00:00:30 . Memory (MB): peak = 2585.113 ; gain = 1012.844
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!

Static Shift Register Report:
h p
x
� 
�
%s
*synth2�
�+---------------------+--------------------------------------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+
h p
x
� 
�
%s
*synth2�
�|Module Name          | RTL Name                                                     | Length | Width | Reset Signal | Pull out first Reg | Pull out last Reg | SRL16E | SRLC32E | 
h p
x
� 
�
%s
*synth2�
�+---------------------+--------------------------------------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+
h p
x
� 
�
%s
*synth2�
�|image_statistics_top | laplacian_core/pixel_7_shift_reg/shift_reg_reg[0][3]         | 4      | 8     | YES          | NO                 | YES               | 8      | 0       | 
h p
x
� 
�
%s
*synth2�
�|image_statistics_top | laplacian_core/pixel_5_shift_reg/shift_reg_reg[0][3]         | 4      | 8     | YES          | NO                 | YES               | 8      | 0       | 
h p
x
� 
�
%s
*synth2�
�|image_statistics_top | statistics_core_laplacian/mean_shift_reg/shift_reg_reg[0][6] | 7      | 15    | YES          | NO                 | YES               | 15     | 0       | 
h p
x
� 
�
%s
*synth2�
�|image_statistics_top | statistics_core_gradient/mean_shift_reg/shift_reg_reg[0][6]  | 7      | 15    | YES          | NO                 | YES               | 15     | 0       | 
h p
x
� 
�
%s
*synth2�
�+---------------------+--------------------------------------------------------------+--------+-------+--------------+--------------------+-------------------+--------+---------+

h p
x
� 
�
%s
*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
9
%s
*synth2!
Start Writing Synthesis Report
h p
x
� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
/
%s
*synth2

Report BlackBoxes: 
h p
x
� 
A
%s
*synth2)
'+------+------------------+----------+
h p
x
� 
A
%s
*synth2)
'|      |BlackBox name     |Instances |
h p
x
� 
A
%s
*synth2)
'+------+------------------+----------+
h p
x
� 
A
%s
*synth2)
'|1     |dsp_macro_add_22b |         4|
h p
x
� 
A
%s
*synth2)
'|2     |dsp_macro_simd    |         4|
h p
x
� 
A
%s
*synth2)
'|3     |dsp_mac           |         2|
h p
x
� 
A
%s
*synth2)
'|4     |dsp_acum          |         2|
h p
x
� 
A
%s
*synth2)
'|5     |dsp_msub          |         2|
h p
x
� 
A
%s
*synth2)
'|6     |sqrt_cordic       |         2|
h p
x
� 
A
%s
*synth2)
'+------+------------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
B
%s*synth2*
(+------+-----------------------+------+
h px� 
B
%s*synth2*
(|      |Cell                   |Count |
h px� 
B
%s*synth2*
(+------+-----------------------+------+
h px� 
B
%s*synth2*
(|1     |dsp_acum_bbox          |     1|
h px� 
B
%s*synth2*
(|2     |dsp_acum_bbox_12       |     1|
h px� 
B
%s*synth2*
(|3     |dsp_mac_bbox           |     1|
h px� 
B
%s*synth2*
(|4     |dsp_mac_bbox_11        |     1|
h px� 
B
%s*synth2*
(|5     |dsp_macro_add_22b_bbox |     4|
h px� 
B
%s*synth2*
(|9     |dsp_macro_simd_bbox    |     4|
h px� 
B
%s*synth2*
(|13    |dsp_msub_bbox          |     1|
h px� 
B
%s*synth2*
(|14    |dsp_msub_bbox_13       |     1|
h px� 
B
%s*synth2*
(|15    |sqrt_cordic_bbox       |     1|
h px� 
B
%s*synth2*
(|16    |sqrt_cordic_bbox_14    |     1|
h px� 
B
%s*synth2*
(|17    |BUFG                   |     2|
h px� 
B
%s*synth2*
(|18    |CARRY8                 |    18|
h px� 
B
%s*synth2*
(|19    |LUT1                   |     3|
h px� 
B
%s*synth2*
(|20    |LUT2                   |   112|
h px� 
B
%s*synth2*
(|21    |LUT3                   |    52|
h px� 
B
%s*synth2*
(|22    |LUT4                   |    30|
h px� 
B
%s*synth2*
(|23    |LUT5                   |    97|
h px� 
B
%s*synth2*
(|24    |LUT6                   |    62|
h px� 
B
%s*synth2*
(|25    |SRL16E                 |    47|
h px� 
B
%s*synth2*
(|26    |SRLC32E                |     2|
h px� 
B
%s*synth2*
(|27    |FDCE                   |   981|
h px� 
B
%s*synth2*
(|28    |FDPE                   |     2|
h px� 
B
%s*synth2*
(|29    |FDRE                   |    47|
h px� 
B
%s*synth2*
(|30    |LD                     |    73|
h px� 
B
%s*synth2*
(|31    |IBUF                   |    20|
h px� 
B
%s*synth2*
(|32    |OBUF                   |    98|
h px� 
B
%s*synth2*
(+------+-----------------------+------+
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:28 ; elapsed = 00:00:30 . Memory (MB): peak = 2585.113 ; gain = 1012.844
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
`
%s
*synth2H
FSynthesis finished with 0 errors, 0 critical warnings and 3 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:18 ; elapsed = 00:00:25 . Memory (MB): peak = 2585.113 ; gain = 890.672
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:28 ; elapsed = 00:00:30 . Memory (MB): peak = 2585.113 ; gain = 1012.844
h p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0182

2593.1522
0.000Z17-268h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
113Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
0Z29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002

00:00:002

2626.0592
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2�
�  A total of 95 instances were transformed.
  BUFG => BUFGCE: 2 instances
  IBUF => IBUF (IBUFCTRL, INBUF): 20 instances
  LD => LDCE: 73 instances
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

320aacceZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
612
1222
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:342

00:00:532

2626.0592

2063.418Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0042

2626.0592
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2
}C:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image Stats/image_statistics/image_statistics.runs/synth_1/image_statistics_top.dcpZ17-1381h px� 
�
%s4*runtcl2�
~Executing : report_utilization -file image_statistics_top_utilization_synth.rpt -pb image_statistics_top_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Thu Jan 23 23:57:22 2025Z17-206h px� 


End Record