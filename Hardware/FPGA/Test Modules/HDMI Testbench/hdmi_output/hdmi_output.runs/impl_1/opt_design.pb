
=
Command: %s
53*	vivadotcl2

opt_designZ4-113h px� 
~
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
Implementation2
xcku3pZ17-347h px� 
n
0Got license for feature '%s' and/or device '%s'
310*common2
Implementation2
xcku3pZ17-349h px� 
\
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_designZ4-22h px� 
@

Starting %s Task
103*constraints2
DRCZ18-103h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
C
DRC finished with %s
272*project2

0 ErrorsZ1-461h px� 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:01 . Memory (MB): peak = 2019.422 ; gain = 0.000h px� 
U

Starting %s Task
103*constraints2
Cache Timing InformationZ18-103h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
V
%s*common2=
;Ending Cache Timing Information Task | Checksum: 108729857
h px� 
�

%s
*constraints2b
`Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.096 . Memory (MB): peak = 2030.648 ; gain = 11.227h px� 
O

Starting %s Task
103*constraints2
Logic OptimizationZ18-103h px� 
K

Phase %s%s
101*constraints2
1 2
InitializationZ18-101h px� 
_

Phase %s%s
101*constraints2
1.1 2"
 Core Generation And Design SetupZ18-101h px� 
d

Phase %s%s
101*constraints2
1.1.1 2%
#Generate And Synthesize Debug CoresZ18-101h px� 
Y
)Generating Script for core instance : %s 214*	chipscope2	
dbg_hubZ16-329h px� 
g
Generating IP %s for %s.
1712*coregen2
xilinx.com:ip:xsdbm:3.02

dbg_hub_CVZ19-3806h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2*
(Done building netlist checker database: 2

00:00:002

00:00:002

2416.1882
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0232

2416.1882
0.000Z17-268h px� 
`
%s*common2G
EPhase 1.1.1 Generate And Synthesize Debug Cores | Checksum: 8bf9882c
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
[
%s*common2B
@Phase 1.1 Core Generation And Design Setup | Checksum: 8bf9882c
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
a

Phase %s%s
101*constraints2
1.2 2$
"Setup Constraints And Sort NetlistZ18-101h px� 
]
%s*common2D
BPhase 1.2 Setup Constraints And Sort Netlist | Checksum: 8bf9882c
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
G
%s*common2.
,Phase 1 Initialization | Checksum: 8bf9882c
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
d

Phase %s%s
101*constraints2
2 2)
'Timer Update And Timing Data CollectionZ18-101h px� 
K

Phase %s%s
101*constraints2
2.1 2
Timer UpdateZ18-101h px� 
G
%s*common2.
,Phase 2.1 Timer Update | Checksum: 8bf9882c
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
U

Phase %s%s
101*constraints2
2.2 2
Timing Data CollectionZ18-101h px� 
Q
%s*common28
6Phase 2.2 Timing Data Collection | Checksum: 8bf9882c
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
`
%s*common2G
EPhase 2 Timer Update And Timing Data Collection | Checksum: 8bf9882c
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
E

Phase %s%s
101*constraints2
3 2

RetargetZ18-101h px� 
S
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
52
127Z31-138h px� 
9
Retargeted %s cell(s).
49*opt2
0Z31-49h px� 
A
%s*common2(
&Phase 3 Retarget | Checksum: 404efd2d
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
3
Retarget | Checksum: 404efd2d
*commonh px� 
d
.Phase %s created %s cells and removed %s cells267*opt2

Retarget2
02
11Z31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2

Retarget2
70Z31-1021h px� 
Q

Phase %s%s
101*constraints2
4 2
Constant propagationZ18-101h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
M
%s*common24
2Phase 4 Constant propagation | Checksum: 404efd2d
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
?
*Constant propagation | Checksum: 404efd2d
*commonh px� 
o
.Phase %s created %s cells and removed %s cells267*opt2
Constant propagation2
02
0Z31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Constant propagation2
46Z31-1021h px� 
B

Phase %s%s
101*constraints2
5 2
SweepZ18-101h px� 
?
%s*common2&
$Phase 5 Sweep | Checksum: 1057ae918
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
1
Sweep | Checksum: 1057ae918
*commonh px� 
`
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2
12
4Z31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Sweep2
887Z31-1021h px� 
N

Phase %s%s
101*constraints2
6 2
BUFG optimizationZ18-101h px� 
u
PPhase BUFG optimization inserted %s global clock buffer(s) for CLOCK_LOW_FANOUT.553*opt2
0Z31-1077h px� 
K
%s*common22
0Phase 6 BUFG optimization | Checksum: 1057ae918
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
=
(BUFG optimization | Checksum: 1057ae918
*commonh px� 
�
EPhase %s created %s cells of which %s are BUFGs and removed %s cells.395*opt2
BUFG optimization2
02
02
0Z31-662h px� 
X

Phase %s%s
101*constraints2
7 2
Shift Register OptimizationZ18-101h px� 
�
dSRL Remap converted %s SRLs to %s registers and converted %s registers of register chains to %s SRLs546*opt2
02
02
02
0Z31-1064h px� 
U
%s*common2<
:Phase 7 Shift Register Optimization | Checksum: 1057ae918
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
G
2Shift Register Optimization | Checksum: 1057ae918
*commonh px� 
v
.Phase %s created %s cells and removed %s cells267*opt2
Shift Register Optimization2
02
0Z31-389h px� 
T

Phase %s%s
101*constraints2
8 2
Post Processing NetlistZ18-101h px� 
Q
%s*common28
6Phase 8 Post Processing Netlist | Checksum: 1057ae918
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
C
.Post Processing Netlist | Checksum: 1057ae918
*commonh px� 
r
.Phase %s created %s cells and removed %s cells267*opt2
Post Processing Netlist2
02
0Z31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Post Processing Netlist2
54Z31-1021h px� 
I

Phase %s%s
101*constraints2
9 2
FinalizationZ18-101h px� 
j

Phase %s%s
101*constraints2
9.1 2-
+Finalizing Design Cores and Updating ShapesZ18-101h px� 
f
%s*common2M
KPhase 9.1 Finalizing Design Cores and Updating Shapes | Checksum: bcf33534
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
]

