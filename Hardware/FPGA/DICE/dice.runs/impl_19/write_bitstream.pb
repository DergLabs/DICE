
`
Command: %s
1870*	planAhead2+
)open_checkpoint top_postroute_physopt.dcpZ12-2866h px� 
L

Starting %s Task
103*constraints2
open_checkpointZ18-103h px� 
�

%s
*constraints2`
^Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.040 . Memory (MB): peak = 316.555 ; gain = 5.668h px� 
G
Loading part %s157*device2
xcku3p-ffva676-2-iZ21-403h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.2272

1554.3792
0.000Z17-268h px� 
U
-Analyzing %s Unisim elements for replacement
17*netlist2
388Z29-17h px� 
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
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read ShapeDB Complete: 2

00:00:002
00:00:00.0592

1675.9962
5.352Z17-268h px� 
L
*Restoring timing data from binary archive.264*timingZ38-478h px� 
F
$Binary timing data restore complete.265*timingZ38-479h px� 
L
*Restoring constraints from binary archive.481*projectZ1-856h px� 
E
#Binary constraint restore complete.478*projectZ1-853h px� 
K
!Start Reading Physical Databases.35885*designutilsZ20-5722h px� 
:
Reading placement.
206*designutilsZ20-206h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read Netlist Cache: 2

00:00:002
00:00:00.0212

2054.1252
0.000Z17-268h px� 
D
Reading placer database...
1602*designutilsZ20-1892h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read Device Cache: 2

00:00:002
00:00:00.0372

2054.1252
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read PlaceDB: 2

00:00:012
00:00:00.5392

2072.4772
18.352Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read PulsedLatchDB: 2

00:00:002

00:00:002

2072.4772
0.000Z17-268h px� 
8
Reading routing.
207*designutilsZ20-207h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read RouteStorage: 2

00:00:002
00:00:00.2212

2100.1522
27.676Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Read Physdb Files: 2

00:00:012
00:00:00.8432

2100.1522
46.027Z17-268h px� 
x
7Restored from archive | CPU: %s secs | Memory: %s MB |
1612*designutils2

1.0000002

0.000000Z20-1924h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Finished XDEF File Restore: 2

00:00:012
00:00:00.8962

2100.1522
50.945Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0042

2441.5122
0.000Z17-268h px� 
�
!Unisim Transformation Summary:
%s111*project2�
�  A total of 70 instances were transformed.
  DSP48E2 => DSP48E2 (DSP_ALU, DSP_A_B_DATA, DSP_C_DATA, DSP_MULTIPLIER, DSP_M_DATA, DSP_OUTPUT, DSP_PREADD, DSP_PREADD_DATA): 37 instances
  DSP48E2 => DSP48E2 (inverted pins: RSTA, RSTALLCARRYIN, RSTALUMODE, RSTB, RSTC, RSTCTRL, RSTD, RSTINMODE, RSTM, RSTP) (DSP_ALU, DSP_A_B_DATA, DSP_C_DATA, DSP_MULTIPLIER, DSP_M_DATA, DSP_OUTPUT, DSP_PREADD, DSP_PREADD_DATA): 2 instances
  IBUF => IBUF (IBUFCTRL, INBUF): 4 instances
  IBUFDS => IBUFDS (DIFFINBUF, IBUFCTRL): 1 instance 
  IOBUF => IOBUF (IBUFCTRL, INBUF, OBUFT): 18 instances
  RAM32M => RAM32M (RAMD32(x6), RAMS32(x2)): 6 instances
  SRLC32E => SRL16E: 2 instances
Z1-111h px� 
o
'Checkpoint was created with %s build %s378*project2
Vivado v2023.2 (64-bit)2	
4029153Z1-604h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
open_checkpoint: 2

00:00:272

00:00:292

2441.5122

2137.184Z17-268h px� 
Q
Command: %s
53*	vivadotcl2 
write_bitstream -force top.bitZ4-113h px� 
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
f
,Running DRC as a precondition to command %s
1349*	planAhead2
write_bitstreamZ12-1349h px� 
>
Refreshing IP repositories
234*coregenZ19-234h px� 
G
"No user IP repositories specified
1154*coregenZ19-1704h px� 
j
"Loaded Vivado IP repository '%s'.
1332*coregen2!
C:/Xilinx/Vivado/2023.2/data/ipZ19-2313h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
Vgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult0	Vgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult02�
 "�
