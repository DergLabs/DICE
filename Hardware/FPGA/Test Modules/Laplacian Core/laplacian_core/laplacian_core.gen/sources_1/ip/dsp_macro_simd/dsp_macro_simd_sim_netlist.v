// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Jan 10 16:11:54 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Laplacian
//               Core/laplacian_core/laplacian_core.gen/sources_1/ip/dsp_macro_simd/dsp_macro_simd_sim_netlist.v}
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
    SCLR,
    A,
    C,
    D,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [26:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [26:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [26:0]D;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [27:0]P;

  wire [26:0]A;
  wire [26:0]C;
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
  (* C_HAS_CE = "0" *) 
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
        .CE(1'b1),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10688)
`pragma protect data_block
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
XwAXP1bcGyUcpaQJFMWNcC1jUctYh5quEPnL1mw=
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
THqlegWAcxglTi3G7+9TCTiPgvaXrnymcHa+GZ73OC1399DERH5SxdoxXasEUt+hDzNZj0pXCvkV
O5KkFT/ZdCQCr8wypvyT4MsoX4n7jraOUGRC4rlSNpTQn5dc+TzKGj2wFpoFXLB7TCdIdnxmlqcj
1WUGPh59AvFxvXglI7tUf64DNQzC62eydeBJW+59uQlClVnXwuDl3AX9gNS2TI3WBzARj0MMkME3
3Zn6yw75RhWdd7V/y9CL69Sojzs/ERWbEaz5jNgsn1CJ8t+fHaHJmomDKAI2loVpkI9eCpoPndXa
xfGV+gLQTWjRLjZVweoWAOw+KFZ1TrwbWuZaXw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
6DKzkHNOd1Ztm3l6vfm2egp12RgV6iuic9Ys3uOxQEl5S6YTS26Tqce+nJS0M06qKhowGsW9NZPO
0r7fNndxQgJpCPR4sC5oI5nYQE51afoRRtuDp5fz92shzoXqgOCr6UZYktB9ILONtWz8TAcriJyF
rAq7EaZGUPvWcuoRI4DswspC1hlkbHdHimrYnJefNaydO3vTX/RkheTw6vedtjDk6sy8UGJ1nZau
fdLQB52IcEDsyX09/lY1Jd01eaw7dChAEdi1JbS8CdiyJuowYULJIV/DauuqQD0feapVn4WbbSMv
4Abw2ZesaGYMv3wiPCik6v1u6g5k4rI3DXKirw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 33616)
`pragma protect data_block
AnDRTV2GVbZnne7yQwv2d504MMamzOd5/YudZ5Qily+dv6VtzyE1SxqgXYEbN7ToAZDQEKIp2vkT
Qo74GSbdZL152V/fd5qARi3EtAiYDergxZsEJ5aPIWNgi3onnaGwDzZGrzECsE1jMVjwnPwP/V6f
VrA6MnAt1zY/ShLRhlRugZAw/0jNhXdFtA4X6lhYAZZ4MED1KhOx56HNDA9jv4CWsu3fYriahxuW
GBPojAVMl6Nqe/Rx9d7F/f4xGlJxT0FR+/CFELZOrFuBdfJOKSVH5WNNCCGwtvMxs6Ja0UEemL5p
+4Bj6GSmSLodWJF3zhHscc0EvNs7bE/FTg8iuDgjEXYET81kRJO5AG2+0RRJQCh+bK/St4zNSGEY
PqJZyh9DHk6qwMAK5ZDD/LAw/VEPDZo1hqjgq4EvhNZirxejKBjln/Kykw9SciUZwneDyEI7j1iU
1polYfAFB0W2SoMUlvz3EiRngSayZyODmNBlFvII3Naz+qrhWC6q+pVmM20suWblmCHCd6LBA034
2nAWrSKE0b+qArg+0Nq0u0VzDR+bN0JHYAtjwMgi+ZxZuxxDyYtmmyBG6uks4PFb5bVtq7TjKlCV
vXMJb4BywTOuTpcWu4O7BsLTGCOfx+Xtb5Azu7+NkG6yGpWoNC78+fh4mSTrNDQML58/nDWmkk64
OWSWdK6hxH2xqnyPIkabLzFfvkC+P91ln0shTMIblXmVOxjLehq5GTb/ldyC1IyIDe81Li9V8oa9
d8tjI793np8orfiOvjb3BQNsUMi/uzxfgyrchk4KS16SBF3aJ4ShthHpBTzTLG+iXYmMi/bsV2kP
koZhPUQwXf6l7coM1+k1E8BB7V1l8dTj4VmotcD+YOkWCi+6djl4myzEfj1XXtaP0z4thC4JNISn
+cZmgbN2nkUDUvoa+7B2n1roKd9NuKjZkCgV7cFLb3wGmXaprOq3VMOAklajr+c+Lg1HdL6/Y3zi
crqnN38F5n78umfIo97epGgkNE4u88SOOFACMShediCBXq+AzqfvIzawfwDlCjo5hMVJRiGKUmLC
STYfE1ws730vPN9pW11wiGUWajx+ejjCuqNDStBCCAQIGcSbVRJ+QD4VZYN186vpw/MWWR8J2tBS
s4M/MC5hND1412+7Ypr4rD+wwX3m1GhnaRIWNwWTIHq6FREbJx9Qh9U3ZTwsidPh6Vxp02+W4yJZ
o+TstPO8CAoW6++cmFG2HfOgIdV3kn0FibPCinBzhDuf7AjgfAWTlHsr0N5yEta+EZLOUb1agwEp
8erww+i+heKiQLDWtyXfeYatWyzBCAT945nwTfR1FGNad7S2gpxDl/YJIQPJcXkyH8MbWHx8HQ1M
P8GCNYvO/JKzSAp5CWH7YUCeHsQB9YBarXDw4tfoPrCI86kAM90QPp1uJjWoiK00Sc6huG9N+3NC
5un/dJbFYXLv+RJ7vZ5xEZoQPBhQhTh4x6h/X+odwGQ8gTJIcZEgBuH+iCHD3h94xfXuxU/pw+1W
7vFBtkSK/P85ZaaCJ+aH15lGtir6CY57Kb+Yi7X8DyntUZyvOGYmaH52Ki+7uDwkR+OaqR6MxMwb
i0hcuoe5xn3PHaEgzTcdQEbThmSXs3ELsu6Kcqi83uDXNGXdrbv4RwhF0+9pf0lj+zbhNev7upJR
qyjCkGhDPLL7fbF0brOdXWIaGsEasHcm6yl/qHIKDyoCNUDc6mKHqxlILDOdmhJwp5uAaR5zRzU9
VKnRwjdYCtEHUceme607NGFMsoSgC9b6dRb17bYwF4aPaylGbDbZtydHPqYD/7sJ1jd/i6NsDZUk
acZItPBl3N5pCmJHiWFcHKRO/GtuS74r7t+alDoJhEFQAfgDBvGeOdSx7iikdVRnwPnF+m652Mvv
itjTjzYsgyM7weL4qz67VatZHMYsbeglHYMjBydOWP3mI6WKp2xiyW91MYh5kNrYZwkvgW3edeEw
PhPW8TbLGOBrKUOY4ZTcACI4u7RzMHRC+A78zDa4K54ETluEftpAhvH8Ds9sAOA5hliYSgAUhCtD
eoFAID2q5S+DyDBIa64Ejza7HtOQ09ix9PkFamNvAsx9KBPz8dupnHUdkTT0ZNDrRwmvLvhXGei7
BT74tkz9hjzfQZEBSKv0+V2FPgbjlK9IZzG5wbOZZHGaBXyQYD6+6RzoQeiVLWJ5g6A+2TRuV45e
PhuIvVf8kVV7LDD7mduN8gs89ms+TM1VsaSxzWhVyX/sUa6dyyEYYWXFbbhclaTPywXZRyvOuPit
uOrjsH+zG+if1Ijvflv/DF4tVDxP5pdyWd0FwHMMdyCJ4+JXAGuMYKEFEaNkLH2Bk9g2HJw3qz5A
xuStru3ewDKvOFQh0uSNEQasbH9OvwQ8aPi7LG3e7NPIWTW9MKcVjdTBXwBAq5emI03xLHREKOjZ
lNHePcMRpFZQUSG6d3CICl4QqW8QvTNTFUyoHkfEA3CUpOShA0C5Rlzn0y/yHxdClzmhsPHYJXZs
A3QIMeuWRAexBG/Fp2kcR2hNxLtJNcyyspfvDpS6DAKdIk0AenWhRuT3wLecssxdrULe+nowTey5
LCTn8H5QpZpOqWqPBakJ4MesE/ugiz4d0cqFGsbqnKs/FCSgxGQbPHuen/Pim45av2Brskozb/wg
0/N/RJISv5c7zd8F5BHGfZIeugzwC6MNW/fMZdZfMS1l9gd6FhdsnE6tA/bV5vHie+bQJO/SxXF9
YLaHl33LjCIh9WsWCslSkVpVHewPLBLHs9QLIREUVRI7bowVmDq1d1J4vbn+aBq8Ck4DnsADS+DE
Mzg/qCp7mvDXXBFpaRtJoYuEhf9D48GFIGJuc+2YQvTDyJvnPfiU+YGYRs3T8me2SqAPRe1g7oST
MrACDcvmNy3mi/XcVsoHFpS7fHGjwNpVEkuRGM+JJZ0jwvwFWib8n+1iYd+u9R7J54o5NfYyyDVZ
zDF7ExrWf9CzyU7Yx2OcP0zkESlX/mGr9m/fZHe5hcUHVuP0hHIhxB+Eh9hB4Se6rH9WTKLuinYg
fqO11PnMxfdBtMuRMacgc0YlFPV66mYslgvPuYzCBxvi2fv8yOvOB8DbVmPUWHFcRS6+ii7JoBHi
No41iscZlekkXQUUM/h6kWayIj0eS47Hs1eBktwWiDBZ/cP4smUQ3birfCtZHwUZA7aCLthuTFdG
5tNs+Osr6PI7gdlWMT7BLlOO1SdXXQaRtcU1SUwSOAnpF98JqFL5GX3rLlKF9fD1rNQL2HCE24/m
wz5I9aS7OS/JAkgiDY2oK53Idk0FW7r59X8gRcZ3yc7Sm7Hm3jKfItuc8wAnVTgvthdzxf57lw3P
/cEd9uURsUHWHtKK1GYTx4i/Zxbq9iOHXy4L9HQa971vgWo7fSP0SueJN7AYo4XE59BayEV/IeXZ
v27qzzSIeev8V5bsdWLOLe5Iu7gXVPBUMft2+5qrLI9r074P+BvS8sQIOzlzr6RoQo57Ezo8PA8O
INg3zQaFLieyfVgQx6dCk91+ykx/7WfUQ1mLujcr6c+/eqCvJ08ALVjIwP7rAiHPml7N9MRhwvV8
yDVyP6PWJexYm39sjsSKg+vFiLzG+qvI2rzhuVj1Lxd3jd0Hy63Ty9tJLYgll2eB6eLqITTd8BX/
TRvdUmHmUceYQI0w05UFI0yYa4MSXcwP7WRciCQ89qi4MH+vtC621VNC7mg4SS4YzEXtYvvr0rI/
5Amc7Dib1Kn/qysBmCrRgvu+w6sDZSkBkN6054FK2xh07QJDwi795IGiUkEZPFJCLkd+tSk94KMZ
QEKQQIkUZi1xn4DKaDVYmOGP/wnt5gcgorKP9dboXtEtb8VTEP2uO883yWzeuA1k3fLbEapMj+fJ
QVTIenuV8cpjU5UbS0ZbswvNSfJn50eilZi3j9F2Y7wrNBOzjtSvzmowUyryDXS+KwAIHofPfyzo
NRapvRByjU2x/wZlv4iUxoIm2Lfsjj75fOZQjtCCACMUSkFj2nHekD0NC5fl7RrTS7MdKx7o1oxs
yn3h7nVi+5k1mQpmecnjONJA5WsqtMSx5SICskCDf6v070oXgRYF3QFtkYwOAMKZR3k8tTpe6/cd
xsrGn+JAs4wIV+8YoSyrpqsJnN6Wy9OJdH3mQ0NTFP5bCk9EN24jjw9ZMrGKllQnncnMi7S0luct
k3d05V3S2yNSR9pcTs1/Es/C2ixziSjISdER0Q4dz4hThIkUtX9I2plLJNKa8VyZ7k6ALmGE4j6V
qVcuOVk7K3eJ3jekyW4xKpV/FYBnXHvMp+K5ZXHqSzmH57FDSGuJgAOU6uDQ6aI7ZN1tLEOkSWuS
JCJKbDnlo3rSw8aiCjsxp57cyKaMJlF/4g+rbnv+3G925BB7fLLPCv1lKoAUbafJiShwSxm00ZLi
mYB0w5obckvCW6jNfDEXJy9XfFnqs2ZDFC+cpYP1j5E5T6zFe9+9mkRzb97qKM4hP7qfbrR/3VTq
7BiEpAWUlcWJAOJtCU24w5+ONSIL1P/PQwyxnQ67oeGcDwQX4Yf84oYImUoz6mNanIrUy+ls+4ew
skWL6DcrQPaMuLwxIwa7wxJ2KrAN8f2atFhwV55MrCxOoLRmfDjbq8CL2M3/iuI+yFO4EPTeX6rf
6cohdCI0seGr3m0uJLp1i+pjPk7tDX4bSuKZmgFD/sukUoIVi9KCfhUKtBXtIJHYDCQBzCI47NLs
ebGRcqIlrFCFL1EqPM8G1qWgWAXH6DMF98YYYpXayrI12oO3GCqi0chDbznJoHB48OkUyZfaAfgT
LDgB5R6ijBzk18yNy1sD7LUQX3p7+WaSuZFTrv3WS1DbWqCkmTaJZABwfp+9FE5X6xaAlEqMWkPW
AuxNp9M6s3DNzi1jsx6jzbH5XNyCSUHdCTO5MIA30Gj1ak+Envtb3hS+R6XbsgHRlT57bj9cYFLz
esKZ5w8f5RjQVZuVadhOuCQHmmVnwxvLqUREmb7rYTHTb4mVzY8yiLvMXsWGeA8kRhZRK0XP+rDb
huMaCyeBTI51HbIZ7a6H/Y7EeiFUAn+/x6XnGPfL4gyNG2KU8YP+hD/E6O8PL4+m9o6n/HVXxJQ6
348QwN2HpkkDcCkXyIVAu4ZTnbkC6OKU3yO+ynp5LsPuvJ0Nd7GImczpanJ1TsjSRnKm72UZ9HsI
YpoUJUwPnlPanTdFmUYEQGbiJ7xQPYz6WNqzTXxOXWFGIWLNhqQSN/ceoEwMvmsbGbbPNyRpF76I
ksCEZvkI2aJf1h4AflVecLsE73/BZAKtB8uIsRyIt1ifpx6fgH1n1Gsj/I+HCKv9BvA5B7BgMcos
Iajzk/SuGJcweJbuiFRCf1iB23hPV6rMLFckFaN9fNBW9oOUwG2uzDGssceNe88I0h/rKQE2OC77
L/juXLCa1d+FglboN9o6Eb1OzsaseJgrPxNS4HoAyZTqGQAR8kGkjI41hF9eiwaWucrBBiv29e9T
hWeqPITRgjlMis50JpEq3MhP9LaGT2aydE3iHVzrXOc+2JssOTCRQCD35G3wyARb3RH1O65pBLHl
kfA68rMqI6A62H7bzmkfS/AFn5k6eq9PEw4Dv1cNFUn4GzmBTB51f6WoTRNJBi5YJ2DfExzKTKzw
mjrJXdCvujPXP9ViVGzs9pIOirC0Xcm05Hf7PPhlCcjOp0soZevcfjlvDlRJpYTesT66Q1Qq1ZOE
9Bz76Km9EERU9XrUnx/hD6QcyGuV5vHfF0aEutfQy1jmjTcJhHwrrnwPcBxqX+Bh3GjRGT80sw9l
8h3VjPuHj4q2B7sqZer0YJiP5crXeofZ4Nw3w8sMjT5XloFge0Vx1WDy9LeY/RnzjWNJYxmbyvri
l7TWBBi10rVmFRYH+npD3QlQfgG4m0UlQmW0/uOeC1QeW7Ymkw/6Q3GdLgrckSoL9X4K2rFSZGeS
KXU3dfVtRVn3N/9FF8TBHoNd8VQIOREStoM5cnrGCPzbhSTywaNIoAssHZ0FGJkxz4iume5K132n
+TEIBN4V7a14hnouUs6aABuotHl47Ew3uOr/+ynXreBMFje98aWagusmOXrM8ZY3AGsC/PYdt4So
YRKGq216GK+1c+vSEPHfCCSwwQJMim8lFSJqBVzQox8yZvB3Qnn4rrhOTlzKG/PbRSKtp+r6fhQ/
ZqKXC1nkOByFWIeF74iyLfzsLkz1Ipx5kbhoshiLbEKvLVtLqrpHtyJ+Lz3fEazkY0kfjXkbqcPF
lgsgudtTYLdfmcZgeoI3c7RkWuzsemXtuzazQHvM+O74AaYqVsErzDQtTy2i3h0JylEs8dgUghl4
xteJzbuUGrS8PeTOsf3yyJICIfX7THAEn3s02ThJgPiDWjVj+l9/Y1/NSpAXyanpD6cimwVPpEuS
ZeEIJQiQ66c6MN8If2uViTQXJjSZomuZwRVTeep7yhZqm2Gp6QAZLa+ITZNPTcQ5GC7DiP6At9ny
bYMmqNCtEiU5hoiOA7DXFw4JCTX/WyeMBHkJI1Pj7d+VxEUtMfHspcHuZCptzsSfpJObxT5/rUfb
SoFnmYIflc9yjYE17lvT1Ju1G3uSyHJVLitDNZW7lu3oP1OV7urQb57pqyR7hYIv94fswSKJHzQp
2YWcUPsj+3Q9RHAmaSsdXDQokWcF3r2C2IVwjaFqeot3nNz37J7p4/A25OpOTI5rHYJLBMXXl8io
bxspbkaG6XjjhiUmE2idiQns8muJW5p5NSEGWR8/NgTLUsDai7atWEHxAiai+Sl1sVcgeGf8lwTT
ceCLSHe6QKd0392nSjobfdI0EV3rrJyd+JxBq41e5FTFRIL6c6r2+bsqys2ArCyClU13b6RrjOX5
iyq5MOAbb/W8dmhCEATyAcK7Up14MaPT4Qf83Z6iQEiXzSM6w2wvCuYHI4KPBFNh/h0PSRXY/pSv
EoQTZFu52+dJpy6PYJxjXR2S6vcq6HGGbGzfNKUtpBZlVqBXHbRnWcwZ8yEFZ5xpFAnd/0A8YcuX
bGZElebLTihwZwonQdnmDXDXQ1s9hiKoQh7EErIkhrSB6+fQo3MbRODXUSGO5goJIZTCVCjV8WrE
eGjxp88Cwn0tFAwOhZ4qP/xioqfLaZDz+DaIpmToZBt1idAQrR1VlnlRtl0utWRnyJeM0HskS4cU
462RvAzAq/BXevDos0Hm2NPY+tch+EuBx+EtXNwNrhLYtUYdKoA5fwYj7UVAh1BJGNLuqr9MNqt0
zZ2f8fdwAKtzpR5pYl2FigcT4PJcArStqFP1sDjtOTyIsNN75oljPW+qlFsDVLaqbibbfe26ORk8
cJtOZmsOWk52w5YgOBwveHel5XLmyqnuB6q3au27UFVDtRJ9mW6dGAGy2DJ13qdDXnL50zbfp04R
6YVZ0GSLDRIa4sZZ7TViKxT44aaySTJb3a9bIMVlfYyfcM2vvhYKTULpHTFI00AznUBBz8vQz/Ns
QXrfvqWVhpu3VetmndwLxSBpGo6e8LMchTtGi/az8Wlu5uPo0qDnaxLPPKsUPfLYz2+bSWEkZynG
oEFYJ9BpveB3kYfs1qLw0Br/MMGs32Ts7CjA+HKo8AdJvtTbeQQO2w/OWKzfAXoxSHKHFbUoeC69
6wZR5/CXSebjjJWBsskAssd6HpZOTud3GQUtdUMLZji+Hjg1yDo5O2XRv5ZvTAWK8+9rJVdidT4H
80IvZ83BEyXfS/X4b8yAJ3Z1mnLMOzlmteFkIyleymI+/C20UccRjXNW8PK7v2+kyUhogT/3350A
b5y4l48NJ1FCKgc3bB5rikkS8Uek3PQ6giRiy589KROMr5C7EuIiuspTUhiRa2+Hge8C7BXIduEM
AQ9ud6nTyWCvG+Lh+KDqCN8X6mrt74lNYcPTCJKTKxQ+5pPN8gdzUG6LT2V7tiS3ZjPUrmgmbk1g
RzpXBbxqB/EZGBbTXTN81GWNH+yL88VDgMSuXFhuKarzRMKIpfycM0Jq86Jw1tl/4cR4W5wMe3cT
ZDTjOL01MYz2lX+IJUF5xaycvLh17riIwuhCwFldLmS7PcZpsBDpIArEUOVEqzTU/Sglkz7oCCXy
ZLNaJvEYDkvV99xlPXYX89QP6gv61+2sX5BXaNA6hK+zY5sd8J6zzBx+DmQ297DqvYxTV+J6CgPA
MO64FlistJikSijThS+KFJdyP3aqgRb5xQWbn/8DIJ4B3rcf8AK/AcbHecucGZD/axq/QAnMgovl
Zih6Pn/FVAiEMCDAg1kgFBjzpXB3N9snzRBEy+SUbeYBzKdxfb6cdaSY2+2vkoFW/TTxhr+tjUwA
B/IHS1KsGkWsjC0JfZV0Tpru87QkLxGUIN32TE83RWH1+D73ODghPYnL3T+uSIdNM/w17xBL8qh7
pIijiYgeWk9vV/W0asKEFAMojXB74AePKQmORR0E5/UgTL5cLSjJSqclrniX9VOT5yBBomG95rCm
SI+PhN8qkiYNNqU9s0BXfwjb6Eo63pxDKz5JXir6AIZUJJefREU7EgMe/N0AaSqXwzjT5DDV/0Pj
+v2/dBV1yLldIqrssNI/00+xJcyMJpk60ZZlgzVMLH40g0BNHr6A/nRpWnbqfSf+WlTmvDPQvmBd
4wakcJj1/M7d+sqpiCx27oQbRY+LE997/0/U/HPOo1XX59ssJpueGZEN3cbVrqs8tRObJbqA0HVF
l2LnjEVFHVvEuYqjOSYrvLhP23qurtanRBNhgw+rzXt2Js2jSGvyf6FmgDZrdSE7dHVNhR/6R8rk
XRKaPA5CdLiCYHfkGoPkqdVBE1A5cuuiYB15xRdcjR3gdA9OjloJPBoNThvCN9jBZCx+OjumrjYi
e0BELHvH/yl8lz9I+KMWiqQecWaPbuvvWihypEIp4hw+FAmxunATE3sAz/RjIlOjKUIL50RQKD4b
huz29YTPi5BYIysaa+rMBSR/k5FPycauf/vfnJLAiNr/68rFLOssXqhNm5LJjmEAspEoXfsaXpJw
i8Yh0DpA4ISIdMcbQgyDU/pe9z2Wto0z0qvHmpVLXx4txmpkpWhJ+hkOH7TJrJe3Nhqs4BhNxsjq
8Hotc+kHj45UrrEPHN7mysMdVerLcy1lq+MIPJABMa2kVZwPcOZOx4dPynwu92b5UJwBXUIigHP+
vQpkVhladDFa6ajdAdyEEyUFxWgpSWQ35cm4WBGEiBDEs8qKaKM4CbhrdspEnYNS4pTqE68cWJZg
jd5akfdvneJuMm4T/NAkUDd4HOOle1NcRVfEwfw8DX9QB87AzDiXgSGKGtmPuWzrbxARJjTStj5R
+Go+V85kM652K28nW0IPLn4PtJz+ZM4UVsq2sTDjT7u6p5tDvrVTWr8yYSvRpbRzF2Z/aJGtvneQ
O7HS1PI99IR1qbI75XKy98oZL/lnJ9XA5BICsNMQVCUdH8zGNo9nequczCAruHRDEmhawZx/UHVV
O0/Re/bZnsiEaPWbfKaamuebymMWBD8UzDdEjf/iWTlusIlB+5yrW7dEpshIUvwM0ixJmohWqNhJ
5xwlD1qv15f7EEHfu8ZKw8whcVGOPX4S4lougw1T13sH9P9m3U77HAPgyi/7giw9WdVkzTkar3ny
fe6ZAC0vb+iNFgmSDHg0TXFd6CUuecCKkaWkZsvwe3fMbBzzrwU/2O9kToXk9JHiosFTiGXJBWFF
sxXwYxCKx2yNUE2CBHhda+iiVg2ZNfDws6xLJunPzlyU5ZdXQaMmlGH8ahA+UNoRHWYtxjkCinyJ
7gxGaTOiSabsSQ8HFq5Qu8eMPnYFBk/XTO6zgRTgf1vgSALU3PAAg0vr60meibEIx9F+Hk2J61QU
0auKv6d2zfow3IZYLJyLrjXsGxtKu+JXY09NVdl+K9tdEqFT/DkbuT7GZE+5Uj/ZlyBzvnZqHeuC
3Da1fEi005rzoOMYcuoq4/XSvRFfmNGyxvYwe+6wXxSjiN7y3GsDj3FA1DALN/uemZgUeAbXxzJR
3zBmf7ixmVqjeP17n2dZQlqbLacIFyMQ2KqJK1G3RdR7OZXG8DuTHvQd1NBGSf4wJAz0ihKKVYOZ
07VS1A3YXnPdZvI4DOlN8Bw1EGDDRDkK2QIt3mXxBrypSNNqYN5B6eCaDqNRLPLd3kc2eFPzvpDb
l7uz81zfRV9dQvnpaSSjReGCVVeYze/MihKn1EmbdJARR3kOkHGKKk8Xy9FPP3pNsykR7pM5e1SR
cOxncbKQpFSFSAJwn5zmH9hpDRAfPIceVEwNZTNGH4RsN+EPI9SY7fbb2ozf4p7SWuyHrEMcb9rg
R26+BlF9Q7empptjB3580dqHvP4gnLh8xV1opJ9WfHVZnP8w5I7AKe5QBrR6uY67I5u1N/t1N597
oywMAl72yxOQdJ7UFcSYkmjVoMaC5ZitL9gTSM/lrq/t0AqNzFw6zpAsAWwa6xaI9EHR0r6m9Nsm
C11IPJy9mEuxcRqqwJiP/i9pG3F3Ri0fI8t6w/Hf5BpsIi6ClnF3BAKQlGDrnu3WFHGoEsGdRUQs
Rf0la7CYk4EPKfvZ/Opv0t3PkRVDAnLPLE2kvJfmmxtuEEqKhVkCtAOhv2JwGY36f7bbdDx8QXwP
BowZQKwTo+L3cVKslFFof2Yzdwm4UrITPej8TyO/TF/G472wOQFOj+7M/bs5m0QeSn/MHs5X2dni
N+r0c77kxqAprUJdi1IBxFSVWcPc0Pv+WLyPOcFa1s+WBv4cYBOTAeaEzUBdxJUY1XeTrt7pdqlz
r4wkb3LfkmkYHiwrBWbIoYmxDPtH4vKp94Y2jboCNSeOlmXkATDx5E+6wGtIXjNYqS238ThSPI1I
IiwWp6dY25ukbJg5yTBBZhw9GjPoQUgnrZ3eRsJb/uz6cWFW6eQDmo7BfYr7/NUcgt6yFbQnCnLl
GSRMBZEhzebGJJ1wOiOMao0I9eD2UNJbgBr6DUnixmeT09zalGS/RKMRCaLTucGTh3dxo0Ce2Zsd
ajpccyCFx80t62AgTr0h17BbMWMvd8+8JbO8ic3RgdcG4WAHXI6fFAyCOMsTMiguhgkkqWAHrpht
UTXPv6oMUScHJqavXMkgRwO1dTm7ujGvVbD5rPQd1aOgaKvrg1qloTHFrXANP2MOcyGWb/v4f8V8
DUlh0s0LTBRR1s9MX8wN+9tj9MnVistKV7aikrTCBq/ZY8Ob7IauY0iTAgzQFl3Eckrn/PLl/RTK
V3dmZ+eYosCaM1K+czeICbHnqiQPM2+Uhfj23zHpoyHaY9TsELQtOlPhusCeqaA7R6J1KLfNQ0NS
HPzNXHvLyw2lT3kUYwFgrjTUZU8kcz6E6jJXee5V2SqGPQ05cs74SXGvdoojrceyJpbsxJWDP8rE
eH1XGftGlL7D2cfJg9+3BKjnTg2HXcweBhhoG0mizq/BICa0F1jI2VCzHlRdyqNqr38ZNpOZij0e
sJg6B/yK7xx3GPjXmGpcXibUmoqQsyH53rL16xMPZ5/yrBw5Mlf93DZWShv7ddrA+B2hVSYbjxv3
j6kQ7uJpLZJ0o7YShcBaouNUKxPtFCdOa9oy90lqCMaPAp/gdBDkebTyW5jlFwAoKpwvUaFnkJRQ
Pyc7unYF+9kmvl6Q+aOPG4/JzbEh+m//BbY17sxYKeG1IVFMEQOzAcXLsdVVnI30rQGn2Ig7I4Jz
sIb+lCrBd3zSeUXuaRJtl/hxI6bO108Pqc/EEg3ZivOgBqdaxPLKflALvkkcOgAUbRWnim1LkTuP
LXoFaNUfq6zzzRcWZimaQD+FiSCxtRRoji3ETdN/AakYn6tWAIAO7Hq8PeFcJttuGscONcvMcolA
zcAprF62Zg9aW86IoaWEGrzN581RA72Qw7ZdrTqeTuRsXstV/1HausUZh+W5Rwue9TWQcF66/ydt
hK+t+iFkSdHrnmgYm1LQoDtMSs1Y+4bhJcKRo8lei1Aq+aneLpa5GPHOID3YOlBA7dIF72SfGw+0
u85fiQfaEon9/Ca3KSKH+KxzrDlsrHelyBYNzAIPaUASe3HG8cOxiVD7t2z9j0O2FEpQNt9X6c3x
2UKTaDcu80wVeYdQtyHxR17L+VY8ltg69qq2dIX6GF/JTswiqbHcatefuoICK+t5NLmSY1twOZiz
YiDj4oLbdhwApPwfTzxALGPblR3nFGfb0IYRkID2AG6HufYG9Skvheln83VqA17qErvkg0+6sU4K
B78hzkboK+hgbVf+PZCWejMIh8Vtk/FToge30iiOEuC72sjnyjUCoExfBUrH5VsrQ1ivR6Z3o6BI
krR6kJx5ULAx+lP13exG0ybGiA8tgN7M2h97Y+RpsLTOZDD3djA53XHhcHdtaAbgrfVGRSyWQg2C
XVn5DQ+Bh5R7FfrguxeM0eS/XkqMLBptZk1LjTSWIXWJuSVBqst/JdKc+HkKzUwX1TmNDXAO4v5v
4hpi1MKqFDWhjfKClAfEh4OiUsSYfHiZC5yxNleyAqW8xAasTcX7Q0+gEFiCncII6fOHooWJRDCs
pmPDL2KR8OFGOxatw9BNc6uMMqI/4HhqvzeY+CEJJV2lMxB4mLE5bYK7RNt2slKkGyw3D25vKsP2
Kb5+4PKy9IT2iV6om2VhJLQy2iW+/oNmAFJ6fuBDkNAeT/d8pzDx46uojAYdDJYhjlXqSv7IadwE
y1tOT3J8dK8oC3Mh0RY00edGVLiZt8GiUKEVwZIQhFwiCG7Wmln6kGsEHmRQ5jguqzc/s270gDZ/
dZVUGjf/HMHKVmmRKlOCgsB3FhL2UFi3CbdGniYt+33JebRNMgyiPsWrxPseqB+89LHNGTyDRWjs
bTll8P+pWHT5K6v5a5POw4xC9vETk0temwusgPPvxWnXSYnWGuhJIdGSAICwOhayFEeo7aRzhlQu
afZ9+2VmAtSi4SZinMt11ebwz2xfyXQTqBkLrMlxF32xPmQK9fxjUBtZeTF5VBxicaJ365BkbLjE
RL9x4VoYlYL3+p0MNg4/vIwDC8CU84y2GzSqBe9HauAfefPlvTGBGZs5EIkluaGyqQK714h+R927
D42isHlg17wwY0RMYL5VbsQxgNMD7ljCf8htPyO4nl97yqfIcM/e616ARqPRR/BM6L1e7c9LVPKl
UquMEbW6BptnIjj+C/NUQybA9sSKkMxbhqVRdzRmMXNLbc2/ENhcKph1EKv9JR8M3Abqkb/tP49U
4zBYmgdU7BK+cmsGLFuw6Zz2kmm1d0N8tNSN8RAieCGrkDzQny8DCwbVwuaFVWUcYH4ivMrHR3bd
VQhNUCV5+75CZj4YR3Ukn1uapfYa+fA+aAgezjoHmkzw8hOzM7bJKtTQkqTtm2/d7llKTYdVvwBA
IbghNK8xInv8oxfvXuaNgRFdHts5S9B7uJ53wFQqHNLzHWDwxn5XU6jSEHBBIC4yY+Xo3Dw4YtY5
8/VZHCo9qNt2ozF3FcJDbASwVhEIHHBvlZV35Q0AyhLa0YuJ7TfJyj+TUFR5GGQ4SReEe1gP8E4V
tqzAA9oy4bA7CIG8NmmRj2IvWtqlMauc/tv26B8O2jYdh11b+J4JyHAmDUppRxd7uBlTHhdOw9pm
XDzMDDpvqAnRMEE42HZHPyrkpLcrImiYQFF/tWz+KXSzQPxwNYNWoP/M22T07rw2Q73DnzI/oagk
T+PQaNe3zO4jOIDv8JBemmNRGHNvTu1AX439nT01i218NmV8R4AN65nVIUwgVA/ujo4p9+rHw02P
LrgW/zCMj7tpJRvpk1SMfTZ3m1UlOll2KEvb9RIH15mGoLcQKr27NVyzpqbGicRHZ4Mhgpwl7fep
/FMBdX3rz7QDMTGvuhcFahQaAlB9W0Yo2lhWw78y9iXETBCVWl/pxe5HT53/DulfGi0zPfDrO3hT
opAEh9E6lI+Bn/9VyOLGWURXFy7lW1C85PDUNVpIn3cHXA8YuXjp6zKO8TIFl9Q2wfQTIq4t21LW
cAOCBiIQoR40Xt6gfAsIDJhHR6ai7quDBeGPrxBItoINK4Y435k6UbiB3B2YEiPB8TKcGoARgVae
7mAgpJvpQ4HXbY1iAkYtKyiHKhHolxz6H6hChoHvIxZem/QDXfFbItjr0SSLsg44nb4FfxhUFUMX
Qkw2UeaCWeid6F6ktasUHUPgnwm09AdpOhk4xv7Yk8/Do+5sXXYwqtYyhSUkyANgSx5HOgAIZ434
JLxPE7juv/DzG/h9fafJEyWgGrSnNdUOyNRuT+5Nz/01cZZDo2eklaQGmipef45mjDGESweOK2sK
y1u5w3Nl99fkLzX/J47Ckgo842xw7JD0tV3DtLUt8XP/26GDueS5VYaHGNMa7joMQJLlRLMxOgCl
DeGHo2OUbwIe9Tyu9VngrDcBOUELYEICOn4IlLSHhuBZikiEF6odaQXPoiz1HCfXjASxaxiSmxRr
W+43L4TwJpx2XHI07yPhVk4BAc7VoAjpwJAkL3502IGAWsRc+TYhMDjNCW9106nME4/PVVUX02Fr
te5/cqnS/3EBGRq5AJpyVq0huryiL4kg7xq15h6BgDPRUXAqtc5kCK0HbGNaF37NH4olw6QTc5Vw
g1fVoQgVgMJ9ujJHj923JGZRucVuompPBpb2hCIRcHZgkwqszbOfD6D0sOfdE5kLAdrzxuiWhYLL
kfPR+qfRVjxyC8Hijzg0kYj8OQfrBewr+Yhvrx59WKv4p6/MDLPGRywhQoQZjeHXX+AB+vt3VR9x
vtIros5nXs8JRizaPNs7fXglSRKF5vBNzTJ0BddEjP0d1KOcDKRBpJMIOKQyN8z/ch8gPQvtYC36
xSu+h7dB9fj4SRRA6NbHXDh/6EeDi0UQEclQDX++whcm5o5TuSilNNhgoBveBPlu1zUW5pKEHOd2
waWt+WcovwyXlV9lMrPU2zI2cBwr+pWZcvDZ9UbvroqNVYVgatZQE8+5seQcxmCkbQKQwUikJAak
4gd2Ao6rGM4ClrkE2Lrv0CR2w5x83RpV91DTZ4tYTBVH7Lr2vM7PWUGVE2fwKJn1CYvXQbv6nl3L
8IcvtoiSaJGYvArouxcuaRBYQQJEwvdD90QYnXoZWtS+/swXMSactwIq+ab1hCuYlLDslOyt/ZId
Pp3IKAsNiCydlQFZSi2z2rtukzuhvH/W1lcL3mcvLHaqBxo2o5znA7gHPAhbByXLe3MDngClTI/4
koTjShEnSgQBKRQOlA6SJQiSLyDudXm6v2ZSTUR4HM6T1pwHfyu6Oy+l6t+D3qr5ECsMxt3Yu6pt
ILJW/bkFaGN4O90SnzOxE2C4vaISISjAij1viT1yAf5LMhsPmjtkt+TUtt/tHhjL9eDfIoXrND11
vBcoMA7pJ91IpUUTC+FZS0Juz9pZpobuYShYz8C97wxtWqII2m7FKaWKha4LfjlL+4JfipdpRPH5
zNVP5eqmCcYOR/ZgWzkV97xQz+7o/MNxAu7dQVaqmk8/j1emwYj4DF1ZZPtXv2WKf+pioycKFeeA
VFNjmCSglMI/k9YnKUIR2USyL9DvkJjuU7zbvhTLzpd+1wTdc5wbeL9rwxVQqzsIP5JfnnzddPyT
aDOZ3QFES9kv9gk/fa4gdu3O1EzXl3jokz0YaQ4rRgjPiX91y/V15tN++nOG8Llm/FJnbzHp4EFM
2c9e6aM80Gvm5mBsoeGAQHW+FyrBp9m7r2UpwEZGdXuB+rZFBIA235/cah2vqZnpHm7ZYiyYcgdx
KlaXwjMjPclZzSNdvJxhsKRRU4pyX7Y5wwjFPglbUXPPzYDCA8/gNWoQNNFTCSEUvRH72kmF+jTm
dx1P6P0vfecJt28GAB4eNUGzpKz8FHjBwcGj1AsHmLUmoGqLNFObe9XhqMOUTc8W1SDMCX0g6NlB
eDVzRd8YUIxCjJ9QY/u5ubEflHLE+mPPNHJf2EV9tXn2t/S7LNZHArbHsF0tP2eiHgpZEkwZ8KZh
Be9wILRiWgb1CZytLEpGIGj37aEiJfYQG2EtAXuzGiSj9OLeTNkrX8sobRdYwxAbtUiYMGFDAB1a
1y5FOFYM0YX/4hZaZsWNv8IAuc+T5UwKTu/B9GqB5fsIZH2LVTbfVietzKByM2s2IkLc1pJ/2+rG
TewQGsEFwvK0EfVwLPMYLXO6G03kujkVfVNXSy2bs892YUEXG3XdZ2AJEumKgW2f//ftpk0gtZXT
piElW3phUZ+A5ueMeOQkvCSN09lh116otmqxqqYjI0cKwK+sXJGM3Ra1PHpWwN1n6c/hYlYmj660
G82c3oYeMf07cK6NStAgczg/B+I1YEV/kPFelBhDcTQmdb1ILVixWkO88sHUPkt6pgbUO8TKhDLO
IQ0b03lWFOE5MaxjgJDZ/QLwesLv+bboa5rQraDXcFMnIM1PtMgXT8/7krmruRR4Cx/Xm5IgRfdb
3Y9C0a/5IhacTKAV9uPAaL1GcRHwJXF2SDniXoIo0ejW1rSuWZvNe/mosUmdYadWI5AffwsMKg7M
FMr/52tyU6vBDmfHnuya+/zazOLpa74D6+TwKiodZWAffpsyEcFAcomb8L0cVKP40bjajXLlcwue
DTx4/b5F0Fl9pbkmLtm+Gx2XKsmaV8ZeRiYsv+UOvQr1hapwMOuzV4VbkyFtBCeUpM49RNJAgQRy
R7H453EMczppOC2A6QG6O6/VnMGJVhyw67h7SOfaT42XzW77DRDQ/GAK861sbqkwll2uM+/7v71Z
/JZyMOxxYCFUb0zOd3nMexUDu/uBKvq7sgvodf6aJH7nHsFY1eIcWZNdmUT091rlQpQDJpsdgptE
1eTAIUs7FOJcr95Qc2nRV33cFWzwY1+a91vz+BusJkChDxyphGT4yh0I9u/jP0+NiD6yKUCQgLEO
il/NBpyIETuI9ZS+0UBPjBLSa6M/Scvq25SzrT1fkD1iWUlPBUaK00OPzGhBR33BzEv7F5Ub0y0G
Bz6wHK98JLwN1UFdXUhUy0T+H737cGFN1oAz+PZ6Kd1G9sOiS3KslNlT/M/KVVKx5CjOfpr+u+w0
JvOZQNl5bdXNLoSqkQWa1X3w8d/VEomnsibRufKVX49fS6DYPehXhFaEYaporoMcjQcdVtN50p//
fkzdf/4Bi1MK66IYC3WbjKVkTf+pgLY71SdE19S2hWZbFbmIapfAYco5mLlRFBBCK0/O2zKx4ko1
w24Lppp4BvpHBgOWMfUWd8rm04PrXHjQUYspwy85RZrY5SrCj4urGY2xZjaKg7olssONT9RHxcoU
8dMYYSAJIBrmnjrN7iJbEnwSyKh0vwSfR8SyIxk/CUzujDZWAXMNxIbOiH/B7gKmG+OHFxZSFX6z
3+apjj4H2NwQ7VbFKyL7zgzAWhBW2ifhRzvvwBK0SvPp5v5pxKvSigIImD10BfU5kQPI3IFy47Qq
1to0F8deAltKpD1l5HhHI1ijdSGWEb9tpIymITTbK3M4NDNrigR7GkqFqSLVh9OBtNALQGGo4g8q
WvptKb2QOl89vUFGzIJxqbvfDhtLYbz+3S9R88+X2eizFbTjdy+wY4ixm2DFGG4JjH9PDkGItubJ
nG2BYc1M9STDA/I37dNDZ/oR4Xm4pnpj+4Lb0J9q0wo+p2XrIxPhs/XpekUnHnLDjmZYaFvytsgY
ZejaIzqP6IkMGa6cNJnhlQhQwMiMejfROZdvhiPqAsl49eSyvQNUIZxYFBrNQSmohPLsneIIyISF
HtVTP2pmGGi9IlggCtxDy1aP7uEENa+pYMb8MsFyel513mcGu0ROGZYuJTNPA2y4hqUrLeGa0uPD
IkciBwhbPt2SqQnVLziYEDH5PI+Lijdv4JPLm1pASNo7wlYFMfmrjZli2b9VDnf0R1nPKJX7ZooB
QHsD0SQibUHjLncRH9pemJ/IlhNqVKoYHAvN5EvtcwdoMMtzWUHB2+owPW0/2JATBnMnF2A6WJUi
BXwEl0ebCgA+sIks3FVScTHLQC+mPmB9rPsA9Z/Y+mMjVfvKWRPLoASVsoqlCKeKPOihKOJw5TIS
YDlhCLKEJAZvk72NOVA+33YbJXT1JWuyuneJ5V+Tpsn/SuDQwRtmTtJh50BdMIihLsB3OGRG44z/
sUBj44+9zkfbFlEZSvTjRNoc6KoVFmYCFcHj+53oeg7oTfyYCOQej7Idxqh63nJqz12XEbCdbtf3
wOD+flZy0cYC+c1OBaMckWOD8zzHgnzKCGxl57x7T54W8jL7tvC8QdIsi4jE5dqxzOR4kVoBHMFi
KjAQ1i/2AQ2h6e0O+1hPrSl/9gHORAHLzA2OXve+7q0nxZS99wkqzX60jw2SaeqFYAy0cuv5yMo8
yGssIIqpXKDQXCSF0Fl+jjjjpnmaiXssA18Rdi9d8JW52l8wdDdLlaRn7HIdUupA//+6fdib26ZV
MNWBeUpbiuEr6iTtJYntWgTrT4AbvLI0Dedu1yUOMDitaMC91H443HqP02S1A548195hb1EKAy8p
cdz1bf4PazRo3f3YOvDi5SSJQSIvRCqPFTMd/v62nXVutM060wChdpKnJNo8W9hVVl4QVQtu2vcH
4sdwABUEmjU0BZTHm30mi3M517adIFH/xD+kepd0zJwkTTBNpjEXSBbk6Z0awzgnqi5L/86UQlft
bS5INRj56lH5erHASmT2N0fD+IaIY9W25hp3QjRLG6a+VipMmNRf08eD56xX0jtr7+Bkqp8osO0e
FVrELWZ9EvinfahAgOr2K96DdPoVER/1Wa4m2wNV+DQgys5YT5NUqSjwcbB0AFWb7WSeMNR8MxSk
kDQx1KJo2Z5GR+ZzgXaEafxid3GCuW2qRcV/JE2fRzF7is4klN4RgEIP6tvISfcnBkRpuhDLdfov
1RYxHGVEo20wYikByUG+sVk3TTW4ck9Ho9Vw1Wxz8VK1hwZ+QLlfZ/dWDo0xQH0EZDFZSRwlxsNb
2n0vpG6CjCa/aqFdo+uxbyQnVhlIYWwSdXa8ThDUdwlG0WnZsqR0aV27w7T9ueL5XF9/FX6zZ9vU
inFJQmUdunD6wNOZmj9MTkmI+1GpfAFEEuI/XEgliaSKfO4mbxDEdTzklQ95JJS8HKa6PEe+yaca
BQAYZESN/sN+LSEcK6i9NBl4v/QoEkSNT1+kK9Nbh0tWYT+hW2rxbPJSCKChV7HMCsbNc+Wk0C5E
TViOnjygy27p1jMhbVmrCaUScHeai9HiZKFlXXU/70HWqhxAjdrI2XBAYMK3rvvJAAiV4p/wOOKa
QRf4m0/ZiyCooF3jFFefVK6TWgSUARX0i2mamZzeYRx/jxW7qLOM6BOROF+xbbBoxd1IMv90+RbT
8UENvFib7WQMQMATV92bBaN61yxkCo7VlTtRYJPARM9mlxHnDtqFez06hfMLK6v7Vyv2tEV9ghby
FtqXZBVmqA2KpKNM8rrjnsvodr4JgXHSrEMKidDuHUZ7YPX2UD6auOx84FiHK2z9zKxudCAEXCxG
v5nEDJoqKVXynJGKcFnad1qDHFv7gYJwTdessK8mV9LxNMVQtR4L9VEPRCLbb0KaR7LcjjJ/v5Nw
In/AVU0QaPz/oGwMq5swS+/QphE2BmRzotW6l3uF8ODOJT9JawfOEElS2iaWWj6jB2D3S2HR+670
mVsW/yfC2kMM0f8D14ys0cmDwxZOAQ4BB7+fAbSkriqERcG0tkfYdSe4V7zAqWX/Tve6I2Za9LAe
XX2H+0BNWWl0aq9KNqD+HKRsyUnfRxl+ndwUKzVdxPIpJd/NwP9mdmi7UQ/Y4VEMlt98Y7d8KYk/
+K5lyu1qazEKjpDh+nNKM0XgFAuUcfFcTHxu19mn6owuMD/UPj/+VNmeenTDMSmX363IokqtcpLe
unQbhWMewelCtMTd9WndtOFGsub1+RZP2qDpMiRuVBnB011mJqmkdSN06cm23QIUun6Scag6YTpo
K93hkGftGKgNZktcg1sqMHJxpCuJ2i0T23CcODrTu0k1ZIpD2RcLmesD32i5ZQounsDvGe1pVxNy
V4Zab0aCLs/C+NVDpeyaLJw75T8rKYPTbvW4Cav7qmv3JvxmYnLgGM1bTSw6nbQbnFPlgl71ZfY/
u8JRh/uzwagUs+08pHl8tURbwKF1VeSpA8QoueLcSQ9YEQ0rgDMHp5qV+8r8Dp1NWFf++WLsHDTe
v5vIAeNJGYQJE8EfNCgU2zLlV2mo0eaFtrgsr4X3jg2UeCs7RhXMnjEAlTK5/2g5kFEb+zEePFz5
kYdvXMXIPqWpMFprRvWFL1BohbfJaGe+4zZCXqHkvsxrAs97uNCQgLx5Mr2FZUifBfRBzumYHj9n
8mW1a3aZeTeEv1ZFFol+ce6ntSTaPJnoFpwGdkcSBo66VmbVpV/Ph0xZkX6xE9R4sAUAh7AczhL9
A4OgQ4yU9KPkrPBGh8IyMTHVIlr7MIr005ozUzn97cMeZXxdEpHgkk7xKRbDiFkxKzh5yGNY3l1Q
uH0g486xLWHBchQoxlVpaTPkdA89hinkV5kt1T4uTtxAy0iLud0+TqXqX8vuJJAro3jWESerpgk4
RnDouuOG1marH4pvcISHwYkvU005boVuCX4EhzkQAa37cmAPpAMzYjSPJKQgjB0GIeCqQdEuae+P
lAoCrjTJCCkuPmL6VeiaGbzYjhHv936IGnk9tIPFFpCYPT42y7j6hqZsy5kgiIV2tvmwbC0VlWte
ozyfq28d9R11WpJqxP/DqLnv1LwPwrAxIl5ix7EtNdwVxGeXaKXmH1ejHBZi/VBQhl87iaPT8x20
Aw5PX7fOO9umuHMC9+tZN/b71q+IpFjyZ7stWX6+RZwoe+pf4sc5i+JRljU74vPqvzHXU1UtxV9+
sCCYohOdGd/tqzGrByHQBGjmCLqx6CL8iM9qPg0GTpG8qy5c/DGxxpqf/PCrPXTx2OamUjGRBFUO
IdAVA0Znm/OzwhpzOKRqg7yw/CeP479oWn4Vlq2klWJcvZ08D1cevR8A/HiUFMHGdTpLFI62uoTb
5GZdkY86awSE3UwV3pIYuZkeZV1Ubk9AC4Yz/DQ0N+TJsrZEIrhK6veHa1xPGfHqQhu/YDAokVM2
YfkSSQzMvw/wM8XIluiwnWvGbX50p27iaoqbw5EpK6IeuOtWfRl4o9bdbeXp3Dm4KXUUopG1nVfd
EK2SpYo5BLsUmxgwaNcaSeEdxCFy7cVM77OgpCvYa/8DV8TPbrEF/lbpPjxHJ689swKFr12OmApE
He+hbPW+UirEef7DoMpSxASlfeaiBrZtD6ke3ZGZh2sdtLqPHitmm0LBT3DbRfxz2XUlArFq8+58
cvuF/p8aFaWiGyBV3Onc99UIw+qPRTPLsUaP9lQ3TjKwFlYw3Gi3PY/hAzfA0/bu+Mr7YoeJbN88
G9j7gw0n9w9mKbj8We1gwM/r79UHKunRyRHmIuWZS8jfaetKsFhmCKcgSgppx2nTYp920uEzRuDu
kPXOGpjfSb5B6rG8tKB83O9PWOYA69LJmRGdsxJZJYbbCAIXCwOMiDYovxbgnffhgmQqbGVbHyse
HI7/QmrFFbtl4rar5muYhMYQ/SZ3qURBC6PEOWQZS3MGdWSYPk9JLalUmQYXtEksr+1BtK4ygtgL
OGarMQl438RcNp3vPWYmtlwT8lYmU9ZsnqnjLaQpZPsnnfJdh+PNTfXyJgtqYGwpr6cnVhAMstwl
6b3TFhrbLzYcJHnBh+gV+9hjKsEzdb956P7fFGsHIZb3qJFb2eHVXOYyC0ZCcQUH3fyazvFLzTa4
k4T25IFXH6QTyyzfkF6e8IgfQqMQB1QIz9RqJ2+BKURBNnfWZPWEyRoxppUl+wJACaEm41KJDZRk
mE7QnCVnrkk97XYK7qCfcNVxjZS6KVwvuuRR61Xzg9SQW28cA5nu5Lgudk0ALY37BZLcA94WXFcb
klm/UqzwQUwRtXoDxvhewzK9pUhPnFjHwxLy8Kcs1OkBmSotwjBbT5gs+lyZm+1fboGsCgSG+nhm
ht1+bN+E4CRkLSaF0vPo5ek2N66fDVxAEp+gWffyaeJYNckGaIqkll05pPAL7p4L2L86E9HfX5ry
P7Df+j7QLD8P4+9MxZ9knI15zgn41cphLK69Km9X3Z1Cyg/4QQuVa2lNIXqOS8HS9qXddoSC86Xe
k0vMqKRs5CZq02eLgGlE1MLoVkmWM8JGJFNGSrkT8WpVUCvxssz90oXWWobXrKgAHskvLzcZ3LXg
0svhPfO2U8J9NABQYRVpXgF8twDHzro81K7G6FmM+0te7AwwnkFedmT1ypVcSSKi1PfChjktdsgU
QYOAH4LAmjxEOMZEnVm/zlxZio+W+HZ2j02QGxd10X2KeMd7/Kz1H+XS1MVmdDrm6HaAaGDmk7bL
sLZJLjmkTk0eAsx3QbA9r4EtAeWJX/uimyaW6Lfkcf1v/woQKq397YRrf+tZiy3BjKA0CLM9vmBm
WSqUC0wfij57yCXph/bXPb0GCM8WsFi+9WOskYo78F9skW/XZFPeBC4o9APm7fxpID2prn2dyQQ1
KwvgGFNU3lLoA0LSJmlbvLhcas8kWOWY2UoFq2XufOVOdFw8jdK9r5wBp0I3c4EwWnvOrox0u9ta
emMiV8YoQkgFW1wC9w2Kb2M2It+Q/wr7BUmnrdJLuR5NBW9o1GgLkEi9Jfs+1dEHdJmGDUTvOCNs
ZB9MTh6QNqrhUxtP40xox/iGz1EMxUhKV7rx9GViQqgMSZTsi4xKsHG4DK0PPCZ/YoSZ39xL50RR
HngNRrrBMM7K7uySQgVsnsazp61Jrn4sYjvihL889NFW5VN2tWUqQIzIG5r94TBMtvKE7lWOa/HQ
e12y7QowLDgjw1lYu+rl3wFKHNCwF98iz0+Sqo/HhhnZ3o13yNMA6JcD3qDQIgXq3MlMXP/C08e1
RSvGhX9G/Y0gZdldcAQudCFSjaRLqG7VcVQMlEBd7olS3HlIlBlOiBEx2PGaAW9SOO6N/TGUL6HP
BqpFxARnmCvoUttJNeFFapt1PqxKpmMIgAERy4GF8a5Kqcyc7HyCJuUjlQ6a6ayUrrQcniNIluac
VFkKQc4TnzjrmWdiGQlUgycFs0SGsH61TImaPpE7WL4mXTxpY3mHqrnQxO4dS20Fqk/uq5Ye2/Gi
i8wcyeLYpgDyL/2dNfAWSC1P9n9xJKCbkHL4coMNAFr+oU/6f7LBf2KUgaz3MMMOsVw/9601c5r3
V7h4Sufsa7o/Ymh2yNKm6uaNgqNZKDWzxP+hZpmRWRQCO1qGldIGZKneYi6uSS0SaYU9nijuDfPU
p1pupTDTI5pzHA1rkgsMQdQfHyzTUP2L8l9GpkJp7ykHaq3MT1TCXJURLX3oV/WUsK/u2/Q71dA/
/r6n88uubOaUg7doLCS3PWEQGUofcjm+uzAUzcTH+4ctbLasYRkbainA4BgjNTDA7jNEWCTZ+5Wu
27/VYCGfmvR8tUPevJD5lLYRzZUBogI0BKQNVrTh577qgSKG8PjmL0ZRp1m0qrbZgGNagh10EaoL
trFCZGji3eNHcoQUfTbhf+KHv6/dA0M/C4u+OeWQ5XpyMn9UbMZOR0VK+mMSkDFYxTOeOVCU+gKt
1dhwjGbvj9OLC+leB/navCQgEI5aQ6EI0rnkTA929d6u2HXC5EPYrMBpMXE1uiILjVQqQLlHVzKI
i2nFkkAHmphKBHH87THplcHQMBfdYO4frIhKJm+QCuX3QaBFHBpOcd6kOrblJcVb0S9TzosYvALI
bKX0R+c92qVpP7drhzyylMDs7atMBI6cXcUy3LQlIRbVm41IiHBP/bT7QVXDhwJbpgQMnvf1CwpF
/ncxcpKe4IzvMfd+YibAHWGNGuzFbzaxTOs6XC/i3qwEYi/Fq6zeM/LnOrZDyUhfyHaeDuzxzyWB
6JDjLr0GiGwj/OQ852hrqbjMDvzRTDa7TVExDbpaIj9O7LViS+LsU2ml02ZvBU4IY/OBBVQyKabM
WN6N5FGArCnGiWN4htWpzW5RKb+7c5sl5ttQu7SCfqCPUkUj6ROGVJ2Bf/UrMQg8/BWUyQq5pKw0
M+q8re/iDodnp94B2Spkpx95mZLJOQUFVE1hZDTlKVZA9x0CbZv/xMiM8vBIvnzPs+Hcgun35Qok
TCK5STYtvDr0kZe1fEOxE32oa+Hn0vS0umz3qcn32KPhpySHbPeYdUeNHeVytx1qen2v8zza5uCa
VXDf94MHaoYVw2YFDlH7pKQUmXkK6i/EV/Lk0FbapSXpYUXVc/ZrfNCcESSdoeJOETf/bASiz+vi
5Yjfl8HGpbwQkMAyBSnobal1uWtaztLZtM/X18AAJdmZ/3VXfVttua7wyJJWGJvcbF6yzZdQL6j2
UZZjzGDyEVbo47G7kzpXgcLkcpXP7ZZcVoOOJ/H3CMU73Fvx2chrzkMlZskXURtrG1xro2TeDwmG
KcZzPbooMzMmBL75plvoL5WfADw3/O87kRb6Sdhp5Lw8fwSxTAo/7287spkjeT6Pt+7xSgJ0ADD8
SsEeJvdMV8NW6ztuu0NINq/Si2p4FNrk7R2ZHoMVLQgdRpPRJgRzcM4ciBhi0Yig06cNkXduGWRc
VtKBDcziu+p6aFfDVzuRY3FqHKPf5ho426EakGCP24Yym4+MSKJhmnI9iMx34LkY+U3mcWGm1Rp3
gYJ5Kkru770GuKENlXRX6N9612uFywDOmXiabLFFRI7E56TrTJQoPMRFvos1dmDYylH7jr7UJSZE
kOuxAegDW2N36kvFjPwKZIZvXsdll5dFj2Y7aP4r/Gq/UA4+NG6KF431v9fFoq2MaN3+R9SwF1gg
0HfOB110rCaFIjx0kb3yFBPhOCNWPuRRVN/dbGlfTcb9uxyEjS781pOVoJFLNjyofUlLt4oan7tg
+cevz8XV1JMIanisV8QolSmuHIDzJiK/LHO2Q1ib9w70M5BBYt1Z/JzzrByCZ1K4ASzL55FIAc2y
nbTL65llippvUxd99ymPj0eJoDXhodHQDYU8Zd5/AnUHo/ztXT85vzRZdZt3IbeDjOYsXtFofJ9B
91C1qS2JVcMmEm57kYu2cB3q39LgpNa2H+0JPO+oRGwKIH1rZpZelrhU7YWyLLog49QjDMhpBHT9
XCNXekukHXUnQ8tuQ4Ajlj+glIJ0LNoawURWVFv2pj8dDE++UzqKivOpsPwMEtoz60O7YaVNEgi2
RXnpkHPxd0yRbvrHmGHYK9QrPlkawp+pvMesV9rWZbKRzZWs4cwpWWcYLWVWJqyjeYr0zv0LfbzS
2HO6pXIMDqz08SQUI5qKH1kf4TyzcbbDY905qaJqYKzSEdW6+r9+eJhhFKzWhCuP+jqSJClBU1LG
gBPuQ57jGuuY7C8e1S5eZLxmCvIaeTuheyFiUV8AJhI8hIytlLfRCSE4X5S+O6e9qLvFxr4cW7HW
ISV9CxFkI60CvWtq84PMUO0lE8T8xOrRzCcNcKPjRH4jdX+mGl0tXGfHKZJuCS220/YTjqVViiPv
H8MkWi2NxuE2KATtYnN4GzkwI6dsbQtu6kucKqOfIHdp4h5CNt3Aqk9ujzJM8KqIwrSbKxHBZLRm
nRt/Qmp+pSOFn2LPCwuJ4QcFr4Rr2vNTRxNirHeNLKGbznmPL9T+kyI7881gxbk4BAfpbm2mtRm5
pu6cTf11JfH4olpLeJUBfP+W+/2KpcK4Dfu48LQ3aJRdNa7lVjqizbMV5/e0fRHMozWEnz+Uncf8
I59NGs0RgBcbmA2WNRFUgKUEcN//8FUA8NjDgm0eR1dH8m0B67vsuhAQo5pd6gm79DAaLrfZ1tlT
CB8QBJdhdiFLRzIY5iN6IVqGwlFfNjXXiL6FPhqbzpCBd3uMDbC85yJqTb4mSZ6brx9Z9mI1soej
vWQ9UZWMxbxVHRJCrMlej9oRT+WOmei8MtGrfo8o/3goC+Xj2vYbarONy+FFVOyGAqVF0B15Mmsp
6n5SUlkmRHz6D/n5Sqvku23HYV6TKrSzyVgRYJ8k+JW25h4+TBsx3UmOeyjrDtksuw83D9qOzF95
4vzhk95nogjrO65VK/E+T83v+fOA4CHRWcC8CAwkXtNQPXe/bGjIHJge8sLKvjyEz6h3qiQRVaZb
n0VO8hSiqu4ym3UCLyOXK2jZuEC6DOKK1A8+GvoxEyPYXXEef7SG37yAHZqRsd1UT6i7mcjOeG6b
QVHrW4GJyT2RJ7/03/q2ttZfqcGhJmKXkhpTyGlZLsOHoX7AvVEAlbuf9YA3m8nnvt7Am6mPljjN
rGSkPgM0HLBgJCUvIw2aHgLGQU9jPvAP3UO4X1leLcf6fAFLJR1HI4qdCpRxzSxwjN+xuLlAGK6d
knCc1WoB337yLbiovP+zLMYcvfcdLNaqH42BePb/dne2XbSSuW4C8HY6Ygy9BpU2DSNToMu8a8Be
YXjTngy+C8dGCjw25L68aUjtVhTOj9865aT7c90ocHAduMk4+ObmCc/ygBAuk0q98kinorVKbeoY
ajsPYnXZSpvhM0xMIh4x8xfTAa8cHd3L+M5eAk81KME3aJ/rmbp1Xn4HPBgNdajJ3Uc9lVH8QWvr
44TCz5sRMuJZvxjMyf70G0emRyP3RIUqBe3GsycE8Gc1vZ7NakH/Z0uMMhuylYGPVKH9k1fHoj/h
2xS29SZiDHoSl4GCrCfDxCNfvT5qlwNzPrCpmbMSvicJjfKDYNm62GQKv8rlTVX/h2jNpehau3Pi
aLuef8X5vNxj1iT2E0oSI1/ZR4NEsUGh3PNmv/xAxA5BdYnYO33dqqPILu92N/S+CIVFlr0IXY/E
yf87aerQQcOoc7km8ueHyOESCla0GaQhxYypwC9ZsUuOKk/j53QeMbByT+QxqhT9rcVGiBiKeZBn
vJFRFy15S7L/k81VhmbS6BTrb8QSti4d6X2j6CVJLIFm22wJnn2Lum1GizHWbo4CI9wNIURc8SNo
aLs1UfcEaFqJYTlMS7Fo2fOCebClVYSMBWcyNmbCwAFLe0vXGH3rRSsY5fxCgmpw1yVfncxoCawx
e7DVVUoNJDh3jVmfsd4BwlLr5VX8S7Z8w2WTgppZfGLDyaT+PKBtwJgpbmrdIiOJ6QnBRLh2gTsf
Q9zti5hYg5OeiWKa0b3Qf0Zw085ia3L8gYTU+89tFmM9JbSEB2R9zQI7B40lgyn09Q26CDlSdVs7
MR3YadBclZM9cPiqThHAJUrQe1r0TnNsrPlgWQ4YXHSupKc+IyKnTDbFG+2V9Ou53I3n/EcCmR6R
7NORg68Li9zkHxxQjzA8b08OD4D3Q1omf3agkEsz3V9H3cyq5e4FTD4qxLbvnRCX/ZzykdYbswLH
CelkHcB2IWx+M7LFd/uiliOxy3o6hk1rUAJg3wjWM3+Ngpv+RkgT4e1Gy2IapgH8QNRc5q38oXHD
zfhz6CLTlZrsZYVjsd0uogwZAaaJD5kIZJ+buf0A/dh5tfxw3c+cI1CyWmLdf9NPsVYM9hQ4bo7+
kKzYcCarc3Mk1ivXHWNXyYXXdB+ndfDDUv0tUAuhz0KTnhKl23bpTzKyoI6RtK92OF0oj9hSrAX6
COTRormOntNum+Y9F+vH9MauDTsWgjsrStKClPSFMtOIRC0YfbOAagDr4K8Jqr1E7dZGS4Yqqrdn
mo6jf2NwAIIF8gX0pgW3DoOhjQXq/aS0Vb1oSiFtxsiyCuXmcSKb8kgcQap7+Tf5PKZOp9ELt0BL
mRO41udQRebIqPcxxk+oO9DvnfTG7+BzP5SKXVIJi8v+c3udZmKFZxwElnrqflUSdLWATwiPosID
C+tRwg2VkxbgyAIjn86ZRGBXov0qjvenrMKBxKNFqwfKF53A7NTV1SXoeJQHTKs69rBLfRL0whM5
n9B2RbAl96uGgjDp50kNNiBHMRYCscoWA7HIW6ph//+7mNVaIgG30AN1J3kh9AzaOU7karkfIpcM
KiFf1LRxHCLs+Bf7fxHN85WRvN+JQHatR4v77+B6KHf2qDN3xrh8pIuTdVVvRWWCV35mIZ/OW/4+
VKWu6IbUonGKNt0ALC6MgP9CYfaFxy5MMuftOZKnG86IcUsbLuA1a9jTUshqZzn8iiB3nmyHdRxQ
U6bJidEWTxw0IUeJvT5xim8XMNALSC9YWC10FI239gq9g03BBJlJbnRVfdceFX3z8Ow/kA3f6jAg
e1ninTG7EK6az/1oq6kqY9opuWOyOBEzBhllbjc66BPlkYKEOXwMq89HN9om8IfDTS6OGav/3t5e
jgz6/5thWgSaQnZ6F8oRYvDRHxVeX3oO2pH6Exi5cysGqy8UM4pBDVmbYcBNHKw/z0b2k9TDP/SG
Af8XnJP89KQmdEYFUJ+z4n5gg2xWXUcsdLfnEm9yWtIGOecepTYCRfjotEVqcAE+79rx9UUQT8i0
cOE9ZQxxXfdsvUJa2HuCzA8IXIIFHFHCzhTSQd8KOXAKzCBWf2Qipbn72WVVAoeNGJuxb6U9pTJE
ZZNJzcRr+RcopUW9kVLrj862D9acGYz3OXACvz1UVll/IE4+CwlfOa57Fddoh+EzxyUuWkpzEiLR
2lyuWvrWnYHbAmm1hmk5E3ze4OkCLo89Rou52ADM+W5snO5xTGYHhd/96lIrvfjX8nt4RhWzBaMV
5R0xZX2yx8yuzV8mMHggmaZ4t3+NQC5wgzJMmsBjJmsUyEf12tS3oWjSj9CS/1BDr7MvCROIoFx1
B137X/XZI4TI0EQrUrVSsKV2BY65tDon9U1womkp3noJ1L5G8honbrvOVvTCmCJbnt8Wc+y01a+X
DIcH/0dVUO/aka3CVqVFSIiy9TmJwB0ufMpFR+UJT/2+UA45Wi7AZrcVeBKER6/1xsX6OnbPzftX
gO1rQT152nbN64OXTLYrR4U8FbG3SwC88Lc5iiQwVmy+k8wGrt8yYmc9TgAiMAySci9KeprZCWhY
JuRSCF3UPtYPkgmniNJIXO0P4SOuu+FBakMVBkzUgn/VQh7oZR0RetvYnPYvLL8671+cFyXZsTZK
BLUc9tAFgtZutq8IHXKZvInmiRVyPxfZGuig7d7A0rZBuOhCACglfLMTIIiizwmmEXgzCVz0DQLq
s1mjTaUpmPYrEUWqFstRODg3qh/EqR2J9QdhekYgLAP6bGyDM0kqCP/hUvULTUEIMjh4QBwwZxJ6
BRID371XU3kBBmNyWNx6UaJ6m7wRZeGCDgpEb5Hss8WxSK9BhG1WjBDmUIYQE8Hh1qAGPzRS7PUH
bkMJDQhTsZScJ1OxLeBSNZFZxT9xT44SWeIhkG389EXY0GHefYQBbYDrt48XUOY5fvhezl4wM+kG
UTM72Fa/GekbxsAJlrbbiyJSaL2pKKZp3he1KESOpZZS2srE9V8FgJWdK76C2/TiFtsoXGH9uQIj
3+/wv4ocvbINivtEPdqCrOegVVJV2BV9eYyW8ZfTgSDy3dRvr3uZo7Rzdltv01OMLQpEfEzGDXYv
E/UcSyXJ+f/ZD8Cs9xZcn2vRH4Ygp9svRaJIZxXHrcJxgt2F5nDCABOWlHPsR0JefDsIulqQ3ZJy
7/vzFLSID7BZFpcuNCOQr94iTGC1dBudksps+1VUsrtKBRTzo5OokkWz05XMYi0U9YzFKIADe7fW
2uWdOTSBqTkyZeQAlXupGxvWj6UM/kYw9PfJ5oT69IUUWf3V0mwpA6lCoSYTEbNX7H8OzBBgx3MW
RmSlCpKn2aVD/fjl/7QQIHUyXb0WoAQ1qvYib5+nk38toZerFnpomQp6wxDkXiX7QUVv7wSwHCx9
rUKeW/hzqROu0A3KbHcbdpem45ukHNc9BWnEeez10kNWebHV4of5rI6EISpLl5DO+vGdwgmkHduK
B7nxsARuJ5aXJKukmy3WuNJw61nqlP6m928X4TAsH+PAOs+XhyYT/aYzlw0DybgwhxHEkweWSF4l
g9ig1MBfpMh7Q/OmsgB0QWKuV7cZjf6zCUVzNe8dyBfrTIScj7Y/jbh3t0J4PaW6/CyVWNkt2T7N
2QXekYQ9N8aRA1ZkKsME2H4nlmI0eRF61SdzMsuW+DjwP32LQeCCoQGRDAqmme6vtjtf5j1ckyYV
P/hmiHWuIAR7bUH9uxIlWT8n937/mPqFshek3OU3eIym50CSWhmzrEWTFUVLKjwGuswl280T8Cox
MUdURZGpfIRz3cnPrQagDdrlW+Vi6TEHH2gCGxIWRyOpeq0NAg6tF3yrvmkneA7ujzcr0VwV1oLC
k/vUvMeN+aKnQJQKsCeCqO+vNupnqJXln7x5YGEaU07HH7YoWZsA2TWv8BJyhfkB+RWC4y0Un0HR
tBeO5hGB2xQYhclthl7bktgOlANqqVAcXdIxXqsgbenp8RV+dJmka93n3aGTWz+67449wUzrI7dw
O1xtIUylHp+BjtVFRNhdcUy3e3ShVtAJwITq3QUIzsSMb0nbZarTf4dtoB9/SoSB3ubrvVKuICPO
q2bU6oVtyR/jgmOitgl4Ky+4zApxt+p5iwuspuiSI473C0qq3CRaaaRn/MrbAcRFQWhAWCEkT0O2
jPXX/mFG75GNX4hqjY/NPCdoXQUQgqGX+J+EMhAxwtkxXmp/l70PHhoFz8Czk4jEz0AyQiG6jw6J
9P62UA2jBiB070Y/vbwCvCVQX93Lc3TMQv1qZuUCTV4hB1Jmq6zxycnsloi4cUOqgqvjpIeW5Nuf
dqasFy9ni0rPBcfPtAg8KCvP6gBIB8p5rcWpiJWFN1tC+1AKVvKzmFEctHQudl0NvQkHCsVMAIwk
0l9GruMXiC8c2lqbnBNEv1joUEj3UhQYdEsBDxve/msS/7HErOReOUTKa7VKp1zo14ENhKbwGrGR
YmNEKEudm2hNo5+1vtIe28G93prwpiGyMugZPB+owQy/bnL/0cbosNoyfBklui5v3UQYQ9kvwQjh
x2pll78tgsizTaWa4X1tEzdGOPsSQ06uwBjSXig1mw1QPtC2FTZm4RZ1huJBC079QhJ/mTjgroYU
58h+elP5NXSjZ8t1Yd2KpKdY8Os+IE6F3SYqTmDta3IClAhs9cMqy0dyFYo5PQ2G8oTq2jg/BlWE
Ihgn71JwAw6GjYkKiFpn6enfzd4tyB90M4ysiV4cAacub0rfw/6E4h2XCtQw3PdU8x3+MEqA3z/C
2lAecUYGxpcm05xbyCpCyIO21FFw4S19zVe+Fyii8UTX55PlkUUftrltaXaTcQrllqZoHI+E1CJA
/aGANURB7WvBmdAV9vmDOXV6yiBUTKpN0X+QhnYd3N3gnKMefJGOAnRgHtGqJ5KzllDYlhLwjgE7
zC/s7qqrKdfMf+eoCwZVFx92BpwVZ0KKUE1ydqV8Zakmh+AXQKvyBAbmN4zEBXV9HLtsRRKtb/0E
AMBEz43bHgCIvK1tA3SNqV1EqlMdeaMOVZzgmhvGcKpRYWbgPpBvIu5QETAaR72tvwQG8iaUkD8I
MJT6GC2EfTXACeVzZaPOdXiWdJVry2FO69mI4Fxf4/zQkeUxLQ4b9Zjm7NoXe6xATeKir1qCa5Pi
ax49a7fooIJabfUvkPP04jIVzBXe1bDcS3HIZ54qQysAGvRL3AWJ2xJ0ngsqouNm/9i9bH7c74AA
o2YfIGH7iODbtF615O86EpgPxUkfGp8Lc9zfJMkgyWa/9DGc/cqOoNJpmbZQgbGhgaAPXLJJOSQG
bJph49Rim5wQZBSFoUBKAS9qptxWylVXt5Jt0JorbU6eVLnzX3qoyuI+LnEERzZE5TiClhcL0JJU
oXhhyDh1WjArH8V75NEADayaLq1m9AXl52MZItrs2vuU1Y1lD9fgXlvKXfmWXdt1VzaZraT6moaT
psPAwZ9FsS4pJMBmTotq2ebisefYiwmNcdCdWqf7yE/5KX8pdssYKr28OthAL0X7WL/UJXR/OXUj
oPzc7u1BciA6njO2krFb24OAVsF5rkRpKlLmKM+McKlUvNWlwppMS1LATs6p1i5TgSDD+Kooi1Oy
ayws3pznVs4v1/CTCFI43V+vgk4zV+1kdAXvLYyiENA2SPvFr4avOOacBxKLzQ4F6BXHU3J2jfwq
VXefZzdEOpEkRcI/89SHhD7Dbddol4D4OyDWJrwLdz4fh5IZ2RmgD0LPB3oSMPicWB9QxnTQceKe
QfDnKh3uX2Q2wmaCaKb6nIK7A+CI/4ZNcAkKOxhMKaAni1m8j5NF1f1nRyxZrw6Tx5fOXMHIThNo
aL6jPQUqn8FgZpsP4sySPJ7qSodZ9ybsn1mS15Plg5YA0V2OWnosWsnQigIEYNA4VpuDrW7kz99K
qXeCCUVqpjmxnZEjOi75dsHl3pfl/M2a8UnYgxT27VlT97Gid5tD1qbYMUEnfy/+U4AGPQiRlFZL
/FhgSVFnCWkxTqpXUbAsT57NlRmxPYjOHqCR2VgHk/RhzTQqorhM22/el7Zft62dCayYso1d2JnU
IkOeTsqlKMjxyx9TjQFKOFTvb/22xChaSXqILvaEnnhJIDqt1rBevifUzX/+nz/l71gYvnJoR7q7
l/dIBkrTZWnHXBte40KQSybGqOyEZ3SmArSM73xbahAE509YSySibkEJ3+rQGI+isGLLrJpwJBjA
uDYQ3iFZ1mg6YrnjyR7v2FkF1Y7b6nnvpYuAlm2zB9qRWl1pKzqZclPEZhfnIFeZ+YqbmS4VnfWu
cjxFpR+ZaKAcskGwHupy5nm7/WJoo75Vl87fX9XcExveRgPR+TyT8Isri50ysUbNdzD3nm62nq7b
H0N9VZ7E2hpWN3v9zibvsbLwEoH0XicWrgRS0MMjDMxqry29WAvDtj9VwPYMcMA7xr4Sw7f633eh
aCDbwXNjOmwYyeuh4jgDvgFXAAM9zkYlAtFZn6kr9GYrz8NWmZkQDXfFS97JHYCZUUFNFZzXkT9L
BJfZa1+CZGFnmeHpb2LjKyUFUdbTjTLPSENLnZUjKu2x+yJnrfJJKinDAdFl0m5OVV2lfQKSjamU
o9J9EQfYJdfNjafII9auq40v0M2gxiOpNJMsS3rnXTxJsV4VI4rdYlh8jr/sc4qT9y4lQ6nb7jce
ACZEfykzFlhZ1579w3twxD4Fjevqo6ztHkm/dkBBi7FCDFt1X+sHISe+IcG98MA2H3IbCIDzFEPz
19nMo1lC7OuBKKYLpoyf07iZcdDOQGn9xjvGR2QezSxhZFyebnUs6mIV887qL22IgTKcs8BbH3ra
zk8MfAXmgYFmOcKA1v4LAvYb19ViUgHK3UWHszFfaSz1Rzk7wb3V8No8gfqgArHKhPAQh545YKvh
531vRJHL0Duv705gm9YjXXa4DyMxrUb2mZWhuhl0PWD+TWs9es//3g640bfiOytA314yk8UVBDUK
oZbU6m49YXKfiWXnR6n3atac+iBlqtX0Raf5KYD25jsTceeXIymGrEFFimJGWdLbe5eJckGh1AnX
Wl7BBTc25eCgSAG0V9xjL+P186jc36MMex0oSqn9CvOjS+66nmFTyNq4KnsYoCtf/7Fn0KIVVu+Y
8aObODtEGWFZN+oMmOOmKpTfJHHbmTsHfOHXJ991x+zNFHMWvjArLubuPz84Juw7oujfISGI4Zr5
ibY2k56UQ4gMGuQR1TwOZhlEw8gzqnB2HxEoMwd7Sd4tI4PaKxbOfGWR3fOMgGQT1689P2OW3JtZ
3ysW3SMgC1RAanvtMFEHgal/svrAKlGk/w9i1uO8iOVahVhvyp09c8OLBRygXXNErNhVttVLx+jI
VXJOuG2Qa3w3DMicZ311Q2arMoygYTwQGrLBtwQC7YYiypiY2JCBbs9hkQTZbfQ7gdChyxGvZ8w2
sgyuXg0nILw2Bz05tduJ0CLQC5XpQV9eYcyWGfnNOBIyST+szduhn5O0nEgXYwdSbC3HugmMwjTV
wEgacnOslxPYg5zNIrHsWawG9Gosvr2+KeP6Tag5U1VzmrjoJGSi8WLjOMGwZQHYitUd2XxMY5IS
7CdzxQpI3+0TehmCZ4YFDD7BrzuQutkj4gZyxH3qUYgQua4nURRBB4Gz7bxlo0Lz/m9OXCZdfQW3
57CmahDX40eiBCDeYvGq8Xc+Zl9x4Z0+CLMBGrYF7ZCEiBmW7PIiqm3BY6/jK3dBN5jWiRz4LMF/
pK8RkGnRzX7tUC2JrUrf+T0MrA/gyyfx8Ts43czNX6dp1R7LXJmTJlVyDANTH1h+dH0ZFHtV3hYi
iin0MXDK+HbGDUBvhrYbJ2FDlfqWFqLrKyURxxMNVhAl3awoRwqbziZyy5Msm/niCfKj3kERW2oi
hflSmfwaDujbpxJE4bR/ZgFf8B96IhKVs8xC/ctbDtN21F/MJmecSFVKX+VQMxfrqVh1hH8pKjzZ
ts1ng9AoaEDOJLsGJ5Zb67v/NKIRCf2uB49x2VY7/D5JnzV4YmIkKWYknuaw1hfBpywj6lSX9D0Z
CRecISYKnCGH6+o37BzJqbCgVzW+UwIU2U6yArWlrILOZ/tgGUnwMTuOHVU1R6SA0lmUPYYyGTQj
apeTVCCanYvLtltHiueIpYY2wNWd3EaTVYA3i99pOxAqveFNQudgs84oaGV3nPknEvjuJNUJQ0Qu
0X4sTOQnStKWprQEOIN8jnlZKYv0IfApfXprZX0/jG6TeD1GImCCN/z6f2iS9shmT5vbzhwyMddo
+OSXLTsYQZO6SQldnKUWQdzogyasLfhZcS5tj9viUOGDloIk1lPc40VkjTVJ2qfqDl/uwqxxLedc
fjtZ3M5X5JwNEqTrTvoUap59xIwcstDB86aegY2JMM36BKXAV88ZWMx7wDFmmqZK5R52CJU4rbnt
ejmzVT+pekNXRnFRSrxk/rxIqYSmvCgqjDCtoXrjfs1wRYwxXPQ/cHWritZ7xdiFEINPgUouSw/z
JuxzlKH/maf+jW4hyo+JhyZMu9bEMA3Oh/tVgZVKL0xDHSlyu6BTlvBlm5d+53WjY4gw0WBrtxQ6
salwwZfCYFrqRAPIIB06ivXeXnRbWT2xGStVIRcnIVDDvPTpYL8Zs6dtJlWUZVkpo3XIsl+qozxW
/qYM0iBr4UD1nmcwvGzN53EETdWA3EF7/KWyyk6PZvDNczeI2UnYfHN33ALtRkPp23B8+c2adt05
ukISnFaHUULOfZl0C9CTZDRJnehCT0ZUNuqwAN1OfoqN4EKAxpNISw/FMoRwPl/7KdKgwVcVXFZM
/ulKGJ7/wjpNUoby/ftWYnFNkmltZqKCgIJ8MUkkb3g9F6VzhB86MpRITH2sFJCKVaT59RBMSXJO
WSXl6fl4JIsn/i8TDQARcSZTfcEFZf74Zn1xVizijwzo82v7KXfDjZVIGgDnjVlboHttS2gCbVrw
jcve25Pql/UTnsTp0Vah6ZJ4lgCxLWnhDMorz+wWce5YMG/BWoMqzOV03UtuRObggGqKXM0gcjUV
deQDyH9oz34qbcQW0TogzJ8Jy0gphjgx2ugCc7sVr7x4mvEMeVgbQoELSyTnmFSYbngRMxETzcvk
AZ+nIwajohYNeB3E9grV2W3SRsf0bDypLIRpbyFDKnldbRg19foSRIVmEzOSwcoDGvWkeApFKcJk
Yl9mTOeoZ6csg7OWNoGjpJvK8wEJQgndXBOHsfJN9ftxhMr66TibyEgBQOi8PpQjqtqONNYrrFeC
OSGTzKWUn7/kUI2TeNCzpgXPwa9p0JX93jUdgeM7uM+/4Le9oGA/f8NOKu0DA4oefaEXq3yFGS9l
NjlFk5xFKhAnfyliYLvdOWV6piA0SsxOyJpfWZa+lFf9Jd221I9Syx3tyFE8FgbXBNj3i1FYteRM
FZPJP4e0WkdfYkBAzm7al015Xg8dLo31uN8qOBqQW53at5YkR5sXYqQ5Vg4q8tNFitmyj5UiMsrT
IlMWyusGdB6mNqAUf0QjAZCg/lo1vod28itQrd3BgXLSQ9q6bn5jHf7rX8jr44aFB/0AsbaanyKD
PnN+uJshOqblaAwRW30dvC9xyw4XCstix99OzyLOpnFT4NjEKbg1w0TvCC8EoGf7583RQKqco66i
cr67lRf5Do34HmCtuLOkMCOqeG6mjfQH+ax6aqQMhX2wYs/U6Ajl0m/9Lx/A90PeeNwfzvmAChwG
m2z2TNONKUAeivkTgzrTIOgDzJ/GbKPtq6LCb7BRQ8P+o25TVQI3y+lVfngd9EqayGWumgEU3rs1
e8fg4UCrcGSBNv49/HDnHOMMGV4aofSh/DxUJhr7vtWw9WDC9GNVfSawH4G3Kxv9Eso1Z/Yo786F
Qk/6quvKVWd4cqSIR34ajNbPRxSw+AzWmZNyCbfDQRGmoaPlOPfZPte95bFy6xCG+PGVKirKEg/K
kGJTTtR9wqUNabw81K9zXZkb+XCTfO3BIPvL3ex5JROi5lOZVJ8LPyCO0Mz1Jp3dMEO8zNxBoR0Y
EXgZa26h9t6tMeJgumIGHOtUxHJllI+j+S8vrOMITiNTGa/rQ2Fi6b2fDsZ6XZHUi8a+tzyCl/hv
git6i+VWzactJxZDo8a8vYKyRWIMB4VGhOeBP2Vy1QSSyXdu03uDokzrosMZclblryCrqMiOfS/s
CVwBqHfhnL57gF771XNMvDALJr7ocKtch7Pc029O6v7CqD90KlqRmYzTE2fjDOUjhrNEPO5sH0wJ
omUQJ79H30S04gzuXGnCUsLwtcpCCAl3aKtALi8IoQNK/BWtQ3WO/aAQpxaACgWEYCaV5iWEJRyp
K06Y1dvdaTlGM5VN4znEqpkzpe2HYopgE+CzKRp07d0BHGUCxGfC8JVAwiRgHrKQWBy0aBI5zTZk
XqEzYhDSuTTS5XPpOYg44djik1Gb3998wFNj11xlAe536LDxW3U+d4H64ZKQ7IhAP/muOmmqObtA
KadFKqbrulH6vU0ZRcS2owAlGwfTpRPIdhmso7ltPq2i0QGgOCIyCj05X9JA0M+9LAO0bUYtofRG
lwyytuWf/7rXA/oy2ve7Jo90qBuC9rTh54R5bByLWkQGj8swXqj9rglfYH2OEapKUM5C5a4D+XnB
B8z1ur/TALGinkkdlEJCMIrXw8xW3y2/o+MOjOtVFyWlM+ReteVH0GRDdKjk2GM1VehCpVDKVu27
TvOS/v9QjMudZctp/ui0sYdxKalQJhwisHkNxSzF6tx6/Hvop2+/ZQjx458O+ISWv7D8Fg4NDhsf
KkO1kcdAv6RxV7QZwhekD7R50XFkkiHl6H3dPRvKqkvOKe9OcpnDNyFk40770woMe/RhKtDepNh2
h4WlYxFk7gRrI/ulo0KnxBsHbUSiLFhtA+oPu/j9TXOLuAyxoOrXPTR0n1fHWc/2AZvH17z3T47Y
L5ynimIfDK8FMGFbaXDBR4MxKLeBzODz3kzs/Q0aZBlU/hzYOwr0eC7hNjUX6WxuOja7w1n81Rys
JeKJOz6LgdcqCD9/iwfOJTv0cBSJ8WbWs0MVHXByY5wmAzqeiE8B/B5orkQUDL++OoGrvgmFpLTY
/3tcAR8LWvwsoVNxfCVTOkn0NlI3swKsb1BzOL1GvrHgP3IUcj27zNfu27/TNPzZIcuzjaIiBB8t
V5uZ4BYUKIm8JYdQ1RDH57FnuuGKllRIqRleHXoKMTG0lbJ41mHDlBs1PZExWtUp0Tfyw3lzilcy
wGkDUluTW/tsEaLPwqXu4MT4yg1llRysKBkrA4CGpJT9tGXhpOe4csmcQwv/fnGS6cXBwIsU2tO1
SaqKykeUOMnZzcmyKnj3DGnmzz2EW5bOyO15T1vSZNXOXxUZTik701y+2H3KUmRfNdvNhVDHZka1
2Cn2TllmS2HspGhQAf13UfDOsATvyiXQZAfuv0XgHuy4L26c3U1BH1LQsLBgH4OMnh4bjZ5IPUmT
rsqn+IJH7Da+I1n6kihwdy3/V6/KupqRaFdJoTL7LBmmynY0fnKChx204OFSqpNlaz30Q8ABI4sM
x2Uit8kRKpuT+zQNOA+PK81TiGwDv9nvcFg30gRWjSrJm8HCZLEyUyTtNpjhvJGk6/jffBNkNeaY
SBW5JXMuFJG+TzCNQDI9tke2iMLSF58z2Hj0xdzcIJcii7+TUUHNVyqUUayPbWbCGLeM+gv2TOSj
bN9k2fFaiuKyHVXUfkUyHmdzDGHFR0bsNTZg1XgK3OnjcHHx2BE4t6GdJeCmEi/QDIlnvaJD+dMA
QeLz+hsILz5ZJhCXPgKspytHppuxrY6EedCmjGKPeoiTlaNc+PBo8PIMu73tdlfbGBSpyP9qciAG
MzuGUKFepN+IZQVtSLckTMEhNpf5dnG4v0eTQTUQhiyZyWnzOiuJCgtDy1AXYXQWuMZpq4S2xgFy
7RhGlrBXLpSA28xMwhwjw/fzjz36ipQ/1NljXzoPwWU9PzJBVAlo40KVaABsSSPLNVMbX8r8Dctx
kSjMFS6fIhXVBpaRoHBTc+fICkD+XPsTij2deui9VBIIhAyVXs9egCdRiMvScj18xhN8UApyVbKS
KvY7CcLS9COYSjHGjd6wrAS0p8sm6oWcFs/+YNOfFwN75ijLjjm4zGxJgF0//7vAN4QJxxRcmw/L
fvPi/cjMHAH6WvWzP3D5Xqen8uaryt+gz16VTMrSVFzrr9xQJwWko12CgOxHjjmdOgVHPQqG6hTL
tFFpNIkw+EaxWYE5bGAmi886Bv4bmfO14wuDVC++8m+N0RXKdjNCUXK/yRiKHyTpbrPygjSSxUJH
JZv64+H1zqOJzcMmRb7WYwFhKK8ECn28ZO4VWLkJZx2aJoCU1X84h5Ue8WbDI+VDLCO6/Tyn14TV
Gpx3CgY9qQfp2f5HdYLEQLbyL5gg/6wG8mdZCXzZx408/aH+LULJrJUH7oGahL/vbY6Y+D3qpOKJ
Tqsuzud8rua58vC06CRqljC2mFy9fH27L7KPStsK2rDz84GmZHsH1RURynlEVbQjoBRzhpg2foFR
ivjFcR2AYZUxwUFlhChOCAxgr7zqBLqqr8hHU7y3B1oz/wEov6qM7x/8mf4m544bjlI+wgKvwxPy
tgKY4qQbUQzbgLTG+PDEUB+9mcEd/6hXXXbm47+khwl/BNiTKRn0OuPpe26MZ/gxEmlrvt6P4Ojg
an46z67QWiJuCi87C97j+AMtt/yHoh3IlR6NIHPYQkIfAp1HKGqUGwaIUwW8JlBx7gz1BBwLmfo/
+c/wsas56SKcRQBHs7iV3bYl7FH8B813qfu8TogBIw0xelluWTbPbVNEXWLKDjsE9f9ZaDxWjDOe
J9zEckGW8usMy/ae9MzNuxpCTU0WlgyEuf14mRdTRuBjMiKnNc3RLoBet4Xv4A43CKmirbJGIr/s
vF9mr73u2H5YCfl1TChAcn9bxdyet0wv0VbDjSEu2CJGzuOA4xXlSxRKVNxGrRvIY/SX++o8o8oU
WUakGW0hgidFykhgw2VQHpWQdhfjk4kKI8VImFStVd9LjDyeQdZsHk+zZYW7ORhG1qWaqYFGpIqa
989qQ0VSvGDLvuOABLzF2GB6RmwLMRRxvWYcQJOjQQ+kPLkyzv5Jn0UCZ8wdNszvmVeAUqPT6ghJ
QZqLpwTQPHDlj20fL+N/GdhxGzZBd8W/FL3JDGD1ABh5PxLi+jFv7ULbT6YkYcBk10Y62+pQU5vJ
PsDj/2HBpqRSCVCGy2QcXA6jfcI+uSeROHINCOPnor5iFZBesyWBHyUDR7NWcx4qewhdDeFaPvNZ
SwvQPlgUfQ0/+4Leh8zl/h2neJif+InaUsCXdaP84oSpFVtMQz723XszkCbQ4HDLVdM4gqvS5naX
Oj16mMTjavy8lkYWiJ9brbxdim4EBFi5qTFfWLZXIibUikLn0HfxslrN7X6DfMvk+rOr3r/x/QM0
x0MHtfQqpustZ/zEZBhlhsmi+l/kocyRnoMxFP9PtBZ+YTtbf5KyyO4PrbLg7N/i/9dL2GP0vEfv
4pWdYMDVEpBjYo3T3WU6/fAwj8qyqThBuOFLuRgxtc+HuiJHkYNUOdyRsDbCXpyFZGHkkFR5x2cs
bJefDW4HIXW8SJMFPg61lG4XiZ56dOyOtJzOVfx1aHCpaMox+hoSu6TNGNV5v43arDA1sHPo2Voh
KZukr1Mf7wTBB6IjgdjDaAGbtxXTqEjfTQKdktm5lxEnNvzM8bwV6kNAgCT9APNo452syDS8MPUn
EPng4yFIthepvYYybsvdjsqmaRYUXGtGBH6yEoG/RyIq++41L1Cd+89yQN25gmqA+mkWGKV/ZSqs
2hSzw+ezdoR9bOmUbBoH9ytR/+zmkLfAoEWKgdlUhQG2Uv9u7I0Z5HyQurytWDpeqDQeQoEQnzrC
xIcSevtj9XppCVnlBvgEYdRdNdOHRW4SovdAKy1tenyBkH9QxvPZnpM2oh5yrsd5xKMJZkJcKPa/
t+JaiZ8HMM4hYWNIN4sN55EW9wKwSwXVPLRDtwePVFOQMMGvJ48+rwr0UwlfuXVTwx3o7lXYy1YJ
DcJ+B2lXtzH+0X8Mnj9gdQOMjj89336jkn1D3m6Cxbcmojc7yRk/IxUP0iD+ND1Qo1CO2yUr2/qw
VFiKN4IA2cLicaZ2aSYazwy0DpATyo+R0a1OQ6cNgRJNYjVGfErCnzTpp8GRUjFBq3s8/3IfrIW/
Ucgnhz7sioN5nXGeqk/sPKiDiukjCX2fOyx0ZnOB8ncJhZ0d/GphzM/bBi5DG/WyEar3fr8pvaAJ
DpbY+eX9u32TVDpRblx/ImDfmlroZUHe75XW1FzfNEYztXC8qRX7ewbaheELSjYkNQKUqay3N+bx
dMrPtp1xsONHfq8Lyk58miqm8eYI6GmHAuRolwgkCWlb7Vfvs+qPJ2knlvTIJ+YxonjKM5HOokZC
jHmqKn1MQIsnZ+a/aE1/hM/6TfcT2M55ZH06TdGA2VpJNRhKfLv7mujlijAZUigfbhuRufO16FdF
ONkgEU5Knga/KFLUPUe2oGJ8BcqCS94B1t6N09Lplcgu8dlY//itGmr1gnHbpD/9cQPoQ7ss0FBT
aEwMKCC/kjVC4SFhzLhSLBwTFM2UTZpjLU9u0PMDIJXKiwflSfoD89sXjCHEK38B2IlVsJ5laZYt
L1A4/UfVWet0A8mfRbfEzOIbAGfqXGsxQQih+vt6ot3Kv8RYwswpMi04GmH7LlTPiPbP8h+AQ0Vk
+SGJ4oEYYsaZDAZT5VGKxCABkFUVXkQrDqSPLdV6glmo9VUIXT7EWHtPpahrESTNf3IN5MjEjRGY
+9ce1uphzIjENT6Fe/j285+2QqIlu8bxiPAzYa6Dm4Ldl2SlSdI5BXcBDEa7tzm8/lr6lBLzuBIr
zvwgQzO6GTukrIdKWBZltN6mhe7Gp+ewfufZAFd4dJQGGkx+4q+lmFqAD2RVEvw8ninz3IZmRWbH
Y08R4Q0BMx+oOdKxwwxvVyTj/CplACb6g2/jy7PvC5pEg/lLbvH0Yr484nXCd5DRM8vW6FLyCeBc
LK57G+PloTiSoVBhX6o4t5LxhbGi56Np9Qqq7/hWKHy1DTq1m1UomnTfMxi5z2SThuxtr7Y90VSz
95tDsOmJIfbidPXLobIhCjfIcg6DRDOSBf3Nu+i4ritn6fsm3msx1HoyTVLrVAoZFyWUDEmsz9EM
ZkSGZQ/1Lk1J8OCOh977EAyxUZlyTZ702EaCzSWoAeeNjf2RAjm/KGRRLq6Zykud1G9HaT3kULd5
K5ajK4KWrC9R1p4DRAtHWWIDDJK/yIwROBH5ZBbZshD4UBc8AkbGyY7w3cVKE5xz5BmRr+vHloGu
uudA2iZNJ8MeVMb4t66ZuXev7678WvZIcwhZBoG7z97sTJm5AUwYCBgYVVARQHzQx6G4MWqudkGp
V4x83q9nHmDiQKkEuMfxULZKc0SIuYb9Ls8ySI+RBQ07AX568QaER0r2cV898JLQxkb1ACxzuwgk
B6KwsAMT3Zw6WEEDww+dPZ7FtX1H9S/AQejC7PAeMY9/2pwnriwAB1xEkVQDwWg/WT0AFF9dauGt
hIBes/EvlhYAFSt3dX9i8Viu1SvCA/D/XAhgWRYnM1LnMTmasVukTMIKw3PXn24PSso/JIYxpsBk
6VSxGafxTdmLMWnT5TULA/hqIUdRjx+liv0saEanJ1LY5fMLUW3ZOYyfv2srV4oIdaNA7Jp1fP99
nNFT4rk3utyYef70wcP8CA1IpiWb4H1K6JnPSJOVQla3jdPjcNuebvFmgcA01fWuVselUWl5OjkS
8muFuYINSvkTA+PcAAN/c0qY7pKr6F02JkMquv3DDS+HiL1LNhpBnfMQWvR1FOcD9aHQOGOz9BLL
saqmM46Wa0mga7KoyML8vc5NN5HHIC2YlysQH7HQMGL30X1pTtH6lbZBrMdTjSnNRHW5MsG9Y0hi
RdpB9mj1yCDHXjsjIZDLMQYq2/+fuJEallqpOIw0JANXug9yUgo0wZV9DG+vhxFNAuZQShE+JfYI
yExDMHpAtGBO6xgO0NwUt3FHYSHsifhM+724WX6JdBCbaVX45X8HKM8Pv6QrNWxqtib4BXeDBgV4
aYAJML+Bt8zU/PzePXNfkf8TarPsPsVLVKSUPMbnIKvhvT7uZhzwdgb65c3jNFCItM4c84ngSMtT
pLhQzyerwdl+ZsBSry1wvyXswZ/8/RhLnFakQPXF+mt3DrOnyp1JcWqlGT3ce6b5RdL137I1/syj
UDGO1vyEfTcp0NRnHqHu1e2mWJ13+vt/172XwEEkHfFPFKKoxChs3jTAdQOOdKyhHLnAJurmLQVi
XghJlla6y8D1TSBObwpEWjlYDsvJYv/lDZjOxU3bs3/RmoDdST8R9FbpEorVbEHXXZjd6J5RDWOb
hABtaN7CO7iuY7S4g2oKX9f3PJF4/Ovujm9UXNeaZTrEMwfe2O4pvKATjwEjNEtTIR0MRRFe/aao
lonAIxPSCY4BQ6pTk6vAtKEvufh+PsIQMkcjweV/MIOVMcb8ZYNq0EA5mf428FiAIoVRHnOh7alW
51UwvUTaxzmrMmINEiJ7c33Ui6jvkmArPT8AdkgA4USxeFggkL4/+E/ioBBNIlVUX76ZdNxfnH2+
juA7YZBGjQGzrAEEVAhlNI3clEu9wNl+xh3XANpKQqHBML13pZFeQk/bL1MwBWQo6ES3TW08p4hu
38thdr/QLpz6vtHbCCb4IlWVMXeztMQYGxqtrWpVr5BkZnl4MZA+Xj48K0vnqN6ZQssahgzkgGOn
3xBjXUfFXV05twF6dqR/z/hEEZW6asKwSFLHLW7YFSC0x8MDLqNsqtunjPFjYiQldcNv5lO65RDG
XV4xLwYZ+wHQVG/dVeUT291WEW/fkEyuBBtQvl+VwuHOLYSCjlp7Sx26FujRJv/9OVgyhcFurxfY
HpJfdK99+obJJ3/bUDbQdH2Gl0fKhCZXq3K9FVUUlU+OoNOcI0DQcoaiNoTXc71E1kwYG6q61glF
HAF1qwK3P75CZMQlzILQWlAQCp+0kQMWW45sPBRjvhC+tFtsOR8zxN/4DWfycGIfVnipjWlPxk6T
AlihvyVQWHX/l2eMZuy59Hwoe7I18MVhGozwTsz88WoqSTGDGAd7tLtE1I6DQey1YShXQVvSPvek
SiSIwQvUNm7PGRjPoyCJ5imGO8zCI7zd0G1i2TU0VD3zWZKhO47qFgpYgax3IOR+Y0ZESMOKdbxN
qzaw4CkpmG9z0QRNobLMN8h3ZNuIMO3k9TiTiuUJSkwZRGsdPTxoNrI+3aTIh/pS4c3NQVlzaN9p
NPfNdxFiBYj/46auuNPVslXakndGA/M6XmkTjcb9PG6W/SAg8tg1ybr/2gjeP1HDneZ3HcPpPnZE
E0HeG6GE7z6A4ozJIiUH0w7czAm3Vj6TF5iszw4rkgTuvDWauGdvyAMPEEooJQGlfBFKHW1ulrCu
5lKfzI2l1m47voxySNh2oFbIgAMOH7RQVqBVLSVv+A0oAhzmgs+s6+co/uAyRUAKKz54f9iskXWn
FfyTlGIaEBovqkra1TfMlOuthuHZPQDkNJs5e5RhLQ3RN4WHsRtvsjWRQOvjjPq1HuMfzUVU/yDU
Yvta0208jvP5gos8Kj5aam7uvcDrss4pD6pBh0VvT5QDLBHxVztE+CZW31S7ZMPVvc62ZvAu1Kf1
/OGD17NqbgbLAjy/Mz8w4AnaKGqA6mvpSDl1UTN7cOK5dgG7QURXzyihgt7QRWnSBqkbcJ3q2Y7f
dyByoku2U7sYRVBSBC+jb7e2KgUV5o3aUsJY/qrpLymKEf8NKm/aWasBDtNkenzTMNls6CglrJG9
Hj1tyyzgO/D9krZPYquGftzuF1RbXEBaUfB3wVWcgetaAYOdfDGd1j+fTLIheS0OfvVoESpiWZgz
mrMKA/aE0j9KM9wUlrYwrPEJLm/mtOjbnIBAMDH/chj2vvgKE0KIrtecaTXPGzkefx3c3AANpZoz
adDweNMWRnEpR4+4nn0x9wwD3bhIadbQk6jzdITRGqP50w4jocps34HnMpx0eNE6fSVmCdTFuaRc
MZkS3RYkVqOxbkYN8HQ5NxBpg8sRluCvlLwVvqPqBGEql2qO6WO/YDUoe9g4EMcgMMHeHL6W1t0B
i0Opu2ToRAExA+tYhOX4ddmDpCP63YPGp9H2hzgV1ARhTk0KSSYRorkbK9TqBveKIiHWXcaiW3cF
iZRTq6TsmdMVr5BgXlwrnzHr4O3DfFgJDI1uK8FFMt/MhsxNlinIFGUpOaeT2084OxLoYnZUpiQl
nZP7naFCLo4HEZHKO98MOZTx3oJV/v0dQWyDUkLkB0XXlZ+/bnJzx3ezsaAzS4YaX2F23tXKJRe2
6DiS8yQuN0kYP5YIDlpFGt6m1WhySulI1uVtQBt6TXY+fJnpv6ivTRT0TOhjtqGUB+ijVPK5AM3r
Vn7/n7TcKXdciRaXvFn91aghz2XbL4gFyo8hRW+OSlCl0V9MXVSxe5gECkGenBl+I+QxewgPfP84
2vfpmizxn6FWfv3KpRA9NQ5HLIzXwi0hMNsBLxwignpNDwmuHrkrYEkDQA==
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
