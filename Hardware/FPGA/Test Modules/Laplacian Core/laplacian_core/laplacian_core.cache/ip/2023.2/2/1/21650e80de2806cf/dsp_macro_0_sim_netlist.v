// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Tue Jan  7 19:30:14 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dsp_macro_0_sim_netlist.v
// Design      : dsp_macro_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_macro_0,dsp_macro_v1_0_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dsp_macro_v1_0_4,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    C,
    D,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [7:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [7:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [7:0]D;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [7:0]P;

  wire [7:0]A;
  wire [7:0]C;
  wire CLK;
  wire [7:0]D;
  wire [7:0]P;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "8" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "8" *) 
  (* C_D_WIDTH = "8" *) 
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
  (* C_HAS_SCLR = "0" *) 
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
  (* C_P_LSB = "2" *) 
  (* C_P_MSB = "9" *) 
  (* C_REG_CONFIG = "00000000000010110000000011000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_SQUARE_FCN = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dsp_macro_v1_0_4 U0
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
        .SCLR(1'b0),
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
Vr3yqQsl8mGcM7Nl5A==
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
B60LOTlPrjK+i3uZr7oxLS0l0V2iwALeoQxcLx+kJKr6ZpSiThUTDJ9YmXNM/e4yzpduEX7rpQO9
ILcl2H7dXjMqvtQzM9T9l9r4amG67haPCHCmzZG5nawlU6YRviPM4+YHFOgTfyX+zeBelbxy1tJV
FZ6YZGzB/TdNbQtGD6tTWw0lkOhHhptHo4IGFnCtzPUDPxf1Mhp+sUnjZ50A+s5Il6OrJBVyZoNr
9r0NeZyOvvyTHns6dHHtD1402q8lNdkcarj9PIJSaEADh7/enhOXccQcFDmNbObAStbKesvwqor7
bcqZRblaYpqbSC7hrHghNGQqxnkdNi59RlXn5w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Z3flkFugZ4SntjWqHtSKPrCYl/eWP1IBm6PC2MuqjVDtTVtatxsCUXa+a1PtLbucTPBPBB6znLN3
UrDbIJz0MuS6/6J8LfKGTSAsj19NyADG5Ag6xkGOoc4U26lDfFLDYDM/kex7vVci/iw8qD+A4C0f
nM3E6Ab7GhXMPZ9iNP0dhs1NYneoVCr35EoPil1BApN/dR5hQ0KUiDEjrGovpn5XCdBO5ujS1WXu
kSFn68fGAqcvWdAxKW7LzzyXiW/5JvdOrgsLUyN6o476wSONT2iFygro3oPmryXyy273SGA/66fh
lV/c90AdNxVgdgruUJ1VsGe6GbqeLNeSc1eOZA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27360)
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
