
U
Command: %s
53*	vivadotcl2$
"phys_opt_design -directive ExploreZ4-113h px� 
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
I
&Physical synthesis in post route mode 99*	vivadotclZ4-241h px� 
W
)Directive used for phys_opt_design is: %s68*	vivadotcl2	
ExploreZ4-137h px� 
R

Starting %s Task
103*constraints2
Initial Update TimingZ18-103h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:03 ; elapsed = 00:00:03 . Memory (MB): peak = 4692.594 ; gain = 0.000h px� 
�
qDesign worst setup slack (WNS) is greater than or equal to %s ns. Skipping all physical synthesis optimizations.
151*	vivadotcl2
0.000Z4-383h px� 
Z
7No setup violation found. The netlist was not modified.94*	vivadotclZ4-232h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 
~
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
112
02
02
0Z4-41h px� 
O
%s completed successfully
29*	vivadotcl2
phys_opt_designZ4-42h px� 
�
%s4*runtcl2�
�Executing : report_timing_summary -max_paths 10 -report_unconstrained -warn_on_violation -file top_timing_summary_postroute_physopted.rpt -pb top_timing_summary_postroute_physopted.pb -rpx top_timing_summary_postroute_physopted.rpx
h px� 
v
UpdateTimingParams:%s.
91*timing2=
; Speed grade: -2, Temperature grade: I, Delay Type: min_maxZ38-91h px� 
j
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
2Z38-191h px� 
�
}There are set_bus_skew constraint(s) in this design. Please run report_bus_skew to ensure that bus skew requirements are met.223*timingZ38-436h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
report_timing_summary: 2

00:00:072

00:00:062

4692.5942
0.000Z17-268h px� 
�
%s4*runtcl2�
�Executing : report_bus_skew -warn_on_violation -file top_bus_skew_postroute_physopted.rpt -pb top_bus_skew_postroute_physopted.pb -rpx top_bus_skew_postroute_physopted.rpx
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

00:00:012
00:00:00.6532

4692.5942
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PlaceDB: 2

00:00:042

00:00:102

4692.5942
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PulsedLatchDB: 2

00:00:002

00:00:002

4692.5942
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

00:00:002

00:00:012

4692.5942
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Netlist Cache: 2

00:00:002
00:00:00.8132

4692.5942
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Device Cache: 2

00:00:002
00:00:00.0842

4692.5942
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write Physdb Complete: 2

00:00:042

00:00:122

4692.5942
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2\
ZC:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.runs/impl_19/top_postroute_physopt.dcpZ17-1381h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
write_checkpoint: 2

00:00:052

00:00:152

4692.5942
0.000Z17-268h px� 


End Record