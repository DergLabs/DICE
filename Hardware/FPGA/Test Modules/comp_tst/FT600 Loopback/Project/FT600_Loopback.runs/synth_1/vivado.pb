
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
create_project: 2

00:00:042

00:00:092	
486.4302	
182.789Z17-268h px� 
�
Command: %s
1870*	planAhead2�
�read_checkpoint -auto_incremental -incremental {C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/utils_1/imports/synth_1/mst_fifo_top.dcp}Z12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2�
�C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/utils_1/imports/synth_1/mst_fifo_top.dcpZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
j
Command: %s
53*	vivadotcl29
7synth_design -top mst_fifo_top -part xcku3p-ffva676-2-eZ4-113h px� 
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
xcku3p-ffva676-2-eZ21-403h px� 
o
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
2Z8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
N
#Helper process launched with PID %s4824*oasys2
11452Z8-7075h px� 
�
%s*synth2{
yStarting RTL Elaboration : Time (s): cpu = 00:00:05 ; elapsed = 00:00:07 . Memory (MB): peak = 1980.207 ; gain = 418.199
h px� 
�
empty statement in %s5658*oasys2
sequential block2X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_fsm.v2
3898@Z8-9400h px� 
�
empty statement in %s5658*oasys2
sequential block2X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_fsm.v2
3918@Z8-9400h px� 
�
empty statement in %s5658*oasys2
sequential block2X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_fsm.v2
3928@Z8-9400h px� 
�
empty statement in %s5658*oasys2
sequential block2X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_fsm.v2
3938@Z8-9400h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
STREN2
wire2X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_top.v2
368@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
MLTCN2
wire2X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_top.v2
378@Z8-11241h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
ERDIS2
wire2X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_top.v2
388@Z8-11241h px� 
�
synthesizing module '%s'%s4497*oasys2
mst_fifo_top2
 2X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_top.v2
108@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
mst_fifo_io2
 2W
SC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_io.v2
98@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mst_fifo_io2
 2
02
12W
SC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_io.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mst_fifo_fsm2
 2X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_fsm.v2
98@Z8-6157h px� 
�
-case statement is not full and has no default155*oasys2X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_fsm.v2
1858@Z8-155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mst_fifo_fsm2
 2
02
12X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_fsm.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mst_pre_fet2
 2W
SC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_pre_fet.v2
108@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mst_pre_fet2
 2
02
12W
SC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_pre_fet.v2
108@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mst_data_chk2
 2X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_data_chk.v2
98@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mst_data_chk2
 2
02
12X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_data_chk.v2
98@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mst_data_gen2
 2X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_data_gen.v2
108@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mst_data_gen2
 2
02
12X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_data_gen.v2
108@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
mst_fifo_ctl2
 2X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_ctl.v2
118@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mst_fifo_ctl2
 2
02
12X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_ctl.v2
118@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
blk_mem_gen_12
 2�
�C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.runs/synth_1/.Xil/Vivado-5980-M_Laptop/realtime/blk_mem_gen_1_stub.v2
68@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
blk_mem_gen_12
 2
02
12�
�C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.runs/synth_1/.Xil/Vivado-5980-M_Laptop/realtime/blk_mem_gen_1_stub.v2
68@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
mst_fifo_top2
 2
02
12X
TC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/src/mst_fifo_top.v2
108@Z8-6155h px� 
n
+design %s has port %s driven by constant %s3447*oasys2
mst_fifo_top2

LED_TEST2
1Z8-3917h px� 
�
%s*synth2{
yFinished RTL Elaboration : Time (s): cpu = 00:00:07 ; elapsed = 00:00:10 . Memory (MB): peak = 2103.199 ; gain = 541.191
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:07 ; elapsed = 00:00:10 . Memory (MB): peak = 2103.199 ; gain = 541.191
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
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:07 ; elapsed = 00:00:10 . Memory (MB): peak = 2103.199 ; gain = 541.191
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
00:00:00.0492

2103.1992
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
�c:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.gen/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1/blk_mem_gen_1_in_context.xdc2

i6_ram	8Z20-848h px� 
�
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2�
�c:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.gen/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1/blk_mem_gen_1_in_context.xdc2

i6_ram	8Z20-847h px� 
�
Parsing XDC File [%s]
179*designutils2
{C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc8Z20-179h px� 
�
No ports matched '%s'.
584*	planAhead2
ERDIS2
{C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc2
438@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
MLTCN2
{C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc2
568@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
STREN2
{C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc2
628@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
ERDIS2
{C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc2
908@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
MLTCN2
{C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc2
928@Z12-584h px�
�
No ports matched '%s'.
584*	planAhead2
STREN2
{C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc2
988@Z12-584h px�
�
Finished Parsing XDC File [%s]
178*designutils2
{C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc8Z20-178h px� 
�
�One or more constraints failed evaluation while reading constraint file [%s] and the design contains unresolved black boxes. These constraints will be read post-synthesis (as long as their source constraint file is marked as used_in_implementation) and should be applied correctly then. You should review the constraints listed in the file [%s] and check the run log file to verify that these constraints were correctly applied.301*project2}
{C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc2 
.Xil/mst_fifo_top_propImpl.xdcZ1-498h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2}
{C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc2 
.Xil/mst_fifo_top_propImpl.xdcZ1-236h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

2174.6802
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
00:00:00.0212

2174.6802
0.000Z17-268h px� 
�
�Clock period '%s' specified during out-of-context synthesis of instance '%s' at clock pin '%s' is different from the actual clock period '%s', this can lead to different synthesis results.
203*timing2
20.0002
i6_ram2
clka2
10.000Z38-316h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:18 ; elapsed = 00:00:26 . Memory (MB): peak = 2176.668 ; gain = 614.660
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
!Loading part: xcku3p-ffva676-2-e
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
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:18 ; elapsed = 00:00:26 . Memory (MB): peak = 2176.668 ; gain = 614.660
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
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:18 ; elapsed = 00:00:26 . Memory (MB): peak = 2176.668 ; gain = 614.660
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
7
%s
*synth2
Start Preparing Guide Design
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
�
�The reference checkpoint %s is not suitable for use with incremental synthesis for this design. Please regenerate the checkpoint for this design with -incremental_synth switch in the same Vivado session that synth_design has been run. Synthesis will continue with the default flow4740*oasys2�
�C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/utils_1/imports/synth_1/mst_fifo_top.dcpZ8-6895h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2~
|Finished Doing Graph Differ : Time (s): cpu = 00:00:18 ; elapsed = 00:00:27 . Memory (MB): peak = 2176.668 ; gain = 614.660
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
�Finished Preparing Guide Design : Time (s): cpu = 00:00:18 ; elapsed = 00:00:27 . Memory (MB): peak = 2176.668 ; gain = 614.660
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
t
3inferred FSM for state register '%s' in module '%s'802*oasys2
nxt_state_reg2
mst_fifo_fsmZ8-802h px� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
z
%s
*synth2b
`                   State |                     New Encoding |                Previous Encoding 
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 

%s
*synth2
*
h p
x
� 
y
%s
*synth2a
_                    IDLE |                             0001 |                             0001
h p
x
� 
y
%s
*synth2a
_                    MTRD |                             0010 |                             0010
h p
x
� 
y
%s
*synth2a
_                    MDLE |                             0100 |                             0100
h p
x
� 
y
%s
*synth2a
_                    MTWR |                             1000 |                             1000
h p
x
� 
~
%s
*synth2f
d---------------------------------------------------------------------------------------------------
h p
x
� 
y
6No Re-encoding of one hot register '%s' in module '%s'3445*oasys2
nxt_state_reg2
mst_fifo_fsmZ8-3898h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:19 ; elapsed = 00:00:27 . Memory (MB): peak = 2176.668 ; gain = 614.660
h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
C
%s
*synth2+
)

Incremental Synthesis Report Summary:

h p
x
� 
<
%s
*synth2$
"1. Incremental synthesis run: no

h p
x
� 
O
%s
*synth27
5   Reason for not running incremental synthesis : 


h p
x
� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}4868*oasysZ8-7130h px� 
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
,	   2 Input   32 Bit       Adders := 8     
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit       Adders := 8     
h p
x
� 
F
%s
*synth2.
,	   2 Input   15 Bit       Adders := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input   14 Bit       Adders := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   13 Bit       Adders := 3     
h p
x
� 
F
%s
*synth2.
,	   2 Input   12 Bit       Adders := 6     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit       Adders := 9     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit       Adders := 5     
h p
x
� 
F
%s
*synth2.
,	   3 Input    2 Bit       Adders := 4     
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
.	               37 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	               36 Bit    Registers := 16    
h p
x
� 
H
%s
*synth20
.	               32 Bit    Registers := 10    
h p
x
� 
H
%s
*synth20
.	               15 Bit    Registers := 1     
h p
x
� 
H
%s
*synth20
.	               14 Bit    Registers := 2     
h p
x
� 
H
%s
*synth20
.	               13 Bit    Registers := 3     
h p
x
� 
H
%s
*synth20
.	               12 Bit    Registers := 6     
h p
x
� 
H
%s
*synth20
.	                4 Bit    Registers := 14    
h p
x
� 
H
%s
*synth20
.	                3 Bit    Registers := 4     
h p
x
� 
H
%s
*synth20
.	                2 Bit    Registers := 5     
h p
x
� 
H
%s
*synth20
.	                1 Bit    Registers := 23    
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
,	   2 Input   37 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input   37 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input   36 Bit        Muxes := 7     
h p
x
� 
F
%s
*synth2.
,	   2 Input   36 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   4 Input   32 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   2 Input   32 Bit        Muxes := 25    
h p
x
� 
F
%s
*synth2.
,	   2 Input   16 Bit        Muxes := 9     
h p
x
� 
F
%s
*synth2.
,	   2 Input   14 Bit        Muxes := 3     
h p
x
� 
F
%s
*synth2.
,	   4 Input   12 Bit        Muxes := 2     
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
,	   2 Input    4 Bit        Muxes := 16    
h p
x
� 
F
%s
*synth2.
,	   5 Input    4 Bit        Muxes := 1     
h p
x
� 
F
%s
*synth2.
,	   2 Input    3 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   3 Input    3 Bit        Muxes := 4     
h p
x
� 
F
%s
*synth2.
,	   2 Input    2 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   4 Input    1 Bit        Muxes := 5     
h p
x
� 
F
%s
*synth2.
,	   2 Input    1 Bit        Muxes := 66    
h p
x
� 
F
%s
*synth2.
,	   3 Input    1 Bit        Muxes := 2     
h p
x
� 
F
%s
*synth2.
,	   5 Input    1 Bit        Muxes := 17    
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
n
+design %s has port %s driven by constant %s3447*oasys2
mst_fifo_top2

LED_TEST2
1Z8-3917h px� 
l
%s
*synth2T
R---------------------------------------------------------------------------------
h p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:29 ; elapsed = 00:00:43 . Memory (MB): peak = 2176.668 ; gain = 614.660
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
�
%s
*synth2�
�Clock  not yet defined at line 47 of file {C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc}
h p
x
� 
�
%s
*synth2�
�Clock  not yet defined at line 48 of file {C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc}
h p
x
� 
�
%s
*synth2�
�Clock  not yet defined at line 49 of file {C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc}
h p
x
� 
�
%s
*synth2�
�Clock  not yet defined at line 50 of file {C:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.srcs/constrs_1/new/constraints.xdc}
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
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:37 ; elapsed = 00:00:58 . Memory (MB): peak = 2543.594 ; gain = 981.586
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
~Finished Timing Optimization : Time (s): cpu = 00:00:38 ; elapsed = 00:00:59 . Memory (MB): peak = 2574.309 ; gain = 1012.301
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
}Finished Technology Mapping : Time (s): cpu = 00:00:38 ; elapsed = 00:00:59 . Memory (MB): peak = 2579.789 ; gain = 1017.781
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
wFinished IO Insertion : Time (s): cpu = 00:00:41 ; elapsed = 00:01:05 . Memory (MB): peak = 2593.586 ; gain = 1031.578
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
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:41 ; elapsed = 00:01:06 . Memory (MB): peak = 2593.586 ; gain = 1031.578
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
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:41 ; elapsed = 00:01:06 . Memory (MB): peak = 2593.586 ; gain = 1031.578
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
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:41 ; elapsed = 00:01:06 . Memory (MB): peak = 2593.586 ; gain = 1031.578
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
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:41 ; elapsed = 00:01:06 . Memory (MB): peak = 2593.586 ; gain = 1031.578
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
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:41 ; elapsed = 00:01:06 . Memory (MB): peak = 2593.586 ; gain = 1031.578
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
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|      |BlackBox name |Instances |
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
=
%s
*synth2%
#|1     |blk_mem_gen_1 |         1|
h p
x
� 
=
%s
*synth2%
#+------+--------------+----------+
h p
x
� 
/
%s*synth2

Report Cell Usage: 
h px� 
7
%s*synth2
+------+------------+------+
h px� 
7
%s*synth2
|      |Cell        |Count |
h px� 
7
%s*synth2
+------+------------+------+
h px� 
7
%s*synth2
|1     |blk_mem_gen |     1|
h px� 
7
%s*synth2
|2     |BUFG        |     1|
h px� 
7
%s*synth2
|3     |LUT1        |    18|
h px� 
7
%s*synth2
|4     |LUT2        |    75|
h px� 
7
%s*synth2
|5     |LUT3        |    33|
h px� 
7
%s*synth2
|6     |LUT4        |    73|
h px� 
7
%s*synth2
|7     |LUT5        |    82|
h px� 
7
%s*synth2
|8     |LUT6        |   400|
h px� 
7
%s*synth2
|9     |MUXF7       |     2|
h px� 
7
%s*synth2
|10    |FDCE        |   826|
h px� 
7
%s*synth2
|11    |FDPE        |   123|
h px� 
7
%s*synth2
|12    |IBUF        |     7|
h px� 
7
%s*synth2
|13    |IOBUF       |    18|
h px� 
7
%s*synth2
|14    |OBUF        |     8|
h px� 
7
%s*synth2
+------+------------+------+
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
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:41 ; elapsed = 00:01:06 . Memory (MB): peak = 2593.586 ; gain = 1031.578
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
FSynthesis finished with 0 errors, 1 critical warnings and 2 warnings.
h p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:00:28 ; elapsed = 00:00:58 . Memory (MB): peak = 2593.586 ; gain = 958.109
h p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:00:41 ; elapsed = 00:01:06 . Memory (MB): peak = 2593.586 ; gain = 1031.578
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
00:00:00.0202

2605.6642
0.000Z17-268h px� 
T
-Analyzing %s Unisim elements for replacement
17*netlist2
28Z29-17h px� 
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

2624.4142
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2�
�  A total of 26 instances were transformed.
  BUFG => BUFGCE: 1 instance 
  IBUF => IBUF (IBUFCTRL, INBUF): 7 instances
  IOBUF => IOBUF (IBUFCTRL, INBUF, OBUFT): 18 instances
Z1-111h px� 
V
%Synth Design complete | Checksum: %s
562*	vivadotcl2

4e0f36eaZ4-1430h px� 
C
Releasing license: %s
83*common2
	SynthesisZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
412
152
12
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
synth_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
synth_design: 2

00:00:492

00:01:182

2624.4142

2067.867Z17-268h px� 
c
%s6*runtcl2G
ESynthesis results are not added to the cache due to CRITICAL_WARNING
h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0112

2624.4142
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2x
vC:/Users/micha/OneDrive/Desktop/DICE/Hardware/FPGA/FT600 Loopback/Project/FT600_Loopback.runs/synth_1/mst_fifo_top.dcpZ17-1381h px� 
�
%s4*runtcl2p
nExecuting : report_utilization -file mst_fifo_top_utilization_synth.rpt -pb mst_fifo_top_utilization_synth.pb
h px� 
\
Exiting %s at %s...
206*common2
Vivado2
Tue Nov 19 18:59:58 2024Z17-206h px� 


End Record