^gen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult0/A[29:0]Xgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult0/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
Vgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult0	Vgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult02�
 "�
^gen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult0/B[17:0]Xgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult0/B2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
Zgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_vsum_mac/mult_reg0	Zgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_vsum_mac/mult_reg02�
 "�
bgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_vsum_mac/mult_reg0/A[29:0]\gen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_vsum_mac/mult_reg0/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
Zgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_vsum_mac/mult_reg0	Zgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_vsum_mac/mult_reg02�
 "�
bgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_vsum_mac/mult_reg0/B[17:0]\gen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_vsum_mac/mult_reg0/B2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
Wgen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult0	Wgen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult02�
 "�
_gen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult0/A[29:0]Ygen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult0/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
Wgen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult0	Wgen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult02�
 "�
_gen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult0/B[17:0]Ygen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult0/B2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
[gen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_vsum_mac/mult_reg0	[gen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_vsum_mac/mult_reg02�
 "�
cgen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_vsum_mac/mult_reg0/A[29:0]]gen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_vsum_mac/mult_reg0/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
[gen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_vsum_mac/mult_reg0	[gen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_vsum_mac/mult_reg02�
 "�
cgen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_vsum_mac/mult_reg0/B[17:0]]gen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_vsum_mac/mult_reg0/B2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
>lossy_comp_core/core_0/col_dct/dsp4_add/simd_add.out0_reg_simd	>lossy_comp_core/core_0/col_dct/dsp4_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_0/col_dct/dsp4_add/simd_add.out0_reg_simd/A[29:0]@lossy_comp_core/core_0/col_dct/dsp4_add/simd_add.out0_reg_simd/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
>lossy_comp_core/core_0/row_dct/dsp4_add/simd_add.out0_reg_simd	>lossy_comp_core/core_0/row_dct/dsp4_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_0/row_dct/dsp4_add/simd_add.out0_reg_simd/A[29:0]@lossy_comp_core/core_0/row_dct/dsp4_add/simd_add.out0_reg_simd/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
>lossy_comp_core/core_1/row_dct/dsp4_add/simd_add.out0_reg_simd	>lossy_comp_core/core_1/row_dct/dsp4_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_1/row_dct/dsp4_add/simd_add.out0_reg_simd/A[29:0]@lossy_comp_core/core_1/row_dct/dsp4_add/simd_add.out0_reg_simd/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
>lossy_comp_core/core_1/row_dct/dsp4_add/simd_add.out0_reg_simd	>lossy_comp_core/core_1/row_dct/dsp4_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_1/row_dct/dsp4_add/simd_add.out0_reg_simd/C[47:0]@lossy_comp_core/core_1/row_dct/dsp4_add/simd_add.out0_reg_simd/C2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2�
 "�
>lossy_comp_core/core_2/row_dct/dsp4_add/simd_add.out0_reg_simd	>lossy_comp_core/core_2/row_dct/dsp4_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_2/row_dct/dsp4_add/simd_add.out0_reg_simd/A[29:0]@lossy_comp_core/core_2/row_dct/dsp4_add/simd_add.out0_reg_simd/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2p
 "l
3rgb_to_ycrcb/dsp_b_madd/gen_dsp_madd_unsigned.mult0	3rgb_to_ycrcb/dsp_b_madd/gen_dsp_madd_unsigned.mult02z
 "v
;rgb_to_ycrcb/dsp_b_madd/gen_dsp_madd_unsigned.mult0/A[29:0]5rgb_to_ycrcb/dsp_b_madd/gen_dsp_madd_unsigned.mult0/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2p
 "l
3rgb_to_ycrcb/dsp_b_madd/gen_dsp_madd_unsigned.mult0	3rgb_to_ycrcb/dsp_b_madd/gen_dsp_madd_unsigned.mult02z
 "v
;rgb_to_ycrcb/dsp_b_madd/gen_dsp_madd_unsigned.mult0/B[17:0]5rgb_to_ycrcb/dsp_b_madd/gen_dsp_madd_unsigned.mult0/B2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2N
 "J
"rgb_to_ycrcb/dsp_cb_presub_mult/p0	"rgb_to_ycrcb/dsp_cb_presub_mult/p02X
 "T
*rgb_to_ycrcb/dsp_cb_presub_mult/p0/A[29:0]$rgb_to_ycrcb/dsp_cb_presub_mult/p0/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2N
 "J
"rgb_to_ycrcb/dsp_cb_presub_mult/p0	"rgb_to_ycrcb/dsp_cb_presub_mult/p02X
 "T
*rgb_to_ycrcb/dsp_cb_presub_mult/p0/B[17:0]$rgb_to_ycrcb/dsp_cb_presub_mult/p0/B2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2N
 "J
"rgb_to_ycrcb/dsp_cr_presub_mult/p0	"rgb_to_ycrcb/dsp_cr_presub_mult/p02X
 "T
*rgb_to_ycrcb/dsp_cr_presub_mult/p0/A[29:0]$rgb_to_ycrcb/dsp_cr_presub_mult/p0/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2N
 "J
"rgb_to_ycrcb/dsp_cr_presub_mult/p0	"rgb_to_ycrcb/dsp_cr_presub_mult/p02X
 "T
*rgb_to_ycrcb/dsp_cr_presub_mult/p0/B[17:0]$rgb_to_ycrcb/dsp_cr_presub_mult/p0/B2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2p
 "l
3rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult0	3rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult02z
 "v
;rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult0/A[29:0]5rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult0/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2p
 "l
3rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult0	3rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult02z
 "v
;rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult0/B[17:0]5rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult0/B2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2p
 "l
3rgb_to_ycrcb/dsp_r_madd/gen_dsp_madd_unsigned.mult0	3rgb_to_ycrcb/dsp_r_madd/gen_dsp_madd_unsigned.mult02z
 "v
;rgb_to_ycrcb/dsp_r_madd/gen_dsp_madd_unsigned.mult0/A[29:0]5rgb_to_ycrcb/dsp_r_madd/gen_dsp_madd_unsigned.mult0/A2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
fInput pipelining: DSP %s input %s is not pipelined. Pipelining DSP48 input will improve performance.%s*DRC2p
 "l
3rgb_to_ycrcb/dsp_r_madd/gen_dsp_madd_unsigned.mult0	3rgb_to_ycrcb/dsp_r_madd/gen_dsp_madd_unsigned.mult02z
 "v
;rgb_to_ycrcb/dsp_r_madd/gen_dsp_madd_unsigned.mult0/B[17:0]5rgb_to_ycrcb/dsp_r_madd/gen_dsp_madd_unsigned.mult0/B2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPIP-2h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
Vgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult0	Vgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult02�
 "�
^gen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult0/P[47:0]Xgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
Wgen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult0	Wgen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult02�
 "�
_gen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult0/P[47:0]Ygen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_0/col_dct/dsp1_add/simd_add.out0_reg_simd	>lossy_comp_core/core_0/col_dct/dsp1_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_0/col_dct/dsp1_add/simd_add.out0_reg_simd/P[47:0]@lossy_comp_core/core_0/col_dct/dsp1_add/simd_add.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_0/col_dct/dsp2_sub/simd_sub.out0_reg_simd	>lossy_comp_core/core_0/col_dct/dsp2_sub/simd_sub.out0_reg_simd2�
 "�
Flossy_comp_core/core_0/col_dct/dsp2_sub/simd_sub.out0_reg_simd/P[47:0]@lossy_comp_core/core_0/col_dct/dsp2_sub/simd_sub.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_0/col_dct/dsp3_add/simd_add.out0_reg_simd	>lossy_comp_core/core_0/col_dct/dsp3_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_0/col_dct/dsp3_add/simd_add.out0_reg_simd/P[47:0]@lossy_comp_core/core_0/col_dct/dsp3_add/simd_add.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_0/row_dct/dsp1_add/simd_add.out0_reg_simd	>lossy_comp_core/core_0/row_dct/dsp1_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_0/row_dct/dsp1_add/simd_add.out0_reg_simd/P[47:0]@lossy_comp_core/core_0/row_dct/dsp1_add/simd_add.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_0/row_dct/dsp2_sub/simd_sub.out0_reg_simd	>lossy_comp_core/core_0/row_dct/dsp2_sub/simd_sub.out0_reg_simd2�
 "�
Flossy_comp_core/core_0/row_dct/dsp2_sub/simd_sub.out0_reg_simd/P[47:0]@lossy_comp_core/core_0/row_dct/dsp2_sub/simd_sub.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_0/row_dct/dsp3_add/simd_add.out0_reg_simd	>lossy_comp_core/core_0/row_dct/dsp3_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_0/row_dct/dsp3_add/simd_add.out0_reg_simd/P[47:0]@lossy_comp_core/core_0/row_dct/dsp3_add/simd_add.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_1/col_dct/dsp1_add/simd_add.out0_reg_simd	>lossy_comp_core/core_1/col_dct/dsp1_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_1/col_dct/dsp1_add/simd_add.out0_reg_simd/P[47:0]@lossy_comp_core/core_1/col_dct/dsp1_add/simd_add.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_1/col_dct/dsp2_sub/simd_sub.out0_reg_simd	>lossy_comp_core/core_1/col_dct/dsp2_sub/simd_sub.out0_reg_simd2�
 "�
Flossy_comp_core/core_1/col_dct/dsp2_sub/simd_sub.out0_reg_simd/P[47:0]@lossy_comp_core/core_1/col_dct/dsp2_sub/simd_sub.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_1/col_dct/dsp3_add/simd_add.out0_reg_simd	>lossy_comp_core/core_1/col_dct/dsp3_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_1/col_dct/dsp3_add/simd_add.out0_reg_simd/P[47:0]@lossy_comp_core/core_1/col_dct/dsp3_add/simd_add.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_1/row_dct/dsp1_add/simd_add.out0_reg_simd	>lossy_comp_core/core_1/row_dct/dsp1_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_1/row_dct/dsp1_add/simd_add.out0_reg_simd/P[47:0]@lossy_comp_core/core_1/row_dct/dsp1_add/simd_add.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_1/row_dct/dsp2_sub/simd_sub.out0_reg_simd	>lossy_comp_core/core_1/row_dct/dsp2_sub/simd_sub.out0_reg_simd2�
 "�
Flossy_comp_core/core_1/row_dct/dsp2_sub/simd_sub.out0_reg_simd/P[47:0]@lossy_comp_core/core_1/row_dct/dsp2_sub/simd_sub.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_1/row_dct/dsp3_add/simd_add.out0_reg_simd	>lossy_comp_core/core_1/row_dct/dsp3_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_1/row_dct/dsp3_add/simd_add.out0_reg_simd/P[47:0]@lossy_comp_core/core_1/row_dct/dsp3_add/simd_add.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_2/col_dct/dsp1_add/simd_add.out0_reg_simd	>lossy_comp_core/core_2/col_dct/dsp1_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_2/col_dct/dsp1_add/simd_add.out0_reg_simd/P[47:0]@lossy_comp_core/core_2/col_dct/dsp1_add/simd_add.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_2/col_dct/dsp2_sub/simd_sub.out0_reg_simd	>lossy_comp_core/core_2/col_dct/dsp2_sub/simd_sub.out0_reg_simd2�
 "�
Flossy_comp_core/core_2/col_dct/dsp2_sub/simd_sub.out0_reg_simd/P[47:0]@lossy_comp_core/core_2/col_dct/dsp2_sub/simd_sub.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_2/col_dct/dsp3_add/simd_add.out0_reg_simd	>lossy_comp_core/core_2/col_dct/dsp3_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_2/col_dct/dsp3_add/simd_add.out0_reg_simd/P[47:0]@lossy_comp_core/core_2/col_dct/dsp3_add/simd_add.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_2/row_dct/dsp1_add/simd_add.out0_reg_simd	>lossy_comp_core/core_2/row_dct/dsp1_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_2/row_dct/dsp1_add/simd_add.out0_reg_simd/P[47:0]@lossy_comp_core/core_2/row_dct/dsp1_add/simd_add.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_2/row_dct/dsp2_sub/simd_sub.out0_reg_simd	>lossy_comp_core/core_2/row_dct/dsp2_sub/simd_sub.out0_reg_simd2�
 "�
Flossy_comp_core/core_2/row_dct/dsp2_sub/simd_sub.out0_reg_simd/P[47:0]@lossy_comp_core/core_2/row_dct/dsp2_sub/simd_sub.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2�
 "�
>lossy_comp_core/core_2/row_dct/dsp3_add/simd_add.out0_reg_simd	>lossy_comp_core/core_2/row_dct/dsp3_add/simd_add.out0_reg_simd2�
 "�
Flossy_comp_core/core_2/row_dct/dsp3_add/simd_add.out0_reg_simd/P[47:0]@lossy_comp_core/core_2/row_dct/dsp3_add/simd_add.out0_reg_simd/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2N
 "J
"rgb_to_ycrcb/dsp_cb_presub_mult/p0	"rgb_to_ycrcb/dsp_cb_presub_mult/p02X
 "T
*rgb_to_ycrcb/dsp_cb_presub_mult/p0/P[47:0]$rgb_to_ycrcb/dsp_cb_presub_mult/p0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2N
 "J
"rgb_to_ycrcb/dsp_cr_presub_mult/p0	"rgb_to_ycrcb/dsp_cr_presub_mult/p02X
 "T
*rgb_to_ycrcb/dsp_cr_presub_mult/p0/P[47:0]$rgb_to_ycrcb/dsp_cr_presub_mult/p0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�PREG Output pipelining: DSP %s output %s is not pipelined (PREG=0). Pipelining the DSP48 output will improve performance and often saves power so it is suggested whenever possible to fully pipeline this function.  If this DSP48 function was inferred, it is suggested to describe an additional register stage after this function.  If the DSP48 was instantiated in the design, it is suggested to set the PREG attribute to 1.%s*DRC2p
 "l
3rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult0	3rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult02z
 "v
;rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult0/P[47:0]5rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-3h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2�
 "�
Zgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_vsum_mac/mult_reg0	Zgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_vsum_mac/mult_reg02�
 "�
bgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_vsum_mac/mult_reg0/P[47:0]\gen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_vsum_mac/mult_reg0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-4h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2�
 "�
[gen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_vsum_mac/mult_reg0	[gen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_vsum_mac/mult_reg02�
 "�
cgen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_vsum_mac/mult_reg0/P[47:0]]gen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_vsum_mac/mult_reg0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-4h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2p
 "l
3rgb_to_ycrcb/dsp_b_madd/gen_dsp_madd_unsigned.mult0	3rgb_to_ycrcb/dsp_b_madd/gen_dsp_madd_unsigned.mult02z
 "v
;rgb_to_ycrcb/dsp_b_madd/gen_dsp_madd_unsigned.mult0/P[47:0]5rgb_to_ycrcb/dsp_b_madd/gen_dsp_madd_unsigned.mult0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-4h px� 
�
�MREG Output pipelining: DSP %s multiplier stage %s is not pipelined (MREG=0). Pipelining the multiplier function will improve performance and will save significant power so it is suggested whenever possible to fully pipeline this function.  If this multiplier was inferred, it is suggested to describe an additional register stage after this function.  If there is no registered adder/accumulator following the multiply function, two pipeline stages are suggested to allow both the MREG and PREG registers to be used.  If the DSP48 was instantiated in the design, it is suggested to set both the MREG and PREG attributes to 1 when performing multiply functions.%s*DRC2p
 "l
3rgb_to_ycrcb/dsp_r_madd/gen_dsp_madd_unsigned.mult0	3rgb_to_ycrcb/dsp_r_madd/gen_dsp_madd_unsigned.mult02z
 "v
;rgb_to_ycrcb/dsp_r_madd/gen_dsp_madd_unsigned.mult0/P[47:0]5rgb_to_ycrcb/dsp_r_madd/gen_dsp_madd_unsigned.mult0/P2+
 %DRC|Netlist|Instance|Pipeline|DSP48E28ZDPOP-4h px� 
�
`No routable loads: 10 net(s) have no routable loads. The problem bus(es) and/or net(s) are %s.%s*DRC2�
 "�
~input_memory_fifo/input_cdc_fifo/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.gr1_int.rfwft/aempty_fwft_i~input_memory_fifo/input_cdc_fifo/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.gr1_int.rfwft/aempty_fwft_i"�
}input_memory_fifo/input_cdc_fifo/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.gr1_int.rfwft/empty_fwft_i}input_memory_fifo/input_cdc_fifo/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gr1.gr1_int.rfwft/empty_fwft_i"�
jinput_memory_fifo/input_cdc_fifo/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.rd_rst_reg[2:0]einput_memory_fifo/input_cdc_fifo/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.rd_rst_reg"�
jinput_memory_fifo/input_cdc_fifo/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.wr_rst_reg[2:0]einput_memory_fifo/input_cdc_fifo/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/rstblk/ngwrdrst.grst.wr_rst_reg"�
tinput_memory_fifo/input_cdc_fifo/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gras.rsts/ram_empty_itinput_memory_fifo/input_cdc_fifo/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.rd/gras.rsts/ram_empty_i"�
sinput_memory_fifo/input_cdc_fifo/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/ram_full_isinput_memory_fifo/input_cdc_fifo/U0/inst_fifo_gen/gconvfifo.rf/grf.rf/gntv_or_sync_fifo.gl0.wr/gwas.wsts/ram_full_i2+
 %DRC|Implementation|Routing|Chip Level8Z	RTSTAT-10h px� 
�
�enum_PREG_0_connects_CEP_GND: %s: When the DSP48E2 PREG attribute is set to 0, the CEP input pin should be tied to GND to save power.%s*DRC2�
 "�
Vgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult0	Vgen_image_statistics.image_statistics_core/statistics_core_gradient/dsp_var_msub/mult02/
 )DRC|Netlist|Instance|Required Pin|DSP48E28Z	REQP-1680h px� 
�
�enum_PREG_0_connects_CEP_GND: %s: When the DSP48E2 PREG attribute is set to 0, the CEP input pin should be tied to GND to save power.%s*DRC2�
 "�
Wgen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult0	Wgen_image_statistics.image_statistics_core/statistics_core_laplacian/dsp_var_msub/mult02/
 )DRC|Netlist|Instance|Required Pin|DSP48E28Z	REQP-1680h px� 
�
�enum_PREG_0_connects_CEP_GND: %s: When the DSP48E2 PREG attribute is set to 0, the CEP input pin should be tied to GND to save power.%s*DRC2N
 "J
"rgb_to_ycrcb/dsp_cb_presub_mult/p0	"rgb_to_ycrcb/dsp_cb_presub_mult/p02/
 )DRC|Netlist|Instance|Required Pin|DSP48E28Z	REQP-1680h px� 
�
�enum_PREG_0_connects_CEP_GND: %s: When the DSP48E2 PREG attribute is set to 0, the CEP input pin should be tied to GND to save power.%s*DRC2N
 "J
"rgb_to_ycrcb/dsp_cr_presub_mult/p0	"rgb_to_ycrcb/dsp_cr_presub_mult/p02/
 )DRC|Netlist|Instance|Required Pin|DSP48E28Z	REQP-1680h px� 
�
�enum_PREG_0_connects_CEP_GND: %s: When the DSP48E2 PREG attribute is set to 0, the CEP input pin should be tied to GND to save power.%s*DRC2p
 "l
3rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult0	3rgb_to_ycrcb/dsp_g_mult/gen_dsp_mult_unsigned.mult02/
 )DRC|Netlist|Instance|Required Pin|DSP48E28Z	REQP-1680h px� 
c
DRC finished with %s
1905*	planAhead2%
#0 Errors, 51 Warnings, 5 AdvisoriesZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
W
)Running write_bitstream with %s threads.
1750*designutils2
2Z20-2272h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
H
Writing bitstream %s...
11*	bitstream2
	./top.bitZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
�
�WebTalk data collection is mandatory when using a ULT device. To see the specific WebTalk data collected for your design, open the usage_statistics_webtalk.html or usage_statistics_webtalk.xml file in the implementation directory.698*projectZ1-1876h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 

G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
282
512
02
0Z4-41h px� 
O
%s completed successfully
29*	vivadotcl2
write_bitstreamZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
write_bitstream: 2

00:00:272

00:00:232

2872.1212	
430.609Z17-268h px� 


End Record