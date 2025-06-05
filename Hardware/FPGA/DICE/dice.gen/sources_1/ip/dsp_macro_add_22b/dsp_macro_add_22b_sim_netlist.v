// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Feb 10 19:11:12 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top dsp_macro_add_22b -prefix
//               dsp_macro_add_22b_ dsp_macro_add_22b_sim_netlist.v
// Design      : dsp_macro_add_22b
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_macro_add_22b,dsp_macro_v1_0_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dsp_macro_v1_0_4,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module dsp_macro_add_22b
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
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [11:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [11:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [11:0]D;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [13:0]P;

  wire [11:0]A;
  wire [11:0]C;
  wire CE;
  wire CLK;
  wire [11:0]D;
  wire [13:0]P;
  wire SCLR;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "12" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "12" *) 
  (* C_D_WIDTH = "12" *) 
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
  (* C_P_MSB = "13" *) 
  (* C_REG_CONFIG = "00000000000010110000000011000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_SQUARE_FCN = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  dsp_macro_add_22b_dsp_macro_v1_0_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10672)
`pragma protect data_block
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
EZH8wVrLiVL/I8pf3Q==
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
d1g9NRPDmhVwrIymOtU5eSpQ/GXDsFu0wCL4D5mhLbS9ZX+Ubx8dySlvFyVX7QzrjSESCRHWc8iV
sJSXzcqC/TzTE1RqRXqEMxMhv3r499BUzkqvg/nzeG23UjLBjMqPs4cklaRczbB/EtOU3x92PatA
slUrpQ8I6HfrPAn40i1JvA/XY1+msc6RKIxW3KDJovQxxA152RsfTsbe4hWy5rZ3/A76+6H7Ovit
fSIcODuEaVd8PMq872M8HDxcdEO3VXAz9CaR/S1j8SOhcL3MPZ0D4HbWtgLaYko33HihfSnDDv/+
UBRVVVxDyPTwG+g3+USM83JbkdC+NumP0hNDaA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
JOou53Dix44EY0hJLfQ+bF8Rgu8M4wZenJKxR7LqewPB9xLIL2IDbudwiCMp5UK1ctzRTYb/cDev
V/RcNJ8QraGYr0GxL2SVPlJ6a3gHjE2mSNKW45ayWC2zlD53UFGuoGlGm5WUlfza/nJjc3qZcE2A
loC3skHGmqQ4oXGR7aKEaRG4DQotd5A+C8rbvtFtmJ4/nXDZZ86EjSt5lwtPCSmXruK8J74MTgSt
foL3oOlp2Og+9gkBzVtoUN6PpjvFHm9gey7Ao++9CI2rMl/S/YLEI0LjuB9RwWoyeHlTX0gGVbuc
7fHkEwnIpYov5EuL1jzxBqpzG3sUStzZMNCy9A==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28848)
`pragma protect data_block
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
ieCT6Pp3
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
