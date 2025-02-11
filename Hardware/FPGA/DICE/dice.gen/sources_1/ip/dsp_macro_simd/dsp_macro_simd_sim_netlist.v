// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Feb 10 19:12:10 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/dsp_macro_simd/dsp_macro_simd_sim_netlist.v
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
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
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
mJo1dYVVPJteXXNessBRC8ocZd0X9AUn7WluqdaI0O+Kw60fDdZusJFWKWKI5ayPOXLlkVrH9ZBM
3b8JLN9BOM05AF/2jhRUFMJHp8IMIWudgWiBo1T1H3/QSJIXxP6izP7BNKxouyK8iPoU8qbL+2IT
qfQFztzCFJOuNHiHXKZJWXWgQCNWbJQaZd9jQyxKI1dDBuq2Ro2QUuNUOY5TKKMTvqmgfWCRMCo+
p2Wq8i4v86QJrl1dB7cQ23WS5ZiqSwjh73aZRb6CLygLSZlAeU5odSN+3Smfpf4cNgFBeRsKWmYM
PoV7IX/cIDtRvd33OaeiJsOpsrltnKB2d4gBUA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
f0cHh8tVvFP88uYhWVj58T8UVCYId2gXtB7PYds33GiOsgX/IIaGlZ7y3LGlUZd+l8lT5qpNu5WX
2R5S8DPXHCapJ+Rt+D/le/2PPu3mMA6GltgXJOfl1uEG33duku5FRw62VmzZbdshfUUbXJ7KpddX
shxcWP21PUtk/7rARld629uzvkA+X6MthtPALHxiYKIqq6szJCRTMeV02mBU4Nq39z8Y3GHjyrsW
Fv5ApCxGZYDFaxlef5OEWYrqezgyvlIxpxZ/XTSmdSIV63W5DluINSBo8hphr1EZEb0G6QZ/8kbq
D9DbW9emo4nul2TR/RgH073WGP6TYwC55vESUg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 33744)
`pragma protect data_block
7EBYTm7b+WLyJlYJKYBVR573Qu95G4jVhZzq3ybyoZMGsn15QB7GK2fNaHhsJDYhtEzhGGHnFVlr
Z4ieuCuhY7fSN3S05/M8xF4qOGzpyDvekkC8kcEsIwIw70UZSfKJUCmDzH58/iCF+3cpalh0SEY+
+Mp0mq76f6EPcRhfJaHbWeSWLtfb/EU5KPMGzLTbuFq2pWKvMrcxxmiI8MFtQ9pG3M+PW4NM2X7W
5qYXRPaEi+KjncpNg5MO8AyNDqkdFUA2aidFog72MNzurd7DOJiCuylwKvYiadZHCiyyyGzbetBZ
Rf5frfwDLx4CubOfzjmMaX/gsMB5ATaFmhVGU2kqlYbJhF9SROMifE+UbyRjjjqKRbrWlfmKZ+RA
9lz8qNZDENFEhG7JHaQ9EPLRsv6gsb+vNFOwcRAXnYzT7YkGOpgRGuJByyoH0hvXsVzQaE6NJiKN
l0g+3TUubLVjIgUgUyQ2zD8DP8bbsPLiGtNZhIv+rKwkLG9mR6gU82Q4PLFL6IckPzld6ktr5/SV
q5Ed3xImCRmRwARSX2uRis0JSJ8KlakczkVVrXTF0kL+1UHcQm2Fnx4kxz9VeHcc3tx67/57U+J7
MA/hEqWkQTyrYjF1HriLuJKfQUrcYs94XlaKMQr1qKU4DPfkY9iKRuZ00OReu9D6d7QUSiNbEIpg
dimnRL4W1Ow/pEmnOXtoHNmIg6/YgOFEEaRJ3Q+QI2cjJkb8GSupxQGafpfbmdq39lWikWLj9yh3
o52kVKQTtTD5b0ZPgjbXvfyFvtK9brwb/D6JHn63jHcSE85fuYDJ+E5xAdAdE63I2cnD4yShb+wn
fE80Qhz1ONg4p7a2O06iLbiJz8h66K98+WpqdufYAKXWyvA0bPM5HKwygnuU0hmkkNlZ5GBCM9cP
BaMTX5+hRdDTovJLcweTf95Pwhq/82PtNbcWOqYa/PGZsLmdzfkQD7U2yWeOpxN/I2IJ+4Vw+4Vs
wzjV6+HjXBh3fjzj40qij7UzCTOctUb5bH9vDEC+XoTObPQt0l1n9NBFvFzZthAlgn7t5ctad04I
o5ewIlJ/ilO4oOj+n2NZNY2JbokvREDWro6i6Fjg4ZeiAs17pK2Y5jZGdDaFWraKzXYqcYCaBmwe
F2VPaPbN+QhZdqOrq/QOlwzlmrvxnOO1D0O3J1SD31RR5hgRdjZy6jF0UMI8aGDU7/CCQTOXecBp
a46A8ljj8fPvA7RI7Rv0nyXp+3GOEhS7kty8/48iEvZTFw/hyfXaPUdT2vw+koZU7k8Dujn3yNLY
CKL7ywkhkyqqFeN1/Jbeq6A6BGNKHy1fBpNqJcD4QjjSDyhN03cnbeEsbKfj+ZYbI5r6k8ilzWJ+
m6LWa0LRuR/7ASFvC2SY9p9RAEjYJRNuut1MHnfAdPO9opGgShc1oSPMYc1f5gDY9TuCrsKgkXcq
e/nm+WCGsXdAnnxWv0U4c4Sz8URBnB16ypsrthQ45GdP+aJwGqdX8D/zdUC+CRY3PEf1Tbz1qa1H
x31d/JsqVrvFR/Uso2AzAPe1Q5+0DadpuLe0G89/hK7m6Ncaz+phMbR1arlzduQR2Rlx0F09oRyt
QO8KdhCOkdTYvEvs6ZM+PkEJPT+Hwt1aeIOc1v6m+9LzbaHk+2sggvTwppSO5rfMI27fiRSX79OQ
tWlLjGV8+LPrsNM5gnxCjLyVHZiXfAi4Udi2zyKtX1E/6UkwHJn5l770kN1vkXboDiVppkcRcG4N
Q6F06zJVj9lUugjfZ/TZ6wVS9pT/SQYcbwaFsRv3bij7CpVyoprmeqOrBPKdwT+I++rlhA8BaXzF
5+VFHojgLsGBqnwiLLtx3sSL0gKSWMxKYBG7Kb+Z0tHPkDTiNihr2VTH40Q8pji2Ha+MZYUV2tQ2
nyCEXczZavv2/p+CJdv5MCOmc98iVJeMkgQwoB04xlAVJdTjmIGFnkJktVGUdZJ4OpqmleBKZhkD
nFxmqUG8f5lyrX7cOYKvI+pU39zsRzf7/BNBsMfiiTa/IdoSErb/4IScfF1+jb6NFtrcSWe92RIX
E1KPB3WxDflC0BWa0Mgn1W1X4TE8OJ2O7R1SULVAaW8f2isk8O+Y2qAT9H9PIhBvdi5d/5eGeUzN
iCENVvKZU1p7DFeGhB/evpE7a3kw+GMo521x1YZFzBTLhdz5moPy+8XapqSKiFxLLrebqcbaFIbx
+PuoFZhfuDsjbQO+/RsZrr4BN443Q/awQRMgJCObmyuDCn3dQZDYvsfASr5CEDhfzEQREOlSyJ6x
RKmePLj7XefofRyQQD3CX0SotwcfEjT1ma0V5zTrDr3lH4e2OSlQLdI29FRLA9792Q2or72reEBL
z9FsuJD6MozbNIwQdHbN7ZYXm7cPmc+2rX8wM5vI+sSI82Dtw9eHt6HkXXVqB1svNeDHCtZRvXZX
rMX1KL0vjsNSSCBMVBhu67SLq1AYMs2j1WdLqVaz9jqk5UW4Sx95nrmJ2mNYnHHR+5bntiJkaplU
gAmJu6S2fI7tNblu/Uti+lfWsC4vt5YZyfpLKr7X+kB9QQZIjnz40SRGQWl2VuU7F6wEyXDRhJeJ
871RwOYkuKmkNrpyZxQiXK4lk3GI7YZvKuVwFPZ2cSXGYttBLDDywWYyDWlaDsuG87H60gmBXvGs
k+JhX+9ZAfh3hHUEGA72v/xOCDepkV0fDyish0vOLdmC33NXub/ZlJFW4ybtcOt348Hzz9zvN93g
djPI+FYoC/Gs0UBH181PgmrWTGLiKXuNjQ2TWw0paQUKF6VGumjid+IxKeqDJqqd/C3Sq5sL014A
bU6YqAc2cFTvGFVvonwzor3VrRXLIpeMnYNfGRYwVeMftDWKD+NX4tMsOOO3t/c6Ap6oQRgNi2hr
sRj2GtldEyB+mm1hTLVbrLOBCkRvbCQIgcUyiBZ9rCKNLHt4S4RSSyZs7TV7+md5pjlYVduDZSfT
lFVwc1r7jxSqIW8NjY1CPTjUrGFfYmj9NHg5YNIIZUkg/fxTutkjSIbTmrBX43sV1SOJiP0suJyc
onKf/R2AHcVkN0PAUdaI2NON+z3uAH8KdCgXdKqtXEcdg2vawYw+gvN0Eej3/wPVRAoIj1d2e4Tr
zWK53Q8/eI4x4v5LUb96WPIKpQW/6pJOId4G6y/kVNOslb7vFFWKGfc4ExrT1MT1OQfxEeVKZjeE
y0pk/oPxmzfouqMXNJ36wwJDjIaVECkU06BTWMdzQqe2CjqpDNR/13ngNK46aXfbr7QnlMqIbbMg
W58zpD93Njl+7cPF8Gv4IzXyPIVDicCeT4yf8CIAa66emd+gaVHfXOLeik5Th3qe2rZnGaXJN728
EV6uXvnRlfvocomxqQNLEaXi9UWRJShuTGfvL7p1hL5a9OaMBBZ66dMHrcWHqK3Sxay9J7M8smV8
h0gDRUaE6lnsJo09jl2x61MVtmG3rLXdegCiJms8To+An2RFBqJY3wV8GrEoTnFoot+VGcWM1tK3
k9MTfzq//DgsM1ufOOHx28+mNp4u/iAZ2x8CkinclBCHkAYySD9fgXPvKgFe6AMsf9I56F5dD0Si
iTLDA1jsrQYJq2Iroy/nfjXgkR5qMWpgmKPd9DBLLUVNnrzcMG83MdP19r5RSBA8epqTiB1KbZco
DA+3XVSHnuJkbihth4LGG6J/DLjp1LV6V+QgOhyb73gLe+QjeCS9m7s4Mb+DERb9fLlxZErwlHvj
QeAU9v98kln+y4S+FLVPNzxeKdD7NRXIZjWt2T7OcAeVUaz4FDPaNfDhYvsYhozokcazJ1wMf5ZM
ZZJze01Zh7WDMTyrm38wSh61LNe9rYCZFDpytsCLboWxM/leyIorkfpGimF/8H1s/rTEInv636AK
F4vj/ds7Alm+N/zoSNLI/TTasPervS9zCCT4i/lty5fIDiwWZLZl7HaTB7nJU5JkyCdKqpLy4wWl
6CMsIKlxm7B2tkLn/UlIuk8YpeF00iFcFspCiEuzWqiDIum6Rp9ul+CFDINz39FyzPGQWJeWmu36
zh/1eQ0oyqqhfjyDlwtLTGpKlMF0Kf2GEgUwBAS44I3AxiZPFXSWR1ntjT5Hz8/Cwx36OwURv/QH
sCEB79ll4d424oApPg7Nkm8dpMqUDmQTEiOk+hpm1j5Zq8A4CcO+khkx9iaDZzzPWdTcYJNJOlPt
asurIZprIUQGDqja/I2h7i5m5ZVuK0LgxE8lS6QMVdJaTXkagBjTQ7e4DUaHJE986O/wgZJgroDW
aXB7KqYWp2RcOra9R+hXGQjX7PMS3Axliph6s7PV9wXS6sikfGvPwG1lLHRdPBgvvXXsZ2+hgAh3
Gt/ot7LXFfJCdZ0SThEpzwoxulscBBXgVytRDl2/mhwIv33kihs9K9bp4RoM+MxqM6DTItedw4Tv
AkgNyURO3yNDond8yXJQGuq02inwztYgbI0NQfez1I7UODnBZfHLwt4iNUxAkEneaDw2vwfeD8dW
6DPu0tv5Wbe64jMMWmgt9FiUEcTw1JYx+0zM2dXrOTdswEfGKff+7yWuqlvsY4Lk8JiXdcbqFX68
huK9TOAyVvv/c+d/dqxtQNTR79pcYQRgai07Y2JhOCjeE7TBY1Syncq/lySQ5lqTsxg7SdqiK/Dz
FlBmsziDfjAyHJphEUN2Lv8EPXSuuw2R4KJvZwgk6HPIfFF9z3NNCeYqTUR4XRMxSRhLtDZQeogN
JU1MAPrPVB9Kaf0ghEJi01Ahylh8v0Pgv5HT6kFBcvE9BGIPsT2ytBG9ojz4SvNUejNjpS8abvSE
XwFSe6snsLkuxo6CIYEei2m0cT8VSGHsmfgiZ64qu9LMZlevu/0SXkvbEbFyU/df3PIg86Fb9RHn
dbT0VfRVqQxfoOvNiki4d2ezKJ9hIvSqt3q1QFhzxmRk/OoDkn/h48CI4nswxi/X5OYMV+YEhdJS
j/qX8EM0KU/29d4KSBrehWA0jl0kHnGxz9jTXO7nRNoYxnbUs75PJEhvYRnfKdQpv8xnP+SX10GT
YvinIBBgnR6NoHnXg4V/dFfVAoq+7uOYqpuYF6XUPhRDU/mOkpcfW/8bZhWtVfakDT01hxegT+Dp
mL47gzDCd8CZ4god6NEEM4EcXum6eQaS9j5mJeTWsQxzo8ZSvJcZM1JiRSlYL5C7w0DQ4ii2CzvC
cEl+PgLkWf9cpch09hYpfxmfvsXPTaTh9QVcKZSGIXi9isrbZYI9N6c3E3l+W4C6IKZwtZY4343r
vhHDKZWGasEZsz+qk4UBcW5bk80O8U68hvzX+TCfyVyNBaiLfws2A5BSGxoUrWGoHsg1uehrAW1E
xCt09UC6e3M6PHzVQVpSkQQ4u1IPuH4+ZhjKoEIYOaN48ANSfzYSBXrSdIN/0qSA8PrMbUl2xxzd
/uurpVHBYIYdGsoS5QRdDuDloHJPzsJkaqEeZuXqbRykNI75VsO0nK6iSMLzJz4VB/ESw5jwIMy3
R8FvOhqXmB94aJlWlG4uXLHjW+gra03SvmwYgiGbZ59mRaNnTevvAD4n/XibHvdufVcb/noJDcfx
Y8YqKno47UvGDnNgFqhaGeDKva5wO/UFeCTRtO53gdVgXWEcPRAVH6m5fBu/I80t4sprD3AA+gck
UKx3phGVX70rWUFMq7YknrDT7hw5eSjpAah+DxXDTHQ+1JOXUMsnNKreKU1NcYtFmFoQzcOoTyj5
4ZXvvELMO2rKba6K7FtBb7jNYe9fnRRBwdNm/OT6VzUDzjFcH78yrtIL9Nvb47upDMPc8Wiyv/jG
ozEN3eQ+Ag4SopUEihAfeUCGXtOhqS8NYDZ69sCDvnMShlG0f9mMvoYcVjkOdgboSNTYUKDgK7r+
DjCjeE1mo/JfOzrFvZJRuhLwYj10JOolXluAU6Yh6QfkB3ERzfIbv5eaaoCR44C8/DncLtnUFXk1
kIdj1r21uP/bMfcCfISSVLF6sgSYHAcbG49NOYKSO+Ra3BuGuEF5JTZJDWKzrrKNRtp5lNr+9x7Q
vJMOyulKvcLE0EnLZpegN3/9DXCcBfWbiDEspQEo9A+8yeRTL0YYgt4ME5toBO5JFDUTpT5BvDXs
iBKb1VIWajZ/BsLHneeYqueh/a7CI9vH5L2Ux/7dM0DhfSYfNMiIPfqjobSfYv2ldXg/HJIWzEVj
uo8O1PYOmRwGLvVz2BReQ3ViEGAEv8JufFBRP4jvmcZQ0M3sBgSFY29gOxAUUxbRiGb36L2hfPKl
huNJwZc7c8OWbw1ZPfoRRIE2KMqerNPuUWJCaIryNNSbxUPVUFCkWFMZjEaUrtfqs5AOEtjwB1a2
z9fBgM5SAHMIZObsxqaNXC2gqmi0cLx8NlAtRr0ZecLnCYZjfWcf96S/tzwXGfPIokTsjWpWQLAc
WAvu2rHo7A1S6781b9O27RVRhPR34Ge70jTLTGAf0VPtFWs+KadnsL/3iPhZKGnzU24taGVJZKAs
OiG2h75z+rvUd372MrFGlHHnZmfS6rm5LLaZ99QW0BpaIbZgHPbrM4gRrYUxz62aNdqXJOHLUPFq
W+DiEfMiV0XeE/08QvlCN7pjBHnUwUobK5XP1eBm6FhhKH0izg2Y71TA6KxuOuBpJFWmnLYFLazv
piHy4gxSoXCK5Vavoy6u+Yi7AveqJKkIbG/aIs/DUyNqSpYndfG0mCCLRcCowmFURKZ4rBPp5LVr
qJnMWTRcAGmKmi4VgJuI2WRiC6Hu9DIVnVdZpqjjjbU+nLwWYPiBz4PAMEt68QxUcnqfST0gusbQ
QcCRVAhe7Wl4OaIvXB7b+WJnnjNkniOVzueGx2ERVHJeFlKZeKgpw7aVhyt2eE+59Ou0Y7VlsfhR
od0B+9z/7QEQabiQ3hRKmIGMTy+2TiyLCLso6KQ4n/YQHBEhvPOPqa/tJgrITnL35aH/mFEVDWIr
AIc0G9EEaW5zcRFw0dZYe7Y7VihUp4fu7iiYWjrhWBnKANiubSv71BBAz4JkFm/7V6KRKQDFEU5m
T8Ycgy15XYEnk9CarE3cROE93WgLCuVbIB1wdCvmdZWCNDYGRNfUycY4yCFK8HY4yK+SEFM0Pjh+
1PgPkLG65tQQcrrWHCKeZCgHUzq3WBF1kxRSHJREt7EA416Kt3eps3VIbU9ksTBRyPsYEaByZ/wL
Qs+mQZ//a3eVjlPgpHJwXeH3RmmRoIyOYtgzmoQmnctw3YgHTbHUevdXXDsiqvJbfpojnzq5FQ4i
QWuZ15y5oMYnHGOHKQu3vmyHppujgibCwyXVkoBpuREWuN028zDmfp90ZtVBXP+6TK/iMWfGqZrQ
5VloDPkQ8tJifzSvTHF1uqO0xxJLAkP1UJ1hteF/zY7YVpg0ct/EHDYZ+3ypk8sxCRvhJEsMpiMR
oc7QONfQ468o/HKS8nfAVzw8wIF8dE912c54yg98mPOtbi5MJJuQcOkHPiw3HSDKZlta54Y/f5eb
oX62Kp0faBGFfp4g99CNTC1d6gHVtgiAJVLHZBXiQsl8jn7XdCXWygcnG7qq+uQUVGdA3gxEqruf
TmikLlg3Q5fy1yZL23RWsUHayw4RAcv+LR7XAowEMOoXMc4IUQyx0wh0Sbzeqni0yqt/FDWJ3vR/
T4A3Af54j1QKLDynIK/BxhX4eP6VC1MMGOEJx+jCt/aAkg46oNk8ovn34QqD2CiwDXyYAlc6Wnb+
ZyNl4o7bm2DLmHI4vEdXx0avpsa/gfImgUX083km3WmvBLQ40mCP9kDZT9nfZMAOWCvvh7uqqqPB
nI+4Ur38l+D5zXbqRH8XOVKzqsb6w4kS6+jVGkITux4QjwC6RAQnNUzEW2argEkdlxnEhtRDuGus
DRqd0NzIpuYnJNfDPKoEwUmCoTAyQXGCLrVlDxz9YdLzLD9/tPXqSeD2hCd9A09XsZwVuAvrnY1M
2IUb+nViJ94LsiW2Yn9scAm/sD6riMad7ml5raX45RSNFRWO96eVxUOabBhIU4HGXgPooImgvJie
DW4RFYST5EhsR7p1H+ScTXSu2cTBMjMKXZntso3z3Mmnd7R3EndC0f48bdw/4VVUAO7cykNLUgaF
HzXiGGx5KVZdTw0j2eM3X3c3zc02hptSPwYz+NbX5bAkYBQEMjPzrojDKRYsK6UMPOjB7lpb7AGw
jAlwZ2VJd5V5ZUtKIBUaBA7UoXy0hvIANfsiDJKO1iCuaeyakyFbZhO1iXpkgbXr4vZl844998oI
YQkl3zgxiB3XoOWj/AJWMah2sQLaKt1aeoaFJLeTZjHD8/6EXn1nGnsnuKxU2YJADypblbMwu0lu
wRXbHhc11LlWLXqSbBq2/jX/ykUKj0b/b9QJEksI6Q6C/BJXeaCzPtBVn2Ts6Cdf9lChI2B8qlY8
s6f02+lkEM2UTWUPbYt00JjRarn4hpBVMnpLKkihFw2lUXcmAQuEAIrb7EovjzPr9RAyBTMnuvAu
cwgnME/WESJETBmHeamGpzCWNuAysb/FjyWHL+M2PM8EQyx3s1T17J6/jlN413z8ll7+jb6C983V
T3Tth/KgY2m+aUAxzfIfEWgFif3EP26/1j2HPA3bpKhZk3CxjdVAZ+V7Hl7Ge2Guqq8hoDKcMqKD
VyMXrPc8l6zD4QhXDfdVbX0Sdk2IwS+lQqOiVdmIQwutz5MvlXim9DZWqTosmW0LuxE2ve7VLH5l
TqkiismKr9sGu2SLTJZtcqnZsVDZ1+syXVdzBep6SgeFUeLBb+ETgKXdousLUMSEIFhUOVn8EhGG
+fGCeR520/I5yzGCmtVLDzrrcHC5mG+XDOMVcVx7R641EFnARlAmhXyngdduxHYpmMg5p0dga8/0
ILG+sXRQ1b80f/TNeMyhUwkzqPAo3G2n42jN+G8urmED1yvy3cZzcEWs0y+MTcPgna8G4S6PUCH7
nm98O4t6Plf3eicveY5syKelEg7qhKnSdlQVrRslSHqjWwa3mDODSsJc1bvyedJxktj5pZSfIvTp
dPBXG9DqqjynN46IIpmV0l8cCrir+Q3PEO914IzRmF4q1y27ddzJZWDBGTJ5gpqRDrrFR28uIOKn
F8sMxtfxgKgge0rEWsIuHOuJmWwQO/PF6qKB5hFwcvpmH6v6zwN1Dqt0/R6Vze8O3FkOxzZKytZz
gJhQznp/iye5B11AekgMtY6Vay9BVepWhKznYEguk9VoBQ2QF5KkSrPWe/9PIJhHZx8JF04y9R8Q
xom1JS/0LjnDvfBOVdwIgYOXB4eNw0m7DkntmHY6pmgWIJjLoEGpXyAsImJciirUBsEKPPiVFM36
OH+aGF/WSUj5klIYRJ6Uz74RgksUu8nZp4H/pQZFlDZGC9dZs2TqOxKPXt9R05SO8Z1N87m57Y75
QFcktgc1hkk+66FW9LwNljugAgDQEHwus6xtbpk+cyvYTuXQZrL/F7jJnKDbLJWZnccWsuWwWA9r
7AHiQiObIKmipCbaAgOHg23aZPou8sRMP8wkB+JLPZZE4tdfvdi/PYoiDjO2tOKYkBF7i3ttRii/
lXGMQgWyXKyGVZtRY1ZAKuByYR+S00Zue272uTDc1xPofqhg5ZOLV812mIWDcJZ4w8iwy4oHX59/
0zUuoXzphIyfD3APnj+JjBnYDf4kJ+Wj5fiXLarsyTlhPqACqOwnHTBqBN2uvQd9F1tGa191BxRy
aWeLgaqFOM/QsL+WTNhKO0CD9uBTk5YIpdAoH4y8hy/L0aVCJowHZBLvBH+ruZqmX5jzCEzsJ47h
sVkXKDKuOCY2toET6ja+1f+R8S097tqZQk6OuqAtJLQf9sWqopl/5vBNAMH4pp5xJy779q0dx2wZ
Yxho6ouhgTDWoncNqWnqkExkwN9BCM5WD14fo5M5pYgRJN05YbjOI0eGfUx5S5nu4f/gPwQkBCSX
qsoTrK9sG1Sockejkh9OuQBcH4fCq33/ipeswghlKjHOEfP6OrrVnszN2jyu3onTm/aH74zTMmCo
vUY+cYkqAoldtFwdO/pPzrU9pABrfqGaEmiqOb/ujBFa5sgF/n3FI615TH7PmQQiILZz2A0rp7YX
xr/eozNYTNsi94ofyXB8DwiLaZ9deP0dpoqYZ+i4BmsV63VVkgxOsHsCeo6CqKsglDPova77Mv+M
4R51FjLvYG5Hqe91bVxRXm1W2DO+Qg47cnC6w/lTv5AgXdzUIclMeQyilICP7OrS2VR4Ny4xedln
J8QcDGQFWbuu2PNjU2QVgJHjaArU2swBZGmEP4ZqdE1G2lVFjKsj0IV6PEIVudGn0WUecPrjftD4
kwCVFdkIXEkditQ+bDtq4/8z6o/Thd/KtDGMo2dhpiNhbxaUncG2yNbJBBep1UFw6CACp/MPbA7X
hK9PXRdzoKMwL2OS292QwCRAqhCQrqo9/ciiSgeT09hnhe89SUBM7THGElJGEuJ/kONeqSU+dm75
PMKJLAWFCgy2XlKSHZPAV2gQfzwMlZRbJOzi7Cz/JW+XFQSAWaHBYNffzO4Ax7zqPEVMR8gnJpzh
kkMeR5rpxWAEGA5TVQBHk1Q/fc9oqgqBpL5pMOjEkWaaZ0cJa/DA1tKGbjvlyK8Rz4Yy4Is5y0m5
y+uAkxCFjUKZOZ/mAs+/G61oZ4A8Gao70GraHVdgpjcEF+frpYuN2G2y9z7zXb1YUs7aJ8uNCgsZ
SeDbXavlhdENqxvr72oNWoPEyXa8DJsHQC9k0LJFgOtHkhdB+y9QXAc7nJFOnEH1fqcXEL4lRh/s
pKuRpJeQc+B6KM9YUSN+AJWFtFpCeCUWYr/p9ag9gyePUkW6XKYHCFw1hIXwxusX+RCEPsWhLcOK
7xZ6m3GjvLzyuVyJpb/bG8dcaYogjtwDQbrfhtMYAQwzETpe6aDGP/KhVaT+q7UKK3aQ4HFnKfvQ
IEkiEICPvEzPla4a2HFP2TtcvOQUHPGnd7x2GDokcZPlkIYMOfbNe6u7bBrCY5A15i/SGS2rWAUF
LP9USBl/2Ub8gZkvni0nsEhYP8FMXmgMMQBmoSj6oRCvI+sAKuYxqNGhCJxqPA9jvOM1qTq3y7Ib
s8G3h0FKiR1tSUmbtK3FtM5rMLnyorjl9wk7Peoe4Fpkaz4z48VCYdH8p1qA3b4k1BaKi3ZpDR9F
AF3lyTHuaM4L8zn2z3zjVtHDoXmrjLtvEt13jSI8tQKIfmHMg4It1GGiwsf7P1/N1/0d3OCUY02w
hoOtINcORS4cSt3NFyaUfdJz0SHsTJ4klZQuvsojdQfvW1ZoCxd4I/diIO3yU8VYM94qnG/mTs54
WCaz2oJ99pAdFM1W5/qsInM4J82e9vU2qcFRBXjgVhgis8UUzIft+E+/q8BqrP13qaJibpcp11/0
yuNXN/PX21sBtzLW65fv8zjuzQP+FFGSOzhIsCC4OIdQZyihUa6lwRhlfyU4yZnuM6cWMlYLMVwN
eZhE2N99z0nns9PRKnVTpngmkxJsqGJ1Bid/KSSiCV8Y0Q0SzY8iFZ3Dx7dpjxd5K5sBaJYcyx69
G2bEkNoNkCmKfkI3Xv4G31U40IL1CxQn6Tfh++MhUWD0nRGW8RJuZXFzYS3JuDSilIck2FB9zXA/
Z9UFl+k277zsbEvGKzhQ7drve79pOOIQ7jzYd2Oy9GiHD49ceYibe8mhTUag7ioj7eiFicfPiF8Z
bqbrMAJDWpTAwYqfahPlM7eAzcu4fThPN2PQiVF+TO7uu/hwx5AH0+B2yDZjgsIfPCo+NSr8DsAw
ixYdTEctA/svw7e7I77lPKDKFdl1InbJLqmqUX3N5piEUqOofAsyUx7zvqrZITyjf+BMfZcodkaC
YjAOCvJ41nstSo4tfXPjrt3HJHAoiKSVzOYUEuKLUNTXme1ueAjB8v9z8oTz+2fRgpYISPsib2gr
eG0+PRH4uOLkuochsGRCdoO3b2wyQfr6kteX4ByMHdFg48C7Av2WCbUTCZMYzirmlLcb7Mka6/8v
+E2BLeou6CtN9+R7ynM9/xNnkAq98yRtGWYrmwkS6Kk+gN6Q7tdJ9AD2NLflOHVQ39mv92QpW/28
iCsScIFOYOlV4zoPk4iy5tzLtPu47LoM+1+AwKWyTcLFXz7kr4B/IRP2JX4ucNwJuTNHFYWGqm3k
OkXAgRu5Y+5V+Zmn/X6y1+1k8r6604HLvor+lhP5iF/noIUv62o5fyasHWrDlESxlFv2MZTfwMFk
x5qaX0RdRHSiQn0Qxm4nPX5dtaRpf5/a7L3a6y/EsSahusX7BTQoZSVFjUesAx/uSlqFyIGGClI2
Qp5ndkax92o6/FBVUOT5uAdwWd8mFmDRvpLD76Hj5jdVYdA+DUMP9OGj+XwhQ228I7Qh+GcM6r31
bipTTM/tKYS9onpMLYzab+yG1YwC0vpFGNXi72sVdQJ1/bOJ0ZucdsDDydnOylHHE3afkeKlBoPe
T7bTjzjH/087oLAw1VBV8An9t5YbwsJMIjH2Ro5qJqC7HdmqEyv7P+wdsb5t5XJufkNbML30cXmS
bB0lkvoU3lGi4tlKmYVjOl/xb/B6+1wxyzBhZY0n2rE447TZ/GkwJvCpEwoczv3xtpvoWcYezRiW
ZZzcuG227NvwlJy9kGPB2M76iPJhcv79CjG4w0jFl2HmCGonvwOae56/6XNVxr0/hOYQ3kjzpoZJ
1W0K5hmw4ArmGq6wcXBSude5cZiy8oGjEEl+NuVcA8mtnaKA2w4fotusa8B+mUvnFKJiKkeQnUlK
83d0afW6z7ttTRd+LYWAjBUopF7ooddGBL9W/sD7aoRKkwtVYQa3k2372//gs/cQjNoF4Wb5oxYB
j4Slv6E9p7INeZ35qGLaPaGlldu9E8a5TNEUnkF54PGpkgRVFUfCWU2UUmjaOGhpNjsSGuqwt3YG
R8oU034wo/JXzaaI93YWd+MdJXNDmJOf2+g1M9QYWJZLSNlbn+zcFoybQCvDTFSHJ7TvntA/wSMh
1xyPcUKY/Bps7d6aJwI41MmFnAUxwG3hX0TdHLcFL6wVHS+uxePPHtoUcD4FYxRTziKKqcbnl3Q8
5rohzzzfAUsNVvCRPHMbki5P0LPU+u8NjCrHOkn7rvQZcXJ/sY34nQ7gJBv6/Bnsfu14XX77Kfwz
a49sIS9Vq2udKpiv+VvJvnJT0psv59+lMjNUaTn4f/4P+FqdVzQYZMokOqZYIhjpyFW6A0ebXOBn
j7tsvWG5cUJyMZv5akPEm8z0Ohwf75mx8j7btlZnxxeBQ5AzxT8pKWDPr+tMYAJY9T3hHi2jvHPA
9qs4JE6H8I7LADNXRcAgc+5VQ9hVFpfOolmOdOzsBtnwS+gpSRwl1Sb89hVooX8Q06sSpbu0QYYF
KTWArclxtxdFBBIEqN8Q9a/XkK+ZKikZFeOCdIK7r//eEBiuPV0KT9jOttYM6Ofe6jCYkh07S9c7
FhjBIIrMNqRnMd4bwoxS/alRoTXAfRkTC6UW91wHas3BFcN1S2SdvjZh9pLWLismKM8ggKNMhWSH
cqFj9/ftCKfxfFAHHjgdKUqDqGA0yuv+f5fBtLSul8eFuhyBnphy17Hx1462cfXWkWJb7d4jz4BI
xTZF1idNvycrx4r5ExaIVQmlFwJLMdvDC98OZd4WWLMTxUqhl7HuXvYhZdNcdKFU+0TZgVcnNRwe
0qUA2a0oyX8Hye7in57ETpbpZp4voNJeoIHaM/a20dzmANFlQ/oAYbnvMC5Z0PYBEnniJgmIKGRC
N3X9xwuYKgabHRjtWq/nr7sm07dHhK/UGEWiS+/+YM4eNQ+LwRvIps4TuHr97M9hQb/qCP10VzjR
+brQdRQs5ZDqfL6/aUJhlA9cFoW3PG+hq3qZdMOhFpb7h1hpDoP8eN0L9OE8p+D5Igjk1kWgPRmX
Gng7sVR4BjjDv4zP/x18V7baNS+9N3k6C1eoGdyvd0fW/X5SpH5Uuc1rz+38FxXF1L3i4Qo92Zue
HwAIlE795cVWxNSY8OttnQu57iMKDA9PcerW+iUAAK0H+DWQ+zGtHoUj529SoRd2SdwuC3KT9HZA
uhOaUb1W1eIpX7l10GW7hDLW9YJ1Gx1ZAhEK0ddbpEJ6dAqG9zacLgRF6NUbcV8MfD9Es/4DfBlE
bBXoixBSuyLdagCLUFM3KNLKLNkabDElZfSr92jMQSHBvvS+v/vG+yDLUkzDd0GSDvfD6AAQucb7
kNmGr45mMNAc2is6f0s/gqy0yUx6GpeSZcJCTCLT/E4GdXdbh60OcqXpJ941PndCXFUiws8PEhRz
dxGuYwG+6i7RVVaduKbmiPMm3RW+zjUHhc/BRpeJ0Hezhm/32r6qtNKPJDlvFQvpZkKKyyeiYdB3
tJHsEo1mtyL+J6ETosAeMWp/DYPUFYlbKRnYPEmII2UkV4rrOKwCXne710yEWm863NHjmVMMzYLf
QiqOR2suvFnpYodkSJv9VQaPztFroQvpXI1xOaGPS5BYaXusEt36nHxhP6kW2HTFToYmUgAXdmoY
rUP3siTqaYlyVT46k4ZIBM6IaGTjDR4xPmsrXf0f5Hi0XE63iJSiugUfNdY5JPfdXTB/yx+hFuHO
+DxVlLdSRqza76o0u0A3r2nuzUFXxjTdeM4YvTc3tutFT6DX7wxO5tyy2QTu7QfcLANqDsLkOAQp
gzX6GBMqmbX9MTq6EfBmOcZLJC7LI4XF/8/QgE11+c9x9J6H341QFk9bBtYB02GR/PkDO9RmArbD
1yu8bIYLasnuqBt9/HjAPaJsEE2AL5FnlkXbJw1BPeBfXipX9M8w+w8vUmxLBXQ1nenO0eSWbesh
ZdVlwSiY7Mnq3MMqj7p0UPmnBmqTVGJcpNsrrFf8m2tiSryBeD1s4TJcEfZOKEfEwGfaSD/M8Yy9
HKfWOP1veqLZklpLKm/ZBcuxt3vvo4FIsQVmNaugvG4vHeNo87PIO2eJdpifvm/GlNE6MbMizjHY
GNFZSB7YCOxEfHEshnCx1bZSv8Es9oQ/LVYb94qFEB0lU7qYPbXLbd0DdzdI4tYiZjg/vnxUYl8v
NvNyrCvYhp4ruV0vjB08vZDAe+1v3yKprzaNiMBK54BTE2k5oQl1SkUZ6Y1iSCMvJdPfnKS/TeYT
c5GMd6zIfh1iSaIwPbBOyg8EwOcHunsRPiXZqvs/TDWb9OwEaid6MZGGBN2HASRVHLeEKIbY1l1z
awSrqNLQHR+yhtq5tII/VFzIXlWCMzG3xfbAoFG0ntqIsmPLpX0fqJENe51AV/RFZJxeRuQ4T04X
ybc7V/eNq6VoRUoOIneeKtm3ri+oDeAJexf3kexwer08auElGL86pDlCpjdGM0ckyay9FDZn0l2E
/h7iW87mR/5at6veaDox6LmNpC9S0HzMGZehPfMvUegKPTsPi49i6U8Fge2V+p0Ukaz1DatliGwI
eqyAJ60Jtsg+BJz1SX+ewjVs4cehvDOd1dXScHvgap770X08tnGdKVV+Pk83GqRKa3MeOXZx0fWC
Tg85ngSOC9GpsT+cC/TqA4poextmqoj9EqUUGJwjQv4elAo2aAD8Pqj0iildu93gCB7L++m7KkWx
0M+4H9Onfp6K6XX6MXISc1lpItTtj66tZe0G/1UQjpPpSlhRGVFSzH48S1YahS36w0ZcPNG3tI4B
t53f9p0OY87c2XGbVIQaIj1OaQg/uRoSFDj1enWEDwSo4TlnudhbUU4R2kQEJBhrhbYm41ObYSKt
Ev6vcRBaPvfMI6q+JYB/xM3HDWblEU405tAxyqhEmSTNUWuQFfCREOEkqTxagpQ4Zo0lxHaBg6O7
06r1OO1Kg3w1UJF3dfSQwHzxkIv+e/vpEw0Y9XPV2wC8LKQch4S4/fYTnKhllhu4f5ySfykBgWwv
vaGH+qm0/B05to+q7zIDIB53Ko/9D4Q3rFYoBp2kZKGalV+GPmyX26WuObFL3wzWZM1EXrMpT28I
LTDjdkdgPH/5huFrVIREWzjqj2lJf7WfDjJcBEcvkT8l3AqJbU5iliwyU/8lPZxjWYuyzPvA/z3t
xSTafpNdlBnKnktne0zA/02vsAsAb0XywZCuXOty215Abw4moPB1JyT0dkSNyRTS70Wck6dMkO47
fSHt0edU3D+B5qZyscXXKWnnaL1R/VcDzQK+UnRyoGodhP2L5+8bjgvHXKC3bff67zEgZqBG+YPe
xgkxFft3qstXQ/mGgVMvRr7EuiaeHdDI8n5yM05IZBdcIBEnlH+E8fiPKRh/NmGIrM3eYtNFX6HE
fBntInpzkj9eId4p+BWOiaXCct1nTX/1FAG3EaWr7sCurBKBbzfRxIJKnOgRo3Gr/ozCqp0wAPiH
cCxRXsiQvlxmqgb4fbnQPqLXwOsENNSCLkpJ8BV8hHrPIw2cZde6jmg3feNKqjo1sGZlCW/T1ro2
bnGCV+Gd/aLyJDrXQhuihz4b2RNtkevMqV//N2Oz9vYsFSTsbFxYVtJgchoB0q7g5zsNli+XxIps
q9osfB1nIc3MyYTNgKHGGExDmCebcMApKh1DtbGozRkCETQLmLpw4FMVG/4TFh+W5EDLrhENlNLO
rrBV2sHLpyMoE9YRx8gRi+tF0FZgRjpk3cNSgXjAcZX6hGKYaFMwb0m8osfZKHtlBPzQ7rW5xf9I
Y5uwLNBOMkyj3MKj24uu5E/ipRC+Qi2xIn9XXddRfsZZ3O8HpWUFWOgYv416by5tsqZ022upKkT4
hY0jilWC+dQuoVFjRQBf7oZXnEPnaabtTHcS+kNWTqohPRmFQzBkPkMWyt6o34toODHCp7Ee3htk
77h5C1ToNZoDgAh3SCQQ4hmQoAjLui+u88P2HAREhCU8qCJc38QgvbYdU6qj7P8ZUo3sxHyHdfEB
gth8HwWiK7GG7YC1W8chScArnPRxgvKeVnOk9R9GwBVZ7xrsEajM58hHHrMGjVJnUa1rjdK/xHtJ
YwQMb7C6eX3ViG5HrcFfCE/qXm7eSg5XWrgrivzov+9vUV7/2t0E1+FtC1n8kuqAwOgSQfs17DTT
DnDEH+Cp0kTfE1fS3aoiaPOtu43UybmEsI2thbdVlYOe9Ok5IG4UU76bNDW6RlcOqpplAuwyleF5
EnMeUJGXRk44SuOZDyF0dHnP3WdaaJF8em117FYsKNXLwzZe/vYXFOIQ0Mh9FJpl+jnNJbEPGztE
O8cwVmfpFD0Q56072sWjl2xCRErXFAYLXCBOCXVxdNeaw/vmOyMDx1PIE2btTWnbVSKbk95C1hlF
TisFKDh4EA2bvfHPA8fN/my3ARFYfxVsxYA5iqE7NvI/1gRqSTTIoZEMTNJ4HBxLS7JDWC3uclu0
KTkD2m7+8HD+MjvVokqndBjdUkUN6NcJWe+XApUO+VWII38C/pVL4LEpmgX556pjJAkmHHTaKMcL
5TfcRqhaWld2LT+73pTVFvVZE7hkOgW3fK0dRJxNa/O/kv8MP9t8ERBeOAIPallA+2FJQMaaZEYB
nNnVWlQdd4KazPDyKEaR3ajPiAMyJWNk8SlkbHTNqTZxjjQnN4OqEwE7coeidyXC43WlfURElodg
Y9j/MITNOG0fgF36MD6Y6BQ8vwizbXUKA2PrvJSnI9e2woSWonAPMRZ9Ug48ERghBkqQP8rPEUnM
or2hdQJuGFmQuhUQENDmwucPTd+SW7WM2/q9K9gJda6CP9WCWoSUQZI7CL8Jmb05SMXSdMT8WV5v
8ge2lvttEO4Arov3qV2G5fO/I7ZzG/+PWN9mYSJcXnTGwSoAddFJ26vzDtzEeJzgsLf/hV0nTU9V
TiBnFS4KfLyOVYzxtZP09+uyc7GeLIkhpAyK84PRf8pHQgjjgQfIZTIKlD7R8k47+YhfvJoT2aMJ
AmkXDWOLBgQNRQORk7zGpsiQlIJ+YDuKs2GLBZDhWm8o43j0k4HNBGDF89nt2LpSfbrLTrm0StEU
+NDJnjjMfII8W7Ly3VebeeMz31LX7KGSocOh6wGkW6YA7whNONbMxd2bpbYbs38LV93HV9lDPwNm
/kspp+I2mmgIVT7QXSLsuiltG88Xru1eqxYhTFnXEacAPARwznfF+w73JC3NQfn2yYgV/1rJcb9b
oZvXtoDaz9HDtnB05Qu8Tp9U6o26kqanNrS8U89y0M1ixHsWcTRWgShhL18WryLHKNu33QOy5dv6
IzFUzA7h7CFi+RsuhYcwraA83FeoqtpvOCvalsBBwWDZ2bxbZ95NWLPZFjLrUZc/15SJo8KlJcgI
/vI9t3u60HR6TzuWbUwOdUI56O1a8/grqD5m3Gh6twa8B8jSdywtfouADs+4PDcJZgjSswnnKjmY
f3Ju/DGOlWTQChbGQ8DqtH2GmN9FUHBCxdnxTBzwpct9v3x1Y1+tpZfQxXjAS2RV07eAEQr9+xuR
PXZlQtwx37MgB74pmQUYpNDgGb1TyNlgIY6jWXy9skNwYnTqvZkmz3Xf3niyUFBAR5mQ4K2eosxq
dt83gz7YLqTk9AgTHHsXajQYshAh13ca6ldtjq9haLfJoZzCseKHPMByTMwk08hYbZWBNlqtdQWs
Mf67Lpma94EIHASj5VW5MT3LbJmssAQVhsQUKIuEayo0axsxUgX788WTXCO4NBQraV7lDtZvChHU
lW/J9Xnd0dg/YZIFT+jBXbH/F1vefOsXu/saeLK0UUMyqlupUA/QUmo/+ArVkmlXR0Xj2XcGObTC
EfFSPZAOxJ0goMT/eZFoM0Wyorb3BHbHMRPVN3GV7tAV3QjQRRKZho9SvUit7CM1yj7aWJeV07ci
ufsej8JbBeugFPBFQLSkHtfiyBv+lB+Bku1vmu0sS1JNIiHKy+A7k6F+OCfXqLOghKDgsTyXfTEQ
I4oZRrsicOsfp682KHw+3N3qqkc5nfeJwS59rfhBW0UOFjTdJ3KuPIWLw9KupRevxUxk+FL0lk64
HHjWR5wsUlzSBsvF8zmwkqhb/wRlYLtMtT0jYq7S7DmO0FtqiBba2il4bOsfIS/2gZ5gXqSRnyPT
D/NSq6+6rCV/FcpwbbPVa481XJYoTQirboWLj7AQTq4iaDOBk4m+VRhbiSfeEDAPAZR9ofldZ9P9
5PKdbeeer1dSqTw0CgfT/VzXy+UEIEbv+AuvWF5vMzWeMIIHXqEY4qZp1Nx68rxKlmon/JiEIKN1
VUsL9BIsHZADwvCrWsR2pHqfJ85Poqh1xzyfoLr5O4oE48g5NKtOk2Dx6gXA8tIS5uh7w5Jt+Q0D
t2xqv3cFyii4ct21i9Fa2VQf6SzkXFmsKk+6LKUqx7CIU4ABR2dMsB2cBWEBlFMmKkvrxy3HrarH
OlXqXUoLbJBzSNyPsAYGsxvDGuB8mHh76ItMv6afGwVr/nLQPMftHI6UpwWeDUyu81uu+gCpG1zp
uKmdS2vu6IKDJSv9DiAt1XXN1ppck61BOXBiXRPKqpDVADvrKsk2ys+gSXOmLLg/zvWtpTOOszlG
iW0C2Fm2PP3jA/0i6umfxHM2fH0Tgq1mdja6XbhhD/5yV6SlfaheCyw4Uxpf5Ohoi2l7ocM/v0Hs
aPSd+ZtHZrdZHhO6scDTBWxqmS5juq8iA92r3jQcpT9JRZ3R6N9IrulEuJ1EanB/usuwE9qZjEZx
UOMfH9nQzaOdQGQ/DQsLao0+c3ANcCw0KSVGPGu792+YFqrZEBUUbZ3yik/YeX87TFXc0Yff+wCV
S4XDzPaxuqYvykxURRnNOOt4mzZoj1GKNqscuHklQfye1XPSkieuV4qrf4c+QexF4icN7NUsXsS1
ZA5ATL4y5e+1twC/+LePhoNFKxangSk3cXfhdctAt/G3oS832jhr4ivDOXQyaMJp0JT7X/BFp6zB
v2F9ckDIf/yifCwCfs/oPEQ74HyI7d5iZ1kpgoNd+bsMapjP+lKAeni/BfuMaO+M8sViH+UlTR6z
8lGYeWm+H/DdaT5eOYeLCf8BI3aXUjSgceltJ87Y1B8ipc5gx70Ts0eJuMys2emGXiSedf0TK39+
4vEeqv+nPVfgM3hpL71oPOVEfIYmWtWMIyng0UGP5aobjANbzkJjdz5pWnNYaUQW583S/T7NlANE
epDu/Y78eFnRixJ6V0uf8rOK0nSQ5Gn+r7UOl+/vM9FJS/9Od1Ib8wmcu/XSiPB+lgoshd3lAT+u
s/SStbNOTxGcgsZE+GiK/4gCxMSqInw+UquuZHnPPF27LsMJ4KET1+V+BGWJBtIwb8wEzljAVFiC
tN8maf4IznoSOi6ntz5u9E/9Czjwrkb9JMSvTdX9jLU9sHFrF+F79Z7rIRAkrXTjFS3QZuDp8hPs
SykHVlzDzCYLsvpU8jsevxgjK2VNl/5+XlGhkIHG4NDMm7FWe8PQDnSW+Afe/606GYdC05tQgrSf
xgoAAJ6rEjPw2yaSpIkILqbtaiWTC1gdjO057UHEGHDPWDacmdZJ5ywzhs75qlUqiHJWQcq07pAT
0G7+7t7edip+aoLyTHeSvHEMozFYZPQe9BTotBFXCg6vnH4PG77FAqYToc/CnRUzGr+vCgrsoZcR
e7PoORZGs1kRZSP9JU5ReV99klA+XL2maGfQSX7S4KSK+K4rXCYBciaphJM5+x3tgNrSc49wvToO
RuvfEPKemTxa58sM3KYHIMV0fm+JTZDffKTKgZalT6YXUL7siJAppI34YmCaVmmnbezybIBZ6avk
4JKnF/NGm6Ynk6RmNXJ0zb/lxD2N9btdx+RHbpSlQ3FrLv0P/F4Mhs9+g62z+xedCqIyRv9hwqPq
7inRrl1FKBMbwMFXajQEud5rYkwI5mfWTwLicSnjkhWPdO70i4PXvexoFkaYMuCG6oqYc12iD3tO
2B0mZa9nicjxeRQDrTzxgeUofqfZ5FgjZLy5y+yGvkPO/nPDJb6xOuc1B4QJ+rlg1f/RgBe5olxW
o+CvsEq2Qs8pbKUtTQbMbhS5npluTWQxnybs13PMr8BZkO9ZiViff33uFzvkX+kncHmf40ALLRDm
hXd1rySrIkNx8eiVQDM84UB0eHWD2F5EW6aAxMnfL6lPiR6oDZaBMgxq8olsde3sYt41pQs/edBY
uZjioFg9Kq7VxBari49W9QvgHbAB5A0pZ5SYMm0LrwcCU2qFe6Ysnl4wcRy8K8A3+40pnlN2SzTm
g9N48UUGVVVUG2lcx+TLJ41obLu426D+qNRS9kvZAMWFLPca8Wcr4ywYhWQ2MTSHs2T9UMKoIII2
JTv7Sg1GMLB8szdpOe8kcD01ZcsMX2npLkGOMi7Rxqn6sEn61BqwqRjhw70CuvYIU/0pGYKuvkfb
DZaN+zVHgo2Yg0hlmyaZlXtLywF/5n6Y9rPQu3wKYmiOVkZCo71/P91eiQQvK753uHWfpbH+5r+P
dWDORYekA2Kw4FmR2MaiZjPZCtmJAHy/IG1/g4NugPqqjCxfcu4T4911OGLBczH1HLUXJQNwU/Pb
Zm3aHq2WOnU3j+kCY8PEtoaUejY10pfVdHdfjEflrLdYG2ks78kqoABmOzSV7KItLkJ0A7O/G081
XnF+wQDmGKWgPMC+NJnTRZG/GBllRcdAy/GPWqcSBJ7QFyM8gtQLiquwZ89V4a+G3HZfBl4aTw5+
JMnvwy9rjwhzh4LpGepRIzw8fpz6hWVfT3fIMn+xtQbZGBSMHZU14azqacQj3Ak2dXCkx7d4Rf0N
xGzqxuUE6Lqj7esfez8wgb/05QuAtxm+xoNUbRIh6FIin3fezYGX58y6WpdbLvo8JoM+NERqjwn4
rfxa1VRegHzugQYxrk7LVmWtZow/6U9FzSeck3UkABxKCeGlx1JVDdCbDDKu/DBAe0/r5h5tHa1B
fH9us6dlR/xyn348zm0iCTOQJ3DVlFtI1q+x+lu5iAi1MCBleYXJoj+0bbzBMHvETMvNphJ8l3ij
YOay9A6pPj4yU2H8qky9d72TIaswvsUzBiurJ8K8KATuXpbbnIHnikDDCWrj84pQs8HRaiXdTHNE
kz/JJSbMqjuVyunt3K8Hyx7MAdItf4mKM5qjvC2UEDenYIP9nrhKs0GmoH5TxY2NkhWspZ3TelFB
KuGD2Cqw6nmgVCP1CWPWE8u7/BflREtpJ5rCq0ki3QpCDwYAJwRgI3jHY87hPgzNtUg9TTBj+brF
rTf5lb2nwbb7fCPxx+HTp5hYizQ6I0a5FwoI2RRhjWBzv+uuQdH5qWrlXPTklwCd1c+V4BeDIZvo
USK+QI6tI/7BIB8LUod+deHnQsiOXuEtMPeEAYR8ejD8KcK6MLLy7oXXAI3IGh4DzpVmM8QOdTpg
GgVIk0LBb2rCh3wlu3H63hLmInUN1ugoTRclZK0u13XtcknyKVgHneqdCL0Odq7HABiI4K1rXH/Q
NlodM1r4LgCtBDTeiSZyVIDhPT4Q2BWJYECwL/JukJZQU+mb3WBG0Yd460btgscSlDLlKk1ainfH
CGw9aCL0HlzNRFf/t+o4Amj3hHKSykJCaeDMJ2RxZwBDdPQrIgZGnoSKKN+TpVL/45ah54/Y4nh5
9WD+QBK6VkG9oWNXodVHvTRtFQQQ5df8gEoaUFIOmBo3skOim804EgrRacfMXlHe8kWruthyNZBF
XeFnV5HyKlJG12aWghsgtj/IbMgLUtuMRxaVy2evLddZNhCTXeBow5kyFDwI/RY94kx3SZa3F/WR
dmBBlMbjFEt5p2eXQOK5VBuQaTxBnSWmHEYxrQGnkmio/jse1gOGsg43GJGgK+y9e1HhiQC1f89J
2k5o29JLzUZwHFu/UDqmcjAO8m/hwOsGzh4Nl3Cj+PnHj8ln5tie8W+Qsfm5Jfx5quxEYble/+p+
TcR6O9SANrxiNbffc86XhslVUPVRCNsaqpHvz+kY71J0T2VjdjnI/8yERaKCglu27eW4EX9lGKyq
VxwOkG1NaYzizqpxESIfQj3LaFd5o7zUvGkGiFXdshegbPy4v+ys8yPgOj6RXnUYp1/6zQlFhgfk
pSt9A/FJK76z8toyvmwsEpNJ8qXSVQHnH3y6HyULFbtCgyLLbVTR8G6rMOB51Og4hR/WJc92qjfr
8OPkXElrxvLVpn3986OjieqHPgK6ehZzfXcYjEXP4UIzmi3E35nDYj/MvUqmhX4tBqMGnF8Vq6uS
yR1nwCGVzrACj/pbqjeGt+vfKRDg2zDDz8KLCevNky4L5gcpHGioZI/dsLCkLCNqSOAJtXCpM2PQ
JqPD+CHY5gnZjBtdk/TFebF1t7Ur/goN3DX9BbtwUtk56hGbrrQMp89iYs/HUgSqAQoz3n/6lbG2
lYJu2bQdKhu0B1QX+UjR5Hs3G/84awUCZ84u2acOIGqjl1oY0PmQykB/3EO9xIT4jhg1GxDAFpIj
hlkTkcaKtFyWod+RDs3K5xHsizj/ZYiDQfVBhVV7iExDuw6aBfsfH6LuuDvMDHdJ55MrE0tuo5El
LtDB2G9J5GCqDeWN0wA8cmTxSWOzsTVnaoS/HQIvbZumIoXp/VF28AEDZzPHg0Tx54gYxR9rgUk/
qRbHLJl78QF/Xjy57UL2T7r/si4vhBIakAsfIHrvgNPesHWtd998as9MZ7aGaBug3GFInek4+PI2
SDnyfM3Hr+yq0931UIx+7ZXyVJC7aoW4cOPkaJWCdkOIPm5i4Yyx93bkHmT1KcY+nOMY+ZWQD6Tb
2o62P8VQKRg1xunji37QXsEmWyJUQIMihXPgCh+X5ZvdsyAC5kjCgQAbaIYZwj6NFJyNP4jdXWCv
XMWx31o/s/9JRue75YYgodhsBlzKLfQW1IgIQ4cFJc9bgqYhY5Kqttsy8gInf5PbLLoofOrXB7Jx
KTRr2gRCXwariJ5hwqztTd37pxiy7W9icrliKcOz45VANAD/AfB8/qdByEizb+IClyjo5G6T4F89
D97Obl4UOPYkvQu4j4rxiQxXnpbt5FVBOmBu79JsuIzEe+rUJ1ws20AHwAIq2jn6/U+9s/sx1MLN
9XhyK8pHKV9cGPtDuQgVuTMSPlNRdiQGBe+ECzoPhRpM+ZSOhJJoduCFishvjS2KYJ8RKPJWZVSe
Vf/6hfgZQ3ke8sltHw3ERhfp4uOwRcG6JJYC+p4l9U8jz/iOjO1X/S1MpKrzpUgT8xUF6oR69FFB
d90kSIh4zRYJyRyL46QEra7E4MheoEssSQhAtsT8++7+bccdCPy1e3zyzRHvPzJxZ7tF+ZoNwo5y
lvKK81Y9L0v1PVPpqFzEhOkvEerHT81e6KbZg8+ErTsZ963ljxMYNLQSLaJtXjvvE9jb/BzKShKU
IZyw1VIh4VP7qbzeLT48aeJdLNc5bLGDX08OHTAFLGi2dwvSmoj3Qs6tzpsdPlQaWv7ub6Ec3+go
5htyFkmoY72wgnRuRFi7r66Sf/9eYUtMpRPjLpli7MM88Qq+EUSbP02rBB5CsuuF0yNMFD0sCUFP
OO+8G/q0lKjtxnx7Q7CoqWcPRbqeiqs9Ef72Jqt5yJmeYvaC1noA0R4VhkglgG1OdGAMnb2AvvA8
AE1ndFUtYa5kubeVZF+CxZ9Fo59D4Y0R1FoosvL2LLHHUbkkevi0/yfV3eP87kdWjlY8ZsUigH/E
VsCqW/WeymA2pq3jf1TDDluEvHcGbY8T8+eORmw9/UwBjXUiWJnDurXw7RTTkXCay2qGx4QpcahD
63WDIpCRax1S68ORU1ZX1mRzkIY+o+xpKkrMBHRXTeOZWEmjTyCsyQ4phV/GR35Hwrv1JLoB4OvZ
gOKvZ4khXpwlv/a1HJULiBHjltVE6NIWsAh1VyKmEo+0RJw2Cnkz0wj5P5lIfoFd0RPzx8npeWoI
up4ZJN5Yjt8xd8Lk9exKSLiGuUHcFg42Br7qjHS2lWbOKfSL5f9FVWIwL9JhoTU2QHDFt4a/uKl3
C5HfVUdyUOrBhdK8/fVihl2QTsZCA7ArqSRs4Ulzm4B3/zXPmK8kJ5AhU5Ai8NASdHdH7URh11Lx
UzQ+ljF2v1DCCNRgfYi9WscV4lO25ug5zjxpwOjTGZRAGFr3FBuDZDGEmSDvoOa7Bxe16E+6bkAp
Cf7qm0fBK+JN4PeS7Q67QLzZO3IHphCnldxlExIYXRv8MwQ9CxjqOpKa4XgH/A2pbC/ytJORvuqA
Gq41PvqAPGR4SKbLzMTQRbiJDix75x8t1gcSbx/RwSfxNd30HaA8zuPhGzhdQG5GlR8gSsKLNpCS
dLW/9s5HEukJbHI+41zUhZFdmuCUCnByg4ynMqcUpfR4ei8+rhIdeA2HKrgOMkL77qwzCt/ev9ck
U6nX+Q0tIgonr3fpLR7hDWiVUoeUXnyv8IibbLZKmNj4qUti8ylq0vtepUT7Ve8x5+sJ/SuPtSid
cVb2epW2wSC8CDd3H3GnJD9VIPz7kD2KO7zGrsOf7SfiK7ARIgpVxI9zT2v3Uv3/i6jOShhHFR+X
vOAca6HWgt/2tNXodmNomVaf0S8Uo/Mc1ICvpLeW5XIuD58eN55wtP4pW89laBBEI/LOhRbly96G
boD/Fch10BQfMtlkHw8qcY/SbQovdzS6bqwKdZ6UlCA3tDQc8wV0Vmbk92MSuJLj4hs7DwhuQg3Q
WQdDt0q9aOG4262I/oyVHhZPeXSRfetMfnurYxQtQim+hyWbta/BJHPY4h3YphKV12dcY1DpDZCw
LMHqgHK3uDV/SnmPSH4KvB0dneRxI5TQ2uQBkao1hBh9UOCswKgp0lCW3dWECINLu52N4dafJpJ9
cCA//HI6MLYm7wf2QgwDL2wfoLSaeuiNkZMNIcM8/DXuaXXlFm1k2H+ek0v4WdFwU51TM2HUbPKL
1klLinK0YYuKMU3xu5WZUTWM/i6nOmRLPXKcdG0oChaLS+LYxSU8dpKE55xR6UZj89KAj1ZX40BJ
vCKoWpDSXFdqK5AFFCnJ++kcRm0gohh4oHEVeO7MWakCyiuTVtLP5zBY8c+zQurz+9XwEXS7cBOy
FQdqYuDYOuXceWNvxwnvccJLERNQNEZuVdDAqkXy0+JqOvBZP2Jw3rmQNixakvDcTv9/wuMWWS10
izoaGvPnR62ITUSVHP0z7brLp6wqZgIbJH5pTi303jD701WoardZOjd14t5ZYFTV9phvT3+MtB2Q
C2hltNLqvDK9azwXcahvqfXmsPSesLRjl7f/DN8QAD5W/QQdHjp5d1TE7VGezH4mohcfu5R57PSz
nH7bPaor7Ewf6fGochwwbCVaDgJ6NeZkglFEUonShub/buhFsPXX3rJru0rNyOrB3BmBpCmh41Wl
h7IR4Aaz9eXEEPxGATB6/Xzk03EhVPDIjS3YEgqnTC/oPBlM6dpd9P3zWmrO/NpDsUIPpGGVcVsJ
qurqjEfb6ZaXCTJ+BEMSR/BBFJcHUFSJ2b7H4rueeVHrmdTcaXFiD9tndDeo3k+sglguXGkh3Epz
4TUozlKECxcE8ejv/DPrNXBMnie04aEdwrvP7iryPiVg1McWfiKIUU3plSNNHvm363J0K5YxUJkI
z1T1ITm7bxciZMLqB4e+9J31p8VV5zjQFKtRVZczvkONlvFwq1+E4tNIrcz79b2If0HAwP/dS8UQ
23j7RGqh6UiM5VOerOCJTCH0K/HhQcFKZ/732w4nk0iDY9IRIZLqrVGxRJarCRtw0Lu9DiiZEWUs
UOvxAE+wBRCEmpjdzPn86CV22POtG9+vk7GY9Sx8OK8u877pI/DjAI3QAOVyx8fnyWYS0MOArVHl
2JKIDF7tKPOZ5SOEg5ZZAdiiffjstrZp5Ohr4bMATTvgSaJgZs0ApLlbbCGmV4+p7jnjFuNXsOPa
H8IkfGNh5pZ06R7f/+7JiIYTUx2LlzpiJYSwX9D6jZgUjse6yL8hCgqMxOWdvStY0wwdsDwXngS5
Myqrr6S2j3sxcF+ddtdtdKs5xDtaUOJEkwMQgtZEHikeNYignGJ7AXqKCwfxaKZHdK0PTOvRe6Ox
0W8Wvw3ortzl7ZecM9ymabO1nkfUeQerxWa83so1IR0EPrsxvPFtM2ONIZrKtAv7uUsiQ8lLHu+e
0xfVWLpwpN1DUdrJdXi17ti2cvpzufCGkWmGdZL/8QXf4tVwCXgbNZ/gcysnaKWSP+4LqpwQ03Lz
M6HnSyTFZBOIhjZmKuAtviVrhEpxaZ/gbbneonDNR8yjlbdfnQV8CuNwdB+WC+PNEfUxVAtPHdja
zkexrS8FtuPRWejik83nxkFOJqzf88Cw5nJncma4Pbpot/8AzAeqJouN0/LLAU0DFaVhNiftHshI
OJKSaiw2XC1EfpU2TWnPD2H9mXIWS8Z5SctnGlC/JECcQBeXQXksSokgVpktsN0UAxpApq83oTvh
lQqfp1Vbw1zk+ulEqbqnhLssBblM+46wYyoT4GR3alaW6OuurI1cggVPQqyiQ0fE553hGzOUoMX/
7uP1ahpztJPok7bUc/nLbJXojGCGnIhz+pbDbjoY4Zg61/E4hxH5LK0ATSZK9g0NdVanrEXIygUH
BE+/R6L69CwhtguD9stNyqp9AkD5yAoCFab7euG+pLSlO6vzm7bNZIdlpwSCuI32oziMB02owsbl
KS6iooYGMPAGZ/ogq8DQEoIhi966+MuV1wujGmX/d8zmGR1wkewNU2I/kLJG39+n1+Iwq0KpXrRv
K4lZl2bhJZyF+DUt4zxg1j8s0JvcSj6TnXvmNHUz+hoNq7o8UpyuFcZN6gXKlTZUJIQgj+zsDa6R
HvmzYZezojid91fnvU7i5GHOZRgr+O/nQTVqqIGtgIt+FQx/PK5h2EPmOq2GECOjS9SFudlJxBU6
GaS93gqCN0LykstTfgjeTpf9tVgDRQ2Lam162c8k89hQOuLNRzvIQM/Lsai1yLxnF+P6K/IeNJUk
l/uZwHMP7LWxdnQ4lJMUTRIhbJR9CsgUWBD17OrgU09LqtnSDy5Q5GLgOYklThZ2W2MXGKLvGoTj
+HC4pnnub9SqMluBZ/PvvmjfVAGVz0fSJ4KKZNC1h5JSvhQ8KDF04tuzfiQ8lEYuNugkvIgJhYzS
vkiUEHolDn7A/BqrE2eFtaIudRirIJHscRZahhdDAUMFqNusSglHWXx/+5bne1fm4RuXtIzQeHdn
3FbdznHzvXDwZI3R7HC2cvUW+b3xNb76p7rh5BsusEGxqcbzw/YB/xXBGkBcQShYDyFhuqZ3B0oQ
5wCkVm6mJhpNjxmamx4o8Mid8mgBWXIjoGGiFOhMMlklHboV1wLZ9eee3aQcU08jwWMWN1EZbijx
W/6NhI3bKGMGvk0s5CnDlZN36WmgOg/nN2PIofHuCOClsZ53vg6uLDBpkA9JBto03ds3whIPiHwA
cDTHyjUPAenjkgmE1PD2AcfPYRhEbQEbnLhQdgLcVovMV+6aAfz0aEm3EQ4JJmkxQ206LWfEZtw1
7K3M+F2KlbaoOJbtnP/zBx0qZvHdwp9Xe1Q0p9OfQq9s4HfNVkfTSPgoiQS9Mz7grmUKTSikTDXX
/faBhvgVvzsJKOf/GAwFPfwkMi9rU9WMrkO5CzvQKC4oat1rG7DABl9PtBIF/SEOWc4cqHfdpocy
xXRrFdpSwenjn2Hki61tvVdb8uI3eEzaNSUO95FQ/5zYDMmkj74/8dkoDGxaDQrmpqeXfj88PU4z
NMoX0KRR5uuQQdOvu3aT4vq27PUHV/p0hAPGXnvcaHJAh5keozSGlWAvVfmv0V60VaOuxzCiWIKz
F7BYotFGJT3Jx51xYdJp1T253udkfYTIrdEHX5CqidYQdjkOHqBmCDw7O5qoxcqPxRHpwk+e70C0
YtQ+lZk9nsgmZEVRUiJlVofxcGrxuk0SjKqEd9YHLwzc0v2AnTuI9oFvMu2oOsWITCSn/AsDrkYE
nKAb1UHoF+40T5kKOrNU+cqt8fRkxzIU+hYW1h6RzS3J8UZltO8SmaCCA2iZ8N57lXoHGU+2ctl0
2uxx8fmSbMGEyDm15QIwaGfYmQ431hZbhM/BFqbk+ZTlzL6+URiaQgPpTfDig9wjBWVYpAm/iJ1m
GxnMRGDVeHP2Pfzen22dOl+np4czZRvkKsHoR/EEOqt2SEx/uH3D/+5p8yGlMSiSRMym7nZZi3MW
qx3I2WRLBg6w8rDLmiXx4NvWU08LN8R82vpeSlo6Vo2RquOmuOSsHfGa2Ws333d+IA2pczILqO34
wRpaRUJksL88RWeymH6p1Dj8nAWfyRd9HCTbfDBTcsvqguTek+nmBym0xQE31fUYZM/fEGJIBV5P
zyz45wOlbrsNFHp+oHK6+rAVnJ/hb/KLPGERriREObycpO5b3FpDlFiH7b4bCl9MvO7ZJpvbKSJ7
1TaXdQ4O3zECWUw79CSJGED/jxjf9fQ+O/pR1sg/c+SV/36udMlEIFD66H7KvfACqugT/p4WV/NM
IvOx5ytW5U90rHCdBMZL89GLqJclVEaeNTGWisOzLUYodDfHXZRFc5gLfA7/Dipnu6inlRCMY3OR
OOJfruTU7p7mZ/k1BgIwTiQYSu73HxDTcqQdkLpxosQQlCvXTEkIAMMPSiDbKGmD/DLszngYdpKs
10ouBnlZSu+kvGnH3tGxR6X5RQ8Zzyq2FiiUU0AXoGQVlzUTY7T6t0MYT8LckmLrXqThIYEAtK2/
2WOTR4pRZbyA/lmzIO739CY9Q2F4SOQ57Pwh28zrdx8QnNYN576u1C3STyDY5ynW39QnWhRSAiiT
FF2kEK3f/rtzOfeFcrzh1NoSCqGX/LezXcwIUf9KeHgNqp8PNa0cN7VfKeqx7E0suPWEHxcY1VBI
DQdowC7B8Tbxq1/CC/vgIbzqcXp2W7amEgeLyOx0xm4dQGxfBYrV8XhQYuJDz5EOyaYddQR1qAJr
5eUWrDI0TfrdlSvNm6RDTQHZ2Lwv0ZI1Mrlwj4yX3p6TW+so3n5HQ/qU8ClQdsSlL6dwumq5dfRQ
gym8y7B1c/RVJLKiZ1TyggjSlNmTSNVaQRgq3ysitPBOHucZKBweVlwC0XjRNHuTpDSIQK2PjjVd
qtVMNTcrM6JSUtONozZJ9bKBkdBDaQYvWOhHeMLcvGRWJc1tUi1C6ULn933q46zV3FxFYJlB64HZ
ErnEvT+cTD7rp7MfuwCdUJLAbD5ZIKgj2LdGttyakgQ6LZtfehGSeWDUlsEC6GwTHIpgk6mjHNYr
aQSTOXXQzXwBP+k6zmsakdHiD/8eoyckwlrxlai9OIrcvlLbRESHLlaEVweHz4Uof8lmQ99USrm5
9yfQVzeYaos8GR3Bgm7tKeSdTue8dpV7eUZsqUfONjPx5PrjNb1gp4UTAcuy8p8sVNPPLvLFh6u2
w6QdOAEsg7UOOoEaS8TN9/RmAw2IXGRuQSAfAX+IGufU6iiuN51+W6YD8+ETeqD1nGCNIUUt/GhO
q2Tsk2BelbA/serUJprlVZQUNmcSqUfd0vTE2uG2wI9eBPfOApMwnYe6VJJg+DTnE1iJZqJP7thZ
b6p01oBAQH56nw15xWTBXmfkOmfZZFf/OXJsrkaoRdEVQTx1dp4ergnazET3Spk5Lxu3jGJOyqtu
hPbsyu+johT6cS2MecZ+vAdaqvUDgIqNOMd1PLZMd6PbdQYHPspyx4S+HwYD+PYFJaD/5OEbF5mM
iUzySe9Y0gRC7Fbz2AL1F9F98bUM/sBxy+tMS7sqPtHR/7Fauswhc1JB/PRcLRKJiknLiQ3rtfPh
e+BDttU+GVU+JR0hABUSeWstwTs2uNsiSpouyzbHDpu5jk2NhVmIOeGBzwmqkBWlIiJHmnRHo74w
0g8mxbVoUtYHZ3LbiJ7Errr+vgIABoSXawLVI8aHLxQ+yzrPrDtjLjtyX1hVr3GB+mXbgABAuyU2
SAA4+dTPWdUcqmFSZrFTKFgQlv91lvh0ElhQUy99ChnbsCTFOG49puuE39Qk+0RlK/mzmEzU7akN
3nBFfSd9cOIU8IXxh15tBfslGm/NkLM2hUjY1PKzfJ5Zwv/tMK1K/XlMRSWlwOmBrTRqALrmiHE7
oQdCXa5dryF89eBHlj7zCFwjNGoukRycxg4qzi+Oo9SpxBFk8CHiemkHdv+MzAurp6+vDk2jiE08
wHOZOG68sQwpqVlhC+rxRvk1jJjNSkIkES2hM2F0eBzeyOQ7MJxepFOtffXlJGLjtg+AToSbG8vg
UCyoudKM4NLYAL0pzCE06zeRE2dUYY1sFmUQ4AcQcyorHAKF74WZWESh1yOicrXCqGfQ5L7LmZcF
JajZTIgaRavNKpaJouZgrMhjo3e4wgpn1HXIxEEVB/5R7RWqnvSdHUsSudIGPT9DI/HT2ChZi5oS
9obiVWJFTgg/eq2fCVpASVARHRmIFLOndJMiFlAPUb076aquOFwZaSveYkD1ytblLttrQQsp8GrB
gzsUiaiM9BmEPPh+cQgORz0m7L06hDZT/lmpQbvrkfuW4pnw13qg8Kd1vdzmIuxtAyO955Nmbq6I
B3FBLnl/n5fM7LBGnSwUdmlIxl0cuT/iNfxpgh+/j6x4paVcpa296mtMkAqpsQusx7Xve7fOdq2p
X7e/9VwzHb9DmLgdts3HJ3pI9POC1z0bcvTy8zzfUvfnxKBPnQGCVXnN0uvYhqOT/MNBxRNLplho
rQXCxiZScycZXR77/Ob7Yvvieca6ZkZ3AOVL1c5HjCCsASzOV9xET39zCFGCmg7vFYtRhB0z+CzK
570p0kgIc3UjNQvLfr1eyB17l51uvpKHr8EDuolGLgObec9zyfYugApnfphQIl32LLVib6MPdk+e
+ZrGfGy21JSnJg4vL8LmB+jQmXD2aKeWxbA9c2R9uebVgS6kcdw2YBJTIva3td2TjXVcmrgniI3E
fERUUrL0TzQLHG2FrPN+/RcCujBOQpaVH2+TIkIDXUjg6Nyiibvi19CZGaa9WhAYmZ2w+Km6NKll
NFZTMnN4giZ35qjiw8EsfFEPhIAsWA47LxAmT/8bkYcLpLBrO4RahpoqLVgqHAF5n/S34PBFppAF
FVOYe29EsGk/5VU2ICWgP0iPXle/9duyWQpJ2aByRgnENNOybvXKv8D3Zys2kFr+8eA7NOVTxI8U
v6SDAzTnb/Ulu6miRTvNofUWvIChykrj1H1gftiSqayVhv1oUpqpLO8hzHTV8Q5XHW5Ka4Fg16+g
nfkq7I5b83QDNwlSGnwsg8p4+ZHmbY4SxW4std0YBUZ10hMpOxUIDqfYhv9almrZSxoCqEuFdCUK
EtwShFkMMtQ10QfPx7OSvowprMI5ec66gpB5W1+oFTV5cKlUDTkb8iv+sKjxy6aHsXkAasJR+f2r
ipqJTiubbVpvEQePSQ2Q00fvFeYIi7hFoHTsvFBkFTBaSt02poVt1eJ6HYm6PgcRSK38cEd81030
JooA4L1rOgXJZeErdy14/ogpYfCkDVMHbeoPdaxPrBxIBwznbRNuXINc5UAt+k4ailZazaIuDQdm
EWVjd74Y85KYg5W6fBNdDYZ6u8zaFPiw7HcvBcWwnYEYEQFOwBKYsF9CYXyfN1HNe8b06A1x/QcE
xYAIjIC7IaxqNFGP1HJD2Z7qKBhbxy25fn10Nb07vU+vzLkQkbLxLvQBs6iqIruGReLzJbH7/4cW
uQtdHrAbAtdTY2mYOu14et4ja/XAzb4nug1GLVi5LhloZilGEPIULtJ4RuFLxwzK2ROybHqzudk6
PrsH2KBZuFt8GUClckSuNhbdwrX5Xanp/jx2ethWfPCQu7Kdo6l67wKdlXQkbB7uN9nTeB4zgguz
dxEz3Ao8brwgYkW0YuFi0XaRYk7XPHEBQyM16biIHrlW35IR4GHPZObzfQvAKPi00srN0NkTk5qC
Uyx8JRQklnjhKSN1G3UKtf+Zqe4ufWRE0vOdO8dba2v2acxiqJuMZc8mlHSu4J708DU3y/ukwrT/
He43Z4NI8WMZYkXEEuS98CQLoXGCvbgGcRmWSerfYCdiAYSGcmJHGJx7JcyuTrReMVKOvVlLMMqO
/sxU6Qh0zgIEXah7aonujluQ6uTQq3qlRn3+7AyP+6Vc+6Yb12zzjdIDNEKSopIbHtu8fgPZx/E8
TMB7VNeYys5tsftKsyXL9AdrPkoFWU95XR8n4ehlud4EwLniESconOtUFiWUIJYCC5le1HkWC/wF
16xwp0HkufFdNKcbx+kxa9cQQbNy8GgetRVMluhteWuqH1Ue5ZMxXiSED9TY4NNUtU4wevykVt5v
MKViVh+0antYzPBfh15NAkVlTGJZqae+Bxar4UuDisPyteonfh5M62G6+ib6CiFTEY/RnFXiO0hb
bzoTUIl3EMxmt7oOyPBRNm9/HtwpF80ertx2A+FLGRZC4VSLCiShJQgzPwiCF9crPgqhfTYFkfYf
YvIcXHEcdduqL90zUwOBIqUB3cBQVgz+07XKcsJ9rrKVQIUu8kngnHvymkKQEt2iM1FqXsaJd99g
1RJJWp3tbB0wDlrAbShpcZZFehW4w/fHqxnQK3ioxUMmslgNt4tp+U8EEY3oa3irlmfbEFLFf0MJ
Zlo7eJIGfGIa2nJr9nFxxebDGI/4bZxYcJu4TsrR+uBGw0hCJ6NFGcySR/l0WQ3AxQ2iKoh0FAKa
ZJE/rUa+0GP3cjJwYm8ePrkzlyBIVO3BsHx8TnZfYyVgwDe0N4PQLZ4wuH/91LpPFTNWEM71FwwZ
w3Ke6mg9V2m0k9OgfvD904342+/hBsouMz7Q43BGDq+sxkUxpQlBJ9OY0sGbARqVVmbCBECpWWSs
jtLsnMLpg+EAIieHYO1ujOQsInCC4CDLehxqpHZb1O1R9RbM/5mMyeIKcHKvr7JSM7yLwTkR5y9X
pXMqjLNHwn6AX+nSxPcuclvwA5kGEpvCTQ8/Tvv4HxIafNwtL9BhOmddaty//KSZN2Ov2FhRviHH
XiSsruHhd08s/gxEeTwYUAX3/kkUjGgCJ6CIwdlvM4Q2aKitbKJW7vyX916PEbJFcAqhioI1304a
9Utqd/+e5R7w34jgGSNsAwzUnnqz5dcGi6SWqxVfezmYJf1jE3VHY2/QGAXeIDNtu0bhwXkJrpFz
8SUN3g9+ZE1JNXA/izfgXSLJiii8+jSxyZ7HdQakYMkw9ZtzfJOsTYr4rucFrQlz1ZeAmnhs8sHZ
0HhcELNsFr78oxZYpeWCZavtgtlymD4iMXQ+8lY7xMHVdjhJhSq20RiFFdIKse4idZARcCQ7REwg
sWP7J/MWafZJTfp0rq0YUR3GmXnTywZdvO6DO4qwDY9yaSUrNlJgzacYfBPVokznT23viNYSS6ed
YJ5zzbdS5WyEXX/+0Asz/SIldCeeNKrBdLsu1j5XVDNkEPxP0gGhzcnzgUxoyHspxP63up+Gh70l
6a3pxva1FfiY2CTaH32FVxsM9SaYHYaV7TLik3l0yPBf8qPikgL/5xK8N3Xm1q+nHynW6/gwnpQ7
Ept3zSMFzvge3LtJFebinI3ltKLxSmjoHFTWG+LbsBUmUh5wy1kCSraSnWGXlPRhhVekN84mmmb3
xiOmZEz7qhrXX6RocWFSL742LoHiMLAVkT14Ic5BCByQgbleVczEZ9YY6K9RFTE+Y3w2BWy80epz
7uxHWhIGaTs+9YdJvNQaTkxnnH8FSBAoJkCkEmk5J3DPfOpa9gIc0FvSYLYaV7DoH/xar7WLVN0X
R2cYT3V/Tze9fgEt8yrdpjlxHhBPIwC//nZoRlc2GiEYzvZmRSsNdn/7CmH/fTsyAJ3JO8EzDWXq
dHHhPobJg3weUAPeCfcTTZjBm1i4n9QzQ6aYrQ5aPT+yxjYXLwIr9NdqoAhbIoM3Y7WVHtcS+NTx
PaKSEl3chbrKYb6iJ6u9xp0Rp/jn9W7Zjx/YwvQVey8SElKW+/IcXyz5sxx05kFi2n83d+LaIvVc
3Pk3ep+bm9i435UEis/P88yGXAwEvoSRAnv5EKafeHZ5AKBeksOzQOBB2PxYK9FUt9vNHuDr8qYf
5/ffchDYwZUxKAEUwmoc/KRrxuArOPLj26AJw3OBm+H1gJLRbmWov6j2wW3NkuPeC9Ju96av3jGB
6CL0uVRgKH6qHdNCpKIJTETQdRffUqqJjPpB3VMRz2BcNHggfQwALfX/muEuFqKtStNSni20mUq8
ULZOx44uaV1Ujb1HdmoXfr3Pxq3IzFk0HF1hhwDKzXxpCHZ2TG8O/H8C08g9UoaT4ywRzvOM84AS
BWVE4yN12YpoHTexFfB6jF+9jc3yx4Q58cacs9K1eKoS9kjC/DR4I87e+QfjXWifQpI7mwugXfqy
WL5G8+TnvA8x7B1GvPx2T6fSRF7a3TtDO/SKxwyS+6EBI4sE946u5SHaFUl6gZTByjVcj5IRCmGr
Rjorz1KDob9GnBy0b0Oot3jlk8p9WY8uY30kEZqdv/PR6A4gPCY2xAlMw3g5nE3VV5w9aP25Y/i7
113nzMoKf2r9nHb0fgc2NuT4xUDHxQCBPvgczokXCp0k2AoK0y6ekWTLfEEPkZcVMuYkapVaLF8D
qoRKtEi2AkNkYvkJdKgqags5YyrjW9/DVL8z3JUtsElx2t65nycWnlgmWnORQ6Cg5DZhIXdk/6OT
clRHa0uyEDhWUvd45w4PdkeEGbBGsZYbesFJMlysRQdcVIvgKDFYyeKC6++IQZ2tR3reOGx3BXAs
2xbBzDurjPsFZtJzhlDqFwtECfONqpgqOLoYPTE+emDGqeFmX5XSWxsv/okm4S3VRBesoSxk+1ts
4QOcsSzk02GUKlPdGhn5vihi6eM3edgDV0xw2T9MMdgoXhoaAGxEDqAhnw1JphogC41jZQNzgj2/
aMmVmJBSxkKL50898OymtlNc4jpV1VgsJOxJzGjVZR/z9rXZCPUgjY96TxLXF6RuJkif/3jEahNO
pYMRVrNKqCgsmYOfke9UYPj3GX4YfTugi2oLf17walzhxxTYks2uROujavXUfwigGeVGK32vz1UX
lvpYRLwuuup7AnGOQxnFcAJHuNke2/6pR3d/UIMrnrjglLs0zSbGqb7DKs3/nfmiqhIrczw0GrGa
MMZSBIby2bvry3IUbSzpM8hASRyCQtz71Laj3U6YcWj/j2HtbfngH5EH5OLPVn6Zv8L1Z4qvZQhG
Xf5P6p5DNmfQHmSvBxJstFZZqTWmeHSUz5RPVGQTzUdCDZ/9s0wNTy1jWUFwo6w8mr0DHCsDB0CW
Hlg0S4xl3wvJ/yWfo5Y985eRr5TT/gK/1JBq+dnJtVrXW/TKE6qNWKbDgY6chRKOS371qvRoQW48
rkGRuPCFt3Y7ST5tlW22AcvUfcSgc7pR6o4I+0aSSu0bQWHrA/p7cOvXVU3WmABiDKBK6KH/Q+Sx
4K4+Y64/F7bft/72ok6r7M3cxaxDknRtstUpjEny+QpGxeyFvDCQgHIsTUmA5M5kGZg/HZs9q261
0Vc++P5thep8V8S5ILN+eIOf6c3Cjm7OOlh0KzLmH4a80Cwj/4IFP0aZAFcvtVk1AOeAESw5nV3G
IX0MqwYmnGSlWCo4LpxSfrD5htuLsxtG+tLH3QnexvxZEMrWE9KPtyWPM5M3Nw+36SKchbP8jF9j
a+Fa4DvJ13FTk8x9O4UJrC8nmuXrO964XNXnt0jojepPvS/JnUYp7HQQJyggu+zlmnOgiMGkTRJV
PGBYHHgeKX1l/OYrPZpWwC9v2oAj5tG2vfj+iYeevbGokHOm4Nq7mgJ+C36vSrv5TPYr3GmTCy+1
62DYZ/09sRB6KRUb2qDGIgf4PtRLreihS0R+VDB3Wvd6l0WMgUrIFxnWstnHZOP1HPGBgRTzzgvm
A5iTHBFPKpBMeGpA5gG+7DV0VSd0kgIHxY/0bqVFC+D3QJqf79z0v0swWI9Nt999uwIPzGQIy5Zr
9MHK454PMOC1obC3uliCzMf1HVNAQo2uhzGN59T6Ju8Jxn71w61rjkJb3qUe0rg+Lhn7UexjaSlw
NxVl3G1Ii63sOyOYYri54P2vcTtEJxWhoq2qiwuacLKsWsq0xGgQ/rd1cW530VJeAw0BELSnIqcD
1ddF7oplBIyptS6/Mpz4ibJzSRezMrMK4I0V2h668yFnYNN6pKw2tW12wA/7xYtjrNCkxOgXA1xt
dIR4UnYx+NNOdhLMJN2M+whFwkHZyE3qNQ335ZBEVjtZionpyIj7Z8yojQqxkxBjI48VIdUJXL6H
fo+7dc83DxLDi9Ebo4pszXGONepwov+EluoiejFV9bNacB63X8ghjNr94Q4fP9sIRVm4/2f/0dQs
3sMLkfXoV9DcGRl5ggW9QF811lWOEF4uHsG9Hzhrqypl3Y6WtPFJqTDPzcRJH15U91puGfB5nT5x
XHPmbVQUBXuSZywnT5rNPy1E0FJROTfDkaVgQSO+WWoAbRknIFNrXOdCLe+VNaTMgCgk1V7gZJlh
TrwbKy4xswNlOcBrZnUfF1RsFKFLEHz3jAGHcLDiPBN514Mpj4r+QPw6BoFBFpTLwjEQEE0ehXpq
/nBlXK75QCFRi99bFcxDb5sVBj972dppX1uLz5ZJfs42QgwrTm3CEA3AKq/QiQIcqM8MtVLfgALL
bWX9OucF4JGhrj1L1GhdYpYFQ5Z/WmALQuRZwYt/mmXO+WJPJJLtOh1a1pwxmogASS694Uixa+vp
upyyT2da02dZLprZcRUnlgPYwBDSQD7ddtmzWohGfBIxYoEDge+KtJ3eFdTRNPvwLLMyV17BFOzK
b90+vXrsvuF/8gZeGgsYsMpM0mRSqY0VUhEyRd+Ju+TPJFhMVkkX6Stj8vjey+pLE/JQeYg1CXuj
Z2cTryAUiS7nAtCggdNUuDZaxZF5FmGnmp1JD6BqInxHghtPLLyr1W8xdxAoBJkQjjQajkLhji+O
ByB3+RAsvrlKX+ge55pTeq7Ftdz3+LXY9V1CthVQkFLWYD8vvobI/mB/pU9wNILrFBS2xvU5fuCo
B9Yr5iTZxgbBbAjG7/zv303m7PbA76y0Juvu2VbTWDuyyyQ/U//K94Tg+JJUSQYQ+3Bz+cIZGzhi
SRDFLeU45kuIhb6FbXSgAVvc/Q/WtdspNEGChIkHq4TZqSN3UGYceJvbE1pJDRY4ZyIRN89tb+k3
9/uiyJOR5EyTzd/+bqJYdKS4Otl7bgdO6X7S+LKs05Wu+JWG1IhKAMMJatXRL78gcb9MXAmBMbSs
XOQWPkzsvynbvV4Ni8kzWCXLqSIcP/UC57/LdNgMSHLVbwBIoicy+lMG1NydBy5I0dLHy82Jt2lC
snotxiIqiOh3HHx92VkMk+wZZd2cZbZNNHjqJOMdYksIM4KAiXkj+N6kPQPJN6Og28nFdWkaTowe
nfjE4gqu6nQdshw+TD7+NVaQ4i5Qab7fM9Ft8xNds5lPhcm0YE4jh3hqXXdjkhSeSBmpH6q2qLHY
wxrHPmZOHnMNELgyLexYpTDKRjuWHJ+vMSOCwvup4SO3UvE5d4c7bgSEi3OaK7FrZoZ5RxfxKAsS
VL7D1yE3ee/6hEctLhpDXrgKOAU41mG879zs4V3qD3Z3lTTwdM7NRMh+TFBSUEkT0R9HTk4VKSoL
+mfpb6GV6ZNIx24wqbPngtmJV3I2/xYXIDIaPfC1+9mSn/y+dpnrt0OolTlgHrUaHDoXoq7bGC7W
BBPGSbLTs2gKKpYwhBV4i3O6hoK8XHbzGKt0fH3NOZTu+RkVcdRwgAlgqc7snIAeppNNn1LkyAxT
FMmGuHyhw4rJmx0fLlL66D0dMfKlpbVJzYwzhk86t+TElGY9pdt/HND1mNJ7fi/wMMDOL2vf6NWP
4ndq2wGz4uRVSKqPLSkal6iQVxNiLp2kEukX1SqwAkvGNkKeeEqbV8SjM8C5XUMGoxTXJvXV+w2f
O8g1/fYMWyQLxd3ArxAr+Qi98BxKFkotX+3C4TfsqfFtJ1tahn+2sdqQMAuZNgcWqV7nqPTRh8we
Sm8OizU51BshusLNVneICge6nnjJ53n1QvdY1HoQZhvMtLMITjLhKRXrz5w6nzITrwpRoQ+M0kAL
ANGCW3CeWM7ZJsbZCVrOBuqFfHR9oKSee/UmwZX5dVqC1KxILSNn+DXvo7IG9N4NJ6qSnmtHgwmx
xaX38sOIVSjjIQkw6R3qMBhRKDAH43imuchz7S11LdGyOWTm+h6x9my2l7TzEsPCSrRb700HHQGx
Dz/h8cclsYm/kZnMAwJtcTYJms1W8qPlLwnUJI+yYMbd1kRLv4oiBkT9Y7p1bTtJubKmEiVf1Swi
GPrXZxLgiSu+PpHcEP83CmTAiTiShYjjovYb5fFEfZh0upgs4iFk+WYjxqH4s1k4s+/MXVrQeDaH
HCWdS61l1LbFHsPTsMjPbV2moDk7uyJkFgZ8146Ij7a/KleoSsFW64ic/LyJTEzaLzZDQ+hugMl4
htmBIP3L/Ox36SNnK/7vgzB9qG6VDLAPa7Sex9TvlQXp7gNmrYFutxl0p62hTdkJ4tnSF6okOXTT
5r7Ml9gkyMBMnkKocjgzP8m83xx2dTd0wfM9bzSyjXH0syGoTlklKZFhN1z4ZiffJUfcKpnjDB7E
+ua70ZBz8dQWaemGdaydP0cl6ZQ/9Vn2T+Wqb/a8k/aizDcNywRuSz63naSJsC9xz681LoIer+wg
nZ0ahtldQMjUeSjrl+YpKoYtaSAYGFIFXf4yFFGdYuL8/TqaSJfesv5iohWI6eZVZHPWyWQIHJLG
ss2gm+HBHA1oWfrY6cnq82W5Fyrnhf220+paeGPGTSY/N2QEXEvg9RwI5lcjneXXirfiq3pNcMdb
yW0634pi0H+eWJlmBnzPSzaWhm9hDkr2+8f9KQmWJOUDkoNoacK3xN37cJmv3Tn8vqooBPtcw9nG
LSgTJFVWTA1cXiIq0zlerla5qvAIwgJ38pUw4L7F/WlpRsRo4sLQFyeO/CnzqfLW2hcvjSitjIO2
9rZ7Nm5a1iYkw6u0Wg+xQPJxXJOgwEt4ohZb8fr2lwj8GKKBAcZllQyAvPRVpTcQJDCm65PfKBoA
JUBINODGp2rsnqyOm69NPtiZJAZsNBswRfxSdkiCDIwcouV2tqyDamnC/BnD4NMn3uUBfNUcefIR
Xj1squm76AlYAPQovRb53mEi0A4RXSl9NPj1ZbonNmEAThoOGvTRJMXi7v8FEonK9XKjZ+BFe2ND
QwBOOVpCzFMelpGjhNOFko4JcKSY+RYfzNLp6+TnkNJYB7ffN7WUhfvHfWneG8h3ahTYLS4tTxLp
dmOldwqnVbeUDrFnp7i25+r9jgpqT2iwYRgNK9MBqJdn2Q/L5CKKXoQWJ1CFhMlM23O5liWJ5jDQ
gbbhHKXVL8kAkgcOSRqRe16qeaW5Bj7JdcMSfny0g/jvquCbsMy+BadarIh8REKm22t8dfI6s3ou
O5E+m9a63nQhdOu2niEIS8wxoz+LpMiUnHvWd2DsohHO0cL8RDuOuxGRVlbWgixAMCxaAMlbP2Cb
RnnbUSh3v5HCh52mlJ6YGsGgSmtwbw4027+80a9otkIgcOZwK2nHs9e6bOJnDFi+LcrzFEQ4zGEt
ZHKhkIjqOVpTL0oeHBO+ZrAiNwn4/F0fpSAmON1Qc2scQnbCfs5iSk8mQneh1Vo1FI8otw0fgH5D
cXmpzOaY/Zjnyi6urHLcZg7Vb442ys+VpHnETAaXR1z0DNEDUYS3ULyINj7HVN3U6bkr+v5uzqCE
2TZCJylhBmW7Z1zGK43c1UaVJBkWrKGl4bFIIKu2lanhd9M6U4m7ntjuUevEeBUS7lfOwmbquGE6
AcdAX10XeuC70fjzjh2VYOg4ynsGMrx2cW0UcP6QxySKETBJS2A7/7K3wrpkly1zWA/VZycfWS9w
d/WdqMK3EdPMpL+v0GmCI85v0+Ini5462j8W6nyMtNdtI9KzBBU5gKejJeI95GCT4Ab5wJ9vRnlh
YjLiAzmMIyhHk1+exqZHwRkXF+UX90Bbv3/FUWBDW2NVakzk5KdcsK0VMJ8TOGp0L2dTDlKzp3/1
EVkUVIa7Ijj4UWugtAwdsnYOoIZSCTzmPSSRJKuBRLlPz742QWopZtmLCFEuy98dCnuH3iwVFzhK
8600mjYYwcLyyLb2m/+CRbyGERmmFIl2hHylGd6EVxrw+SPu47ttVlSzMV+aFq4AWgtHJ8ybx+/Z
Ib7Xg1yjGFT/b8LpVrAgZe8BGceJDKxKtwCl1NKxX7t1lkkAtvFYSpIFWDFTC3TgQEeXtPcc9lQx
uJqzav9SgTd1Vki955E3D0M3KEYGUBbip/B2CbuXS25VabIVHKyA5noe9BQIEl+QMiSYW6JekhdQ
o3W/X6Kk4panQjY9TkiqNQ1lCZkZw2NIScD4glmm9T7Q9+g/yu5968c2ajbTxAGj+s6Rt0dhorVi
n4+chleEDwOnqq3c6AENE1qqqmAOYnCiXsrHyYByyFGcAQNNvtDvoje3HHY9cw9wPcWZHQblJpg1
oB9U/mrWKoYGIuWKAU15K4ZTwzk9touwKAtE3KjT1v+PL40zN3MEjzufTI1FUNap3WsdY+RztX3T
e00cvD4FvNMlczO16uZ+gkIyn4XzC3hsbeFf9bQlqM9cyf1Ff3WCyxCkrWU4wy0TrvHXGuj9nVuC
stODl3lFA9Ww0G/FN3AKjAA68YpmqcJ2UCdE4DWSoCE2XXjIUj2T2fOlwKEoWHz6uoi50UsfXRGV
ZSGuaMyvsF7Q8KaggrGarrIL7aRAfkGo3bSP9dQYLg5gaY0J7oC2lYV4XscZnTrSh62ZAGY4FJC0
74YtR743wwh4NMiTCfujCNUTTtiutiMYakyGLnVK1pdVkTpVdnhBSvaI5SzHFMVh57SGt44U+KOu
hpq60kDgOJLgBiDtcrc2gdu0CNyqBXGDYAy1F3B3Zl0Kx0FlFIdC53KTkZAb/Wg9xTmNKofyQdM0
gG2n5Ta7/wJ7psrsUoGs0LcytpA75EcIBSPEwYfo4VVRYYkHdVyzaLanOXwg3DWB2CUEOtcwrn1a
v1eyynV/2EA2BN5gn/aiLPpt7O437rClnL1CPkRhMbWnRi+5J5RL8luVRb2m1RuFW99psN/KY+fd
Ytnq4asbkde/QWQaPluES/A6VRpqWaSYkWv2H0jPvr60s0HrnbGqUgvMWd8zWCcTu7AQVJcq5VMu
bffn5kAHHjhFCpW+zhrbX669gSD6dKkz5VXgK1bKjT2Bcd4n37MlqoU1FbRTs9p5TMwKREk1NmCv
EwSGf27+hG942GMMfoz9McAWZXoQp+MHN/FH8LIp6KhPSLJP9UQbuRwGg1MDT+RzS/n6jPuIuQRc
/2jFl4qFIJqCMStRFg6iEflUz+0xNbnwqBCRS8eIKUE8RlI9f2oxYzJaObpjITP3SDtXfIGPMGNu
goIAoSr9uFhFRB9dGQE1L5se96rv0it0VT7Vg2n2N2tBDp7J5fWr03oLL5W3e3WUSBDCyCOk/urZ
+uqO+owV6zJ6odlMFlgSSo+KnnaW4uU0xwXrCMB4kBu4jze8QYA+OwyQvt0odsCZG65+1Fkstz2P
Sw34sembbLit5P1RADHqs4FWyU7R+hZ+4ABYjiB5XMJYHsUz0bMSMfS1b9jQ5HBdmNTnMNtJw/9L
T+ptRe77E4u8b698zpyruKnui0Co3Eacc5d/fjH+XaC9fo8UdmFdmG+cohucPPeoL/EjAR0mgkpu
9bM5lrHvKdsdWCatMof5BuvU30Dcc2Z8mT824ym0wZdGvy7SoAPMwei/hM2YyJJUi/HpoKpRNh+p
4e/JZ/HB1G2KOLTi48Phx/jk0j5lU1o8OQmAmlQseNWzcsrJ2QYZezCLgEoIWI3/fa023J3SxlZx
JifBZaAuPdtlRBbZSGCc6weg5Yh83KYWVyYmJK6f0Jo9k6Us3RjhcMS4y35v9hrVgEFdTDTEP+np
c8c6AsUod4iNDkASD5RofucXOtv81roNIZuWECA1aJ4ZGRqDVhfXnJexqLJvjFBMnPTa7vMeDToN
wKzFN5nSIyDlD6C07vpof5P2XwUBRYdL+NkSqAb/nt3f22vHmvTkzA4xIZ02EXk2ExbvX+x7wq4o
qeMOXHLtjcjuu+XCNAEaMScPVQefWur+zjmaTd9y6TRWLOeFvU+USI2V25g3XWei8TguM8MEbdJu
BWihhwayrDQzItaOWUbVwOsPyYn4+0bCQWf0JQnWeatnIy4oURfBUdFTCWGdexk+eq/i3STaYooh
Lnl3lHKdWLdnt1sUiu420Ki7vnRUJMNJaT0gN8wLV/3c66qRTZIgvQhYoTroSZoxCXtNh4U6uUgW
uuyC64SWftCXEYOxIPPfPfLWYzarp27nkccRTr/1Okm6gBQ6d1gpffCCeTtHbIaHRT6HCBbpy/9z
xvrRblbU3L/3PFeGngGry+d4fM34/FjvYOEncaqUX8JDGPvi2O4SlgnXtPQ/XqmXZARFW6lJKp/v
abMw2K8/0GbgN2tnxFnxe43nXRVOjGZ4Yo1cwhf4GHGheZlhPXUB88N/TZ+Ql3l60gbgustVKWOw
DD0LJuyPF43JedefylqCe+tp+/xT/GLzzy+vcYZJA12s1sxxoYWIvPQ+i+lAvFOuF0ZSSzy37nTY
hHfJTWDEvOAx8HIMoauPCCOChVlfhxBbrqkxHA9qDI1MHptA5TKpJBMhqfgFheyR7zFpk1F9FW7H
5hlEya6xL70E+/3gHu+GkACHQJY8ctBP6kC5/btkfpvJ8PV9GAqipUyiH00fMtNKJnFLjgio7ck0
7OvvXTYszc1gmkTCrJWFgLFB03TzOKT3Drk+cQDe1r6lrtAb1LqMlDPY3pA8RJNQyuJ/7Lg9rlA6
7OLerZkctVaT0+RXppG44Jz1UTcV8qmuWzWofJVkOR8OD9TFT77dC1x1tMGPmgMppjAioSfQWgU6
QmBJrglgpjP9fMWfMKK2I70FesVI1dhDL9BUGnQdI/FbGqbSQ8XKLNWW+BbBfLK0cOhmRJPNwHmm
TuQNseFVamoL9lwmrCXtZGzFAsx1JuKMXgLOxJTEUqET67b6LSrTEYNVTu1Wezd+92bh0eZT+MUy
pWd5tTSX27SOaKERcEX2B47hCB0vlDO874Map+geF9QGHaN2c+FxPsBAEVyoz8oKos9QHA4Wv+vg
PvAa9CNgt2lyKD7KO4rOSwxSGIV8winOc44tCRjlAk0S9mLWSA1EtjONTTQwVacdOndMAC3rUJEu
xtY7vHo7M1unpUJyvGFE3FtBI5cv39IP2Ln4qcm/oPuIRPCA7bj8OpMlKvj9lUU0XSLUqcVfrmnV
ncs+Eneqok6EzwyTP9mBBFI5zhPQa88npCDrPTK2AcNiZf8qucaed4BvGl+J8N2nGdzkBaewyPjp
HX2rh4tuvjcQ2kjKlxvIpawP+PLXw4e7Cp/PI/7bh8S76iD91eMBAZQJhgr5bdzCOCrAx224kNvv
0NnRoHKcLb3xXA8CHo1eBiZFrCcST8yNRn1BXFokVUCV787eOfBCN1uHqDIT1stc9/UjYOllPYCA
UljDR8E+Rrsy1enXiyx2e/GGHaS15KHi12+8YJASPzt21WMiaD/W6WdmHZ8A4O/zU/HlcnSCOt+f
/VDXQBiBNRpfqFBRmudWzKCVvBHwUFI87btuFucbaAOcHSt94oUQ3uf5WtOC3Qc4GR9EKXEDOnKv
ahWxlDeZZoQ/FPvVMC7e7YIAtmx8qjdM47PCMPZ7ICol3SCz0GNh6DjyYtWoT4EVcaCCbwcvFXwI
0X8MTkP6Mlmu1njTpSMhk5yN5aW8rq4rLydch6bk5bS3V8DvK2DG5pMk1R1VLxl7F+B9tu80VMHz
/G7OGLh10wShhqdoRf4GgjeUZ3IUcyUCEhldtFKNKhT5VRi81O+ddPEy71YWE8u+uj6kZl2+4OO1
YDuXSbXiIpK1PUl/LLqktyk91hcP9R7RG2cwOVaT7hJ350WMRX7nWaHpdEDuZLhK7gRVRNGIRSak
l04IzEgVguRDKkHurT94GrqLqrOPEsGUTQtLsgev2ixSM/XhAmJH1IZkW+9Ht5vF4lvG5NWfXjET
fBHyuy8dy09GjIHJHvCT5a0ehKHm9oQ2H90w7Lr3uuELd0PupfLxT6G73EIa0/obs5iiFHdXNLQK
7qGRS6tbM3aOfHyyZmjEYBF9+l/JbV84P6sOSu0aLa0M41x8qm1yUmssBrR8I+kUy9KEPXT0i6ds
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
