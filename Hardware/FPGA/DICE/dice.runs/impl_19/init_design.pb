
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:082

00:00:092	
485.2422	
177.750Z17-268h px� 
`
Command: %s
53*	vivadotcl2/
-link_design -top top -part xcku3p-ffva676-2-iZ4-113h px� 
U
#Design is defaulting to srcset: %s
437*	planAhead2
	sources_1Z12-437h px� 
X
&Design is defaulting to constrset: %s
434*	planAhead2
	constrs_1Z12-434h px� 
G
Loading part %s157*device2
xcku3p-ffva676-2-iZ21-403h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2d
bc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/sys_clk_mmcm/sys_clk_mmcm.dcp2
clocking_gen.sys_clkZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2n
lc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/dsp_macro_add_22b/dsp_macro_add_22b.dcp2G
Egen_image_statistics.image_statistics_core/gradient_core/sobel_x_dsp1Z1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2h
fc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/dsp_macro_simd/dsp_macro_simd.dcp2H
Fgen_image_statistics.image_statistics_core/laplacian_core/dsp_add1_11bZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2b
`c:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/sqrt_cordic/sqrt_cordic.dcp2R
Pgen_image_statistics.image_statistics_core/statistics_core_gradient/std_dev_sqrtZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2j
hc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/input_data_fifo/input_data_fifo.dcp2"
 input_memory_fifo/input_cdc_fifoZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2t
rc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/input_pixel_hold_ram/input_pixel_hold_ram.dcp2"
 input_memory_fifo/pixel_hold_ramZ1-454h px� 
�
-Reading design checkpoint '%s' for cell '%s'
275*project2n
lc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/output_buffer_ram/output_buffer_ram.dcp2
output_memory/output_memoryZ1-454h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.4352

1641.8202
0.000Z17-268h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
410Z29-17h px� 
X
2Unisim Transformation completed in %s CPU seconds
28*netlist2
1Z29-28h px� 
T
Netlist was created with %s %s291*project2
Vivado2
2023.2Z1-479h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2l
hc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/input_data_fifo/input_data_fifo.xdc2'
#input_memory_fifo/input_cdc_fifo/U0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2l
hc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/input_data_fifo/input_data_fifo.xdc2'
#input_memory_fifo/input_cdc_fifo/U0	8Z20-847h px� 
�
ZCould not find module '%s'. The XDC file %s will not be read for any cell of this module.
1082*designutils2
ila_02n
lc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/ila_0/ila_v6_2/constraints/ila_impl.xdcZ20-1280h px� 
�
ZCould not find module '%s'. The XDC file %s will not be read for any cell of this module.
1082*designutils2
ila_02i
gc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/ila_0/ila_v6_2/constraints/ila.xdcZ20-1280h px� 
�
NCould not find module '%s'. The XDC file %s will not be read for this module.
1083*designutils2
vio_02V
Tc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/vio_0/vio_0.xdcZ20-1281h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2l
hc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/sys_clk_mmcm/sys_clk_mmcm_board.xdc2
clocking_gen.sys_clk/inst	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2l
hc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/sys_clk_mmcm/sys_clk_mmcm_board.xdc2
clocking_gen.sys_clk/inst	8Z20-847h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2f
bc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/sys_clk_mmcm/sys_clk_mmcm.xdc2
clocking_gen.sys_clk/inst	8Z20-848h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_clock: 2

00:00:062

00:00:062

1800.8522
35.008Z17-268h px� 
�
%Done setting XDC timing constraints.
35*timing2f
bc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/sys_clk_mmcm/sys_clk_mmcm.xdc2
548@Z38-35h px� 
�
Deriving generated clocks
2*timing2f
bc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/sys_clk_mmcm/sys_clk_mmcm.xdc2
548@Z38-2h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
get_clocks: 2

00:00:122

00:00:142

