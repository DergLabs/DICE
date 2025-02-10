// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Jan 10 20:03:46 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Laplacian
//               Core/laplacian_core/laplacian_core.gen/sources_1/ip/dsp_acum/dsp_acum_sim_netlist.v}
// Design      : dsp_acum
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_acum,dsp_macro_v1_0_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dsp_macro_v1_0_4,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module dsp_acum
   (CLK,
    SCLR,
    C,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [10:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;

  wire [10:0]C;
  wire CLK;
  wire [47:0]P;
  wire SCLR;
  wire NLW_U0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_U0_CARRYOUT_UNCONNECTED;
  wire [29:0]NLW_U0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_U0_BCOUT_UNCONNECTED;
  wire [47:0]NLW_U0_PCOUT_UNCONNECTED;

  (* C_A_WIDTH = "18" *) 
  (* C_B_WIDTH = "18" *) 
  (* C_CONCAT_WIDTH = "48" *) 
  (* C_CONSTANT_1 = "1" *) 
  (* C_C_WIDTH = "11" *) 
  (* C_D_WIDTH = "18" *) 
  (* C_HAS_A = "0" *) 
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
  (* C_OPMODES = "000000011010000000000000" *) 
  (* C_P_LSB = "0" *) 
  (* C_P_MSB = "47" *) 
  (* C_REG_CONFIG = "00000000000000100000100010000100" *) 
  (* C_SEL_WIDTH = "0" *) 
  (* C_SQUARE_FCN = "0" *) 
  (* C_TEST_CORE = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  dsp_acum_dsp_macro_v1_0_4 U0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10832)
`pragma protect data_block
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
fDo=
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
TVx3gmxFRGPjvZjS0YZTWNyeEIqnbzOEfQnJhyaL01AxZX/GsiGdVRjza07sCpE5LYUxr+LazmSD
OtDjO97JNoAYjzScOCshnPwukVFMcfYmbxUnv818+TrtSMa/zwDYx8WK0lBUDZpNApKWxR8q1M1U
oyoRMYWxFbmCzl3B3UbUe6d5ALtT/RLQa9TILfo8CcYIo87Xoo9YNZSTo1OD1e5MVeA/VOK09KvU
8G5QuwISQ2Z0Hf/hJKaKFBVgSb6fA7WOtqOyKLDp8ex5uD6BcG4gFVlD2EakC+kzs0oV0aCljZ8V
XquggzAu6cWoGbUz9X7v8xnfnOgr886VUgZhTA==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
wE0+nECES+s4qADzVl5HHnCd3PXjZX/Idjosg60Qp/UTRejfYyKz2K6f7AZ6nHFeBfynFpQcEvHk
W/3DDOwdREVRWpmOZXtwoIXR6A2b+h86XfzreetJ2AnfYnxfrtgJgSEKIWjS/JHQcgflYVzLv4W+
SliCTeqEDS0lYxv7gtJvZMP9Gn0/9OfSuXyVrReAHDd/RM3pKjHR5X82IxGdkqAuyhjUAUXRA0yp
HssuDVUp2d3hyo622IWwqgeeYj5K+MZzWFNNjN7LxUW3kOROLobdxuy6hIra1VmVPhYPDp/mOJa7
fKImrWuw1WFbuI0/oFC3bQE0GtdE74LMguJyWA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 42816)
`pragma protect data_block
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
Dal9M0K0stgZ
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
