// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Jan 10 20:29:27 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Laplacian
//               Core/laplacian_core/laplacian_core.gen/sources_1/ip/dsp_mac/dsp_mac_sim_netlist.v}
// Design      : dsp_mac
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_mac,dsp_macro_v1_0_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dsp_macro_v1_0_4,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module dsp_mac
   (CLK,
    SCLR,
    A,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [10:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;

  wire [10:0]A;
  wire CLK;
  wire [47:0]P;
  wire SCLR;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "11" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "48" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "1" *) 
  (* C_HAS_ACIN = "0" *) 
  (* C_HAS_ACOUT = "0" *) 
  (* C_HAS_B = "0" *) 
  (* C_HAS_BCIN = "0" *) 
  (* C_HAS_BCOUT = "0" *) 
  (* C_HAS_C = "0" *) 
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
  (* C_HAS_D = "0" *) 
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
  (* C_LATENCY = "-1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_OPMODES = "000100101000010100000000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000010000010000001000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_SQUARE_FCN = "1" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  dsp_mac_dsp_macro_v1_0_4 U0
       (.A(A),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_U0_ACOUT_UNCONNECTED[29:0]),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_U0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10976)
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
kRq1vWYVu/8bJk+VXlslQhRdqc5+BVdYNe1dXi6K4DtQudkdSQXRo50I6reAyb8WyMnVfw0fpJ7W
sPYovqJt5UY0amw0o6YIaKBvnlCh0LHLRtLeWsbt8UoSXHpBHqGx2cKnodEMfeQw455wFkW5o71S
JlvrlHxrEDnV123Sih2l4fRHAwEImpkW7whd27SWXLa9HTGiSMLeg5lyYa0LgDCvLyxeLzopqCJ/
2QY61tG1+9EZ0gqzqIOpvmHx4GVXY8KYvEqixMzqllqgix5Ps70uohipRVUpo5kNiNxg32luihYi
11msztwwWqR6vTIPwvRXbvIZ6vnhLr3t+YrxPg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
yCokbxdmDRqii6/C599LMcqSqtURySlgoMeYXsYkTkHs1Xd4HcjCiNfCaiHnFCDMlgViSvHoBXsd
TDwBfzTPVpBnMH0ocMe6TJR+e4f0b2rcFrrUAW4ohpGH5Du8KzsIJs6+P57NU66GXRKWPLUxN+hd
fFuPp93MdiFKhTYVQzFRhhb2rZOedH2AIfx9q5RMElEPR4kgdIUXE74rgUmGGS4GY/TSkJS+CdWC
1XRIJggRcYmr8YZ/tF9vOOXZQmGThRXuhTHyeztYhcvSQsqMleaLzf/tGcvQOrx0YKor/d6h3IqO
qssYMKFvPMzMOxsGdgvuc01j8z69Zhdo9H9DPw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 38256)
`pragma protect data_block
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
GCwYlGz9SAoC
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