2120.4182	
319.566Z17-268h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2f
bc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/sys_clk_mmcm/sys_clk_mmcm.xdc2
clocking_gen.sys_clk/inst	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2Z
VC:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.srcs/constrs_1/new/constraints.xdc8Z20-179h px� 
�
No clocks matched '%s'.
627*	planAhead2
sysclk2Z
VC:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.srcs/constrs_1/new/constraints.xdc2
168@Z12-627h px� 
�
"No clocks found for command '%s'.
1008*	planAhead2U
Sget_clocks -of_objects [get_pins clocking_gen.sys_clk/inst/mmcme4_adv_inst/CLKOUT1]2Z
VC:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.srcs/constrs_1/new/constraints.xdc2
178@Z12-1008h px� 
�
aNo clocks found. Please use 'create_clock' or 'create_generated_clock' command to create clocks.
626*	planAhead2Z
VC:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.srcs/constrs_1/new/constraints.xdc2
178@Z12-626h px� 
�
3There are no ChipScope debug cores in this design.
750*	planAhead2Z
VC:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.srcs/constrs_1/new/constraints.xdc2
2398@Z12-750h px� 
�
"'%s' expects at least one object.
55*common2
set_property2Z
VC:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.srcs/constrs_1/new/constraints.xdc2
2398@Z17-55h px�
�
3There are no ChipScope debug cores in this design.
750*	planAhead2Z
VC:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.srcs/constrs_1/new/constraints.xdc2
2408@Z12-750h px� 
�
"'%s' expects at least one object.
55*common2
set_property2Z
VC:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.srcs/constrs_1/new/constraints.xdc2
2408@Z17-55h px�
�
3There are no ChipScope debug cores in this design.
750*	planAhead2Z
VC:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.srcs/constrs_1/new/constraints.xdc2
2418@Z12-750h px� 
�
"'%s' expects at least one object.
55*common2
set_property2Z
VC:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.srcs/constrs_1/new/constraints.xdc2
2418@Z17-55h px�
�
Debug core '%s' was not found.
1419*	planAhead2	
dbg_hub2Z
VC:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.srcs/constrs_1/new/constraints.xdc2
2428@Z12-1419h px�
�
Finished Parsing XDC File [%s]
178*designutils2Z
VC:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.srcs/constrs_1/new/constraints.xdc8Z20-178h px� 
�
$Parsing XDC File [%s] for cell '%s'
848*designutils2s
oc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/input_data_fifo/input_data_fifo_clocks.xdc2'
#input_memory_fifo/input_cdc_fifo/U0	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2s
oc:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/input_data_fifo/input_data_fifo_clocks.xdc2'
#input_memory_fifo/input_cdc_fifo/U0	8Z20-847h px� 
Z
2%s XPM XDC files have been applied to the design.
665*project2
7Z1-1714h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
�
|The CLOCK_DOMAINS attribute on the %s cell %s has been changed from %s to %s to match the clocking topology used for the %s.290*opt2
BRAM2�
�input_memory_fifo/pixel_hold_ram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram2
INDEPENDENT2
COMMON2
BRAMZ31-422h px� 
�
|The CLOCK_DOMAINS attribute on the %s cell %s has been changed from %s to %s to match the clocking topology used for the %s.290*opt2
BRAM2�
�input_memory_fifo/pixel_hold_ram/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/prim_noinit.ram/DEVICE_8SERIES.NO_BMM_INFO.SDP.SIMPLE_PRIM36.ram2
INDEPENDENT2
COMMON2
BRAMZ31-422h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0112

2120.4182
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2�
�  A total of 68 instances were transformed.
  DSP48E2 => DSP48E2 (DSP_ALU, DSP_A_B_DATA, DSP_C_DATA, DSP_MULTIPLIER, DSP_M_DATA, DSP_OUTPUT, DSP_PREADD, DSP_PREADD_DATA): 39 instances
  IBUF => IBUF (IBUFCTRL, INBUF): 4 instances
  IBUFDS => IBUFDS (DIFFINBUF, IBUFCTRL): 1 instance 
  IOBUF => IOBUF (IBUFCTRL, INBUF, OBUFT): 18 instances
  RAM32M => RAM32M (RAMD32(x6), RAMS32(x2)): 6 instances
Z1-111h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
202
52
72
0Z4-41h px� 
K
%s completed successfully
29*	vivadotcl2
link_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
link_design: 2

00:00:382

00:00:452

2120.4182

1561.188Z17-268h px� 


End Record