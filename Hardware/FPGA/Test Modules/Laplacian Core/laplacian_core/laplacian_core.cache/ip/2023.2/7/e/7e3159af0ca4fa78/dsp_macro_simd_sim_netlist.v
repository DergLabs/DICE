// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Jan 10 16:11:53 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dsp_macro_simd_sim_netlist.v
// Design      : dsp_macro_simd
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dsp_macro_simd,dsp_macro_v1_0_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dsp_macro_v1_0_4,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
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
Z2Z+m9cZ4UiQgANtm6Im+CaE7iJzvM6JNF1fB0wxIEJCho+z+55b9y+Z7VAAJ/+T7SpYFG+Sc1W7
r6Z0DE6GZ0G4y7X9dLYZCXXKXhCw7DcnGvBGAJgkfUAnaA9XUMrSihTuvuZGGA3x07Rns36jJY54
+gvee2RzTxz7S7Pq8a+NOWqyCw8v1Ou+6zfxd1f8nxrOf866KUbOrLSE5ynD2CqXxOTjSddObYvz
YXNvsMfzS49qTOlwIx/x8pDfT/tpRt++vw8teFHuH1lc9CcaxNEboka9cUTV9TujJLeiY23XyzPh
rZIaEffyfScwqb39uplvxkcKrTWu5bif3MuB9g==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
1Lz2G5O782RegRX/0Jl5hoZ891VnOfJsCAii4O+V5NNslbh8QKYUhQNxa1uLOMKww2J+wRGiFxGx
0fdBlu29wcDnFPjn57F/aJH8os5EmYGdhHyKCbiMrgmWLkPupfbg1nuPQVMj1cJPVQmcy1iilLvf
eim+Lo6zWYBAi01yGXEiTKGtHoccHFOWqa9x5XUNoXcEDfTvv2cIXWUAbFd1va99vnDpt9/oshc/
3vOPozR7D93urMByssfbOm72Pwl6KS1m0Qg9Vq+6UUlnLb9ULSB9ENjyL554q11ZvUafmY39YDXq
t7uRxPKX5tC83km+skuaUQNSIR46VVO7W2VGuA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 33776)
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