Phase %s%s
101*constraints2
9.2 2 
Verifying Netlist ConnectivityZ18-101h px� 
O

Starting %s Task
103*constraints2
Connectivity CheckZ18-103h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.003 . Memory (MB): peak = 2416.188 ; gain = 0.000h px� 
Y
%s*common2@
>Phase 9.2 Verifying Netlist Connectivity | Checksum: bcf33534
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
E
%s*common2,
*Phase 9 Finalization | Checksum: bcf33534
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
/
Opt_design Change Summary
*commonh px� 
/
=========================
*commonh px� 


*commonh px� 


*commonh px� 
�
z-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Phase                        |  #Cells created  |  #Cells Removed  |  #Constrained objects preventing optimizations  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Retarget                     |               0  |              11  |                                             70  |
|  Constant propagation         |               0  |               0  |                                             46  |
|  Sweep                        |               1  |               4  |                                            887  |
|  BUFG optimization            |               0  |               0  |                                              0  |
|  Shift Register Optimization  |               0  |               0  |                                              0  |
|  Post Processing Netlist      |               0  |               0  |                                             54  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
O
%s*common26
4Ending Logic Optimization Task | Checksum: bcf33534
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:01:46 . Memory (MB): peak = 2416.188 ; gain = 19.773h px� 
b
2Building netlist checker database with flags, 0x%s23991*constraints2
8Z18-11670h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2*
(Done building netlist checker database: 2

00:00:002

00:00:002

2416.1882
0.000Z17-268h px� 
O

Starting %s Task
103*constraints2
Power OptimizationZ18-103h px� 
a
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
2.00Z34-132h px� 
O
%s*common26
4Ending Power Optimization Task | Checksum: bcf33534
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.009 . Memory (MB): peak = 2416.188 ; gain = 0.000h px� 
J

Starting %s Task
103*constraints2
Final CleanupZ18-103h px� 
J
%s*common21
/Ending Final Cleanup Task | Checksum: bcf33534
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.001 . Memory (MB): peak = 2416.188 ; gain = 0.000h px� 
P

Starting %s Task
103*constraints2
Netlist ObfuscationZ18-103h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0012

2416.1882
0.000Z17-268h px� 
P
%s*common27
5Ending Netlist Obfuscation Task | Checksum: bcf33534
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.001 . Memory (MB): peak = 2416.188 ; gain = 0.000h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
422
02
12
0Z4-41h px� 
J
%s completed successfully
29*	vivadotcl2

opt_designZ4-42h px� 
l
4The following parameters have non-default value.
%s
395*common2
tcl.statsThresholdZ17-600h px� 
�
%s4*runtcl2u
sExecuting : report_drc -file hdmi_tx_top_drc_opted.rpt -pb hdmi_tx_top_drc_opted.pb -rpx hdmi_tx_top_drc_opted.rpx
h px� 
�
Command: %s
53*	vivadotcl2h
freport_drc -file hdmi_tx_top_drc_opted.rpt -pb hdmi_tx_top_drc_opted.pb -rpx hdmi_tx_top_drc_opted.rpxZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
�
#The results of DRC are in file %s.
586*	vivadotcl2�
vC:/Users/johnh/Desktop/DICE/Hardware/FPGA/HDMI Testbench/hdmi_output/hdmi_output.runs/impl_1/hdmi_tx_top_drc_opted.rptvC:/Users/johnh/Desktop/DICE/Hardware/FPGA/HDMI Testbench/hdmi_output/hdmi_output.runs/impl_1/hdmi_tx_top_drc_opted.rpt8Z2-168h px� 
J
%s completed successfully
29*	vivadotcl2

report_drcZ4-42h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0052

2419.3832
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PlaceDB: 2

00:00:002
00:00:00.0052

2419.3832
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PulsedLatchDB: 2

00:00:002

00:00:002

2419.3832
0.000Z17-268h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote RouteStorage: 2

00:00:002
00:00:00.0572

2419.3832
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Netlist Cache: 2

00:00:002

00:00:002

2419.3832
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Device Cache: 2

00:00:002
00:00:00.0572

2419.3832
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write Physdb Complete: 2

00:00:002
00:00:00.1362

2419.3832
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2r
pC:/Users/johnh/Desktop/DICE/Hardware/FPGA/HDMI Testbench/hdmi_output/hdmi_output.runs/impl_1/hdmi_tx_top_opt.dcpZ17-1381h px� 


End Record