
?
Command: %s
53*	vivadotcl2
route_designZ4-113h px� 
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
^
,Running DRC as a precondition to command %s
22*	vivadotcl2
route_designZ4-22h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
D
DRC finished with %s
79*	vivadotcl2

0 ErrorsZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
D

Starting %s Task
103*constraints2	
RoutingZ18-103h px� 
k
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
8Z35-254h px� 
L

Phase %s%s
101*constraints2
1 2
Build RT DesignZ18-101h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
Nodegraph reading from file.  2

00:00:012
00:00:00.7732

3887.2622
0.000Z17-268h px� 
I
%s*common20
.Phase 1 Build RT Design | Checksum: 2b5ca0212
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:06 ; elapsed = 00:00:04 . Memory (MB): peak = 3887.262 ; gain = 0.000h px� 
R

Phase %s%s
101*constraints2
2 2
Router InitializationZ18-101h px� 
W

Phase %s%s
101*constraints2
2.1 2
Fix Topology ConstraintsZ18-101h px� 
T
%s*common2;
9Phase 2.1 Fix Topology Constraints | Checksum: 2b5ca0212
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:06 ; elapsed = 00:00:04 . Memory (MB): peak = 3887.262 ; gain = 0.000h px� 
P

Phase %s%s
101*constraints2
2.2 2
Pre Route CleanupZ18-101h px� 
M
%s*common24
2Phase 2.2 Pre Route Cleanup | Checksum: 2b5ca0212
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:06 ; elapsed = 00:00:04 . Memory (MB): peak = 3887.262 ; gain = 0.000h px� 
W

Phase %s%s
101*constraints2
2.3 2
Global Clock Net RoutingZ18-101h px� 
T
%s*common2;
9Phase 2.3 Global Clock Net Routing | Checksum: 2c1b1f1ab
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:09 ; elapsed = 00:00:06 . Memory (MB): peak = 3954.180 ; gain = 66.918h px� 
L

Phase %s%s
101*constraints2
2.4 2
Update TimingZ18-101h px� 
I
%s*common20
.Phase 2.4 Update Timing | Checksum: 1dfe935c4
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:10 ; elapsed = 00:00:07 . Memory (MB): peak = 3954.180 ; gain = 66.918h px� 
z
Intermediate Timing Summary %s164*route29
7| WNS=-6.958 | TNS=-98.264| WHS=-3.147 | THS=-302.754|
Z35-416h px� 
Y

Phase %s%s
101*constraints2
2.5 2
Update Timing for Bus SkewZ18-101h px� 
N

Phase %s%s
101*constraints2
2.5.1 2
Update TimingZ18-101h px� 
K
%s*common22
0Phase 2.5.1 Update Timing | Checksum: 1e7f3eac3
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:13 ; elapsed = 00:00:09 . Memory (MB): peak = 3954.180 ; gain = 66.918h px� 
y
Intermediate Timing Summary %s164*route28
6| WNS=-6.958 | TNS=-98.330| WHS=N/A    | THS=N/A    |
Z35-416h px� 
V
%s*common2=
;Phase 2.5 Update Timing for Bus Skew | Checksum: 21848176a
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:13 ; elapsed = 00:00:09 . Memory (MB): peak = 3954.180 ; gain = 66.918h px� 
O
%s*common26
4Phase 2 Router Initialization | Checksum: 2658ee197
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:14 ; elapsed = 00:00:09 . Memory (MB): peak = 4003.207 ; gain = 115.945h px� 
L

Phase %s%s
101*constraints2
3 2
Initial RoutingZ18-101h px� 
M

Phase %s%s
101*constraints2
3.1 2
Global RoutingZ18-101h px� 
J
%s*common21
/Phase 3.1 Global Routing | Checksum: 2658ee197
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:14 ; elapsed = 00:00:09 . Memory (MB): peak = 4003.207 ; gain = 115.945h px� 
R

Phase %s%s
101*constraints2
3.2 2
Initial Net RoutingZ18-101h px� 
O
%s*common26
4Phase 3.2 Initial Net Routing | Checksum: 1f589385f
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:17 . Memory (MB): peak = 4003.207 ; gain = 115.945h px� 
I
%s*common20
.Phase 3 Initial Routing | Checksum: 1b33d1238
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:25 ; elapsed = 00:00:17 . Memory (MB): peak = 4003.207 ; gain = 115.945h px� 
�	
>Design has %s pins with tight setup and hold constraints.

%s
244*route2
1252�
�The top 5 pins with tight setup and hold constraints:

