// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Feb 10 19:11:12 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dsp_macro_add_22b_sim_netlist.v
// Design      : dsp_macro_add_22b
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_macro_add_22b,dsp_macro_v1_0_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dsp_macro_v1_0_4,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10720)
`pragma protect data_block
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
JhGtzg==
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 29120)
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
