// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Jan 23 15:48:46 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Image
//               Stats/image_statistics/image_statistics.gen/sources_1/ip/dsp_acum/dsp_acum_sim_netlist.v}
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
    CE,
    SCLR,
    C,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:pcout_intf:carrycascout_intf:carryout_intf:bcout_intf:acout_intf:concat_intf:d_intf:c_intf:b_intf:a_intf:bcin_intf:acin_intf:pcin_intf:carryin_intf:carrycascin_intf:sel_intf, ASSOCIATED_RESET SCLR:SCLRD:SCLRA:SCLRB:SCLRCONCAT:SCLRC:SCLRM:SCLRP:SCLRSEL, ASSOCIATED_CLKEN CE:CED:CED1:CED2:CED3:CEA:CEA1:CEA2:CEA3:CEA4:CEB:CEB1:CEB2:CEB3:CEB4:CECONCAT:CECONCAT3:CECONCAT4:CECONCAT5:CEC:CEC1:CEC2:CEC3:CEC4:CEC5:CEM:CEP:CESEL:CESEL1:CESEL2:CESEL3:CESEL4:CESEL5, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_HIGH" *) input CE;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 c_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME c_intf, LAYERED_METADATA undef" *) input [10:0]C;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [47:0]P;

  wire [10:0]C;
  wire CE;
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
TpM=
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
appSsQ8MC/W6c4Mht7HJ+u5ji7WN7GwNNR26MJtTmtjyzZEjVziSRahILTv495EoZd0UbClHqmmc
Gy5aS2CPFeS+3g2ZpuCpIB8acSj1D/2V8ZJd0xnoYN/w6IWtzolHqHFJjphhoezOHXHx+d9RrJXj
cyIl7FiN8GoTQgUtzNPkhMxrafHZv8VgQd/+f08js2NAZ3zrVeZYZ777lmuvRVJpTC69pcacmqPZ
Jia5xyRJIcu9hCif3fIsux2kTS5WJt4NRx5g/yGBPZsnELNn0ekI42pfEovqlewfvhl3fYjYzcBw
jI7ZWWT5RNMMID6p6hofwwXnGdqYGsHaQZEWxQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Z6+w8l3q0lWuCZpBxwdHvqMiKLgk/xidY44ZxqwQL4mz3h2j451JdDsaUvIiHbPkQ9TxRLmDlVkc
lj+gtlM+hoAC3qbFEXR2dI8wICY/zpCBkucynlqDxncQRvlpp8Gs5MAb59YFZXWmliHs/jVJScM1
e/dRr9CowWeiDItjb2HS7pKA7UZ9PPx7vkYXJnNkfFDL+WDFz80rqNho2Jocq5rq1FUTRtv+Y7Ft
c+fVrAEdoWWGsOwNIUsANBpDEE22VafeSAJS4peJWYgnoaT77XF7AQpXhfGbKmMezN0JHivZrcz2
RMVYedAJcu1I2pHT4cgjEolHtcYvEw2GuAKYyQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 42976)
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
