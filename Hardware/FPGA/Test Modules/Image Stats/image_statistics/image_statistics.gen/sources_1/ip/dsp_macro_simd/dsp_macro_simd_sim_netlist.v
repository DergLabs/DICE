// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Jan 23 15:49:55 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image
//               Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_macro_simd/dsp_macro_simd_sim_netlist.v}
// Design      : dsp_macro_simd
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_macro_simd,dsp_macro_v1_0_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dsp_macro_v1_0_4,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module dsp_macro_simd
   (CLK,
    CE,
    SCLR,
    A,
    C,
    D,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [26:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [26:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [26:0]D;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [27:0]P;

  wire [26:0]A;
  wire [26:0]C;
  wire CE;
  wire CLK;
  wire [26:0]D;
  wire [27:0]P;
  wire SCLR;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "27" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "27" *) 
  (* C_D_WIDTH = "27" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "0" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "1" *) 
  (* C_HAS_CARRYCASCIN = "0" *) 
  (* C_HAS_CARRYCASCOUT = "0" *) 
  (* C_HAS_CARRYIN = "0" *) 
  (* C_HAS_CARRYOUT = "0" *) 
  (* C_HAS_CE = "1" *) 
  (* C_HAS_CEA = "0" *) 
  (* C_HAS_CEB = "0" *) 
  (* C_HAS_CEC = "0" *) 
  (* C_HAS_CECONCAT = "0" *) 
  (* C_HAS_CED = "0" *) 
  (* C_HAS_CEM = "0" *) 
  (* C_HAS_CEP = "0" *) 
  (* C_HAS_CESEL = "0" *) 
  (* C_HAS_CONCAT = "0" *) 
  (* C_HAS_D = "1" *) 
  (* C_HAS_INDEP_CE = "0" *) 
  (* C_HAS_INDEP_SCLR = "0" *) 
  (* C_HAS_PCIN = "0" *) 
  (* C_HAS_PCOUT = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SCLRA = "0" *) 
  (* C_HAS_SCLRB = "0" *) 
  (* C_HAS_SCLRC = "0" *) 
  (* C_HAS_SCLRCONCAT = "0" *) 
  (* C_HAS_SCLRD = "0" *) 
  (* C_HAS_SCLRM = "0" *) 
  (* C_HAS_SCLRP = "0" *) 
  (* C_HAS_SCLRSEL = "0" *) 
  (* C_LATENCY = "116" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000100111000010100001001" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "27" *) 
  (* C_REG_CONFIG = "00000000000010110000000011000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_SQUARE_FCN = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  dsp_macro_simd_dsp_macro_v1_0_4 U0
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_U0_ACOUT_UNCONNECTED[29:0]),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_U0_BCOUT_UNCONNECTED[17:0]),
        .C(C),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_U0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYOUT(NLW_U0_CARRYOUT_UNCONNECTED),
        .CE(CE),
        .CEA(1'b1),
        .CEA1(1'b1),
        .CEA2(1'b1),
        .CEA3(1'b1),
        .CEA4(1'b1),
        .CEB(1'b1),
        .CEB1(1'b1),
        .CEB2(1'b1),
        .CEB3(1'b1),
        .CEB4(1'b1),
        .CEC(1'b1),
        .CEC1(1'b1),
        .CEC2(1'b1),
        .CEC3(1'b1),
        .CEC4(1'b1),
        .CEC5(1'b1),
        .CECONCAT(1'b1),
        .CECONCAT3(1'b1),
        .CECONCAT4(1'b1),
        .CECONCAT5(1'b1),
        .CED(1'b1),
        .CED1(1'b1),
        .CED2(1'b1),
        .CED3(1'b1),
        .CEM(1'b1),
        .CEP(1'b1),
        .CESEL(1'b1),
        .CESEL1(1'b1),
        .CESEL2(1'b1),
        .CESEL3(1'b1),
        .CESEL4(1'b1),
        .CESEL5(1'b1),
        .CLK(CLK),
        .CONCAT({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .D(D),
        .P(P),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT(NLW_U0_PCOUT_UNCONNECTED[47:0]),
        .SCLR(SCLR),
        .SCLRA(1'b0),
        .SCLRB(1'b0),
        .SCLRC(1'b0),
        .SCLRCONCAT(1'b0),
        .SCLRD(1'b0),
        .SCLRM(1'b0),
        .SCLRP(1'b0),
        .SCLRSEL(1'b0),
        .SEL(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
EvYLTRfGsJFrKv/jfBtBFCAh6k6Rqq6R4eba0PctGnThuyO3nHmIS+Hfy0Q3SMrw8qHjtc3NwMNM
yTe0zMWBIb7CDjgR9jRVxxdDVi+x5oGyPFCdFoR2JE72bIqCAMNCuTxYeY4gnMKBE1ETpbxXKvMS
u6TR7d//1+vDSdorkZ8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
q7quPrmRZnr9XX3P0IBUTIBd6v5XJQBzA8nkHrWjbLmtjgOdTduOSvUn3TQOv/+jCCNIFBPZKWpI
4c4l64XX2sXAAYC/kIGuBrD437Met4AFhb22GIo4Kd46cR4kkzgFxTuEot3cQfcej7oU7FqbPDdF
B3oY2PI+tEW/O6N5I2UT9clzdeRjGHuU8ZAtG6uNksF9oIbmMYnd9Gd4IxtMr5kJszmDEpKV+dyN
tJnFlljBy0loALWD3AuAVG1rTjVeF/CHSCx7yP0qKxpHUCNt0BtFzfaRzWVI25ppkV+hCQDvLHJO
wybaFzy/cNy5fagQqiQDhsvLjezl+66uc3long==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
pnKFDiM5i4YvxiD/7ByjNqkNpFon+18O/mYf4e0cEZFE0X4BoojEqFPe0iX/ww33X60GF2eie4lR
2Fspjxe4HWf/JZjzlS4tj8ndZep4oK9vUcPNHrNDcgR5Ae+0Zjhes1HSi/qrB3rkIUwxPcTaa4rV
qOoUS1jTN21fDok6ICQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pDdHWV8RCArTpXTv9UEbd7VXwc3iw1ShwIXh36xk8ZKDFkD3Fk4LOQdc7zhsF716XPwhXKi/z5fC
dTTuVbkJdlQpyb5j7FwBXiNfQ+SaOFVVeOJSHk5bmmvWAFINQtOSwA9E8WwiwvMbSNQA5hBodNGD
dhv3G092vDHsYlNobgPZLytqAyhePkPR/0vBt1qDq6ol0fRcC252+piSH9iebAH3616rRRIeHJex
37wfZtB/i6jNSM1g05jzPO02gMPsSPzxi9+gsvkoW3WPTc7O2/NwrY5V+utYeg0UWOtz3ubuB7Gd
7kn0738kwh1/qho/mA3FK4oeNaqxtOIO7hWHhA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tqDjoJppG7/kcqhD53iYTXN5LetWm5t4+MNFqlTxkGW7KQW0ty51tI/YZKuQZxSSJoyB41dtSQ7T
htMJF9/cqnJyjAV7Uhh9sxCUm9on7dXmjX2JqO3HQNeQWGzuXfUxvN4lW5tgxLN8RKn99Vm21SDn
56jt2Ud81diTRCEvf/aSOP/N+Da/0tbmv1tf2f/EG8GgKK7tucnWlh4p72RiwQgt8xKRdppv+3tA
tGqL09v//+V26qB90YULYTEgvc8YKGNGNCnWve/8knkooXs35TZAkmVjOHMtN/xIPS42LCqgh6b7
RQtEgFATZ47xU/4aQHJqD+3lx/ayFTg4YyrpQw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bM+suLx0vPZeQAwBwEaiDrAIlQbgUU4XpLAU4smc9bk+ScaY4dtQkGDr/c9WKThOPjWUv5TzI/Go
vHTRAok7G8Z9faYGhnwwP1zO2GED0uLmAVICGwowEVtC741lDPVw/mgDKj+td099MfQx4QbW8Qwm
tZMtH7B3UU1rh/6JVlXSzNQTYa22m7dTH0DXep/Soa7W1KrmH8zrLZR6XLtFgDQvkFeXv2dqPpdQ
CHrPNwWEg/yOpPEd0KFfXk05ZVecc0Ea+MTXOiDTiafzE3JGmzCX4gFkwMYkAHB3w5xh7TVR3h84
iEJ8sqceerRDV+nIKczBBMz3iB0BmTD9sP4+xg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PBzmQMDcoXjdHYLtEU3LLGhq13vaBzpKg4lsU/QTnUE53oQLIWRekKBW/m9XUm+5UbTe+tgjeudC
Gd4PeLQWCWlm+Fu+qR48lnK+gJmN9qJeEWoh/2RygTK+F6pmtuNd25wVy50AenN2HA95oAltj5qj
+7BAYAuekkU0PU/4ibah3YjJGwu/WklhOE/qV/7AMVWOLRQ6MjGcVQqeVEPs3Vb9IQ2RXuMcypCn
0NRQ48ox5sk4tW8Pp3PiHS78WCPHhVPYuBXjUq1zImMgq/S8UMlNGuNX5Oi/MyERXrHd6Vin9UPt
jqA6vS8UsFeucdJxKbobQIeWq6wjgjYMsaFuCg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lOrF82st+/Yk7Lwj6bx9RbyOqGbOA2F8aMKNJRitTcU51ONGwtM28BGbqKI0kOI71alHOh9PWKgB
X0Gc/y0BOo1ju6VnJHUytJUqDPmPUOOaSZMEIWlWAstY5EazuDO4rLR6hDPTI00yeDSKuOhUkgZd
BSAHESoxHQuixlf5FsYeRscvnkYMtiIDf96q1mnLDtfGq7Zn+lG0IHo+KN25cBjB7ysotoq5uT9t
xCRoMBZv0atGPmvCgG/JYN4Ps68h7IGfeSxRRtrlaAaIRUrVVtiGAYV5WHuTLZFrPAhMcMJO0g3W
PMKSMJAoW6FlhhNuR8H64o2h/iY8pAT/zsPLTWB0FGc6XUI1+/RaFl+/pSA+q6HHnaqs9z00zE4F
0N8PhstEVLXHaQBMP6EpjVPTt1rvmUA5/iA/UcUzgh8gq4FSK7s2BA0VuR5HMTiSGtM/AOcCt8RC
4aNaLpABwdw31tZyt7LuhpfvcUOUPUQiNnL0iodnhE/rhQ9r8MSPYyhP

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
c75FiDeVQpOfDfDjji5ZwkKv2MG6jUiLIOZDB74gvxAE09BrN5mmBxWzOFZF/Cp/Yi2dubcUfSmP
ej74hZ7FnVhFGBkZutfrlf50xBOq28ak7Bycx0Hb6WMn/ipRC2vg2kSkxxAtHGaqEF5NFGddzvb+
ZxVN94+pnbcE6/kezOzb+53DnWRMv581nna+fG/gnjgxwixTBaMGM2ZPV5F/T/eYVvYu0fr6BpE1
srnl7Ba+GYzPM3GIW2miECQnIuG4nPk6xQFcptRJDk8aOQ3D58stTR+Q9vfAtlZbsD7e5o3BnaAX
euTw99kphw9dYNHLcMGhhVcAsIJVL/2K4J/KXg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10704)
`pragma protect data_block
BLOANBR1Uuw7G1QunFnKlZRE51RueNSa4mQMi4JsxX6bN14X6ckuvTKJDNaZBdWPa/zrHKFjgdQn
6HjQgZ9Oub95v5WmEvxUj4ZZJjpMNTFYjnK6onUIw5nbLZiX8m2uolMrVuMCOnCdDGOVF2dyDlDM
pj2NK1nzF8KMGtXP1GNryUQwp+VbV2vQh4Mv2OIbyCLZWNThU4/MLCSa53ASOFcre7UUjy3winvE
NuwLPzKUjhD8LhuHE3M3YSeJwa0Gxr7Z7LaZtnUEBTOWc9yOXneD7CnkyM9XEknDIPscyp6dVFJl
EQT8QPHcf8kWULyQ+jk2Al0rIvWdm0+AKxBRb6KTxMdd2jVjYPUvoTLL19OIJrTul6aE3w1Dg0wQ
Ym4Lk+D9mwQqUaTkJrDs3vFhCVxZmaUW+plNdsM64afWtFq/vZnOHMdSEO34kMWTu5i/Az8P7OVF
K8TTVJcGkc0BVMAZkcyQVxeQYujuXlxIRk/Cv5Oyz06cuK+3yuvtU3Wo08hz2eysSvJGImC4CpCm
0NuSB9QeOLYK9yG6R6tHKYZDlatZCwiNGJ1QWvMjpSRaTYEcpfdJ64zFyJZi8PIGb7ZsZXp6szNs
/j0G431lmUV935bPMNbSJE1InpHIiVku+K4yFiHCvVT/wYqGvWMtyutjCOOsI0XRhv5Y+8LTUp03
j5p/yKZuDB8ebF68BULxsNVUmil/HmBDU46DXD8mWDuq1okWPyD1wV0rFp6qrFtPDFTTncLZ9AJA
i5DdTRg2GyCbwrhpkCEY3E461FTCxOefUHCXDvBYxNxVSyx5xUsngq0/rsxc3Cf+a+nBFsTdUv/H
z6UP1sSuVCOSiIv7RhxDyEDTy1cgYFCzsF3jeAk4vUIYbcIuOqFX9u0lZN6LQ9uZ32+RZHq2AhG2
p8ASvmtNSZq8mQGwk2D9d3D9/6gi5xvXjqGr5LsNxrS64n+Palw7UK1TOqMG8tkaNmRkmaUZBOlU
gCR/Dn4X2zIwSvpAcpPKXxusnMJR9QskvxueepeTyPnvoPfLbDcDF+FdPjpgoqYVvxM+1R+LzVBW
rnz0Y7N6/9+t1NdaFXQudbCd0exRDImTv7mr5zHIUnAAypOa48mtadhmCBMO/H44hw1+NzzCK63G
aKAuWo/zmeOY3EJLYuDl9LTv4hNvFjxWk+p1mKnqj1o3faQ5XaU+odkvPrDwviGmarjyErITnDiU
E2Qq4wrzBlq0kmMsJNYmXyp4DMBunb3WyNfdNazJabCpF2DSBpm3O3Un/Jqk0nGDGZjDK4VcaPfD
AKJXIYxGnwmdVgsTDv103pSgYy6CoBiYsWgJ7LomDN/4n+Erhj2BfHEe1cI+QQQpSvmxZIOnnS9B
QD3qXWfO86uxYH2RzMLxJpsgC6TI+cjGfRn4qClokji5Fww67HkFPW6gAAELQ4eUePk02eDKBtNl
ZDCrw6n2GgeaVQfUCkJanw+R2KO3tyVD6g5SSpcgpzgOWVXedT7BR0L1sLpnYGy5Q7oxjiHnoC50
/bPGF3Hzqlr4ZYlS1kFsasXzk4uiu2AHuAMSawoqO7E1seDrniv0igkSxxDMqOOHM+o+2sHRRryn
aGqvtPeiihBx3GswIOYsRwAHMGnzWzo1lI4GVpiFqjS7rFvs+SrAfa+Ju58sve6P/WnA5yIkTh9P
DAn5QBClZo3tyHuD+ro5P6aZhuGdaziFQm+6+MRXj1gA0eWtZgnzlBSDf6LOv7feaZ+/5SyRc3/1
M1PTB8TCYED3XryZ4rBO1KWHQaN+QDgD8ihXTLCfxj0qhf3ym4DK2EFA0qnmgVBvrJDbZyXOyMQC
VybzAai3qU6sJ3E694hnNP4wxxph4qEkThyEzRCAgSwUZ08psMLqqiL5sevQDiIqjMo3F2S43arK
/IG+UGrDRLMkHq1BiXzmKAe/P3mut9d2hSsocpPplFATJOm9MF5x1D+PKBG5Ps01KhJQI4lzW2VW
Ay4Pjtp9CFmGurzLKD/iycfjxnDEztmSGXPte8j/eJqxwO2nmHmu2RAFytliuz29UdiKgDFtBrpU
e9bFhi/BU0nG4rwJBng0zStaSywA/u2w06aGxTM8fD6AOycLudvgO6hAfruSV+XSFOZWIuHUniqw
Q05OWzZsoAyPF6x+w9M/9FOg3n4oThrxChqDj5hazr7ChOCgeak78iAvIdAaJRYhGJhTdt5HmLpQ
RnDf42tHwNBjYMgq+ZafaxfcntOGcagSRWftpptv3fMw7cIDTqeeFzRim/36EZkQuuKNBi4tBqdv
LjLRkzi+28Xzvu/oxzSb+DlbcR2s12RAgh4R3XM6CHqJWI1KR/vQPEQgGvwIRMNT/CvNbyCKWUay
vqnKtJG9gdXiOUEGL/IiS9Z7ZQqfQTlkO4jsMIwKA14XnbxOCZ2GmXa5w3SkxDo+5YfudqMnbHXU
e+6x20qvik5tllTkxjbdGefZKJO6ln8Abxxrv6/h1h0IdqGMP7n9rFm+atqiVVJ2BBGKC965pHGL
SSzn2GMXRFAFeT7hRXA5TmFWn8pxHboLN9qmBpNx6LDHXBaoSmuEJX7YdlVJAi8RZNaf7WFgCyfv
9lcvjZavW1Tzu0kd7A/a6+CXE1P3AyrEbCzWMj9DWVIlFv7YjgnnaKt43/7YrG3RNF/2nO/1rF8O
XDAN0ATPULt2a26/JmJrw63haquwOi1s2HxvWNZNHRKzVzaa1e3csBoIHLWslcE066yRm/FKX4jm
SVno/OqLHigYzQPeoY7nTO6YIrSUZSq68oSxGfRUaAWez93d6NXVkZbr5HekqdG9gpDEPN4PYkBu
Sz0LTbXacZxdh5Ak/jG4XNMIZY/IF9lojrJnujdedWClXh/BFo6mckuvYoBuFPWce8JtSdY0Wlu0
10BnU32YtDixYkWidMBtmG8Xd9MVQEufqQ1Odw6XJIZJ8RKhBn0MtwDJCVnOb5oJvSXJDSkWU9jg
HtUFE3iPdeaV25hDgSoUQLhOXPKYYk1VJyPmc1sKVrRFwiFnnfDRYOqXgHpZEckfLWMwwSsTHkZx
Eiyg7u6wRl/VXJvGyHqeO1fgxTJm0BAygRzpaGxDpG/5RbwXWDAdnJx5zYQ9LueXq2DGdHhVuHHs
npHqwA34KiY4nOQIrVUD+WKg3INezCi/A2EexXwJXwhNWf9YVR8nUfwVbqApu9Wqq4vSbi6I9Y4M
oFXQQ5a08rcFJHT9IoKoaPuR9IXO1krgPd73gm5UKS4v8iLKF7EDxEglNmd4h9BT8/cGQReYIktb
snI1CvVZnfW/m58/BOtpx0mT3HHVnn7n3a0TbdjNG/L/1kxuAqsw00qWIVTEuU9TFV81ud2t3h8b
1hH+fdBHgncOYdDIqayMVw8UUo/e7qjKkWsCxwo6CxaFRDUbRegkCIS+zRy0MNGM4XQIfQWFjYl+
TvPwCV6q+Tim0Tn+fn+27mmotdGu8wqHw3l8pcPnRhDCah3SG4JvDdy8iNUqcYpcgZyYX/mnG35r
p46Q4Ymo83eo5+PSKYE6F3WXsjCqogDi80t7feszoPrP5hCiPhBAIaD9r39TPmFWHFFComFgZeRf
QaHuDGqCG0AezxeyFVdlK5n0T7hjyI0r8s1xYOkWS9TC3x9zkEJU1pxRC9J+QZ2/mjkizabV9Olm
kMF5wefZ6H8K5RCqee/dxsBGRLco3CXck71cfxqFW/YaIiVXJ3Edv8OPcYFoskZrPBX6nIxg17ls
3JOeyXwgsGgxHxijS4lwTax9hB/7b5cuFW4efsvvTDvVmrVAP9g7uBnyhAk+svW7PY4dsn8D/SP+
GBmdjumfyyWp8vlwGoz0sXHaHejemeNmkDHzroztnJznfBAtK3OXe9KZLS5H3TEw/wLlGdWtHSdG
B21BTcVGyjW/Q/Zbx8Y+ii9EvS9QcKEvczhgnViKmx4Dn4xc/wXl/egSnrw3mVvD53u/9wirIYVO
HLUMlKuzmSX3vy+8hZmm+jZQdNfmHTzZg4pxkcJeC7FkF5g0m9aE5OFmBwrSvDHPHqjTDN5ZkPz5
5dkbaq+WqLnVGtmQOmIa7GDfvQliIKQIOw/l4iadSEakYsAoecUutVB9vLplbNS6aY7hUXobnjvO
3XShvkwjtFmt8HwIwSqsg+d9tsbmu7YdXgG5Y2BKtFwJ9c58lAQrgy+B9nN7+Uk8TaGiJhVUbTdJ
KsYnc4dFkpE7L+xgGLdN92mV+rY4TvUS0drqjYoyRDnEYzPVU3ic/LYHzkKGCPNY9j1Ji6MCNPaT
Bq6MB/PRGe07s7TO/6pFMbX1GLo2obP6119DDhtrBg3d+z7N4txIhhL7YZUFjRSi2Ya8ThrepMCb
hcMvau5o9GFHoD9gy4YeP4GzM5UyP0QZdahXi8YiwdwUnU9x+cjR2L18n9Usz3DnI6yvatg5sklT
V7QtbkZJkQ9YHBN+4RtDY4LDks1fGFDCUbsYLE5/8ZCCrOoBakfqo3jaauCuCM1a6kDzW36Dw5KX
mTVP9YmJJEphPK2R97dvbj61GSgZIev8Wfp4C2i4BtPa2X4lH5YV4e97+o7TcnQElVhChZQseKe9
B3QA5+3Z965Itp5j+C4VNPlXI6hI68fwWedCGvFba957EtLGbfZFuyk/4vGZjr+wbqIbJQCnq79G
8fCondl68OCKrrzpzIbkVgfVHE3Iq5ITEdtqjAc9g7cg/3gh0Ppnn0fzKgnB5L7lX9utCSrkXgTs
SmTMKqumUZqAFazbj5BoZUwF/V+wxbRqQmwbXVT4uneTt6bh2Px+TFw1oh1LTk3C8oPPBzecdv5k
44kcq6kctur1bHH0ns5o/vJOHOgUYxb3X3wNfguH6skn8Nd5wI6vLX8gVNfijB69gHlZy0E3G7l7
xel28kadOY3vwQ5hGeB4JxGYWO3CUl/eDKrEjiU8TsEAKvqSW6aWT2irI9gkHYj9zqGARNmjarTX
J2BFpk6YJ42PY1933DyyYlDuGWvQOBg+83rKSQ7xLPBrxRO9ClGDm+PSPYJOkZDAHcwP1Y4T2kAa
yWVh84B/aij0xWo7HOM/ooOdbCjOnW1pP1lOzZp87/ZGoD5FWo25B5I3nbf4xGRsex5AOdbp803J
mZS5g4CkCtoZI95qPuUHvTklLr+6YPCustna+UuhEd2p3nQKEl3W/10hAc072h9kbX1aBeqBE7tN
Q49E1NbQH5AAPK1qMas9znUBHbbMPDeC3ESnq1TUhr1Kg8WUxoH4E0zaN3oqa0ccsF+vvko4M1kt
Pz8Su4dV+CgOyP3+kWTf/tWoD3OKgYRXeyiDsjVQXfWVbgv/1L3MwA9hOSyE0T6LKJFm3LPXLr86
gcqHwgpk2Ew8Bz112H28UAzn1kXNMgr9PPzKrlM5sSh+2+g0c06goHLkwMq8K/d3z4E8EaT6q76S
Xqlau3HrjxB8mXWn9AaPs3BvXTOOkjWIAY59GPGncHmDXE1FBX44K4teYZnrbJ7i3CAT6FrvNouW
vCDxrH0MLZbITft/hHlEz6pzcYWBMzGLcpYByTHJOrxHioFYDGXpvTETQoUFxE/ch7AkQYgsKyAh
KSZ1zu7Djyc2XWolZTGUQD3ChyrXX64Hps6YzvbL6jUGdEDgvBQXbEQiFaW6IpgvV6votvrnY6FT
iJ/M3HXHCAFjugBtQwQ3VLTqGIiqBm7xs9cN3NNra5j1vGTMF1SUi0B9CBTSVyGuoz5m9od9j788
B+bVofrzdA9V9MTBmFALjQl3Jee9H7NH+dVsPOXRd7/lCJhx+lw/Io06ymXej+Aohqs8Fr8lXFXm
bmzq+AhfVfvQxmN6sND3ZdfoGE5XtVMZR2rMotnJwzLBCHdjCymHccGm2ILelJaMU/NJbpW6ztEr
MfgsAyaHZh9bESiE7zBs3zXlh2B2ABzltmqejwQQL7ojZt1u53X9Cv6kXTKW4Ri7LWqe8GAvnZnf
gkQLpopykOzCRDkMI2XPNttqFiwNgBlAniN7kGV+xzFcHqS7aQqXEcxu8c9zJ8VRsCUVi97HHvwe
IenjwXNUrMdalRwar1urPo2+aDInG9S1Xb63PWQU+oEyFgHrnSc2mQEbInH0EyJ7ctwId08z8gGz
4xr3PA6ukaNijbFM+xZui8iTLh5dqyMI+fOJ/zCzuQZG1dn392rFdwHJ3qNTGN+LonfZRlVsDFfH
Pl91+LvE0sjMNyMCFJPbrYvPWCRtn/31T/OWJrqDQMyiB0qOJxe42yX5ip0ZNXPEIbnXRK1d78Wg
hLTAabwH/t4SHPq22g6NoS1G+UDGjLXj3TrWbyJc262LVV1SFrSaeoEUnzitW1A78vGi9OEM7BUq
kEIBX30f9N5PP23U48vc4bEEAUfXUZ5EgfMAYJL3cLF4qkk0T+WUuUPpWf5FjZQkQ2OQiF2jMmsC
mT74uc+Kra2kKskLlICZcdJXln6U0H85CaxmSFS/TdmCmU1tCOLQrGOwwgbTWzFAYsvmKL+hL3fO
R/F4DxpTr3n6/HZS42bO9qj1RizN+/ssdyMVQMZMf4VDFvy4uuKECQ4edJnm/kM9/XrterynDxWy
5SbHYSBdYOir4MCB1LvniIdaZzauJbuZ6Kc5d1aOmMpztiag2EmacngHSmV1SgRT0QajsJNo3Gny
66xs5CMfoGEkA+3EjUirgWNWaPtFHuS/kDqx2fkX+otXWpPUbMZpH9tI1m2UZYpozAmbi3XxZH6b
95atpr/k0qop9mXZ7aCBWbXEDXArYX8VzR+iWi8IctJnedihMnwC3Di8ldNIJZ0TtJMy9Dr7PtML
DyvukqSbR8ZOeljrLY7Gw2+HM7eZPKby0emLbXtEdNew924qAGOUNmLkq3G/5CRQpPEhAx47wf6J
IZ3PfMxWsGEip6Scus9JQv4DmUC3Ancav0h0PRBFunUYufp4bQDnvuBt4FaquUE8kjK9Hi4Y7cZI
ZbyiNf/fcp7AmiMqkL/E9Ui7UdL2x5LjiOr4kWr2FuqfF8TtpTBIywpMz0aK3JjDWBulo50VEknk
Qc2vfpEh58xJj7eN8GrDvU7kikuHwFmK9HcSrfLLhURPsCj0QdVicAibtLmCKS+N7rgvVPq8EcZW
RARO3jWLneXZHj0qP+gVaGcX5UtETU9Frrjlu9q4L8bFTInIlf+np38VxQddBd+WLSqylBwUddvi
uOv0nx2F5t88PanZstHZhdmSHJ6PQtGXN8xLsHgA0Fpy+OiL3Z+qrkH0H2Od/bgX7QkYv0zcUAjL
nyWL59cPuC0cXyhQYnRD0mAnPzUU4ZoCLeb4WJpSjVt+7LIzVOjfvL2OKlQmRJ7aDjcvQzQ5DE0z
IEPGB2R5BjaLIfKtC4z/EaL88XM53v/3PVa0A2rrrE0KH0cl3DlOt8eKDnLBFHk5eyOMKhRAfKZ0
yc3GDXAeyqyd8k9nah7xS4AsEwNCNaucXK2AkZVUm+j0HRzixk5kBncXz5gsnwNiO7d+b/JraJiA
TfP+3n231FRx/vOwY7Z8481NVRGM8gc3wwv5NRox0OLMqpknxXH32C8Xc5QJyCo6dLlif8N0zIPc
CGgFyr2H540QGVXVlFPztOqm4/DWdiDPmuLVU1yofSeqdVL15x2x+EhWEn3BMi9pSIH48/+EsRci
rE5TSoC6TqSIdiW0+QP6NZZbUoqxufFqF2qamXNn6Hf/FE8vKuOOpOopDOaC5ZKB1SNTUYHBxwFG
WNU03V0ZpbbyF2OHM8e5XOomEmDhMzHwhFnCQIw5T42nQUWHzSxd0UjFoaNt0v/fSpplMFKbtrj+
jnI41DWHUhvpix76vlEJ9ee0xZTbNgp/yeLWJmAMkakl+HgIfrfDKTWnpqoB6tKHrwiptbg7AQKi
6zWeByEQS7M7MMQjQGV/R6Hs9Mg/oBvIgHj2yp920BZFzYO4ho0rnm4puIRhOAWVOeltXmBs2NaN
HLb5EFETq7mwMZjXWxwMIWn3eVxZbNgS2p7m9/FEpm5RH6fDW4BCsc8VOupSsbSzwq0a039MkxiU
9eRIiYje21w+1bEG/+lBN/5D7AycjbBwlamtd3P2n4FybOKbc6zquHnCO1J1Ti60xv3VPI5zUAkS
vbIVOO/HVIyr7tdF8zl3FD2A5V6V3DkuD0RBh4KannY0EXa7DO3RaYIvP7C9gCI+o5Mz7uJtT8Dc
jTdO1QVG0Y7F1O7f6G3ESOFtIZaVROw86YJfe0QW5phYNrPYAFnOYM5ki+4IBCHZeRRpEUi3Gv/A
OGUWibaSx9+lyww88GQ/ZKP17P5j5Uu6vnTFT5oxW5Q8sXewGkAiEqQ6J1ySrVFszV8o4ZpX67IM
Q7Rk4U6BTgSBcqnlEy8seGRCLve90EepDYGdxV4x32Gj18qvWJSv6qkepKNvxV5T7bXISYDYIPQg
lbV5RXy2x+OLbBvpk9VogmA9PQFPrt+B4ASkalRRxj4uAJ+c6Yx5LvFvip5mK/vaV3OTYxH5KDK3
JeQwyr/XiyB6/1pV/MT/t7LQPc0kEH7Q91NDoWYmMZq3uGLEIjc72LeW7BFPXl5tqoCRzuWQsgaH
xTYEhaT86CbsvjJvGML0vi1foGMqf57EV31DbZ77MgXfJOLtcOb8A+Hl2X1+qpK+ifATH5veG47m
iTOA7zJ9+dM30JewNBoFRjI0WzB00pr1PGFksp6EBB/RQklY50/9vv4cTc5XHsDwIk2XSvdGhRTz
nSyMzyym/WGKwQmJdwjxikNRyhrtatl42LWnPQB+V16eo8DvS4Rqj7Ri7+SgaZeAhjlqAnzr//uT
8xf7txKWVUEO+wSsWZOh7jIGDIImc7vACCWQ5Xmpc7gJGRzKuZ7Mk07f77cF9k5p2hATvnJbDk8D
lhaXRfFqkYnZp8I0bgN4KMai2nXvouJH1kv+4MIKBVbaI7ljZvfumtRpFDgD1M2cW8aGw8mr25Eo
ez1c09NJ+HPXebdGwOyI2qev6uYG0HKOHQR+vu6AW7JayV9O3Qq9Qov39AYNaXYqkc4m/il4JWYz
78Uk8dtJTqpt7xmYkwFmEtVTKIPWGoDK3cR+8FchRflbk1olqkt8SwXNF4ddi1nJoEhPNX5DVze/
eOppu2HdPUqhALpCHihU1nry7BEhbagWhNaux18JoVRdFQ9DZ2Ao3xw8zJAZ78sD3d45efW0IiDZ
lpjv1OiBc1zKi8dMI+c4IhOyraTki2OMUxS98LLL0isedCmjwKKHsu637gOxBK7lrgTBhr7JodIS
2Z58cSaMEX9HwRFHf3whdL/TPKzNVMJeFWA42bMJil5AJW8A+U8warYPjcdLqNTg4YkAQinBL8x+
EQQvg92jh6Hao0pHc0BnA/GP7btiZl2TCdRh22Np9i+lmFdKvZlQ6pIlIx1KcrNSLKrYmwMzFIWs
An0j6zmvh8UxrKMHZJXAERNncDTKFGmfvGt7GylVEmz602tzoQifa5ZnYjuRfxECz/2wLFklDjf5
7vfckFCDd+jtSyMU+siV3yYyUQOXbGLxTvQRmUdKbeyazN9oMp9RG1ZBdjRBjJWz/RRHaVHOhgvy
S9J1AcmmvcxYe7mKmJ/vKa9qeVEOhNYgUKil7U7ZB2/Ce+86J9D2bYRqJnEQjwFDfmhDHXStS9QY
/IPDtImvqC1s+aBlzmMDDmSfkX2/6nRNJ04TDIFvnfI3Yzco89Qu+OGt9qu+SY5pPLQn7oABJlUC
VULjvfEK18Rvoepy+2T10CpCyi26LREiJ+m7V7sjmqO/pbjhYNTBp2DLxkOsEyzyI6Tf4r4lUn+P
ZgYFzXDw6ituhIWl1IzEEiE5Ozpw0WxrIFSDo9+UpEj2gTBTo2lMIyI9GtqmFWEwRhWNxMl81Xmd
jny3ax3vvV+LJB/JZKJvjhCcDYFNKYcBLMt0R+Grxrf97uLXkKw6vvHiHI/b96tI+RVmAOquhtnt
vxolOUmq1VlCPJylI3nxph+HKJZZW9Ihi+eug8cKanqCh4g3PN4NVP2NW72DbKJv3J672Xr6g7+5
4wLUHefeyuy75rIo7nRZEvz6wn2XctCmWvyJikMPrIPmOPaJqsqPjnHmNFg0Cxj4z4vGY35UyBpH
dR1m/XiXGZ+DHs8AJoYnSZV3V7QJYMr8xZoFhv11VG88jgJOnx9H5n4P71JX6aZohKTXo6B+i5pp
N8gEpK95/UUDof5Ys0TUVRM6XMz5NFZSsRG3ZKiaAyrmO+jwlv/i3UwYVgR3oHN0Y3TSOlBE0Hzi
egdVG/4657HztbTDIfwURzRDbfUxmSbnRgkY/PBgtgx2C+V0Fc91Hkv5JTbcvOnpBtLnp4QhgDdR
PI0mQvgu6Kf4apu+XncKwraamWEzPuG7F1Vdx+IUxlkCRcRmInGiNXRwS1gVnOCe1f1JSFL8m4P3
QeQVaZIcIn+BL5x5mjqLU/dPIhur3LuT5O9c3ZpEGED+wWLhrV0u6fDdMJ037D1athbC+LMjOhbO
c7Lo9N4pPKfBgPwfd+7JOnvCqUPIKs+nM99tP3lNQ9jR6pDptqkHsJPmGWnxWGiikYG0per0IPby
Hp2B6c1LCZLFap+XlOzjOG1xow+Y/jhObPBR5jqNzJfU+pUZmOIwmBASNjNXbabWrmQQ4qq/XaVD
SbhALRXeYtnVEt6bCBak87++raVx4OkDOfQszRGoZIyTNgKOpJ3aPM49CG+pH1cMXH+q/C9XDVa0
zrbtwLRpnd0Z9PaC/U4tpVD/TLGf/AD800P81yH/yNQGtp9ykDqkpkUcb39ljnjgJb6+seoL6HVk
L+19CZy6a96p6QivZwE7NbzLQ92z1aSv5BsWMWSQ1+pS+NlaE4tHSK8DFTiomOF8CZiW5Y1k97lV
jbHVBANBa/WpPfVks2ajAMSxIbx883vaD5oala3PwPy26eUxA0kX1TcNqDGsm+iUMnuVOZtCtlVR
PyGL+gaX2OIhDkkFPoFD99I2nX1aAnQKe/9GAIcRyenJ3ttYR79zzgKe/8MUzjEbGKvFo+J2DgwU
gx86RF5WaiZpNDwOSe7Sh+48Cy2K9MTb1KT9FLYWvSrQRtfxxgt1W5Vb6swWEiItcpKg0BVq3du3
DWDpg4lnXkuzq5wx4mMabPUKLitHYS4XeF/jP89gwWGgBmRFO2noTNHCVodcgTkug2Bg+ljmWhbX
pwFB45gyqV1gijdHo9lrOjY1qd262fgfck3pisKpDxXA8wDav0wby/1LRvC9Gw13KBQJ4SSBm2/Y
w7FpkRFD501nbW4Ry85EUMRzzY9OmN4PcQod/CjnyfqaepSGjT3w+77jtqDmWzC0G3KnIfGGYsct
o7+1/UzkqUinGb/sj6prRdEDVW46Uglq7kckfIs2GCnJjIb7kKP03uYOKoDHf+U0UfprGVunAXj8
c3v/+LYvgOOtB5WKVsEmWF/YTm4yLB2Sd71WxjKN6xCLP7U8YAYuudEZ2Km5NvghrqCScpsJQdee
IQOBXy+OgP+L/TSgpgFDAxAl/FsEozNTEKJMMSvOJKA1ILW7AelzxAad0nbM4vs8Qg3ehz5ITKYW
U4eFcogEVFI4+r7/gMIG3fNZ4kv35yQMLiVJb7XI3nLHSn1pyBhvqI3WvLbTAxfKFOlyxsFwptkX
A/MqDCSBbyXTs/4IOAJYv/dVLwkCM7NjtHiLi182+fF2sD8eiYAcrDGf0G+U/7q0LQ4KqbafXFq+
e/tA2dF5ydEraAcR5lKRteaeYaJIr22t5TtFq3vuXh3mfXEjPQOwMzRa6z8nqpFFvGFOXzMDowa1
XvgLNCLOUk73Haot5FXbrX2uG/CP6w0N/lNZyvfYONCg1X/CuBP6d7+w/tFgUX6GWdinjP64uaJ2
MOAAcCauFD9Sxrc/T0AyiOh+DfQtqu8O+1HZc9pBsbsKG556bte8//8gu09CXSqRDfAFC8mYx31t
LSWMRHcE0VevKPVhfX9yS5DumMTQkyLbChClAg3KEtes2lUqAn+Q/Q7nLsaGC+YkVVzb2lhLSWsm
SjHPsIk0p8R2s6lMrjlV2oMylU37Ca8Zowhb48TWQu4yIXhGVvCUTdQXH4t/hyypcxmavyRcsIaQ
xMpMiwpU9s/3GVINH9JJDe7d7sPfxqh5yAwSy2iRZyA/37PJeuyRG5MOrj9dgjBqD09alC2kWHo2
HaCBcEautNIeSeNt/5DcPYtH2+hJLuMoaPKW/sslrH3E40cpMadasNR3YOW3GDVbUHISyNiK1Eg8
PlPy9E3KHo1875IrKDsz20kK6BgdrRRbHGIbBhBJI/fUmvnD1vCMeTRrvKBapiYP6ur2MBOGZOo4
M2/gYlKUfhIxp98ci6KFzn2+7Ehalwa97fyGxVGBPa9ziFev9aCXC5Oy0vKYQUzCdtpT5v9KAF0W
4IEa44cPLXeB8jkDT/Jxj+F77J40mXFZGtjionI1JHlhqcQCc14bdOhGoma+DtrbTyIc5611PicC
h+JmYlLWXyMFFtUYcbh/JxYJjnPPEVOSKEBjC4nOw/QEOWiixYxCjphtugVoIX33A3E8MBEJIYig
AX8Ix6dw57Rtek/E+nC7CxEjfvJDzvlEybJUgXkTPXKCGu2jG25GgV7xBsZ3WJWYRZn9UB1DgoqU
V5yDC0VKIUGojWaQbBcO4j7/kiYq3XLnjJGnTs5lCtb5bg2gAu0vnOICeF1QUUMUXKu8Pf9ZG7oP
8bn0fiwOXMAX91CcZiQNh5bO5TzIEKyt26wZe0/1FkhHxB+DrC0tz1+2BUQbjGUANg7ZtMzL524y
A+I9/cRFxTRhHYuNqbVI256KAK5010Bu6fmeiv2fygcDdabvTh2ag5ZxUG+6dBVpzOThLSjHZsvO
J+YK7zgrmC0CGRcWTf/yjbAmFhdwBnLnKNneCkeS6Vx9w9T0PVvFy3KHLtWr5sOoJQgKZA2ucJcN
s21kXin+4UcnaYW7aJofMRBZoAqJGUhAIYznkO2AjszfzXH9md8eCgTn+ayZvvUimXLYsdiKIyDC
uuY6/Rpq6lI1+5pRlm8zquVqb7b8XfBqtYss7I2Gasi2NPZfC92UiTWtOTKT3eCmLOAfy1M+5p+T
KJ7q/FSOTxOKWQ2OtRZfusHx7v6AbaWoqbZwlv+kpmA3C02c/oMyhMFSGI5+8oiPf+7wILqytuVy
mse9nxjMqok4ZHyjePiyrPoBIfGMx1U2yLIIqff+s3yphYtJPO0za2l0mqQem5o863ZwzSQ7ppr8
/ifZlgzUWSd/25BQZmJFSZFrYvUVfqb9iPT0WUN9bKvn/HBJwgL6DO39uCfxnBw/OpAqkHUtcu6g
gdAUXpvUZB6aEFuv+qX7n+3l1viOY3GQ4VSMijW/WEFcRdHiTHtx2+8PNi/3iNcjNis2zq8lvHYn
tNKLOh5wlkcdoqAeugc93aW7++TwyN/JiN4j+Jw5LKY8vWgFtCih8SEzpbstkq/82BysSSzHO5MK
abPFdcPdvIahjvFZm0EPB3ST/nUeKO3S189q0+zdhYqgFzwL9/UJVs1La6rUqO5MLfSC9ATup3wg
4k53YnTvdWSkuMV+/CZmOWRAlfGaIjHHmU6xFYbltnKyUAbM4oMaVxUCMqjMGrkMmIUa2ik60huf
IgKs3JeHlQYqVN+jr0edVCvZCIELbKvR/TvD1V5eh5cj1dkBfIQK+adXNKFsZNPBR4vt7nyTN3Gw
iSb+K6qOSG7V17cgMP0muLWQfGJvyoy9cYW9PMsXGi/SxGwlAGZeje1OzDadOvjMszn2HjaKfX2P
gU9xGu0WBbA2zzN9xCEa3LYrQxP171684GhFUL7txPOU0l+oQgr3jElVZntJrqZRiYhDiKTeACBf
2hojpUvAy4k4Km4rjYD3fhDFTewg+62tBJxpdBE49uAziAMjKKn186hZP5MCbx7kS/CvlRFEiGi7
nfEyQJ/06gbrjeFc/kzN8DJXzR2QhkD/AMoDjaRTW0ErmQMxaQaxClRxLQgoyseZjWu+FJeiyFWg
RnVB0VoV5OMv6Tlb1EH/Ja7G4MqIYFD4WZBAL9JF1ES1dFf0fm/G0NCm28HMfnzUSDhZB1NO99o4
dRgXj2i8W5nfHfvjocLoKsVOZ0kZkR3nFa8oUEtugA3hZEW7cdnalR5q3BqeDQMe3c/jl23ycygL
vbSW2O3W1V/1qQOgczHjxQqM6ByckckAnF5aooWVj20J6yDdaso1Xa8rk9Qlb1jJtdMy7gTewEZy
MvN4MY4kT4uzX1ETIQoJ5xkqAD1dgPACzaeoNsMV44rFIneLWpSX89vHuZKU0tRDkGBkyYpvIewt
pMCWh1+ScDqdqF9gPAnryzUrt4l05AwnCysRXeXJib5axE924y3lyQgEgEIu
`pragma protect end_protected
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
EvYLTRfGsJFrKv/jfBtBFCAh6k6Rqq6R4eba0PctGnThuyO3nHmIS+Hfy0Q3SMrw8qHjtc3NwMNM
yTe0zMWBIb7CDjgR9jRVxxdDVi+x5oGyPFCdFoR2JE72bIqCAMNCuTxYeY4gnMKBE1ETpbxXKvMS
u6TR7d//1+vDSdorkZ8=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
q7quPrmRZnr9XX3P0IBUTIBd6v5XJQBzA8nkHrWjbLmtjgOdTduOSvUn3TQOv/+jCCNIFBPZKWpI
4c4l64XX2sXAAYC/kIGuBrD437Met4AFhb22GIo4Kd46cR4kkzgFxTuEot3cQfcej7oU7FqbPDdF
B3oY2PI+tEW/O6N5I2UT9clzdeRjGHuU8ZAtG6uNksF9oIbmMYnd9Gd4IxtMr5kJszmDEpKV+dyN
tJnFlljBy0loALWD3AuAVG1rTjVeF/CHSCx7yP0qKxpHUCNt0BtFzfaRzWVI25ppkV+hCQDvLHJO
wybaFzy/cNy5fagQqiQDhsvLjezl+66uc3long==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
pnKFDiM5i4YvxiD/7ByjNqkNpFon+18O/mYf4e0cEZFE0X4BoojEqFPe0iX/ww33X60GF2eie4lR
2Fspjxe4HWf/JZjzlS4tj8ndZep4oK9vUcPNHrNDcgR5Ae+0Zjhes1HSi/qrB3rkIUwxPcTaa4rV
qOoUS1jTN21fDok6ICQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
pDdHWV8RCArTpXTv9UEbd7VXwc3iw1ShwIXh36xk8ZKDFkD3Fk4LOQdc7zhsF716XPwhXKi/z5fC
dTTuVbkJdlQpyb5j7FwBXiNfQ+SaOFVVeOJSHk5bmmvWAFINQtOSwA9E8WwiwvMbSNQA5hBodNGD
dhv3G092vDHsYlNobgPZLytqAyhePkPR/0vBt1qDq6ol0fRcC252+piSH9iebAH3616rRRIeHJex
37wfZtB/i6jNSM1g05jzPO02gMPsSPzxi9+gsvkoW3WPTc7O2/NwrY5V+utYeg0UWOtz3ubuB7Gd
7kn0738kwh1/qho/mA3FK4oeNaqxtOIO7hWHhA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tqDjoJppG7/kcqhD53iYTXN5LetWm5t4+MNFqlTxkGW7KQW0ty51tI/YZKuQZxSSJoyB41dtSQ7T
htMJF9/cqnJyjAV7Uhh9sxCUm9on7dXmjX2JqO3HQNeQWGzuXfUxvN4lW5tgxLN8RKn99Vm21SDn
56jt2Ud81diTRCEvf/aSOP/N+Da/0tbmv1tf2f/EG8GgKK7tucnWlh4p72RiwQgt8xKRdppv+3tA
tGqL09v//+V26qB90YULYTEgvc8YKGNGNCnWve/8knkooXs35TZAkmVjOHMtN/xIPS42LCqgh6b7
RQtEgFATZ47xU/4aQHJqD+3lx/ayFTg4YyrpQw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bM+suLx0vPZeQAwBwEaiDrAIlQbgUU4XpLAU4smc9bk+ScaY4dtQkGDr/c9WKThOPjWUv5TzI/Go
vHTRAok7G8Z9faYGhnwwP1zO2GED0uLmAVICGwowEVtC741lDPVw/mgDKj+td099MfQx4QbW8Qwm
tZMtH7B3UU1rh/6JVlXSzNQTYa22m7dTH0DXep/Soa7W1KrmH8zrLZR6XLtFgDQvkFeXv2dqPpdQ
CHrPNwWEg/yOpPEd0KFfXk05ZVecc0Ea+MTXOiDTiafzE3JGmzCX4gFkwMYkAHB3w5xh7TVR3h84
iEJ8sqceerRDV+nIKczBBMz3iB0BmTD9sP4+xg==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PBzmQMDcoXjdHYLtEU3LLGhq13vaBzpKg4lsU/QTnUE53oQLIWRekKBW/m9XUm+5UbTe+tgjeudC
Gd4PeLQWCWlm+Fu+qR48lnK+gJmN9qJeEWoh/2RygTK+F6pmtuNd25wVy50AenN2HA95oAltj5qj
+7BAYAuekkU0PU/4ibah3YjJGwu/WklhOE/qV/7AMVWOLRQ6MjGcVQqeVEPs3Vb9IQ2RXuMcypCn
0NRQ48ox5sk4tW8Pp3PiHS78WCPHhVPYuBXjUq1zImMgq/S8UMlNGuNX5Oi/MyERXrHd6Vin9UPt
jqA6vS8UsFeucdJxKbobQIeWq6wjgjYMsaFuCg==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lOrF82st+/Yk7Lwj6bx9RbyOqGbOA2F8aMKNJRitTcU51ONGwtM28BGbqKI0kOI71alHOh9PWKgB
X0Gc/y0BOo1ju6VnJHUytJUqDPmPUOOaSZMEIWlWAstY5EazuDO4rLR6hDPTI00yeDSKuOhUkgZd
BSAHESoxHQuixlf5FsYeRscvnkYMtiIDf96q1mnLDtfGq7Zn+lG0IHo+KN25cBjB7ysotoq5uT9t
xCRoMBZv0atGPmvCgG/JYN4Ps68h7IGfeSxRRtrlaAaIRUrVVtiGAYV5WHuTLZFrPAhMcMJO0g3W
PMKSMJAoW6FlhhNuR8H64o2h/iY8pAT/zsPLTWB0FGc6XUI1+/RaFl+/pSA+q6HHnaqs9z00zE4F
0N8PhstEVLXHaQBMP6EpjVPTt1rvmUA5/iA/UcUzgh8gq4FSK7s2BA0VuR5HMTiSGtM/AOcCt8RC
4aNaLpABwdw31tZyt7LuhpfvcUOUPUQiNnL0iodnhE/rhQ9r8MSPYyhP

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
c75FiDeVQpOfDfDjji5ZwkKv2MG6jUiLIOZDB74gvxAE09BrN5mmBxWzOFZF/Cp/Yi2dubcUfSmP
ej74hZ7FnVhFGBkZutfrlf50xBOq28ak7Bycx0Hb6WMn/ipRC2vg2kSkxxAtHGaqEF5NFGddzvb+
ZxVN94+pnbcE6/kezOzb+53DnWRMv581nna+fG/gnjgxwixTBaMGM2ZPV5F/T/eYVvYu0fr6BpE1
srnl7Ba+GYzPM3GIW2miECQnIuG4nPk6xQFcptRJDk8aOQ3D58stTR+Q9vfAtlZbsD7e5o3BnaAX
euTw99kphw9dYNHLcMGhhVcAsIJVL/2K4J/KXg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
fDqeHowbOzbsY/PWvqbDLC1pK97+MYnoVVeJHwLq+D5Zp/RboxD97YqfMOaug6hjKMOypwg0bKHm
8P49qg1CIohLxEcoE8zOctGCgOmGekVT9EXRBqn/oSll2q/mabl8QuC7LJDNRhVZf/SyftHPq77k
DRL47eUv4NVZ/EtJRA+7zNhAoqQ90AwSTXU2zfNl1l4PIbzF2zie7MvinFjXBuAFGllWRHrkpbLR
/SWLtmUCAjC5hQGuSlyYx4jAK4vBQ92vFT3XPa10faYNVcYFeWhbKJRYiAsM1PJLIejxzig2PirV
mz/mpvzexFSuMuW7wJkfYh/FZ7tozBTUnQ7WZw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
1Uev2341CRZJXBirDY87tjxZjzE9dLoG3iZBv21BVsTfh784zNJahflrXjlVB/E+/goeaAeRZ/O9
X95nG0I15A/s6xjg+ZRsPGZEGhpwjJqdf2KFdeo80DrvsClDpBoc7g7NUDzhsvILwxhbUaXx9a1G
/h9x7c520cFXYSP+kFljWi1jTdSF5Brg3xRMQXix7n0/lIjXFhLhWWaoObABcC9xsi0Nu2FdXYse
x4Yj7If3NDQZOyP448HWsdEhzLJL0995VC75o5NWoyk32nAszeTf1Bmxum9eF5w0ZTZ1KmZ/zwhM
V30SyXUgr/xv8K82Rbzq/ZecBIXP0DmvHDzY+g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 33744)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