+====================+===================+======================================================================+
| Launch Setup Clock | Launch Hold Clock | Pin                                                                  |
+====================+===================+======================================================================+
| byte_clk           | byte_clk          | pixel_processor/output_reformatter/input_pixel_count_meta1_reg[5]/D  |
| byte_clk           | byte_clk          | pixel_processor/output_reformatter/input_pixel_count_meta1_reg[4]/D  |
| byte_clk           | byte_clk          | pixel_processor/output_reformatter/input_pixel_count_meta1_reg[3]/D  |
| byte_clk           | byte_clk          | pixel_processor/output_reformatter/input_pixel_count_meta1_reg[8]/D  |
| byte_clk           | byte_clk          | pixel_processor/output_reformatter/input_pixel_count_meta1_reg[10]/D |
+--------------------+-------------------+----------------------------------------------------------------------+

File with complete list of pins: tight_setup_hold_pins.txt
Z35-580h px� 
O

Phase %s%s
101*constraints2
4 2
Rip-up And RerouteZ18-101h px� 
Q

Phase %s%s
101*constraints2
4.1 2
Global Iteration 0Z18-101h px� 
{
Intermediate Timing Summary %s164*route2:
8| WNS=-6.962 | TNS=-212.302| WHS=-1.701 | THS=-246.572|
Z35-416h px� 
N
%s*common25
3Phase 4.1 Global Iteration 0 | Checksum: 1e72598e6
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:04:20 ; elapsed = 00:02:41 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
Q

Phase %s%s
101*constraints2
4.2 2
Global Iteration 1Z18-101h px� 
z
Intermediate Timing Summary %s164*route29
7| WNS=-6.962 | TNS=-290.641| WHS=N/A    | THS=N/A    |
Z35-416h px� 
N
%s*common25
3Phase 4.2 Global Iteration 1 | Checksum: 226c196b7
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:04:23 ; elapsed = 00:02:43 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
Q

Phase %s%s
101*constraints2
4.3 2
Global Iteration 2Z18-101h px� 
z
Intermediate Timing Summary %s164*route29
7| WNS=-6.962 | TNS=-286.180| WHS=N/A    | THS=N/A    |
Z35-416h px� 
N
%s*common25
3Phase 4.3 Global Iteration 2 | Checksum: 1f718a0fb
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:04:23 ; elapsed = 00:02:43 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
L
%s*common23
1Phase 4 Rip-up And Reroute | Checksum: 1f718a0fb
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:04:23 ; elapsed = 00:02:43 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
X

Phase %s%s
101*constraints2
5 2
Delay and Skew OptimizationZ18-101h px� 
L

Phase %s%s
101*constraints2
5.1 2
Delay CleanUpZ18-101h px� 
N

Phase %s%s
101*constraints2
5.1.1 2
Update TimingZ18-101h px� 
K
%s*common22
0Phase 5.1.1 Update Timing | Checksum: 1a866958b
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:04:24 ; elapsed = 00:02:43 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
z
Intermediate Timing Summary %s164*route29
7| WNS=-6.962 | TNS=-286.180| WHS=-0.190 | THS=-0.759 |
Z35-416h px� 
N

Phase %s%s
101*constraints2
5.1.2 2
Update TimingZ18-101h px� 
K
%s*common22
0Phase 5.1.2 Update Timing | Checksum: 2439469e5
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:04:24 ; elapsed = 00:02:44 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
z
Intermediate Timing Summary %s164*route29
7| WNS=-6.962 | TNS=-286.180| WHS=-0.190 | THS=-0.759 |
Z35-416h px� 
I
%s*common20
.Phase 5.1 Delay CleanUp | Checksum: 220894016
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:05:23 ; elapsed = 00:03:04 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
V

Phase %s%s
101*constraints2
5.2 2
Clock Skew OptimizationZ18-101h px� 
S
%s*common2:
8Phase 5.2 Clock Skew Optimization | Checksum: 220894016
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:05:23 ; elapsed = 00:03:04 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
U
%s*common2<
:Phase 5 Delay and Skew Optimization | Checksum: 220894016
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:05:23 ; elapsed = 00:03:04 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
J

Phase %s%s
101*constraints2
6 2
Post Hold FixZ18-101h px� 
L

Phase %s%s
101*constraints2
6.1 2
Hold Fix IterZ18-101h px� 
N

Phase %s%s
101*constraints2
6.1.1 2
Update TimingZ18-101h px� 
K
%s*common22
0Phase 6.1.1 Update Timing | Checksum: 263bc1393
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:05:24 ; elapsed = 00:03:04 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
z
Intermediate Timing Summary %s164*route29
7| WNS=-6.962 | TNS=-297.628| WHS=-0.190 | THS=-0.552 |
Z35-416h px� 
I
%s*common20
.Phase 6.1 Hold Fix Iter | Checksum: 2f9cd084c
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:25 ; elapsed = 00:04:27 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
^

Phase %s%s
101*constraints2
6.2 2!
Non Free Resource Hold Fix IterZ18-101h px� 
[
%s*common2B
@Phase 6.2 Non Free Resource Hold Fix Iter | Checksum: 27c7edad0
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:25 ; elapsed = 00:04:27 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
�
�The router encountered %s pins that are both setup-critical and hold-critical and tried to fix hold violations at the expense of setup slack. Such pins are:
%s201*route2
772�
�	pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/prim_noinit.ram/DEVICE_8SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM18.ram/RSTRAMB
	pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[10].ram.r/prim_noinit.ram/DEVICE_8SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/RSTRAMB
	pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[10].ram.r/prim_noinit.ram/DEVICE_8SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/RSTRAMB
	pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[11].ram.r/prim_noinit.ram/DEVICE_8SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/RSTRAMB
	pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[11].ram.r/prim_noinit.ram/DEVICE_8SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/RSTRAMB
	pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[12].ram.r/prim_noinit.ram/DEVICE_8SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/RSTRAMB
	pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[12].ram.r/prim_noinit.ram/DEVICE_8SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/RSTRAMB
	pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/prim_noinit.ram/DEVICE_8SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/RSTRAMB
	pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/prim_noinit.ram/DEVICE_8SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/RSTRAMB
	pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/prim_noinit.ram/DEVICE_8SERIES.NO_BMM_INFO.TRUE_DP.SIMPLE_PRIM36.ram/RSTRAMB
	.. and 67 more pins.
Z35-468h px� 
G
%s*common2.
,Phase 6 Post Hold Fix | Checksum: 27c7edad0
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:25 ; elapsed = 00:04:27 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
K

Phase %s%s
101*constraints2
7 2
Route finalizeZ18-101h px� 
H
%s*common2/
-Phase 7 Route finalize | Checksum: 27c7edad0
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:26 ; elapsed = 00:04:27 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
R

Phase %s%s
101*constraints2
8 2
Verifying routed netsZ18-101h px� 
O
%s*common26
4Phase 8 Verifying routed nets | Checksum: 27c7edad0
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:26 ; elapsed = 00:04:27 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
N

Phase %s%s
101*constraints2
9 2
Depositing RoutesZ18-101h px� 
K
%s*common22
0Phase 9 Depositing Routes | Checksum: 27c7edad0
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:26 ; elapsed = 00:04:27 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
K

Phase %s%s
101*constraints2
10 2
Resolve XTalkZ18-101h px� 
H
%s*common2/
-Phase 10 Resolve XTalk | Checksum: 27c7edad0
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:26 ; elapsed = 00:04:27 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
P

Phase %s%s
101*constraints2
11 2
Post Router TimingZ18-101h px� 
M

Phase %s%s
101*constraints2
11.1 2
Update TimingZ18-101h px� 
J
%s*common21
/Phase 11.1 Update Timing | Checksum: 2717d5fbb
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:27 ; elapsed = 00:04:27 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
v
Estimated Timing Summary %s
57*route29
7| WNS=-6.962 | TNS=-308.949| WHS=0.013  | THS=0.000  |
Z35-57h px� 
B
!Router estimated timing not met.
128*routeZ35-328h px� 
M
%s*common24
2Phase 11 Post Router Timing | Checksum: 2717d5fbb
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:27 ; elapsed = 00:04:27 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
Z

Phase %s%s
101*constraints2
12 2
Physical Synthesis in RouterZ18-101h px� 
a

Phase %s%s
101*constraints2
12.1 2#
!Physical Synthesis InitializationZ18-101h px� 
�
:%s %s Timing Summary | WNS=%s | TNS=%s | WHS=%s | THS=%s |342*physynth2	
Current2
 2
-6.9622

-308.6172
0.0132
0.000Z32-668h px� 
^
%s*common2E
CPhase 12.1 Physical Synthesis Initialization | Checksum: 2717d5fbb
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:33 ; elapsed = 00:04:32 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
�
�WARNING: Physical Optimization has determined that the magnitude of the negative slack is too large and it is highly unlikely that slack will be improved. Post-Route Physical Optimization is most effective when WNS is above -0.5ns400*physynthZ32-745h px� 
Z

Phase %s%s
101*constraints2
12.2 2
Critical Path OptimizationZ18-101h px� 
�
:%s %s Timing Summary | WNS=%s | TNS=%s | WHS=%s | THS=%s |342*physynth2	
Current2
 2
-6.9622

-308.6172
0.0132
0.000Z32-668h px� 
�
CPath group WNS did not improve. Path group: %s. Processed net: %s.
525*physynth2

byte_clk26
reister_stage0/signal0_oreister_stage0/signal0_o8Z32-953h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-6.9572

byte_clk2j
2mipi_subsystem/mipi_dphy/IBUFDS_DPHY_inst/LPRX_O_P2mipi_subsystem/mipi_dphy/IBUFDS_DPHY_inst/LPRX_O_P8Z32-952h px� 
�
CPath group WNS did not improve. Path group: %s. Processed net: %s.
525*physynth2

byte_clk2j
2mipi_subsystem/mipi_dphy/IBUFDS_DPHY_inst/LPRX_O_P2mipi_subsystem/mipi_dphy/IBUFDS_DPHY_inst/LPRX_O_P8Z32-953h px� 
�
CPath group WNS did not improve. Path group: %s. Processed net: %s.
525*physynth2

byte_clk2 
dphy_clk_i[1]dphy_clk_i[1]8Z32-953h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.2412
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[13].ram.r/prim_noinit.ram/doutb[0]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[13].ram.r/prim_noinit.ram/doutb[0]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.2202
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[9].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[9].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.1922
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[13].ram.r/prim_noinit.ram/doutb[0]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[13].ram.r/prim_noinit.ram/doutb[0]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.1712
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[9].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[9].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.1572
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.1342
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[13].ram.r/prim_noinit.ram/doutb[0]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[13].ram.r/prim_noinit.ram/doutb[0]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.1292
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.1222
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[9].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[9].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.1162
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.1162
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.1052
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/prim_noinit.ram/doutb[0]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/prim_noinit.ram/doutb[0]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0872
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0852
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0742
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0672
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[13].ram.r/prim_noinit.ram/doutb[0]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[13].ram.r/prim_noinit.ram/doutb[0]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0672
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0592
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/prim_noinit.ram/doutb[0]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/prim_noinit.ram/doutb[0]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0592
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0562
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0442
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0382
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[9].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[9].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0372
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[7].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0262
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[12].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[12].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0222
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/even_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/even_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0102
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0042
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-4.0042
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-3.9912
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/prim_noinit.ram/doutb[0]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/prim_noinit.ram/doutb[0]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-3.9772
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
AImproved path group WNS = %s. Path group: %s. Processed net: %s.
524*physynth2
-3.9762
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/even_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/even_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/prim_noinit.ram/doutb[8]8Z32-952h px� 
�
CPath group WNS did not improve. Path group: %s. Processed net: %s.
525*physynth2
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/prim_noinit.ram/doutb[8]�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/prim_noinit.ram/doutb[8]8Z32-953h px� 
�
CPath group WNS did not improve. Path group: %s. Processed net: %s.
525*physynth2
mutli_pixel_clk_x2�
�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[13].ram.r/prim_noinit.ram/ram_rstram_b�pixel_processor/output_reformatter/odd_line/U0/inst_blk_mem_gen/gnbram.gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[13].ram.r/prim_noinit.ram/ram_rstram_b8Z32-953h px� 
�
CPath group WNS did not improve. Path group: %s. Processed net: %s.
525*physynth2
clk_297m_clk_wiz_02B
hdmi_controller/video_data[20]hdmi_controller/video_data[20]8Z32-953h px� 
�
CPath group WNS did not improve. Path group: %s. Processed net: %s.
525*physynth2
**async_default**2,
reset_i_IBUF_inst/Oreset_i_IBUF_inst/O8Z32-953h px� 
�
CPath group WNS did not improve. Path group: %s. Processed net: %s.
525*physynth2
**async_default**20
reset_i_IBUF_inst/OUTreset_i_IBUF_inst/OUT8Z32-953h px� 
�
CPath group WNS did not improve. Path group: %s. Processed net: %s.
525*physynth2
**async_default**2
reset_ireset_i8Z32-953h px� 
�
:%s %s Timing Summary | WNS=%s | TNS=%s | WHS=%s | THS=%s |342*physynth2	
Current2
 2
-6.9572

-303.9302
0.0002
0.000Z32-668h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0032

6108.3362
0.000Z17-268h px� 
W
%s*common2>
<Phase 12.2 Critical Path Optimization | Checksum: 190462666
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:36 ; elapsed = 00:04:35 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0032

6108.3362
0.000Z17-268h px� 
�
OPost Physical Optimization Timing Summary | WNS=%s | TNS=%s | WHS=%s | THS=%s |343*physynth2
-6.9572

-303.9302
0.0002
0.000Z32-669h px� 
W
%s*common2>
<Phase 12 Physical Synthesis in Router | Checksum: 1ce88e30f
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:36 ; elapsed = 00:04:35 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
@
Router Completed Successfully
2*	routeflowZ35-16h px� 
Y

Phase %s%s
101*constraints2
13 2
Post-Route Event ProcessingZ18-101h px� 
V
%s*common2=
;Phase 13 Post-Route Event Processing | Checksum: 1c1f1343d
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:36 ; elapsed = 00:04:35 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
E
%s*common2,
*Ending Routing Task | Checksum: 1c1f1343d
h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:07:36 ; elapsed = 00:04:35 . Memory (MB): peak = 6108.336 ; gain = 2221.074h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
2232
92
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
route_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
route_design: 2

00:07:392

00:04:372

6108.3362

2221.074Z17-268h px� 
�
%s4*runtcl2�
�Executing : report_drc -file mipi_csi_top_v2_drc_routed.rpt -pb mipi_csi_top_v2_drc_routed.pb -rpx mipi_csi_top_v2_drc_routed.rpx
h px� 
�
Command: %s
53*	vivadotcl2w
ureport_drc -file mipi_csi_top_v2_drc_routed.rpt -pb mipi_csi_top_v2_drc_routed.pb -rpx mipi_csi_top_v2_drc_routed.rpxZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
�
#The results of DRC are in file %s.
586*	vivadotcl2�
_C:/Users/johnh/Desktop/camera_test_v2/camera_test_v2.runs/impl_1/mipi_csi_top_v2_drc_routed.rpt_C:/Users/johnh/Desktop/camera_test_v2/camera_test_v2.runs/impl_1/mipi_csi_top_v2_drc_routed.rpt8Z2-168h px� 
J
%s completed successfully
29*	vivadotcl2

report_drcZ4-42h px� 
�
%s4*runtcl2�
�Executing : report_methodology -file mipi_csi_top_v2_methodology_drc_routed.rpt -pb mipi_csi_top_v2_methodology_drc_routed.pb -rpx mipi_csi_top_v2_methodology_drc_routed.rpx
h px� 
�
Command: %s
53*	vivadotcl2�
�report_methodology -file mipi_csi_top_v2_methodology_drc_routed.rpt -pb mipi_csi_top_v2_methodology_drc_routed.pb -rpx mipi_csi_top_v2_methodology_drc_routed.rpxZ4-113h px� 
�
J%s: No clock object specified, the clocks will be automatically identified581*constraints2
set_input_delay2_
[C:/Users/johnh/Desktop/camera_test_v2/camera_test_v2.srcs/constrs_2/new/mipi_csi_top_v2.xdc2
1828@Z18-632h px� 
�
J%s: No clock object specified, the clocks will be automatically identified581*constraints2
set_output_delay2_
[C:/Users/johnh/Desktop/camera_test_v2/camera_test_v2.srcs/constrs_2/new/mipi_csi_top_v2.xdc2
1838@Z18-632h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�
�User defined clock exists on pin %s%s%s%s%s%s and will prevent any subsequent automatic derivation of generated clocks on that pin. If the user defined clock specifies '-add', any existing auto-derived clocks on that pin are retained.
3*timing2Z
*mipi_subsystem/mipi_dphy/BUFGCE_DIV_inst/O*mipi_subsystem/mipi_dphy/BUFGCE_DIV_inst/O2
 2
 2
 2
 2
 8Z38-3h px� 
G
$Running Methodology with %s threads
74*drc2
2Z23-133h px� 
�
2The results of Report Methodology are in file %s.
609*	vivadotcl2�
kC:/Users/johnh/Desktop/camera_test_v2/camera_test_v2.runs/impl_1/mipi_csi_top_v2_methodology_drc_routed.rptkC:/Users/johnh/Desktop/camera_test_v2/camera_test_v2.runs/impl_1/mipi_csi_top_v2_methodology_drc_routed.rpt8Z2-1520h px� 
R
%s completed successfully
29*	vivadotcl2
report_methodologyZ4-42h px� 
�
%s4*runtcl2�
�Executing : report_power -file mipi_csi_top_v2_power_routed.rpt -pb mipi_csi_top_v2_power_summary_routed.pb -rpx mipi_csi_top_v2_power_routed.rpx
h px� 
�
Command: %s
53*	vivadotcl2�
�report_power -file mipi_csi_top_v2_power_routed.rpt -pb mipi_csi_top_v2_power_summary_routed.pb -rpx mipi_csi_top_v2_power_routed.rpxZ4-113h px� 
�
J%s: No clock object specified, the clocks will be automatically identified581*constraints2
set_input_delay2_
[C:/Users/johnh/Desktop/camera_test_v2/camera_test_v2.srcs/constrs_2/new/mipi_csi_top_v2.xdc2
1828@Z18-632h px� 
�
J%s: No clock object specified, the clocks will be automatically identified581*constraints2
set_output_delay2_
[C:/Users/johnh/Desktop/camera_test_v2/camera_test_v2.srcs/constrs_2/new/mipi_csi_top_v2.xdc2
1838@Z18-632h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�
�User defined clock exists on pin %s%s%s%s%s%s and will prevent any subsequent automatic derivation of generated clocks on that pin. If the user defined clock specifies '-add', any existing auto-derived clocks on that pin are retained.
3*timing2Z
*mipi_subsystem/mipi_dphy/BUFGCE_DIV_inst/O*mipi_subsystem/mipi_dphy/BUFGCE_DIV_inst/O2
 2
 2
 2
 2
 8Z38-3h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
�Detected over-assertion of set/reset/preset/clear net with high fanouts, power estimation might not be accurate. Please run Tool - Power Constraint Wizard to set proper switching activities for control signals.282*powerZ33-332h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
2372
122
02
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
report_powerZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
report_power: 2

00:00:072

00:00:072

6108.3362
0.000Z17-268h px� 
�
%s4*runtcl2m
kExecuting : report_route_status -file mipi_csi_top_v2_route_status.rpt -pb mipi_csi_top_v2_route_status.pb
h px� 
�
%s4*runtcl2�
�Executing : report_timing_summary -max_paths 10 -report_unconstrained -file mipi_csi_top_v2_timing_summary_routed.rpt -pb mipi_csi_top_v2_timing_summary_routed.pb -rpx mipi_csi_top_v2_timing_summary_routed.rpx -warn_on_violation 
h px� 
v
UpdateTimingParams:%s.
91*timing2=
; Speed grade: -2, Temperature grade: I, Delay Type: min_maxZ38-91h px� 
j
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
2Z38-191h px� 
�
rThe design failed to meet the timing requirements. Please see the %s report for details on the timing violations.
188*timing2
timing summaryZ38-282h px� 
�
}There are set_bus_skew constraint(s) in this design. Please run report_bus_skew to ensure that bus skew requirements are met.223*timingZ38-436h px� 
v
%s4*runtcl2Z
XExecuting : report_incremental_reuse -file mipi_csi_top_v2_incremental_reuse_routed.rpt
h px� 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px� 
v
%s4*runtcl2Z
XExecuting : report_clock_utilization -file mipi_csi_top_v2_clock_utilization_routed.rpt
h px� 
�
%s4*runtcl2�
�Executing : report_bus_skew -warn_on_violation -file mipi_csi_top_v2_bus_skew_routed.rpt -pb mipi_csi_top_v2_bus_skew_routed.pb -rpx mipi_csi_top_v2_bus_skew_routed.rpx
h px� 
v
UpdateTimingParams:%s.
91*timing2=
; Speed grade: -2, Temperature grade: I, Delay Type: min_maxZ38-91h px� 
j
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
2Z38-191h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.0182

6108.3362
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PlaceDB: 2

00:00:012
00:00:00.3602

6108.3362
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PulsedLatchDB: 2

00:00:002

00:00:002

6108.3362
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
00:00:00.1232

6108.3362
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Netlist Cache: 2

00:00:002
00:00:00.0112

6108.3362
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Device Cache: 2

00:00:002
00:00:00.0502

6108.3362
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write Physdb Complete: 2

00:00:012
00:00:00.5632

6108.3362
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2]
[C:/Users/johnh/Desktop/camera_test_v2/camera_test_v2.runs/impl_1/mipi_csi_top_v2_routed.dcpZ17-1381h px� 


End Record