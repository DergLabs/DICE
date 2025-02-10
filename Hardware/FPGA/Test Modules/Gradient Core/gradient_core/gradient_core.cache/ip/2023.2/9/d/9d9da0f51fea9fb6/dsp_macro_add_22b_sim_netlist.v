// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Jan 13 17:09:44 2025
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
as0yHA==
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
DqFzw9FjzliqhkiCd+ZwmTdR/LG6nmf+2GoCZs5UNa18cSKFqWQssV6bQalHv1Wk6vwhbvq2LGO0
Wnxuovx43WJlcRljW6xFemSaBfBJTUsnQdCaljqA909d6z41H47Ym4Y8iInfnniJ+RMAicwWXvVL
6hdOcuDVjnwq/J7kiX0hv6sXNwHB1/aS7Sq4NCSipzyis43KvoP6SynUVQABTWPVeOUWKq/RS9Ze
J4H63HNNY5peBFAQhbYa1VHi7iSc2XAcFs83TYCwNxFkRYG7EuOhFnAWodYUJGNDa90rbNgjuZ2V
KkjSBv1wR3YjaPsrn7qySeRLlCvw18rhaz4LCg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
1mFVW/fQrQ0fx1gwnL8gNXVzP1RvxiYhKrkUuK+8DjVyOc4mr50RCqNRpvV2jK6Q7Dpg5P+k8O3f
6msVBOTS3KhuXTipIWCSsmlQWLCHdY3xfqzTbM5JWm/bay4JeJCnOxUX8rJHGEKlviPWEVPkE8wm
gmwGvnJbxVxk5nxPpnF/6ZmfZG2Ofld2pq/eE7NpLmALdkNoE/hfc9NKJIDVPzJKF49DYCEebRsH
S2rcQFJAKxdufE30epgrQr9LMb1nhBN+5RpOaOJpmYPjvrlX0c9vOZznXcPYBjr3PCe1/yXpn2R8
lChVteYT/68eKRk9M14ikllAEg2WsPm1X61akQ==

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
