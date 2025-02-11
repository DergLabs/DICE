// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Feb 10 19:11:13 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/johnh/Desktop/DICE/Hardware/FPGA/DICE/dice.gen/sources_1/ip/dsp_macro_add_22b/dsp_macro_add_22b_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 10704)
`pragma protect data_block
FzPryiRnTpFYT6/w0CSaZx1aUnV0acIBUjnTbhTdz9fvfZq5GEqKuhnTVduGsF0QbXSLYazvF/MK
oNoEoMMFjWrZQXoxvyooep7rOW68FbNEI3FNZjFXRJdh2k2eImfEK8lA2W8HYa32PPJlHELFU7Ow
Z/DJ+ubetuWTfTAMw8qdaINMZKT/Bvt8Lsgfw4izbfqVCqT2mBC1zrWTCGD/eqNaA5xiekx36nP1
5qEnAdxhmWeVMP3iWU5kAmOQUtgvjVEPrgKSPXWle2l4xhK3F05Hm8qI65cifsl2IDsgLVoyRb/m
UBvWDIKHW5dNfcBZFWN9TiUgf5FIA2y5SYwc2uIqWZHdr5iaPaB78egFMw9+GYIDQvdQIG/yxbpD
Y6zpM3pADEEaAb218pyS4Prr5T159cpo4ZUqiQBdqRRqv4dFDVIMZDPbuyquIbr5bN8Dxr1g20dk
nVgnbQjc7duz2z07JDRnd9uNl1sdyswGZZ80t/mtO8VxxZ15KvbOkDz2xydpea3FT2KHKNkZLpVG
g1QH4bcMIfKEpVJQrSHR7MpRRhvW5FDyqfBV98U0XG6ywfaQceLeIZ5yrwlqlmrE0nkkIw1iBZOP
hLg50H5Ml1aWDjPC27PvVLeVFEME92MY4C5pPrn1pyQQx1rFkqJfvXQ0GMfJeaHFL5K6sWcwINNB
8vwU4cVEv7KdqCnOn1Sj3hHHm+QpeYDEjuSe+NZhEV5t9ksCFD2sdJ/31H4lzHCXxK3LhEBU7BcZ
d5Z6Zhe4ua48rYhMvoDWcxJDAwG3IRUSkpUYptLI4GBASyCAAw2jV45XjPRognI6aZ2WG+GSnswx
kWxoB9c/t4t2qMTJqRrpS/3/Jm3Pk4pMeVoNBUYMdeTDj8hfXEgY4CjEePo4d+M1b3TogXDCx2W8
BIIApsjQpNHcqaLd1LNdsRJ4jCwymczLCGCniVBWWq+BL8jHMev/oPgS19ulYa5tmX0m7L+0J20b
7QYHMFsDFJUkFWJ4Jvuphd0uQ2+Konlrov+3HZimSKj6A01tj2B6qc05fYebr4tuuhje8YQqRxmZ
Zu1aMLu1X1f6OdBDYrLOnA/0RjISzCDUAaoHHNs9sDqcXtmZGr3LpxWypyhx1AiXdyUs/t1afj6y
Cfr931Wo021jiu2jK/msuw7pMzQDbRUOjR8s+4q8gWJ5Z3Wcb3o4IMXF+c+Etwzh6p9P0f5D4TGW
HAnKJbFh6mwaX2uwLLO2mD+OdHLtua5AnIQ1dJ5ZgI4S3n6tDJGMW68AgmDmdsQFZAAv4X+lP8Kd
G0pTJdljU5iVJtLy5+hcZjoRpgqr4jkU0FoIpjYsApi0o5sKzqiqjY/BmRylYesOEdJkKxXjejcv
yMZ8V+6ZCB0Fd4txEd99iNYIMp3dE4EGmBb/k7F8N4en1rUWdkIfClM7Vq75SYmsA5H6BKLUVV1E
eGlXoezPhQxk45/fcrq8MpQFjDHqM+C5x0JgD/jlg3JB8gk/g37XwxDg7xwEm/Fq0KuZBt33t8Tf
JFtfnieFAFzX8f852elPlO1wm9cqGHfVVpOSSixC71HKv7ASzUuMIQ9ND5YWYP3HZ7E01foo8MZy
051fELHHVLGwb2dxU/LIU+Oi6WDchdxM+elVu6o0oUtE9BcGOwFgKY1D3LmUHQDCjHVNlRPg6QbY
i1oxxqFBnPMgmCemeAx2fU7RPrJkOC0hWagX+m4IsMo5Q6vfSnBtr/C8OuSOVI20aFs4PKoYzZh3
7DKQh1MrXevZbT1mkUT/uIDGtO6Ln4hINZbvnXCRtkuXAf162pSqLsKj+BsN6luNKzmO6P70FeRy
h03AxhkpFYEEVRx4w9COiNa6XrYlHL3JdYy5/lqtVHUNDSKOqOk4SPRpKxNb+qBN6+5w5dGK8tyX
yVotJrZ55JxS9KIsb9faE30VHrg7uVeBRvteYfccIpSmYqd5q4DpJeOGJ5n+Qvsq/2t6NZEANCfF
qq7sZe2eGOIckKDVa38VNEO5YCxErn+S4JZB9s6wtWrUgjs6nSyNNox+CJKK7nbCwhL3O0dUu6m0
6tIthw9dOJXN8lL9Q7b+6DwMSDmEYNna8EDl6BhinKUoVJW6VtjuysoueinV+s80uZO0roAJtPml
P+OEr0eWppq4H6FweOiMIH1RS1UYmfrZjIdFG5edgsfS1Bp2vf1jmp26UtZMWg7/mzASvGpx3dua
rBY3TVBSRkMVkuP55XmsbS345SaMgxzH2up1LFiLd68DvkpE1EsRhHztIu0FWKyI2ExhIdfWkLmu
yeEPpH65lKE2rkwRssTCpxzWWhEMyovFEJGYQoUd9E/O28sc/WfbmjYlKkn/gHHzRe6QMmfY/rvE
YInmhNwvZ0He1eSzp/UZacZum7xMK7dIhcnPpMPRlLypfCOgxEJQLDmXyQMTdDqPHOZlSulv/MQd
g4e6yEQ0tHA3nTqC8kteeS6oVu0ZitO1bfWA8Nr+lVa6K7L5GpDMbkRrqiihQzAimgw2nyeOknA+
YoRaNOAMbwYPcjauhrIBUWTV6Bu60+COQDDULi/4w+BNxyJS8o9EehleGTBYsV5qRhLs+tUpKScf
P/lVsTuIkwgxOZV9GdvxKVYVXV0HhpN5Y/2qn6wAI4SAbahHuuv1/CD0dByV5vBPuUegu54Cn6mB
g9pTDaakE9JNWVw6ORr9vIO04V1PCOtIm8/Z6I2J4ufcWX11npjTce2BKBJUTXK4gsHaMb20iFcJ
USawIocuCEClby3Te/sBjSTrmJoVjWy+xwy9F1KXQv9GF4r2F5B+XQpYkV6OrR/Bhtm+Anr+bRPg
Uj+xBZTZYfKn6dd8W4Lba0ZGSITV/N/H7MvrufDCvhwJ/W6xxj+1lY9faGEC/xLnaA+/7bC8CmzR
1My2QoGUylqqEV4h1mBEgb3EjT/OpURsyK1NWfIjdTIb/9xrQJc4E+eJomlWdtAnkKhPuhxXZn3a
DMhHlsr6vTgfq3MZenFGeo0QuYceEQev+veohWncLiXutvhCi8x4PWZWoVBS+KuuROna5WIR7+uP
AnYlkH6m/iJuGYS9OY2mztPt7G3/hy5O/EvhTekGzfV0uUzzVYcP3RxRVBooRv7EETp3CRik1iPH
1hJ92ypdACuT5R1xNkDl0I/bT6Z37xoLa0pif6LmDFWkax4xt7RbXu7ns97wga5V4taL+nEOMkVQ
lrGRs/C8UkbMmyjSKyDIL3pXVbj4Mbx/FtnTZWYS8jpcgVwFE5HoX5pCWGSLgGyj9sGJZfA6LTm4
y6FCArhX0poBlsLSMMl0JTZ1k7jauLebbXscch72T2x4P/echJ/8lwbp3pQTT8dqJndKmjOzC6bU
ruQLDeUwB5+gUF5KcOosIM+Dvvi/cTAyekfML/G1EhXGrq6GYsbaozAZzKEdaB6eEjeHQrUZmbFw
egR2XFP8rizz3WK2eEG8lt736Jq8Y5gcp/+d4AXTVGpyS7aFct2Qf7BOCGeVrmwzTEu3yT40TGIa
fCyYaFPXID17I+59VGT+LxO7/FDURadTCcFHMaEwo5aXmkcAmR1t9+58+pC4Ur7KKpHoKY/Od/T1
1+5M1cFZDV0EweoKnn8mad1GgTKRd8yV1T/w3r3V92oGCm7kfZeErjPdBo0bukyknMBvRMrESw5u
85nq5zeU0DnkRzw4LEJqajjmWtGEUpkq7lPjce+tIWX7H8ukYPXB/7zpxs58Law/Dzqz2lzDyvn0
CKd1fG5I6/zHIfk6cjRGGbxkIDwkqYP9uOB5qvBHCzTMPYk1DfT+1RwcHOJbnnfZckf/dwZotW6U
8A68wO8f1G4c+qYKr51/85H6lSHssYmnJQP6FkW4TUl1SXmO72RGJhhaWoQWHRsPZjPPTlnU2SVW
FSYFK4UTH2A4Gum6wrQ6snNVuJkbIK3dGmOyhDqOieeHmOOPLDpSLiIkOm1XiMJ7cXGLK3eYsKxO
8PdHnOyXaxTk2N10qjA0OMs8e3mosZGas0pGRUxCrUXxbRsIv5hsRfk3CjGv0mJPhAqt0OU0kXQD
t7H/e0LhtwrzPDv0SB8KSjD2nsGLTlGpI/ULxVUceY9Nl7kWx+l42L7+kIDlKxX3CbN9fqOrtH/2
W13yOmiwEi7/xVd8qncLtrP182ZE5vwfrZll9KsxsABuP77Iw7R3O9M+TlyCGHnF+ya4e2uy2xYz
W/9zhbSd0pYUuFqkSju+ImKQTH06U45ZipiOrnnc8Mq3F3T4nedICE9sFnewqUm4GAXjfSLiO9u9
HQExlGNRFqaR9gkslbrHg7RS7t9+bjjH+aJgwb3K5gUW2eBLVtCP7b7EckX310Rse5qcxFQShiWE
YxfGOCBExgaKikvjUvOccrdBxKo3AcGJ0ryHJVKzt7wVUO5GuB2ifaljiMHvkawkBB3ec/faKnKr
M+fcFPI3b6XI4sK23qi6mh0k87j+lJmrMGOq810pK6r2KgYUN8oF7JuAh/hgmg3oV+X1OjZ9DFTf
CKkZc72QG9H584jxk1rnN1uOnK+SJh9Sc8SEG0okfiNyt+iISelgKV5pW5yig+po3ZhWk185EJ9V
11xT0LqhwWhdQ7A6/HxWFOw26lY6CnsfYcheV9K+w61aPteOV6maVWRrmaewLFzQYFb6JLxlRi9U
XQzwkB0FWrgo2sjHQ3xfMkdpWaI+CVcInjEc9VFywjGv3N/BItjk2wssvUJSX+sBS34Owii6oFG6
/AV1yP4+JX1eIUR9jdCzc4MYyEFMa4t5glaQBK1VZjdf7c3ynQAfb1b7uNspedOzzix1sSTShgDE
iTU+2Gi3SQTQZncnNLf/C9yo/5PSepgcYooHvAkm8Ct6hCpENE9CG1Qiv7Baz7UscUIQ7PeULpA7
naxc9Gn8AcIdGg8zWZiEINsxHPNaL7iidmlaFkeq4GjKJdzwWV6bzlDNNl7rIEr7XbnGRL6zc9qq
l+HGTzT5x+LGYKX7s57mfbKmSktM7/t5hDPqPj2SI6Tf0ZjzA0mppwhq7GoBdTS4o/ZfS/OzA43B
sufh8A1BlfitGxnGN3HFzwYdyZeBrDRW894VznWpFNqq1Cibx713cTlZPmSH0L/2RfLtEP6teaHR
UIFJaUQdesjvZUYeB7jpMfMaunXs2ZxxD1wY6eobLTpfN2uqKlxL4zCzhyk3QTiW/MNqMRMjy6Iv
S4r00+jTAKwBpSz6lnVhw6WAXKSweZuM/RNPVEWKa8YOCmSMPPQ+cSj1JvB53eerygpN6qae3Xy3
eX3/jznzQOmpvPDjM3UxFFVMpmvQKFYon6Hm9jcl2nSb9CvJYUyX+uiJ9QAk1NSAjzOwL5saOa8G
A5DRMH0UYMOrIIIfB3QLxu2igj4TVVPjeT64zuWyG5FcVVi+s2i0OsBU71hRS0jR2wW4OtcHa+0T
HtrXf6kox6fXAV5VoRAO0035JP8O+ErQbW0p5ig/nwyhjw6vE1z4x2Gla92vmHfHN0CS4k7KcVA5
hdycJH6a4hKiNiLsCPMmIUBGDKnv+YHgTJSGK/EeLclwB38Ak0MBMOS8uNkjeLsQWp52NfPA/o5o
FFUyOvalxu2/w0fwVTLBfODyoHjOUWMWfKxbcoJRn3ilXVU8Q6YObku59cwnuRxGI5hOxBjX3HA+
y1pTyRtpXyHcXnYntdqIKkNKenHtnxo2VqAkOaHpoEam3Nz3xS9glu+z3TcVDdnujO39/qi6vzav
6upo6jXivXT0Wyagtx4x3SS2BL4t0pOSzdzc3wGzLXzV0xB0PwN9ZnnMmSt0SxKdd/rVKo3WsYfB
tTq0cVyKO5DFw4W3QKHFgWC2JfvMztjeN93uVCP9rs8OVomZUFlCfyFApzTRfZGzzx+qkqItfBic
3yRLbWmnPwbtkcfK+1vo53mUe59pdPSlMp8FkazZqjq3uZYTXnDs0AVd/hccBt/PJY6D8tBfeyL5
3CLC7H57xcIYVc0uJVSmbTcx2WlkEoCbZKSv/rA7zIj8Rwae3NQi8y5getQU090SOk9W7J57cIZN
Erjr3WQWWv8TBnD33EuKN6puruKxpAN25KTLTRrXnZJvNbHCenlQ25t9QJ0cloy2rQZOHDFURhdk
ln8v+wWTuTZm07lddgihmplXvUiVlo3lgQ8S4jmsoNjUnWGP2Ku6G2vhMP1XNtm3EpDr0wOC0oZJ
4TeywtbvtTUlxHsmmPVjyrsnawyKj8J7TYydLlrFRCWyr/eexe/MEBkbp2lSP4xD8hH/ssXCkjQC
x9JH1VWTTti+DfYL180tNmGmbkfXQpWbyOSfZFvGQT5hv3j+zsxv21NP7fRa8sNZciZhWYoZ6DLT
uC78j62VxJJIxanxjdfEBtNnc0J5tmRzGPfOUVeqg3WjJ8tnbAusEhigD4fMpihT0zFSmJ1rQ7We
8Fm4ctfV4jarm3bldWgRcM7PRZZFAPQt+WUYViutUwIumiZNL0zlJahBY7W7fzxQgHRLP2oh4j8I
NGAnjczi0AyRWJj3ZpOuNBOSEB/YureRFM0ORGd4ZPu/TkvRH9g/srMZdNBWWZzbYDlRRUbIRF2t
iPoaEekOGndtXkXptGVq0etLoic4pALxeEa5bm6WLLxdpSUAVOd/eimiySM394ttXmWoYUEBTWLK
JBAiP5vYCb+4zWgrj+vHc2mWPOwx1ik8sfCcdM7WgO9DVnRQYM9VhAbH/IkwwJ9C8tP0ZQwnsr5W
rZKouVeS2VzeBkaJETYZdPnOqjBKUZCYOUpCjNB6gUi5CsMrb9xNC8I+qBgYlgpweee0lS0T0jQA
ezKNAggV1KOPRQXHAQ33+5qD0JoS80Ce2sQsxzbf28CljgvVGw6aWzNF6gKWxKb6/oDZGGRZ8fl/
VYPYse6FrjtGUsqusIjcLm+N9JTtzJDyT/h1s8CNQo+pipCsKALEij/MrL5h6egCckp+DCyq18h6
9QNXDAnkB+s/CJCv0pZL7xVtc7uNZIzRak1LKpCOA5fPTnf92wd8Agr60iqQl48yHr+Aq4B6avGf
w0mKO/sm0jyA83yt+R3qozikb2Mh8HGjtLeI7OfRi9QrvG3jI3pidFjQWBWHf5FT3Of+ZftGpUMa
QXjSDMy7iel/hZEUDsyOKrf9MXy3bWn8y8OqSFkcNoyiBSNwiTlKMANRw1Cflpi7ZpM0L311BlQb
zhyCFzQhb+dM1ofNSXZK16/glXibT5erp5clHmv99kt46uGxKq76TOsO/8ThSbCTlO34JpmTP9L+
tDAuSOcwkVcqnT5wKFBTIY/m5g4299eg5AeIqQlelp+Yl2lWbdoiG2A0oMCC4Dc/edK4FscyQmV1
L0xdhajgXx6hsnwZGeud46913xt5YnSm0DyRImWTJVwK6CiwK92StzY3X9yFuOG4DQqDsdmfJ9wx
rBK9fcNGZvBPRonERkEW20BgbohZWmjby91sXNlW6QY1e+n0E2QZ+bW1aTGgO5hfRaEmN73ekd53
NhlCwyUT4rm0Z/1rYog8m/MKxZpVpDPFDtUZ4IqzOwWCi0DgK7q1klsLpYHR/BStCNm5tPBjGrYv
DZRjny7AP8weEmv9K2iqyVZnQvvkF9+s+mAb0AACfSEJkFZfnvGUoHAMQDolBXyW8ALBvY5fa/eB
qiC3e3tttAHzH2SZ4h2fLAJIPdGRsafmvewolWKkKmfMlYy1YZIjApWWh4XqbZHSYdsS8eNVOO4g
acrtk+DlC07wXMYE3CdZx0VpOpzE698og5A8orfp3IOyvN/IUXJiD8p3Imr9PWGRRBQQL0XgWeBI
eTCvLfUsUM9ZuIldEP3zE6pn7r0UfLVU505gt0Qune2u1MdVHn4UZRxi0rgT/+gt5WKbY7uuQ6m6
uaST2vNPCsffFvMONFdy/bEXFrTTRux7Ew5cet8x4Y44wQVUkrs9x/bIk5phThULvhoKRoaZ9/S/
hsy0sx1ZQ9Yqy1Jpwn6ZEjW+lAN32ThvLAbzFOhEWMluH2MYmhLwJdmAjnRHPT+qZQ98atMyjboV
wz28w+g4scS5ImpZT1JWMhUX2pvrgucUtf+gOlLodRlvSXOANNMUb2h0tHodYew4hJYtV5CmxD7V
p+BxOjnW+hda5Rx/+kqLkdn0s4xfOF2VLOpvEgKY2+UjX5vl5NVg720+Fszdh5lBwCS8/r7HHq2R
GChjdVI5jnAUuSNH92nHQbfogrdh7dhN/3FG40VUEzoykBJaWaSD+lyQZ6HPY+vObyPC5Pv7AfTb
X/w/eKUH0JAmEPudHqjEI+gfFp7CVV7n+yAWp8roi+DQN2nETuNhNgST38WAKvnd/jyRtDpKaLaP
h0Xl1PnfsIx5pRvKiijsFUUUHy5Kh66qce3qQ3HPpuWxUax/PrbEe2PeK8dJEQApuIxYuY+IpjlF
aNtEklYG8S+87CK8h4LsuU3HVSz7uaeQHwmubMLRp1qdeJ61zNFggx/3vSoDZjf17bAqJ5lwcsQo
XlDujlaCqQq0um9RGMvAq+HGZxBSfsRc1E9dthQViEQYUXseH9qheczsz5+v8tp7Q0y/uu52YVsk
iuE0r2dOgFmEUzT+IZuA4vHtSdGTfyaUV4cHAzP0uSGB8guXw6KNXECe3lE4Qrr3CBf7CIPPAUPW
RUILSOhnMk79NXVA3Mv7m0spZxwmq/UJappaQxBebZDY5RPtcoXVBm4RAjyOxSl1wqb0ALu/NsLH
YeG4pXlxtk1fIV61C5cilejpuRMNXJRkIZaZjOiW6bkzJddXvqXQNLvM+3zwcvZhqt9Vd5DgYFCz
cmr+A66wFyr7STD0UfTtP20nTvkKhqhsQ9Mekb/DOjy0dyjKRX6Y4yhQGfncUxwOXkY59IZcx8DI
j28zWwDvaEJ/IEGqLxBhGXHjcZ+t05JlHKk4EAr+29ql6+dVbxfxvja+1LJfdLHa7VlIfWbIMnDD
0StvNDrRHF+LTlBYnCyp8IWO9X/lFkcQPU7JUAbfaRTrdMTJMqqh549ncEO09T7x75URDalMy4+L
WmPvwaTsd1hSjmE0iLDXAbwKptE75gmBMLQN2DRoG4y3aqu3vycbFtbaBJKXsGmNjyqUOK82eJ+h
pYjuhXXvmb69dHmfrOZjXwyPlWqVj11UtyiMg+VAAbuSVJaiZr03HGRcYnWsNN3MrlCtEsk+3XGc
AXoYz1WMFB1A3Ko/FwS1UW7w7wKWYU7puTj1pv5BfLqM+7BVk18aDdxWAY9uWKLYJ72R1y86DxIm
nqAajQVm/aaoT3kyiNZzmF0ps+layVy7BIq8ytgeTl6O8xpQtBVUQHekJpVcvp/CTobIaGmYLno/
X9lRL2HUIFXV3oNgbetAgc4jvkLy+6O6KobT4Vs1q5+xWedwloBXsjPPJXq67PH90Eceoj2q5EwX
0iH7+TLYTfbw2J1DK1aWVOQv0C0vRyxV630IpT4H14pyenCQmFCrcFlEn3XvRhplRZ+/QjonxJMK
bzCvmD0Hnxc2qeNGGBe/rfWcpcz+6DPLDZVOnDZrJuw20Fab2nWLxS9Tqcn3oa6tdMzyuPYkhKin
qU44FdBWxf1wb1mSq2GOiPx9TOa3cEa3ExVIk/xUuh/WQLSTfZ80Sdnfqh3rtkWIcqITk34/F8xC
Lafzxv5tPFSPpqJUCteD6Xgxth8hXVDXmu7pd7TJAnb+k0aGLUomVSAlqw5LyCOI4BG0pnm08LtQ
V6K2wNPOhmkf1Cevz8vbZaITdZa1W2w1U2jUfeAd91gzWOXgZidK7Bpn3igca3l66duBg1nzDzMy
Qb9dEmYAgqAetczMABeo/PuwGI7wXXL7oDyV7DNo5mOFubir725f0ydEHUd7yA9+1zMnJghfkThb
ZySBDGRFc+r1BdXyxskl/cO9BC6fV+lloh+pimfWZI8pOxATBU9AQaev0zsG0S3W/zlwIMaaN3NX
Egl1GFNzn7ntxKn0qIDuyfRr//OmE6Bl2pE5VzSjfPNB1Qq6JZ5D5PHlXw4uHDvH5TcC6Xx56I6v
YMsQSYB8cOG+4CttkfnrahnA/z5Wo9yDDauJjsVEko+d1YQhxbx/9Ldlqh6Lmj1AgzB62LrWfVi3
yV3AKUh5/N9JdYtjv1Zuoz1F7kntHWCFojmHZCQMza799Kc56novRdhlsAtx+vwC6PGXDhF3P0xf
29ZdECu2uWjSEZiSyOV9StK/JEz5+fcZT2jtDS+9m/m9y7NE7G0sXWU4ruY7uaCcri9fg2yoziOg
vgn8JOS+0Y/EpcQhXbr9Ehgns5k2aYFis2EizaRAC3lw/7JCOzQxJdK1SSvC7gDg+gxXcSoBXNXz
JDEIh5y1nhteYRSUL0WmRTLZXHkrMpumB3bajY4Xek405Hawyx1AKcpa8m3wd4Ae+LRxfqbSoM4I
aBTAoOL8gklN3zTeHlhb8pAncz8JOUcb9i9sptMqSt6zFWer9dJVGjeWz+a475SeVqeqlCyDAYZU
XUi7xAJqw5ZtI8A0QznSb2v19du5zeXmvDabIbNEQfC1U93Rj7J3u6I1+1I8pxk4GClkQre7/8+v
T3ezJYJ6cbr+/xQlAjfOKS6AwVC7LW2GN2iRsEzGOn/y0ka/nQVM/isAyJ7CaVVTJ/TrAwcMJVkS
YIAp1ZwDI2Ghj1KOuaR6waBjl6nGzOiW2og3uJBLsa4q920pGNdSNE35px3K82dsj10okKLCEUAB
85Sl48FUyFiefmKh6zoi0EnrSh+gX0sYsDGEAQgoCxXDp6ago94O0Xs/pQ1vdmqLTIsm7GxXYQlG
GEzA9Ttg/hKyL3zQJkvL9DMp1x8RMBd0xwTHOClp2kXfCyDmu0KOT6CUd5epnkvEAciVyr78uVJY
Kela8njNP6t8LDSx+6F7qZdgQ5jKx2szI5B7ZuYEKVQQ+GcGm4XdMg5qsLWARGf1Eft0VLIgWyJt
vyZecAGxjXygSgCd7s25SWzInM+4vpHzEZyvE7oC35gfDWaIW5Ml1zHuc6v9DZl1zhGNkvoTNGkM
5VTwrDKxMMuCnNSPv8EMZn4mnhMHmkFsR+AQXeeZapU0pwHbA0A4SFa9Mi+oUw6xUvq7oJN5BPgw
Z0i4VMFeLfbKoQ66LOl65Sg2Y+tZ/peixuwLqfmo5JVm5036V8E/Yxd0KUuUiu3yWocQGfcihr1B
4rJtNfRCApW04Wab58hJnu5XczzdQ1TMH1vIaEXroyIa0ckBAPwSYNsOhy9PEgTkfartgj4afrQJ
fmOgVf8e1noIJQCU0LazA4veIOzcbfy81oK6RWaZOJbcO3WzQ8u/XG+5q9U/cHffzzJX2jQ4aXa7
YHO3jxNsSpZjZjHedNLHyNVXd4EAka+waF+oH2ICYxWm8UogkiHq7SZmoe+sW/IRtd3/t2hTyAGG
BWF91adX9nyve3pgo1Q+lXW+iS5/WrXB+rz+ivR/cBYTOxkI/Q6vH0v55loc1lQwDR4WlfT1DdEy
toMIYggBdMVEetTwUiINohngNTQNdsYVd5ygvzwk6OSh3XeXRC3W2Ih3UIBjzLZATIPwFUBwhTsx
JTI0BkHcg7KH3U6WVNGnRq1wwIdD2OowO/thL4ely18lpz+zoN8RbnfhF7WbzVwOTlQRh0P0GhBj
p+eWLQGa/xwz6espvXM7YpqGGcunP5fCgCUKNpGF9eoM/jarclSn36Gx9m/YwHw3SSP4XmNOUFw5
ueVSYdaGZjm5buNmt/Odkoznts96ZIFRH/NLKTn2GSfATQbnMrhW4e2APIOK0ygiEPGRZGIoI+6i
oPEYngud4Qf0aa3Nxq5Wne89gTCzE3XlkxNCgNn3Upyj7RXeY4yXRmj4its92pT4Nbbs0kKug9tJ
cNWfNdmV4yycCsd/JTXDePict0dtmZWLiaxBs7+t0UFf92TQgbeRDYvCC5AEwXtFVvhGvOZa2CQp
MOh/+yXVbcUQQd3MSujf5YvSHrTBVahNA5vIipILsnDah406jddBPOvxeJwkWfoifoIVD0hGcPDc
PVZpaYALrJFGLcYB4BJsCfsoZYHEY8CO9zi3DSbP7RbxOk1v7hY8WubNAJkPxKO9qM2ofNJkszEI
ntmcSSqSz4h4RmxCC1VUvAuaL44X+dE5cjdN0NVgdSHFOSAh+PUmYwXBgspqd7VaVEXHDHVHd7ve
P9PN2KsOciVZEQaSXpK8ZOUetstdBZSgjHQYIdbIRr0BvR8ZAgF1cOs7PJd8tqrRYpnl3FXnAk3U
XI9d5w/tZCeQ7YmpYdkVqE+GXLoFyfkQzYtos0RayJRXaPeBifeUPwwJcMd+mmQw/iNMbLDtmjUB
wppBE0NrsYUb02OOJmEVJqxSazTpGxx9yxO8nF8Nb8Z3TZ/7sB8vXJEyhKmDHf0+txvMvoNlZ2NL
bWWuKsyJw9LTve4kZzTWZ7LwoFhNLxCWj7njc81NIKRUQMG2Gc3EK+zlUuFApKtN7YM7prmHk8WK
AaWCZMtyTZdV4U/P26aIfy7uMYZ2pkEgJQeN28qFh4eoBE/BwFiSGOO/WiD/18K/a/q0psUSvU39
mCAat3AqxCVJaf6GhWSAOe3WJgWox0d9Bmmwn9nJSu3SKRc/6OGYl2Ni8rZmdtdvU1JCY6KwBume
NhGNwCuTHS4TdtIxyz0v4SCear4PHRZyxOme3/3i8VDF/lApWVVqkTfyCUGwYkoBL/3QJhrrQqTN
WNxt54yUQqmC1j9et2cschqED2aCzkRMTPf+ui/3CwyduN1pySjyMpQYk2omWCG3TJWuXNa3Enl6
Wc2hMk8Y1WP76UVJsBhYY50qgtkJBTN3f7PqZvUbXWAQfB/iJ9pP8Q8MVEFmkF0Zap6AnZkwY4wE
RdKlLthZQLsmqANgSYTBZtV4sM2bftfg0siKu/XBmStaysf0vW4OnbFAxyKm9e17sAR0roC3vFnb
/BvHunro+LwdA79ylPGwnMdBhN1oOVxQFYXm+8qvRiAsWNXGpKrYer6DLiQi6cNeDZ9AGgPd3aXp
7gGMo7/ls1yNpORxWH4PSHQc9+X7X01HJakyEdmTPbxrukJMCzh4cZWagPTcz5Fzrgs9ESJZDGPY
BCEFiLPcv1xlachVSfrJxA3QVhcH9YYWadeQI9myKm45SmAJg67ZceFNsVt4PWtVTe/MclNIn44/
IWbN+lMbtVHMY/WhRtwR5aD7K2RqTYzzQWH6s0Lpr9C9XVVYntgrzm7hATjOHTjo6ygWVcl2EREs
/YAZnUhvS8C9HqfKspyMLpLSCgriciIoECoE1GSwRpnIIwTWU9GcOOlej9Sr8uMh80Ttln6fwVLh
qxxZwcgSAMHggbPpj2sgTtZvGYU1IH7/KRGy867Pjmo8sYlNdICmCxZQbztnzDUNWVY57Ly/gbf5
Jx+d6gFvCtiSZXxLB+BcB5va/cg2nzwiYUPlEcjEfI3QD+l+xwvqIPbHwbEWQSioSBuoy3StaMFa
u+5unxtnu01SVYq1mWg7qZpaG7IV0Uu5QAewvyVRcfyqcR/+B7eEYECbclPc36qRsC7bYVIaBcq1
uvKxrj5u7xUVwLOBT+F0pNrGyKQWV24qoU6o6x+pj+KXTWGvIyULn9kwM+yAg68KdqsnO+JBM7pL
7fgCTOQk+L92zkCYKW7XrIoIsbkHi4dbazom8CMKBFL2rNkWfvj/9A/d55kYiTUwCZeK2IxPblYK
oByKFjGiFD/mEnTyhSHiueVTIIuBoTsMi76I2PNRebpVvNfLQXcNhMrcHmYRCeyyoAozqljU7iIC
m144+pjBBMpl5Nz29yW8yWaZHltzEHlNGOXW2syg7rNzWcsfHUqHBGCmyFdbrn43tt7qofBoNOOO
xR+1geFSKkZL3ruIge1PacYnR1wcC+nsF5sTVG19yDu9nBivfV4jULfcYi/RaZWO+GE2iTZcx2qt
uxJqymQMmqG1ujQXJMKy9Px0F5aPt/k50O2qM8DVdz97qI9LeUInmDfKNkaEISfHBd5b4ZZAQPSk
HZ+HgKeIjajfHeSE+MzW1HEGhCXMjSEGfA7ho8rHWHBElbcyCQ/pJxWQolNLPYmskc07AnLuehmd
rUnMBeOYNA7S2nMzV4XWgfDxJ0PThL8GXMEcaCunkRBQoj4FIB4b+ivvasfnVDa0+YK9XYCyUkvE
f7ZWe4ugarjw6oQTmUTvW8j9gHTOrUtkP7ghn/CHq5FualejsQTLPUHanSXqRey5V59t0RnkOto9
o+ReaMCykyes5Bx6r5LOSlTa2EpdwjJoSCptyM0amW/fJpZ9xkyol7HC5ahdmGFmO3DUaBDEqw+U
2QDRnipxXrf9GEeuHOC8UTOwpa+yPi6bSCW+nrg2OvGgm6OEDV88WjRm2Pjz
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
jVJPt7F32VAppS4kF1hbRME5Y+/etiZSkjHIcXAabOa/dLV44RsW0dB8q+jr94CMKZV7TEsltTIt
5q13SkSZoFMkLuAqb/lHvqzRg+7vR+BfsGYRMHEJdInICtZs16v+qizlQLPg1MK0hNC6eZk2JeJe
cq6nAcw8gzVxX0qhQqcXiFeEzl/ADxmJD+jqL9Yl4+KZAwLbYWJDdTNZH0QoOIaNw9fHoQszi+vE
bGmKg/3d5PEt1kuyjKg8tOwOKoxXPHQYb1dL+9pkf877aGGKMO5kakRBQmWW2WUmHzBfsShUGVrz
4cQnsnJQbNodLI3u0R6N9JpKgVCE5AKO49TOHw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
tvesA6ouHB/gxa1fTT5silCjbCSGCmwbHw43y9OYuVlCBPL/2yhd7Evxx15/ltSskS22aaK3skpo
svZX52iVA9FMsiGwjKUvZswY2rTByJy03h/JF5olOEKWJtc/+qcs5frEp+HIDUg030hyQ9YcXJm6
C/mjJseJExb4i3zN0MHAazhM2FWLiOFecnulyfi6xEN4SizG7r+6oahSKTsPz6pvUL30D0rasjq2
IcIspTnnCvljgXaDM7vzbckGjbsC10j2Ia3c//SILvlCAJw8oon6MMX2jegBftpRCKZz1XGE0CtK
Z+OkErN7gZddpWQZ0W2Tq7SWCurKuLhqU6tymA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28992)
`pragma protect data_block
FzPryiRnTpFYT6/w0CSaZ6L75z8dyFK0KBXFFnnZNIc6RaphqQdgX6gLkShOuZubo290uRUwfuc4
9Ufvtml+fBdS0CCkcl4Xnb3mjt/MZw3kUATHOPE8ktFZmaEcewwsfHvnrUaj9iXX7Lvcr8+PirDu
x47+Y2RJcxvmp0kKSRSTC+hFgR0pwC3KTvbmVNipRR+GOKU5GBEoRbSzBt3RUcCvhIvgAuEed64M
8amioXhRXBlLhYUR1VGaIF131ocouILOXNAAhEGwBmt6isiEYvTpI2oTtX1xlH2NA6iFJ9IuWs1H
gXNaQswu7QdZpDhSBkwwTZRJD2n94qY+dvgBDOSX/oAwlR/cwzxT0ArPigVSQItybXqg8TvZen9W
DEkk4kNWlD8Do0c2dmzFjsxRG9+Dt/5Pav01knLcOm7XVvKI37UCZebiy+82ptnXmD0R5DAIqRbE
PxZ1i1eLpy074Ec+XBAiPq1gfqPYNv1rtbg8APNrTLzxPwV03f151WX8KH51dN9idKulXgOx+aBt
7QbWg4+QTtFcD9IVMgw3pI9qSBt63FHtmiMvuRYYIspkVEaLV7I4o5PGy/RAFSR7CQ8Mt3T+LeaA
LKbvVDuhamZ2fSMb6C99YJ4KSHvStenA1HfGtDXfiez+4gP9UjDbixZowqsBw8b19Vi4DdyNrDjx
yLpRqylN+JmqJA+EsdRCMtqBstAsq+sgOTZEF6ZRh4pYIn+WV+ILM7neAVaCO/+CMK4SMp2T13Di
rKCoGCB0JDT4DtdGgMEwP+dj0kgaAnK+vhSUAvCAKegxrXx3CYF/jnx/5m+s+HymOwGWeKdAZy1N
DstmjZcDgfOToiwuSxtzp+ishyfrDYRpDwAqMSUvqdN/kyZYGKdlNmOBo+mqJWAQpC8sAIY44RDv
IAMPwu8vegZTNeHbBDHINvuS8h30+JSYkFyaF0RGZWOdIMkUvN1RuhsooOZsfYLhp6m0bOpC4nf1
rQADIsgfiCbqCsvGamGqd0P6soIP5smq4A/rl2i10cyEdh6mv4Wg1+7jgkQ3H7093KC9nC5PVRWp
dvwoM8LgsHktvyNUXf0fLNvAvhgp4sPD5uegzj9S5A4LL193xS+sM81+/AwCkKKyUJQ1oT4nNds+
PJPSKLiX7xpz+Dt7EKVtgWssvI66X3usVUzSDo1er8kmNghEJAAtsw+7vhnH5l1/wUvW55mIif/f
DI+AQYENcP55DX1Rh5l+eA4+nT+LNEFJWoaeoGg2e34oX79piFEF5Ao0vHYRyNZLYju024vjWG/6
WecDRJ0NFAHLR5f9UEsjXOxgNGBQ6YdLxQtVWwXzTGCY1RGbMXrHyUGxL0wkeQAUrwIpRCPkqp3E
bwRCO5bIYeYTinhsyBDyABKJ9mRUg1wRXbMtl/Wu7IEJ3GIFgSAmjMMsHWs6GJyKyPzK1TjYHDPB
4pt0wtuscUnoaqW70SSbWgkh0eC3IucKjOMAVu1lqSS7fkCB4j5wEsyjYxYzY/8g7TRc+7NeUNUv
4dSUcWUfyYkoNVF8VR6/ZlhULZWH45h8khGotIzRrn0wyvbE+BUR7rb2KlyTaK7vOsnH5yL8v63E
9+a/W7DFmQ1uYJ+dACHNvgttjSrkrFJTSyKRHI2nkRQf8t2/Fsdbh6EEeT+O/fgnzkn0qWHgvSEc
mKUFPin/r5TnIdyl60M7+EhUkcSBTpdLq36FkJ2yZQ4ScVNOaBPlgm7rAIz3kFtDZZiEFRpzlT6t
HrD6RACLh4RP5AbG4Xnnxk9aMy/E1VRb0JDewayzWhb1DPKLXgKRZeRf50LUllgYf2vaoxRmcXSP
LyeZS7EUUIULHb2GdAcMsWpK9Krj/UPPUBDmwUbBN0RX73F6DcPF8cfGdrIRzk4Un6j7FjtF1CHJ
XVGRkMduemkWVAPRM+kaSUXkF81OpciFj7ouyydLgGfYOVCkBdW6hDHR0Wm4YZVAeq+mS/QoTvm0
V4sCk6NPjad6kdg7XgTSdBm4B1dFp0Gbi5Eh5dJRX1QOQMNqekU/0iNDhcYrQvnlTUagM125VblI
WcvsYUiAG9Lf4/cSirfv2OFl0A5qR3NMUnBJJ6gV2wfJeEQ+G3nIgxk87tM8nMVpgThGsxikPux9
Yc7zmRW31d6vdyd4zYeQANSwrLoqcEeYvYLDt+ZoNBKCDrCMp40ilKGGaZcnzRqKCqgtFEoru+a6
q0S40ISbax3MBpeKZieQUym2QEqiIs9414zfj3qTvDKMPeXNwmFMUNLQn/KWo6DjgRmVeQlsRnLG
+8VvWN9Nll+wt25mix9zPbCVRIVfGD+xxs9GpcDiN8z5UFc2hAYISpUsf50Ql5T1eIh3BPbaRy9a
nRqp6XlkzEFr1+h0gct2DLR4Stwqm9j0noMbT8wxK+MXd00X0/RD9gsKOAWllgfmdrXTYiwjt3ZV
mM25D1iK2ahqw2cXxiP1hXCZ94XKk6kG2lRPFRYoHlvHMT69YsFyuytMUDv7Suc5Hetr0AKvOYTg
ug9DNgsG/9CSN00/iPn3W8VLAFRfeA9p8WWZaquWJmYMtWzK6uWRwSMIMJQxQbHye8GlYOlsyyh+
NGijMztfF+VVm2gsocrB8uVbjKo890rfSHO3dnAqrAOipBRC/JU5NjfTzgCp7E7n79R/qgjyuAJ9
bdekYKaZwapWDSLJh7ozqYJg2nWob9g3ZKmPj8TGwMVhp/SaV5b4FxSaXoDPM4BGtk7yTz2R0WUw
44m4TYNXzt4POBAQHfmjWtwX/I1LpYhPsUjsqBzWM2mlanXGXh+2qxa0pWmgWvOctFPNYVb2oT+L
uYdvrPwsgAcXZuq2CWz94JZr13g0cY9UsbtT++IB6YXt5ROCuTTivy7KVI3dndirVl5hPD8bgMru
r2Mr2pTRluv5ocQIsCLTv/iUSDuwDg0ctB/dAdLV06HVqbfWvovZyLEOfN55RNPDqDj/QDJdaVv7
pQSwljnOkbjbg6V86MY3X5CF6koMUT+GJ6/tAbSQaRijRRPVzEg8VU2RbWotdr3kwX+FmlnV1xRk
Kkadm/1AMyrgR3hGoGSk3LXp1rwuyt3OEO7HGsEnjj7Z/+ultq+eOsUjmSI27UnQ3SmsmS8dVHGu
poYJkZ727eU8DEZysHFXyOFm7dKQO56J4j9lCL8xabyN3mnlw/LaHlB1TfrdG13CXOGzPgT5nqVH
ElkRmJBET3Worl8NAdy6eT8IDwhhV8vTomGme464zx7kgDArTwmTag7KO5UTkfOzv3RbpIV1XUgv
U5XteCpC79OXoElUYUCQ1XRxpPHfUngnLSl/e7eP/CSm0It7GlhzuSAZf5FolvPTo7mZ5Lg5Y8NF
ASguODt7wHDs0geHcrcRVr3PMlP3uq2Cld+CkhE3Mh9BeJXjj03WNTKJpOic0UChNb6EyPR1cqI8
dAQVqhDyGzolb1xvjzPW+rimBkCwgJqw4nhojndHjrAL1jwthuEMsM7LQ5+fxS4bho9tve+8WdQR
6lnmA6CJo3EtRHkOPkL5XMONOr53nPC58zVLl3yc+1qGi4A4vD14rJZt98atHdN3r/yoUzYIaEMh
aFLyJBKsuBlmT4t+7EvjAST+cA3yeWpsOx7RAcBAp+jpAy6n6mQRWZ+Ou6sGImcOsDkt8RRpw/HS
mIs9a1uxM3If20HHakrlGYpjQPMG094Sr/AuTEfSOgQV/XWp99MdxJY975TH4YiM2AkwNBHSkxP4
8T6Pm1mIfeobv14iI/cIG1T+AXS8LfVRFXrPf+5S47qFcbouh9pdStqlbL/9U87GfPA3lQDkxwyb
czzqLbvioqs6xg5a86HDzZfPCux+syGjeatjjgqfZXOx2IKCt/oK4+apUbcvyzTYa5Zk9jc41wG3
QHw2lDz86TBYFf9c602FJRbMUTCBzq2HHVvmJMrWs1cOAdBrsf99rDkcJ21FfVggN8HEU/iXBWgr
24BsjfLTeC69NB0DBVK+/6T4CRl1dARUMWJQUkf/4SYIeR/kOdnpQ7cEIs3Ub7mTz06kVjBA2qKp
p4Fe21YFz4zaO6Yd+M/nHAeP0nC0RZpVIbJAjqLtQxfCM6MXsyYlm5DX5cC2MgTZCB/+0q6ZqK6B
1g/NRT00gwt423t+xDh+xVGBo2AxVWINBOXiXMFoA6VLMg3Tb/f7+Gg/rpzx0uBhZWhNYTGBfBiX
c7GhoYk0wiV42vM7E4wSGRGlmIinyf6eMBfSAl4N4S1C4ZEkf0bQ9AKU9VzpAyUW7yUxF3g6Qo+D
wKnTnATmg2bkA357HZmcQPs/n4XU4OjWVaFSkJWxONTZqxCr5PifZuDqYy0CNHrbjs8r+jSsUXkp
OHEWiB36SGcgEEwXr41gqdfIIDT0AsYjUm7sKC2DG4ig0ruYSsWMoy0gAiRrJ7HKicSftwE1uxZn
40YG1Y/cdh9oES1Kr8eUDR7jTIN2v8CdmwobAdaze0+KJu+xkLXhlXfw9ialga/NIW1jwvwfY8jl
gumZKQqgiUrjDfTLqo6bAvS4IZSdW7S5Gw4hQT2kd+SgGQqhLAfzxGGzuWlMLycEvOxbTs/ZYOV8
nfLmXLCS8M4vqb7J+CdFIRSXITJErHC2C34lMwZjfsXBhpF30JA4KF0jObspZBJtM5/l+M/5eK2n
/cyLRO3T2LmpUo5WYRsnMK7hrtztuu7q3DI5yzWGcWUuV8SP+hvOIP3+6v3xeyrWSJJWyZ5UBOCn
ZKhHKXY2Q6k+wSO1vvIuXb1Jwbes618uDz0e5OmP9XJPxKN5OxdGI4gSus3V+C0pLb9xiYwt/DKS
ZGWZz3RDXZoIztI0rLXQqCVV0fHvd6030Ixo9nYW4l8JaW+OWRvOhzIxULdYs7CfH/t/d8/IUhsS
tV/jGYe9IoEWu4JY8desQabbl8C3Qile5Z9JnEsCyyoAcpGHPLf/lDtq9KqpQVW2CH7WXS1l/uxN
Jszhh8Ln9dy84Gi1AedYx+5QTNT7M7DnWqwj3V5wtLHIjyzEOSiMijAtprpQcW9ytfqrb0PrEPlh
1VUcwzHV4Mc3UJf+Eh8XdeA2jUKLsWFbw5SXwAldgVKkfMo1z9WmK3PiBNaZ307oekUO2K+QRqck
ta7z7mvetYCwETARAqrLtN9VC5Kzpv5hJnPVMpUCaSsWr7yTy4itpg2180ayTSdNq6CCUaoLFiw0
tq77r47JxlIiCpTnZ4yzvhJIoHY59cSudf+5dDSWTPH3lm+uJ6AVt5OIhocGc6oaE/MoK6biEoHa
gadhGBIP6QjmJGOFPkAvajdE9rysn1ctpguuuvyI/dSUKYC72uf45rZhSnGbjUCUMpkv2FwdNY5N
UkXp2ddnsrXpeZ/3QIT4eX5/eMjMTVvqyw3U9MOmfU41pw0UDZg1iFLqVEAC0QTPUQz0cD0e+JDw
pw4kocoKYIS2QsAItFiFcjGyEm5P1n/1MYGrvbFm6Ksqhjf0eBTJl19aJMHpXeAXA+GtBosPXAPe
ts604BZGW0ksfkMdC/e+0a1PQANvxQbZCsIUde9EthfSCtuhmeVOz3juiZPhcpQp7k3M1wbPaySC
BuHMA8JAAkHNQJ4HTstg4iW2QFBF8sA502DsxG8H+FLrF7Ovpzajx0IvduUrpS1C4eWRF8fs719W
tSX+GdQffXM59lvFDY6UDGKjTrRa00IFx1SI8eJ8enGyzQDz70gff/gsW42Pwm7tSmQlemyF3/wu
ApHVIuB3amQOFaBNNYwYY+kug/DrGh01PmjSTK9M6Ukd3K7R/rKxIa0tNkgOG5WQPLD9NZ3kC2Fc
G+ihlxKOCRb6Fx+xCl/hZIbfSRT5l9JAAKIfGvK8X4u4ee+KZ/JzTw3UFwSTgKaEWbY4zPQgJKeu
qPv99GUHTEbd1R+lVITYq3bG/P8FXqCXgOIncVKceT9jXshTUMDcSHIKPqqdLus9PoL7OtUiXtUM
4FBvgSZbcDgcRsoRpZpJWw9RU/B7Q6ACzBTI5yfXoCJOagC968QTEFq1tfpx7F6JIirIsyZUTWDo
HQ4g6qo8GPkb7qoZmPpndc4ogyvpfb94R5epu8z978vSxMz1kamO+vInh2NhJKAH5wt8/yyDW8+Y
bnQFMzBTUDDZCa/VKRRbYCFZWUQiJpFAym+++7f9+eOBd7ThiIXUc3rCDoow9TGjLhM/kZL0Rh1G
ri9+tWPfUaL/4pgyHxseFIrHZXbYda6Zl2oBI7sNr5AyOYuRdqBxcqsSYX+Wu4U9sHp46Mwk3vAF
XkkEHPkWSeRg9uxXeJDdUFqvSF1yFA80+tNFUZTsvPinQ7+ZII8RVIC3hPJqC/XaK4Oqpw5BZw9l
E/xo7EybV2cAuTo6hMCYuaNcetHHLwsGM8VVkUMMKku+vMmuDZliWXaitZ2qtNaG1WYnxJ3tspbB
NusoLO4BpUSisUf7o68/nuMYjiVuumk8aCV8lQIgDyuh+ZAca4HnSSmZJCG4ykfPgZ07ehN6TbNq
qrW3tu/uMc3yQ511yaY41/7qnHSbALU9D7rkGDUFhLdVH2mwiJB44qph/qOdIoOUNuZ/hA2r7uRo
TfXeCXJMQEDZYwr6Eeeu66N2lKN/YNHksCBYLc9EDXjmiJD6Rw7Wj7+XNd0vDt802p0ffm8TjTAD
qHZbkNhwcpuGxBvCD3ffnUcwHBmQ/205gkdThNzaH/YyZewtq6LIc3Twh4hslUD098QGyUA7UPqW
ozKg/bGkSSB9hS3vSgzvZF7iloqpz4i4eqICRieBNWH7xHjMws5DETh+ZLyRCZITD5y1CtRaABrL
MM12EzdPP6XyzcA+Vh6AfkloFomhnnIWq+Z9G7cnsjs1nkpvYbY9ia02pncvQTBB2b2YT5+aESmK
duO0s+F2lyW0vXisGmLYLZLtev4DvnNIBElXOTB+n2pk2wjzd2Iy0Nj4WhaMcIQsxaqUG6sTK5Mu
ELXKCIsTiSYoDc6xe6znOzpmJiPA18QIGmjJ2j4SGnBFuJ7hbhXndAqoifAN6fWjf65vjAAHL2gQ
/BWNJ47HxFENUcVcS4KHWKbm0d65cQwOPSLGGaUHmAoQpimJwjaX4rZ1pQI5jtBjGNySoxqPOk0M
vs5gZyWajL2QHoNh7J1fxWgis1g38xyH1jTdVx3wp63Dsp9Vru2rJ9dL2FapA7PD0WV4IHbE8b6j
01nssbBmvA3fEKrang5UitypKOInJeLoqRtFdHGr4omGgci634Q4N8G7dTpx0Gcl7UOo2SNU+nqJ
E33ALDuRG0hNmOaLvI6kfRcodBt0PpCH4v2MTpWnDJa9FDJV3o8YrtUUL3vqu7y2twNMuDOS8X3c
+i8GbrZ83GhbP5iQm4ssxZZgGbXeyFFfAzF8trYcbXrLnErrvvvjFkOPpOLwBk+IT0Opu7mzGktV
5uzKWFTCHbazyHLZVF8iKpEC2FJqxdfD4qBbhDqTHrqpDC7rXQCyKnfQKTxGvMK6rUh5E6A9Pboy
Jcptc2j4iWE9PX2On0FR/QKsHdkl2JdO+tlMzb+50kygMv9n0zGVbUXqqSX3Afdk1Z8JbtwLiC3B
ykL7amZaRZKYYIu/ULQ6rUTX2eRKfqhRW6o//zTjifH0KhpDFAotxZLchayHk8tWHKl6gkFSmSS/
ADswxqmkuzrk5Zyb2ZxmBdyavZCugYKbNye9QhffVls7BcR2Mw25ZIUmsf+xACn3CL0EjJLiljQi
Uo4mLsc6Abq6lnNKN28BlpOEId3cvxm8jEJQ9CNlNaVTHfXza7p/c4R8zTm0K7xQA9P8cHW3igB3
6V3rxSppxy24r7Jfwh6YH+/fHXXKBnf4Dz6rJHW8X8TJvG8iZ+DHnczSbZ76TnHmleUtIGSIZTW6
UY7tip6XB9mKrp69pzNH9KE/UU/vBOJqgyyqDDVtWWKRnRj/CVYAo+s7Lg3KAl1Q7gZxAEJ0b0m9
4Vf70KuyU885NVxHXvP494bfERRg8bNgs6fsn3ghi2UQj9rPwGE2Ah5lni2VNh0ToyWOuPryvuEY
Eh1X5jaz047yiPNyBYGSSwt7fjgR/O72gc/VRBD3JXcxtkPMmVHgNW7vPjvRlwhAIYr60jSDi4Y0
aOoG4tBVjtbGv5aSttnJDBUPJ8LF+dP182t9dDH10sOcKOZ6DtWucY8IUiksTWyHAO660jWsOdNh
5fkfiO6BGxMTsWG4rfDTzEf5jsZbvgGO9bNraKS2FgpdRcAd531VZOLjhPbDpv6CUltbuKIfvtxL
Iamvsr0fLHdeZ2E+TNatSTIpwDceTc6dlk1RlOsXVyC3MKAoQCMiSx1BjVFoko3i/tR4ZOBFu7Y2
J4EgFY+eptkONXxGr4eRZGTuXHoKDvqTsyPmTkkEBxS816uG8kWlOuwzvTbyDy9fK0OLDyvpaAzZ
AE8ivETWGFT9vnW0TZScF/L0d6Ci/LTZb7nAW/1NhkIIQo1JNb4y71B4zDUEZn/p+FFSUa7M0/jJ
8mvjUZeuo7Bbg7nViTSBVBpUazV89kikR98W+ZkCZmRf4PFQxRU6kYB2q2EJ1BCjnFz8iv03/dl0
PKbRpiOc+rswYQRqc4FhPPnO6B+2qzbJOeCKAs+zDTr7MLi0U0Egk+EaFiZf09osQAKWKlPPMWCP
pwgC52b8afohob1GwpMBNfumT2D+qoEelTSWLySpJqEwqwfrTU5B0dyyLk3HPFEmlQu4MKO46lLb
aZBkju9XiuJXAWElSDl7aO3RVjySyVIkcAqUwl7u0DUv4yvrS/JTcdeNvL8NLo/HqYt+kaGo3h7E
6mUHQy+LGvmGGe5bQAzJk6rj1uxDns3z+fGQL0kuqgZ+5YHsnEBNq8CFdUjMahfk2/Dyrkwn6nF1
ziNL9vePZibX1BwNT8hWNssVL+3F3ZFcqFZrbBMoCXp62yldpDLSB+D1l7YSB52TxiEPVs7vnywa
3eNkmPsag/dnXjYTp2HB5gTuo9F/Q9FNITt0n32LcYyfEi/OPpsCFbUgbCV8TxXnadc4k85YsopV
gtjDvZZBT0qqBe87EJqVQLFQ7ZxuFBvp/YNhfTqkYrrVjWPgptGIaQ6gW+z0r4dJqj9GcoaLIxSa
1e0ijjHwtElZSwGG2FbhFDRahVUnQga6UCZoYshW6o4dWPM6bJMpX2UEl5U+5OTA2UzNT0rDh47G
KkNuBIOzD/22o4N9nl+HqEZvpTu/2BXr2lS1/0ixIbKBeNgZQ7n/Cz+ShHicycbpeb6p+HdfVmYD
KjU4cYsmijUXnaBDKbWp1F0EFo6FKkbRuxdDfro8TDU1711XC6XsB152m5UJrQ+hT0pb9kNhZERL
wpcCS3y7Twh+BQ/8mheGKxG07S02A7phI/uN87GrCi2UuaVqLt4mGUHRY+4hiHJi5qWC7+YZEJH0
RuweuIZ3r8Cm/jtZeCEMrD6SjMAN3R0FCrnyuJPtsWOdDU5SPscI4+c+iRC+0IRvXB0j10TK+JjL
poJyBhzm5dzXxiwWoUO8/5M5xymA1cJPjNoM3MDbe7uh1//BDMnG3n3AzMlUcuDxTuss6DITD5DR
1ypeAvUUfqwz+KuQbGh2Pwxs2rVclGnBV8q69fzxqkbTuXjxwh/iNAZbPGnj6+MZWkSJyVuQ1COu
QAKVA8AT3O9zaxSiKmom4T82T57JJtqjS7/dAi+k61LLc82lCtKxiiW700CyKaptMNV63wW2ZlIH
fhsXqORZlvC+w/CuAxTnmGKnJU9wcjvaGeOTZBmnKJId5kMAxM1L9RznfeG/C4fJ8964kt5/pbHV
NPXCRuWGcHKIjBqwnw/Jt+Hx98Ob9u4FSmwPp4AUEVo5dsepx/wfvJNrHLIqWJ3rBjW3dYlM2KRb
D5VuUJLS0TPtm9Z5L6oA72tIBYwjIfqIju4fpnKJpqAF4aFkCvhJ2lMi3Qh4jXEA0EjUVYPiCFnM
xERpRSg5MK2plRaZBhV8gApcWVwiBrfLs1ertIRWiiL9dIVcyhpYSPdUsMgX60CicGCSitlTr9Fb
CkcUqeIwdc1MeEFLTDGamVOALxQBwE9FUbbNdpzASQGqFC1jzj2O1DlifrL6dv0SM6xoGp2EVQNH
3v2RZ1HaIhPfMcQYN8iPlu75TV1nKSNup7rZk1oW9FiNpVAK5nXo3dG7zWQnklxPKItaRnmJ7PVG
r2HCXfPqNatQBxZsdzcsnhYN1rFvNJGEwOwaj9rGyvFDQ9hGNoDUWIbSs2h2sMdXGDaIZGn5lqgq
bPr2B3w3LvQ1PeWS60EWWNIk1oxBmW4uxNFErW2hzg0pRzLggrcjUACT1NiTkxmgAMgZ8e24J2XA
n+wdcyBvXuogIfIS9c6FID4P1hXQdjIy+1kJVQ+RX0qC4ymn+gquYauVLwJZbSmU46NCELWIyBQZ
E+PbGml2ps4vmBpNeA06ecwBKuDl+VnEW09SIN0lMU+wYFlBDGt9p9pCJCEcnNsKNV/Md2sMnK1s
BusCSWhCcDVYDA9rtt1ftIv8b6HP20LDXlbhPpiF9aUXIrwnVsCRmoSPYHAmyJn8C/Cs+T3fVQW7
bo+e8WMIPXUxTV/bXCLo+s4iFQEfVga7y+R0uvlWz9A/NVBd6vyTJCg61m2N/m74D49P1hDNyPxB
sPfHSgUBOTZvHSmUuGGDXOYKF0tEq+b/I/YU9E0hEsvyceV+D9EnAggK0+9FT2/r7ONS1PQAVZcf
mt08LetM9DVUDOLSIwbUA2+JQFl++cCe2ZtuwxooWYBhw98q6rcUbpJM8HEiuX1zr1MBwk3KYkuA
pMOrX/7vB3TbjvFg674LawjPoZKwYi3th1cjyL8VMqVDWCk0shcMUn7zY+1oUYdEyScetzTABBtt
LEmbrZ0SBNBLffU3VZ3pIXSWDm0oa7I7PWx/1sIkSTi69F1pZ3Ws+kwuZtLjeH4ChjWammmHRo+g
Czrr2JzMNztRVFPiDfnLDnJpjc7hQI5zNWrD1FCjIMy1xrXgXIRCz4plER6O5xsmpC0w5S8wd3TM
8z39ZcOa2TWwfDNFw3wQ7uOfXPfRkDsoE1jjH5y+yQmPiGduZqeQIZZmWU6GYwsTzlBy4e4jfWtE
AJPvBEqk6gr9wriEMBzQj9sLOmBsqKxJn0Ujx6fEmIM0W620hGuhSILmAyNoggN0tGqPouwyu7As
EI6pTDGlD+3PCPC9bh3gvFz/OMhcJtpZO7ltNOToQScchEqAnVzxz4b8onAU/0tXncz7XsEkaYKj
IxLg7+/RRFot6tyhdxROwPARQIbJMXcGOp7te+KbWkVldyeleCPiRf/T2gu64/8NdRn2JgkrjmtA
2+iZ2XAw07jQ4Pfe/0b0XUBD0ZEntdtsvpCwbbpiacZ4rn2IbXbA/hetY9zT9yNDKJ6hKdvPvA12
Wr28DSKeMUYqQhlXERpdxAjpCIdqUqj7eGfrJNEXNBoVO3LyeGb83Jnm0pO80MHkFLyomUtnZ2ev
+VbSXc6yEYivz5xvOsGpqjgKDwL1p35PLsYTmlJeCMhPhFeG9iQYYqFd76fj6id6jY4fljGbOTv8
xjqynEAdDFNiWTqH1PTG6Hi/betNoVHBd0IPpBSHcHdQNXH8FurZmuU+vAl1rP2KbJbmjAJlMYt7
OOoD4v3NdDhCoRW5duasEFTN8Y8cBZx08eQuz3kWVCzStAN/HK0CPgpq7YN10A6X3BoUnqOTrZwz
5kAwyz4sh/Qqv+CX5kTXx23Lvk1Tyx7mJ6DDDXvokvf2tZApahDun+cjUwjQkZ7fqPFk0cCCfaAe
b/sYepzDPiHUSk3d1+4qAhnlZmtssnjYDd6+5UiBpsTDPjQ1bomYdnaEKm7ESWfW0Dx8n5LRonD8
1UHmgoq74s33dOjmdo4uRUpRThaihTmhzd319cYtsooGwHcoqA9lqaTylnzqatkDgaXJJECIsvDz
yKnn0ArWKThWK5h1f73b+VRIK8lMvJxG4FIJcLQTE0Uvg/rc06LgpO8TM0/RsgOh1SExD4WE2sci
+se63RetCoFkM+R/8jh2uzPs3sMEWwVw0ysztOUSfMuyZwOnAIuUzLwNGQEnjUrjfAM3LbnmdZCD
5HRDhFr3U3aaImUCR/RP04kHyY/JDOE4/3EdtOyF0CZkLRi3kzcxOCnImlOiDpMa0OjeB/PuyKjK
BEhkqIkdRm+fPZy8B2Vo3jDXEvLhvhJDxtoHUjulNuTKaCrDEUXI07PjTTg7mJ++7u9JNQfMeUMH
0WvX/aQ5D+1vT2RMZbo7omW4/fbgltmvBrIk3YBVPu6In/Focth4WEP7/8omxqOoljN8zZPc2N1G
4leLlipZSRFZfnR0/koZOZGgxE4tF1Nx3CD6HKNaApfazrPxGHe84bQBaq4xyVWqB2K1Zhdymqfr
fGABFuhbmxg5UfhZjcmDrPpJmbFkDAtoknUtXhC9Zrfi/lwUPLOra0boWu+BhWBkV2Sca7V/AMk9
oAFBJZN+BR3JAQmSeUZyJrugU1Xk4b1u5yOmsMVGDMfoq6LUSJYTAHVZLM+a61VK+PIT046IeLkS
ItfUwkA+bCh926S58u/MMtFhDuB8qbtlMMbuCbhDB/i0fcLU5bP6DZiCrJYlaPExAvcTWMstGJ+L
YrVAyeBKr7sMEdjatA4qO6a7r07LUDiNupzJD4AHrA8t/cXo8l8Hi7WfKxpnVkce6jP7dBRgLeM/
xOgUmQ6VJPmEYkEEwL12DzD+F4jFVOB7mi3rYeGWlJ5J9lPoQbWfm+Ui0OzfC8wkO/WvkM6pMgFb
Qy/9fAxXthsckeNWjpokIzkgtCeEN14cDNLHfE1DfhzquOxFFDuGfOMprsW7XY9jF3LKtSu3SMG2
iF7kvjv8z9AtdkWjyDHZYam9nhuSR6HAtkOWxOnEQiFIt5i46uZ0cgEmHyZKxxCRxloBtnNWFnKw
reJxn0tNr09vlyrnRAlmA5hzSb/U+lC46tZ3/o1CQFZrFsnOYNsoh7rf2/JJAlLg7+mZAvPISdPk
lElOrqgqCWXTkZU2bibZ6U3JmNyBaF7Yy29pe5W7xuDpcYkaiqxkzKP6BMJGgGG8kcOq20yhRMaC
4s8d8awRmZgrKfS5I+3bpws2WGz5bNOMygnorNdNKYfzD+B6zoA8OzgU67ZT90eZeFj1ZzYExV1c
qaxz9mBaXs1hSXJMdQza1w8KUotmZjyhtGv41K/1yGF+I4WKS488cAq60JZIV/FRrUFdKqDl11uu
98y5+xa3W2lx6XrPUKXbZYYxg3D1ySYvOa9qGQ6KRBOEXJbRxXAqR23076iZJPOS4lQUiLGT+ZXP
ZbVGEh0AGnPk06tpttjdJw3Mk8we/BWmTRzO52LJbGBUvWPOde1NOwyxO2pDziiBrJ5zw1+WvQzd
W4/D+1Xpslcg6T4ideIYvnslXTekTUXWqAVr6zRFZOIs+BtuxpePDQiVm5NqkKFOHnefPMUgh6Sd
OnvIyeQgIKapuj7fxxjNr4pEQ9AevEzMhyf5LT5VnCx6H4qAxiYmboCwzz3lK7froF2ThTA4gwT7
WyIkFggBmGop9321dCxFXPYmu1Iz4SNBH1xtEA4BTACgoP4sLqsYC+x0Uub+i9MqMOnW9ckPDxcJ
SobimaayZ7wKrewOkJ5wRq7Y7Mw83lVcuLfYZs5/cqouPISHre4h+G+ebR8VIW58orMdePbE4cn+
A44fHuwOD8PaeekhtyUJIQxGpTbFM0/jbRtbZL0aRY4GSXN70hozxs9L074PaPOmSRfMYkqXsnvr
cW982VUUxNsQlLF5XCSga/bKboEVQG5Mon3ldfu8lcba7OuiSi5yUCin386jopHtami/kZIWsGQ4
80yLNCBOwFmlSZXtt3taeYLcYho2lXL4ES3hzsjmsmO8QCEWNG0VEiu3gbXgX1V0fzm8cqqEzuZk
ZJElH1qClEASeBE1cw6FgcuI3+LRPPQgm63VRH1/Vjp+WJTXpwvfu0oszAPEjc9xfoYOStQozbOq
PwYej8MzatFnvQ0mhHfAKaall5DJo3mfnu7jCT+noARuVrgkVSL94dn+UJo4bgaAefZMKab8GGDI
+iTkIekT6qMiaCRN7NmrpHOaMM17xF+M4rTiZpebyTMuns+8NR1Zefwo46oM7Mll1iVjipPbycso
LG9a4rpa1CBzi+ph48npmuGWDmfLf7eDYWvdsxeYHJzSMfhRN80pV6hi2GQ4HhyQfrVyU0nqpLKK
31zAPjMgj3MHUYMg2/dyetPajuYGP9THru4gpkqG0xhDa9UTsgwIVJcb5l4mtyLcQYpBkxRtdoWc
s0fkXsDs0hVp7meog/MiMlFUr9yvRtpR0rt2c7oudlOvqs1xHJLRxHxBgsoy415+g77jxmlLLTBA
9iiIW8x3xNajOBGUUEaRKwAH47kaZvHo92KLGJsbVnXh0wecYdhmLuQNwtNjKTy7ON68Gix/cQg5
UIxZWYTAqaVqv8seusQwQPZHr4xFG9fDOQENMHAyXy4mjIL80KnBBlkGJk9QKusUDEGM6+1Necrv
jNQPWfLtmtwUyZIpJMyKBDJ0g1RgwbmsmRWjTAng/C1mIk+Bi60U6XapgeEdLv2bNcrbCjMKFBbE
6ihPNgCfJQncM5YxPBcUGzzE6bcLx37A9bhIma7HMrNrhSZmiWl134ddyE8v+PnZdez0FJVdqdvn
6y1I729z6oD1wC4dwpMqCZR2QC+c2ccGkB2sM2c5i/VfeSIrnPgNKxxKR6yV0Ew2OSH+cF55V6q+
a/4tVuf5H74jFALv6AbYf5/CRtYbIxVtrfvex9hiTq0PHq/oI7Efo3bojTAh8n7uT13Tf7eA3myq
fBY69DBbA7B6TNfqyhhplLUwT94VnM0nzvWU4mt4mbxDLeydrsY+Vp53cpS+KLwtF6D6suazUhrD
HpCYVDBXap2hrCumjmkqzXUBoJOSM/7GWIfEy5niJyiuw3ydMSLjub7usig9/Vkom8EBgaF28fQN
7vGJaQIMcfIrBt9AldwWSpeAibADZS4uZ/lHu0lTam1mr/vJVyppCf4i5aCrKtpyCF4SVeKrzlZT
OHCEc8UQ6yqqsZ0vpYiwZYhoR8Hw4GHG6CPy7Q39Nq+LRH5fbFJ7D+dk11f8IMbscbys4Ca47QGI
PTNzjRme7X1z1cZUcsrCP8TwF44xzz430kGMY5MIY82GBNsSO/XxVgUlss3WHDFqcNc2fa1JwXFM
S/3W2NvWJDqy364XbzK+u9ew1oStyUNCYlx1X2itFmpPOeUHoYJf4N9xvgSATziejiN70J6oU/Mh
NuGk+CoCqescrMTY5w0HUoCglvE+hFVZ7Eq5IOy5bYsfq7u8SO5viYmG9TuRm6ed+lBcsz3bEf+q
j8khAzPTmdbSMocW8ngaFBMxNZeYytnLqltq8fwtMZP6fGkKm543kgs66LZSWdCC3cXL3Onr074n
TzqhP8E1Y+9iqyhmTZupT41XPcT+/sB8fNabNDVwWkFlSYMskCeLYT3ZxwaMFJcZlSLTRUAZx7Md
qsaEZIabCYt0PpSOG8n2+PjqMEN/KwFzc1iP+RnAkGNJzfDjRXUvsNI7aYBFM9CBKf38YDQQwjcR
dZshuqDLSNvSYAoi16I8D4cv8Y5VBBjPwJpN+0B+1Su+zJOUfMswGCgxoGJbAm+QDLNWMC/Vdb1Y
J0NNzkwdcQ8m4V52BH25xi+EWUWoW9h2tAKakXER3nOFPuq1/VlwzF0pm/brghSmCRSA+zKs4dYd
evVJ9t7zvwxBqQCH2rVw2Hyj0JsvQ2M8wRGTPjmk/XdgJ5i9JekKyUT7NegKG+VEgD7aG1RazZu4
WbZwX2QraXWeFKj5rsYNMnnwVfoquGhT9B3RjNkUZ3prWbK0iM+35OUYby7cK1/9d9ICjJwtuhRU
MVXIDqFFy9guaZv266RJCivTnMwpFZoDnaLFEOg7Us+YqvY+QaeaVuhx3XG9h7z1GSwRhRY9/usP
ZgYhmVUL0AgjdJ/4eL+TxffmkOiZF0HXeIEDVy7ZGg/Z4VeyPknrDa8v5us4zEjc+/0ZyteoRiH9
LSAEya+gn4Fyw9KwMLrkhvhgXbZtBJOKbSR/7I9fsVZKKiTiatQiskr4GHgM8STGCRWxjStueZsb
0UdbA3InQiGDtNqo2kpIa2byo3296w3n+f3Aikq7TJeMFxB62C330QK+drhuI1ysJZOVEbBQJUk8
qCG8eI70QYEasrRhjmLKwEVTF1Mvoj1uHOMIR8PZcE+bhcziOJY2IKVV1SRygfrQaO5Rr4sH+GMb
mw4V88B9iPPy2UbkaeKqiCCjy/fSsNwtuowPFdf/XTFdORH9UNYaWjfMaxoC2+sgJkFFguKch8Du
KHwoH+dUijdojDv8Qfl5o+g67iMMoX0ctzgDSLmcA9D9/sXxuzKbT1+ecRnPfinB2PGpBVMD4QNd
YDY45uQA+W/xUUlxKFGdwRwUq4NtAUVo5UvmGePOq0miFITmlla0kV+Z7y2vnXkeL5N29KKvtIxe
mO+sGy9QhmNp64mlvtBdJkjTkMf14GMXSjxa7Q6UU34PyIY2wSD7CjTLzOvXXh4MSMte0Jwt3+LS
MIKlYOU6XQdsHCrtKr8r8Cx/K0h2eNpW0pnntZG1LvuD81FbnpK/r+zSZgJQrZQJvJTrnZF8jtIZ
ZZ3oDsQg7zCzrRqGwY9JW+iN0zqQ7a4rYB6J3GBaY68dyY4gNUKRMzKuwIFSaBCyksDajV4OpCdS
0rzmyib6WPDqagjpEhMXgqcfAA3TBU8tc41nTZ5n4jmj7W8sNWjAwqdRKsoJ/winiXOGr4W2xj6o
AliWJDCKTS5Lmfow9/vvkvyTUQ3ijsYbILCkhGj1JJrCVlc7k9WosebjtqqR/Q3YPXc5KkzXU/yR
fS7gzkgDFsslj2c2r7Otm00+7wD5V3qS/HmqbDW3M8d4GFggQ1T/ApvJmG1trlZ8g2o1cAFfiTDi
6uI4d4NFWS+Mta1OeUD+T2vHXxBbKjaCv+s4XrWM8c93TCtzkxYuRx/Q49S+hrHjqKKZhthP05zp
jnhrQq9oe38Du5ZCyEAugDuRhC1SjiXiIo6LgMdq8WwHlzSznkv1m9aXJHV8yyDUfBkJ9zAStfi4
GzUxzflewaSw3FfN2VDz3F1nQbvhNmfyspd1kxpP6hFj6HZrFCz29cWmE3JcuRP0ZiOzSJGDxEyB
f3wmtbM03xOHBGVNsGJr6NwhpcqIUgFfj1VlAQcNpk8L2lm4sUkL3l0wuq5tlxhJKpWANPrbGoUn
k/FOXdqWEgS2rgvCCbJ/sP1M7A/ScPV45UtD1tEQMAflnZ/dM8wWInKZhZS4Tln+Cl82jADoho4m
xpKdevtKnF2e6QcxLo5WBpbapz6h4dqI8OTuzRbBIKBPKMnGJ++voxcF2kwpR7/btWShbo7q6ziy
LeZlfUFTlpnJddqwpU8XDgRClRojugZvpmwmwnNaccqPRhdtrDmUYyiZ48cPEviuSblbjucQOo84
dDj5MaaI9TshNRctumYph5NqRUrY0Ui9lybF/haGAbuie3YQYMnMjpwDI5HZOxhCxQTkG/LB8Gtf
pyE87HRFLEfr8z8sbGc/Kb20Sc6HhFehTUIHp65juITh7CPEy9B8vLhfsJeopvu0xz3bW6MxAOkp
NAybHYkk3yf/VrtrubbJ9GZep4N9m/GyMJUX5CprYial83kv0aoW/OWb+aDwmMuBDQfcgyUYSpad
DnphV4Kdk402d9xtweW9kZVgCwiqM1Qx4FzveIFyVzdelgRCQHvTq9QOregbwlozIKxeilzLu3qd
m4LKAEOpoMpX2iQzdZPJkTVsZ1NI53wqlYX0ZC1gufjSKcteYOBPcO14Y1uh9tqcblnY4H1ECmUw
v0f93m0J9UuIspIus+hH9BY32uFW3YP5TQa/ZyM+A99YhJbCjj7mN6NXMNuAhExGf++er/h+XhoT
zvpFE4xdGmuDw9YYqnucA6/PCIwGQN0AA9ZRRWQgBt7EqSqb7f0HV6AaTM9i02/0nVUYr1lUgSR/
3dH2dV/9zzTaQHPiDNimxF2Twyz86njW94OK0ALq6tn9h16W1UmmZYDcYnOYYIEDsAfV7/mJwKgF
LbgV0pPStHWEhdLi0yFmGYlGs+a1U2yuI1aZZPIKhhO43eFc5zlOdRw3h2VD66x2vGO5YTiPqT00
F3bzm5Zya8rYPd948MPveo3rxhQzU7/ZGXvjzJFpYyiS6vuEV1S9diEv/U9Aa+Bw8LZVz6d+X/qx
1VsRR/An4um5x7t/Z0+B/T0wAUE1q+l7prO1rD2Tp0UGvy2gTi+4+owXEm+4xYyMZsGCcqKvOO1m
e4Q+/OmSm0ClHjisGJB75jKWaB1Ca+meqghQ2rEa2ufcP9x8x36crVSBLsLshOPMn2nhxUICB5Rr
WyUlQnAXoSgGpKeATBfPA/D0S2D/0kqn8oXoyCxRFoFS9Qy+nAExgyN2/XTEL/+ZYbCBI2Z0Zmx4
6X71qWcIy6QYBUVO6YYwbT9DLPiV0IWd24p1w66RF/VOKxtsdblBJnongnE2pu7MrB5sAd9LsQ2x
6fnYyZNTHam9b4JcBSRB9QoDKbuBZsEj858px0yzg45bT6kJt1W8fXTS8wka/NMLurq5gK/PyHp1
bt6zVcUFx93yEIx4vnER+PX3so+s9H+Ohs1mqGUwb92yKYA4DydDo3EIJbCPTjmJemr2DKs3HyWH
eGC6CeOPmklZElgg8heqzl8RbYhXTfrp4GfeTUxygwKSrA9YfDJGWRbXNEm66wxu9dotBSVeUh1L
/Q+l0dhLmhoGAXfuareCotOEDSpQuKlWYMV1AX4aNzSDNNu8X/fjD4NQTMCsmQL/sH5jPJXtMyZZ
szEVWM2A/wq2khYjzlj+6vJ28/3MH0Nw77vPeaBuVIg4JyFHhyKJVvKckRM/XVainyBnY8jCmCt7
1GbTi5hRzvlURp9geG5xyoJr8a6iFbR4BREdTitL8x8U2WFKuwTwvdLyIhRZVYuG94V1Lear5OtM
GIQnvdYT1FQ6beTfrtX6gjYrSnsJ2hgvkh+6YKdIGlelt53j+Xf5o9MZepFMbY6uxefghTuTx90A
uSB3331GBYnmMFGhSkxgEq5SBP2YIy5EVTLAfTlKPox8z8MxsNo9M2JuKrz3E9+bP+qx0CdwZVnI
v2+6su+rW6di7VU1tkurE3JSRWAEWAm12SBcitcwEF4Nsgv+6r3r5LzLeKL4yOv+fvhuf870SGRH
DjW0xJoGPE6fHUqcTHtE05qgPbHl5ITeB0v2nOHXNWIqLaV7OjIDsztem767uinG0A7ngauil1mn
F46IF/Q5PsiQCwLil8U//B61NF9S8a8wTEvEf+IYO1q4ol1I+RNiPTvpvno8JBRwyV7Mv3aeQ52w
DP0ClEqVqLGJ7V87bYgXBhtknwpBTOK3TDP+G1FQA/TxxDPbBUgqkgFukxXnAbscOb9z872vorap
csXsUc4f7a0EI5TKgtnevYSLQSoqRmZqc6YYd0uPuNj9+FNT/vtwK1brxWOIxWpts/m34QZAPxgs
uxagvDP0vHJAQ/0m3Q38CXoDNyQcBOwWeyWIVRI3otaFBKw9HmGZGpAcLLIKNpxBHacpqs+owhK7
tDYLc4SH4/1F3tBX29hqaKf/Hl/AdRWCxOQSwS4THRBsBFJEfS9cUPBI4sK1aIkbFPUmzTJ8DvXZ
zDu8B/ikfy1POw0HDxfjlc8y/65JPyeI3XfDu25d+clemfQ9NwYn7sbAcSqFsYof2rErpRm0hynU
KCv4iJGCTJie9MqvLL+jaxcNpmJV3ncNGMllr+Jcgvuja9BUBqYtW+SAxCe/K6KNCPMtf4oif3la
/+KLtQCge6Yd38QewatRI9FvaIVq+sZTBB4abYR2GvRZImFwGPP3XihjZ9KWd8gI16R41TCC1Rqv
q9hm0LvtexbMJEZ4e7EHvUVEEf6efqu+BEFPE/dR0eN2b+977oRru9J5Q/EIwpM9cnuXj4I7aTXb
Ib+PbVDSoxxedUdxVyZx6HyJGWB1VQg+xeEfQsYSVeGXRVo1qZKiLJyTlclnLiHlhJ7UZjk6HukI
jj0CuZo6jexGx7td5bRUS3h0etbZZgStSSQZzbxWl1DoOptC4VxQs5obO5uyGdvrb2AdzPaFLbXs
I06AwL8ytK39vLelx/othCCw9JeFAg/r82NsCY8y2inq+xApxrs+yHNO/Byflk+ej4TyrS/QuB75
uPDGrMbu0DTdJ0XoZ/ULHzv6AoGwELInSSDBOX6UWgorICCLhZdW2CZNaV6JMjSFWqIaUE5yzqqf
YkeF6ttg/vRC5TGWywTv7N5yyTHkN6u8NMi2s59TNAA6XJck/XrRZw+pEzxaRQrgX81wkZAruaal
s4oOsIrDC3EFNperznjJxS/t+LGpLwXGyGckdYWohocsuzlpEx08VOMUnP2saWsO7d+2QdGX18Xm
9OF0A08Xi4LnNuuJkJfVyHlEp9DTgnMeWV8aTgi61ZsFnoeTrPbKLkkYpoCTa5mIH2fRpB4px9WE
4Wde8ah5ce9H2QEENnNLVEAVw36Dd74GlhwYJRArHknbdlTEQWBSk71xMaESLJXpiA97Z9JgLAPr
mfHndIwZ0kJsLYkMvAKvdQ2j4zOcWJV6HenbvOoqqvszEHuRrrz6ijxFQ/ab91zgt/LFOrCBz9/4
LSIBSOdMXBbnCjM8c/bxnuI/xzDPfE0+t9WekzDjQ1e/0rPSgiC5syY8Jb55ZXVFhYDnu2rOFzRx
yMUcPyFUuDiywzB1vg/YrB2/tsXsWA5lxv8H4t4Ng3OKCrPm1wvi5TiP5NYx+JJIzmTuBXgvdUdn
zgBFcJb++i5nFWA9/vcn8HeHgSFTQCDvk/6YMr+smJ7f+JubsqyGr0cVAZ+wNpLa/smEhVzBe28H
B1IrqokngD34+wAibfQFUnYCvLByyDfh5ighL+Q2CeQHGFdxytkjp85u5eYfCi/RRgxPlRD6Hv3Z
X9OToRaP534lKHMuFy4tsY84HGs2RCQ5XK44OdesYt00+rUFRS+s82Z35PTQm31EVdnngzticDt0
50nPOJdzG8FVA2WcEmRVZkAO68aQ0q+fMjRqfvnuaA039SrMQyl8+oST/QyAM5vUzYZp1pRGADHO
utO3qscUYpHZt+ht5ynyIMo7fDyHGrUWnirRQEwILKYuatoEdX5cdV6ehbhSckR93igTsxHgvM9+
rwYVMCrMj6N+dfwem7ZLznktrqRHueQmZKjSrcXruRR9GeVqIu256wnEwz2a8rRMWCf+vdq2WmRH
hYH8EzblTM5Qw1wKeClvt9VBSIY9fWwmihQalGvBfc/amKVA6DhyxnpCDDf/L4fCXN+KiPAFodjr
9Dgqg2hgUF1e4jK8GBfW1URicBGhDpzwbvYBzKBd58XOrNoMWfD2nabi/HUTuNtuN3PMr75Bxjwf
3Oqiqm2bH75w1qlk87SDKGeq6BuQnx/SoP5YMOnb4QXfdGAhyluA4oUkKdCcnZejPgbflepm5jYn
KmpfeUzqScUqpsg1zbQ74nHYA1IzUtXx9asnYf4iBqnzKkyrSyu95/+oWWiCqHdiJSjYnUv5EnG/
OFjxhCRJ1DSCPSAgerWQwrmAc5MmhTNoTToc7rruY9t4FMwDjJlGkEACh120xfYOI1PK4ta+REwg
XofRF8cdVOb/OKfKL3vwixS7uI0/pn72tgr52zEMhZBKl8ITv4WDX+kURS7NYAcS9+JUPP/UwCS0
95tRUNeKEsafyYoLvX3Gd050UI10AnSYhppiP3G5jHTOu71UP4k7vUt/HhRpPSEp/jRVD4Ms/K+u
vnJikvwXm2zy2pdZEPIOj+zs4oeYJoBbQUUyY1zLI7MvC/7oejNCPDl8z36GVLbqSKXyhl5LcJ23
4X6zSFlQ6R1vmpShzdTTpiGc1DdBnwn4/sgdFoAE+37aOQNE6nqkHa18qr0iPDoZ/Vu16EhbQskL
L+kIF9DkQQPlkTfqNPkoNkjEEwF2d+vQEOadjCUfai9wo4eMtHbinTkn0/yCUSw6BvPGmLlyKkLK
fXHaiODhB7bMQaiUymkz3iSNPX0v6V5ojIkGDpZdbz63kYgMbbK5TBxPhbC9iwQFa/lYla5+DD4N
pVAub1CS149ddrHkP/nSCqcxfeEw0sZY+EHHLDQZaFvytWL9sYezFoswfhEuGszeTgxzRYkMrQz0
+ThbWPBHX/1jJP0ShPgYZ0YztPoDnpGEwRghgLs+0woFFNpzlkj1OFliWh1J+ac8Yp4+Qb+PVdxE
7x2nhnpjIXdqhWCFC9Gb63nKfUYUEn8XduS8PglQPR4M9lRFDvHyuWUVVMo3TpM0SaewbY8H9Sio
1UU5lW9z1sKth3N49I8CxYbW/q301BtzGzQKkN4YtMJ0uoR25g22YeYBSFQFbdegx2sy2YtiKIYO
GrGP8EhdhbxCNnxxAJCeGdf85NuyCFYekXsfchoLVeL79Xzh+8yy5wdhRH/VNwTewNCqGDKRgZMN
YYyjU+WXn8oOnp6ZZazYQxSjnxlWKR6OA5xXAzMh7Yny/hw9Q9ZwjViqJ0qmtABGe7/tJ7NiqIeZ
6k9QlgK126Zfcnhl0XeK3LfBZeN2P0J7Uc2iN2VgyCYm2OIIe+TatvigPcZJXgwG3Jt0So7ZvgIr
HkE7TG6Ev5atbljQd19RqG0tij3pUEQspUN36XuQ/SCpBF+oFb3B1aE5UDyw63CLHlkEHYGf6MoA
NKkyp0nfFmz+AQNh3fWlA0iROUtbPt3ez3OZR4z8Jv1b346heA8crizlljxG8MiZk3R0LeqO2aJM
Ga7PGOPkexxhJ39EATey5f8+Hg+iKs60SRaH5fQIVoWJp15RDB9xt5yGkoMuYMEaek8dTLMn23Me
5IoqZbvB4aKGx+H+jwlMA9Xcw3N8HogyAS8ssxjevR0BKhbnk2ouimpn5LrHBSpsP2U+fJbXV3FD
PijMX0XkK8pPzrizeO8yZGUoKZiv676mq2eHzl5NID5JYSeHnCzDeJ7S4Ia3yTzGL9ZuYkRQKvxP
3V1QPN2NHGYbGHkllF//gVzP8a/iYLUMO5IaBCTV5KRyAaBSJjLEolC/6ZWDRz0cU4ejewQO3vPE
dWghDQPdWSi4WTIwwUccoyjjzGPjeO8WKxJSVbw/rTaYwuditNQOLZ7W9UL34S+sfIZa65vs/HVr
wS6gbVnkFw5dSyoUV8CxNbsaYHFOGGialXA3OyXNzkRShqe2JjdCkx6ZcLci0pa07M8Nxi82tLG5
4rRCVIy0HsZ5tSz641fcJkM9d9WSqbzqwgHsPJf0Znd6vinNeNDhn3Z5l7pC8elX7o4DsoGdRAU5
LaBTUBqMUivc6kvdCHeN3Kn0LEKeG44x2A+4mzgyLnlj2O7SqPX1fsG1pwH6Trvfk5cw5RHQF/hQ
2i6qt4RUTfkEeBZsyU/v2UsxGmrdkq/CSVQs+L3oIMzP48D9b/SX29XaYdYj3VD59e0RvRuoYWxJ
uYOYetJWlwomyl+sQbvNbd1yE/igw3AK2P2D4hPH/G9wYxWGDRNfAwPj3UbaVsA4xNQ1203k765D
dajteNb/4WiKnLxSCajiucXmRbsHQ5Xq7pgR6sXC9GexuR5xRplqRtbZfI3aHWwTkLHkLAhL2VuX
0PHXlcNBPZZsQH988VFj87xpEXMC9sI+lrMppjXgu5eN8KT/sF6Eh0T3q3p05h7/3nhJXTus+/pS
ZGM+3u1twzzg6gvN6Nzyg7r3oP0WqUucNIU8BMWjxbFGd+jKrqaxMhAODUhKZYhgVZJOt63CMZRd
r0KeKOMi0e65sd7qxmDKb8Tx1rFHxzvveJ2HFaE4Gooshg9IYq3XR+11JhUY4ZzetgLATakWHlIc
dT22JmU7wr5H/MEOOMTgATRKriMyrHhofReWnjHZRfUkNuffXtNBHQeLe3B+AEnonVvOPeRfmeD7
ZoZUSWjNjf7zJhWPW1X9V+0H8wgftwfYTZlh6/+qGZ8zZrHhVCnj8/S5wQx8A8CHNY3k+GSczjzL
u8L2//eUqMur2FaL06C7R3mb2xn+SxV8RhqnfbBdAfQ7ck5Xua6wQEC9zHN4/+828MnyYjr1R7/G
LpQ+EaBLW4KlFssD4YHN7U/ONOfgahAfzRpWQhFMzKqDUFF55Vpm7nSZNvBzT+IxYqcfOTJQLuPo
GGhV/X90S1WY0fXRYd0FNddICwWYoRVpId1dB70XErUQOSgXDHXG+ngWrT8zmyurYSzrF2bBFi4o
5mdoQjjn7DYHSg+T1k/oWBwuE/rcMgXS//82gvBSsJfmmxLmo5UDNBq63Ab2JCpn7VBW7+/DzJjo
rM3jS7bem9N7C5T0cuQ1di5IzDIJMSxHFBFCf6xnIWq5R4WJpepsETeifCwK0P0Ws8yfTSDTRQOi
eZXJSP2yuzscTWpq1TUZq3jheFmjnEtEwiXrpSHrrKG1YrnP3tylo4oJsTRnWn3mv95hfLCpng1+
0sgBKmESkjq6tqPqcDxOKwWakByMt/daJEk46IFCqFYJB8e+oaASw4YDkCdXv7ZA/w2lObsIhgk+
lPy6y94u8UMfuFEKFaITvcoP3SAabEkNqWND5NZ15tUkYsS3VtlEpTH8a0rpMHpP/SOiV+h0ETgM
95t15VbtQVzUcJVSlrTIG/cbcWsfXCtt4hkCIbc3KA3rfch93FEFYtP6S5HAo/IAX1Nag+SFtvzn
M0I5iTs8vsxwVa6/tNi0p8XykVveYnjTD3SMuhO4fBhHtwFH056y9znIBtJ6w39vfmoayxxP17/W
aUa0Xx9bnxeKVk5HX0YcdYV0XkDM9+oY6JLC1cPEVyWvqcqhzj1LXgHJtZaxQuic48tdZIKyIYUE
amAfqaCCEzXv+tQM13sQFlt2fBefhb7et5bdL3s1h6Lx4n3gTLUHHYC/FSb2UaSjK+d+gXvszUuV
KipfAAR1RNEEea5xbgDoZ2/fmJgD5BYjeFbXJJHhujLBloqSeCP8V8xs3ypLl6ayePLjCankBNpZ
igNv4cnpQhUo/0T+6O5a/+gGVazpSgzwIEZb3wDSyZ+vQjPUr69Xar4mseCa6B/ViXPfrR9DnhPy
iruwB/nZmOnMun7XoU5S2QJVNH72WeRJpYf0vY64ko1I+uwuw9yQ73ZxTZRweCFDiNIzXCQXluH5
xXf3t2tP52ccY+ZugqNgnumie/KpjWRjimx5OWnV0d5rxLN2cEbFF+yWWSw6HhJo/NQehdm2DXDt
mJvliIOtvK7E2Du/p15BAVFOZHUffRuf5MvfPa9ZtJCJBdrQ1MpUqEPiSXXb66q+Vj59LmZwutYt
ymBHBerQ3XGWrcyjs2CrZt2IGt1ELBv4MY0vktT0vg0ratqfaYhGcVO+NVweb+oqD24/Et5cHhmE
nbvhOQoHUmxUsBvRmx7qLy2LVNZkqmNmkDnTc646EUo9wsP2ZBAENRz/782yjtqyCw/h8Kbb2anw
KA1z5TkkAsrnRbFdt6+mep3oXgEv9exMv3pU4Ohi80EYccw8qRiU/w+EBqCsfuTagn/FvUtB2kk8
pnF6PAaWMh53/6wJ0TItgDOF2xB/P7YHvLVYxETEMZI5hT2rr1zHyag8bzMEuX5AjS1PrBh1Kbmy
e7OEbou90vHbb8FP5oB4ecfifqmx6bNDEG17lcLiQs+OX0XlplOFibgu8a7Mb7xx9hn3fe4MMY59
ZWjilFLDsozBN4mGCJyzbVFDqDEW0JLYMrQqpC37nz7REl6ZKKaD4Whw/w/cEV+zG/VLALar+GeM
Vx3++/IL1CHK2Y337zorHTFtKvV4Fhao0gmpNV7wuB1Qv4NeEFXtD+MZOT3MVu4XtjAQlymLaO7B
VyoPPPtED6m3G3wbvqeJccm6od0RZGQfzitM+UbNsdl92ZxN6RcqIqUh10I9D5d8eMSjOJgLOLYC
z8VtJ9eyPhJgPaJzuoOD2sl22oW8zT12SeanyoaqynmCahzF+NsPJ1F8P3aQ7KXpbTwkoouvKzgP
qpuWg/BqECrHLmGeP7/iU8P6xwe03KrFPNfHfxGI2Z5ocbvsF3r+bDNnNdpO3236FcCmrsjkCzda
oI8+z4RPGYG0LKY6RmyzVKhRWPG5LHoJ1xC7r/srgXQqAwlZwiMbC7YAxAm2GFhc/gm5w2HXZ4Ct
8jhAwoxGFcw/B2hsjGyizQR3joCPdhn4ZCApQmaXYPSPtoRjiehW0w3BjQ6FNMQgXFzEGAtHq3Uc
gag2P4q5nJXdy29m+VCttpMZ98etB7VQDy56cCKbIxfqdsZ0cTfMT5Xhrk0Jzm1r0dEwtnr9CG/+
GRhqxOSqFHgriqK1rbs3m/ufaHKevIPFWrRvZ+lOZIP46XYOm+R9xir1Oax2HfNxbGbY3QRkkrIR
mLpBM1IMJmZN2frnva1AvTKL4r/NK0YsFSCf3AO9az0UiQyRb7m3cIMdLNE1oSeydkwyfB9Uu+9t
AwCFz/fgml9IJmstiBp/aDb5VprOV1zsCR3/e6AsGTGsvjfgQnWqWrFg/mTvvQ3Gikqo9p81V8MQ
mPj8PqMSA9iZNN+YrIwZJfFsVoNH7bOrWZCj3vUWm04qjUWRMkRtQENTrziYo+nh5SEq6P/KvL8H
ASj1+Em87u6NfA5aS3pkPEKAJXY6r2+B7HpVf03i0rGMOqInJoOCMQMsa3KZ+V1OLEu7YOCp5R7l
EVBIapfIGant0ndXJzTPL3RKcokhp2oMGGc7wzDjVYPcaRM+Ng+C7U7mUAxg3tDTHayGfZ+5JS9f
rE3hW/3ydsPbXY1Y57H8CeEpAqeIQ8+Gm6acmv1aWKUCvM4tlbg0+bsfI+v9MFDkk6eKoa/79Yo+
bWYeh0uYf7cE1u7Z1TqV/T2kTo6BNTZEr3sIaglraVz/VmNOkcfRmtUCHNFIH9NdY9HTW6azk9CV
E+n/qPfLgjgxYSxA/tw76KS2M2RJx3NUwlleQJxjWp8U3t4vOXKspHqZ3akIZOgE4AWWSH9GKxje
L2QH3IodTNjSNNgMwQUNfUR6bAnSXCJZXuwmLoSsq0dOtbdrfi4zHwcuL/buMFnkV8tMT7UsdeCL
5uljapTJ6abIIS3HmsgiEO4to+9jvZCy+wyQSBbuBSjRWYOyUds6e+nBLlZ/ItR2HHV2q9wzK1/F
XKn34vxBGhSw3JpSeKK4U9fS07P2JHVULKPHAfaijOK978Q66JzkvB5uduqh8FYc0bMv+Vk0dz/O
RTcKd4siOHqXiGvF0iNJLz6+JRv2tNJWdX2f/3RERlMT4WQOOVd695jY5Zxo9YaFnfNJG7LbpcZE
NRFMB4J3yPIKF5SWONPq7hE+II94uBv8wXYZAQAQxLHCFX0WY/HsVed09C7zeku+9O75eCMcWmuK
A+Dq7corlggutNrBmw3OXmLl7MyqFTNeQd2jmofvWiPy8Hw72tBvpLjf1kw6fWPt3pUDuZA1saJn
ZycLRP6/jPI4eTTgwAhE+7QkRdGVsAKY8yIlGVgmjFmSTLaaw2s0NvXCOQ5770XwVBXnq8q8c7A0
YlqOtqXbI+4YBAGQFp5XQYHGvGpIGFbeltC+E6ZuAUm2Yq7BcVWwiLEuZv085vBdYE5Fxj1wSf5Y
oZMhdEX9/YWT/0EWDo1JfR5+zvrTA6BTO/yE2LuTFPRjirPjWxFiIZ4ZVTlesWKTExc5KebHhyCq
z1GClvHUgqyyw5Y5tOVtMQZcpviN5pPVMilblv1edWEVGJAJdxfr0TN5AH4pvzPEkeohhnKu3bvS
PvHC8/nzioleZLhdHCOHN7AU9V/LrJSYmhsgnCAFznrBX+JOyq8wn15TR98ZzYoZpAcbrs6TlzD+
dqci762BuVA/zodji/k2rRe8kaCFUrrkPgAlQxAQtsWSIlm3FBMJFCchv5j2ytPJJskT6/iUpN7a
7dkYy+f1wDxosx4wal2oFGkj9IsnWrq/hsltRnE5bWIp/o1v4LJfiMptXqWjCmTqQSj7ncTM6etB
vTRiVVrh/8U/NbZroyIcKGnK6FT57UMZOPWSjA/Y3YGN/BsUeLg+JzF2+rx26TWf0EkLXVZQwr7N
jx9qFrqNsL9HqXR3SPseAwP7USguBMM9rQiOSQXgVYWaY3EYQU0nK5iXLsAziCm8g+iFZyXTziHk
vHmOIZgYb2RvVykoW+fJR7HyyJACavsV6qIYBEUH8LNZz1KDcFXj8qLFq7Jop609rzUOzcgQvQz0
59D7n5BgNMlG04hmgasJPleN6NHIGmOzeDgEh8uRyqOfycWlTu/TxIp4Zj3dXsN/LRaZtDGo7Kid
Yed7qftiw24CCw2hKAUuP53JlSee0JB6MkovBUFAKCO1jtudJxvPhrbLd1wXUwJkmdgLJwpUTDhx
23DC/gCC6B7B97HCbklI0ZsLvS/IA2kIuJhQI1WnHFeZF4MfZuvfOlC3JSLZ6GvPntX3w/yX4AAJ
53zAtvr4/4q7gjDVaB1sQ8N+CUgiPUsJBI9mwdYpOrRePVBINlLhxKgWYNhKib+h9FT7VJWnwGtt
E9rXR87RR3bu7S9eZv3ozbZF697QqydAJQl4AiK5h5eNaafKkfO+M0I88fD3kbqnYsOf0TV+BsXu
TTHxNEbvi3OU3pNiXL+5N/+MThRQr554y076GsF2RoT6osJsGMpaknpk3Wt1YpW2Kivobx3pcXtg
u8PrOmRrp23PR3D7gaG3f8AZfPdlNbCMNctgELu/1YLJVtV96Kkk5bppAzlBWB4QsYy+vsmCkC33
gaM2jpN0d7aAkTdhdqJyOxwGdJNH7PoJrEb1ct4B70eP5in3oQJHiFbBdE4LncJ8wc3A0Gm+Eu50
fDkfTfq65KvRYgWKP1YIQBrTYs6ov9EaiKEVVFGhoSz2+thaMlVuU3lPnyEvSmJDZsLBDsV1SWpp
T3TXqjTiLTmXCRVYjHHsxmhdjuJP8EUHQdrw7My6gMPwP+USvEpBTu6bXsiDxDYII+OZwBsi6Em1
rZJEutVFsDCVzxwFsA5REsofc6QsJ86B1qByj8eH2W1EWoFZdPF9ci8+855Ui9rtj7I9CVE0bsDA
I3dcaFozqqhozddTNnPC3BmmVY1WqhG+DfzksFIGDYn+kVNJB6g/Xz3ISrWE+c9BqkiZ/7VSy7Jc
pamIubQUTH2A7po6isaR4DPfntlVQGNt1N2uLlfxafwViww1oueF+Q50n2MOurrWeAEkFcJDWavq
gH7FbAtnkhLJVzlvGrL8pzfnUypswgnddUU//YfP3P2N2+wwiRB+EsavMP6phUgJzZHkNxQ4kmo1
Jm+WG0wmY7PLk8r3dBmAqnNcoVrir46g12YYqYCTkZKHiRaxg8RuC5Kj9mlD6/hERKnNJ06hnRXv
Gdx8RuLRInjm5MZR5+wuN1S7+Bm0yka9AI5BorousvbT6CxZ4sq2J87kjwoGMG5AveFXFQGFIjR3
PCb7JpEgx+3B7w4JD1do9rSnRIANRjU7+QtofsfLxZzEcft917zp+w329Mpiamc+khyhRyBkddG7
Wy+BRiPGprmShI0Jl1W6L1C3dKV19UECrAQSEprlles0fJ9+7FHZQTAiMK9hERfrFdb3piU6wsGf
QZ4CAofW8EZABR/RrzYi/9E3Z5ka7iZouaCwO1H4X7Z99pX3fFaA0fK895YgkIwebUV1EmuCORBs
Sl4d+7MC8m3OrVPWihZEnCMi3plVrDGAt9tLtGdD36FMs8CoN436RSuHrATHKsjpfneJAcoTN5wQ
W+aQ8CrwMH5L0nj0e554V5VOPzB7buxycDwBc0yXw3KKRe8ew+DPQ+RIjP2ddrLMwwIRS8S3lASe
vrFjgatGAaZBfeN/O4y007/kOuA4QEHJr9pfp2LuhPf7qcjTxoXbKG61ESGynxP9tsGVSQ6AokIl
x7eEQ2nTvmsxIt98bfj+KOLZ2CfiOnozNpz2QTx2NzaotYZT5ar3EdJzuP7yvKVoSmQlgG5mAwn/
UEPXD+buWiGDErpJQV64J8mFoX9ZS0NuNZ/oty9l02ZpgQnFMyNjFytAy26MjOIaO1WhIQLFcSLc
+qhPVs0hZhsGnqudVNOtaUha6zyuM8eh65Ne7DygZvvO4ZYOEjbwgr4+8nQtoqWMEPOvBfZt1wYn
3YLk7x6ovsuJMCyo6J8ErXS9mfOX/lkiN1aayM2jS2hZ9+DiVNbmXwiU89BlyNvxApRF6fgl17g0
efipfU+DYCYjfHizrWvk4Ba4G8LG8G7fMVLx2TJ2Uqy5iJReRUR6WnaUhiQ3HVMYXSsceIGq6k7f
YI0gin1KLlYRrknllDTbNzSLh4+DG4qgKTJ5OtdvZnEEqyPePtU3xUHITwvKLHSChytDs9Cu6qEz
97Zx1RQ7ygtyM83tFaGJHlYVOler3dmFPOX7WSjTKP2ekWT4iPgNi9It6jEBuHEPEAVJYDhhWblo
1u8yqVb2/1zavnROYk4k34OXd7yTNUowV17u7zcTMf977RxuvskRvSPS3F5XutFJnSFpPd3hJpwU
lRXSYd5eq6Mgynrk/SwpXITsfj48+WcXcDSYG/QU7O3yPVTq4Ac4SP2jgDl0S6NVAOuIDQXsU48x
hFLoe3dr6B7TtKEc7A24GvKxo2ZhUIyiVPmqWM6dtBjoo9TQhRQNacx3e48K9HXH9Ls2YMF5fQJ/
10DLzjcmwYLG7Wl8bFFDeMMyF5sPIAF9IODM8vPWHbols76motJEnDjQ3hmkv0imSFmEZcqko/PM
ndqveEqPyTA7hl7lnqk1Wi1UhZsB49CkkUn1Rb6sriS9hbynwtqagSj24MsGZC100wjxCpEIo61D
AhPrTtTSz5eEd+QTn9NU5AWFJvNopw3nqIdgoH6o2tOYs6hZ14f0zH0pD7zrNiR+5mqWtHSPrjVq
qPDBJok5658Zpt6qYdykvSFa3tnj7f3o/HkPSBUlaIBK5zMeIC4oJWe78R6fcpZE3xUprRbuFkjp
Qc9pvJU0NS/NSOO6rA5HezC3w+l7VDFFiAFxTmpZAgjRvSJrawFUv0mdM5LoX1NCJ5Qj1PuAQr7g
Bl0sUrPQ5JIdc0LNUwBEgLv25NfHgq68ZzvIKTiUsr37Tdnjj2kn80eKFPtYzPoTrAvJehbnAN6q
sfu1zS+emDVlocDQMxHTOkqs9MuYYUTupvDb6ek3AZytXrRzEubTU9pg7PJJrrhmhFK+6mMhc8Zr
JPM/fQK+34KYXy5sdOEreh65ZVf7JgBG9R15+VecYZnOVmH7E403l6YYL5TByHYDt/KI/DZnqRKv
TQhEHyvNDj1f87aQ7To3PKDKh2TB9umbSgzU6KTp647n8jQSWi5a63ynTKJeihnvF9fJngLM9kQN
seID+6PDe9VuRSnUMUUuZcxSFWhyCuFIIijpzI7uZmqgLD7aD4BrOSvpJPdNSRAsidjhQRIZYsus
VHZeltyEpyS3EOTae9B+CGdc64juPvZEYKg9SRrtzK46YyCS7UiYy0JPsvJDZgtrKBajVob8bPH9
1zv848VSoVWJiIXR+qiFwpN8T8gBLjLPl+PY1qhHWrKYBOfPY5HoaIkVHvXtyf+3iZh0m772o5Ap
nTSVWrQY6vfj3JcCzINF4G9lGc0SKbvGTCZCb8YqIvct2hkvT9j1qSt/1VAsQeNMaFAbtS2ZvSAi
tk8Wi4BenrMDTLqSZEK9bOJx7D9OLbPu7wCpkS4eObRVIWKCRKQrwZYfFec6Xq3XpKi6iaVSD+hj
sttQ2H28obO6gpT1xzYb7yCPkBbEfslOorUORifBpuTKtenAzbJLPNSO8fEG48fAzPppHZHTYXQo
/SbAUiKCLYPN81fpRD509o7p2zyFQ8VSFaP2/M8bGazKOSAHfbtmh7UUF6Cdfa8HLlnh9n8cOlG9
q3f6r5ELruaOxkIMqjXGT+0xhQr57LE27lEIZ8/ZEKBQ5lQs/X98ELY110RAqurFfzcVVa/3qn1v
wxP+XygG955/QXMT+nUJIlJipZpJbJOxpfeUYfg7P7krTPLZkbK6lTt1sDhPNMOecjlx645tVUxa
nF1/8xgWgkf9Nlx6HURck0BDEufPEzd6ejU1+PPHUIz1fahiRj5xJOTCWtFpILRRDP4QCZwoW/rF
jNorJHPwGKo8AyupyWHOuSDaYMGZidD5NAkjyA3vBKJk8oCSX0vBXdnC8+/WSFFisvg9iARfS0J5
3D60/jNajaJYfolj3lELoWQOsJT0iakDYnM6Gp+2h3f6LeDQLdeMQcKHANyETof+Fz4YQDB58pqN
qmZdQdIT2Pk73+QPMjxBxBmrs+9DSj2FD+mIDC9X5S3E3f2FCwLIO7csWA8l+zn+05XUAUFtMHC9
6ZJDqPC89IAUCjVDkJL6xKbJ3ZEXuzun079L1OubyUAdAjqSI1BaRrVX0E0H/sn9mSEtp8//E9U1
Rj1U2uKbNTdcFaVxK/VTLW4h+EV9xc/H1sUBmzGVb5OROqu/bbuQ8oxgFPVE5oH/V5ijpT7BBuWE
lG4twr3uJW3dlEKmrMWzEC4Jjqc4z7H7SCb9EYLO+OI+rJwh0x75OoXbjQ8uMw9nDsR+ilFOGW1O
eWNOGBSy7p9AUpdgiSbaVv+vc+lK7ZjHCj4VzyvimeOQqWlLSiOmGG4LOBmAoxeXca5n5zBk8fgV
vum2BZHmBizjJOmFCedSaI1loZw+4D63j5DSJdkOA9Ok5NXN96+SMa8uX0tOdq+tfJb0tMzNBTHR
1V5mbbPQCYXFKtqfs0r0cEiYm6N8AsAtpCMNKYYPp7Oa1VAaRouFLwwO5eiak9Aca9noLsy3ESHQ
YQo7pqa72wzJzubh0/hFoRg8pr5euWLJoLU4vEKCDKP2hDdEW9B/KOmddlmc/tMHMoy7ngXq8bdJ
/66iqK9wCpIB892gH1f7YvtQzR/h1+c5S3Xmpxb/klzCetbmaSit8yrv4ksavA3Rij3iX2PhwZgs
m5w9zMhotBAeRj9T0HYVanubM65QmbDRiw+kj4XKK9mPgzYFgnApG3Wtai/hHtJF2N72HPTMcEGK
+jp8UiPrXpGzLNDE4oq2OhaoPhB8DyGOr5UYBNRV/utdlA+DlwV5IUAq/A0k2SKDPtty4tRtjfk+
sBi4nGluW7TLLYh8cOc0+MZDgw6L10uEsoL/nLL9PfMqfeygyCD6W3/3944uHVoXjkb9nHR2/EAX
viw+7TXmr1z1xA8KgYwrGz6VhMC6e/LIOo2Nz1DjzJmxydYgj1A7Zxr1p7MauN+zI0uFJvIU7qZd
zDwEtw+jNQv7mMv8Gdgoqd4gconXW3xLVd7ltkgyQMRXnMtCa3nNpnUB4A8dVpO9xPlxAaF76Ub3
ybsCo2oeU7yS9t5UlanNagsbJghtMP6DN7dOG1YNp0jexQjWMO79j7cYwdop1TlVIkdsCu8IbJy+
3XlqbwvoDvzmZe8VbfukXaLEEg1PO6QToicAyu/yf7k6UYMbVtWVUrc6srzKyr0QYWpPvw7nfH8z
QiH6lStKO06DAODtKHnySPPKDsbjqbxTmIZ2X429oSqbF6uit5bfH/XSytt7cDEqsaKvQu2mmXrn
tLrgwnj39kJCbg+lzl0wFLh7B0FYVUFT1YU4C5oXy9dMJEvJ/pOY1KFnEbSFcrxkvamy92M0D8IE
1T/B43GTRBx2G3zIvD7QtLX8dfd5Japp5cdwe/cSn8lnc5lbQcPh64404B9h9CXjl6Mlm2TgbvH9
8pkHc4ccbW4yvCAg2pnLC6BNUC8wzV8XDmnwIrhhW9wxa1+AgDX7M/J0yr1LXXNd/dHsC59KD8Cq
WKnR1YqmgSsE28xuXcMtOcfFEriLxxsrb/Qx26j/rlnlEhCRaZPyENK346/9yFDyqSUNJSqAahHK
PxxoFL2FvtJxFCyQa1+eXPJPzriWvQf/pChqCiIVclMMKW9ChLcxneh24KNl/oaAJw5ohxgRG4uq
vwwfTMoiATFpFl+26Bx2AvCxcTuQJJSGyi4IuQqOOz95U+3a8UyAddKIQVpRb+vbUztnKuz9SaEf
pAAN4YtDrniuhmN0HVmaQkw/iWgmKSC5MWRiSy5hYNaUGxP+6RFqOn4jFC6wfubW1E9zhUxqHdX4
zMcJHiV0wqh7K7c4LXPJnuhAHlG/eqwxpq6DvQ2sUW1Z0Ci1zCJvLTAbUd7Prass55t/E8swhHU9
p3AAIz53d6sexhpkekalTfGeTcJ9DOG3BGdxngwGpsZ9sWyJ0lOrrDbBzUhj2otqFaQy28F1SxXu
LKJO0qlvAdAanPWAiRtVw3QPFhRE89YRDIbrl/LiGD85Hg2WEdquDbsMb3t5AJLLkNvY3rk5z9kv
4JRvABIJPJx1wUvexVaWLWBN40W+fXk6YekiIsDQbFbxX//vU92JPGFgPqEZx7GjLO1+gWKOysoc
3iLc1gLGPWeXtYcjx12vQ475S9NnnCoK1J/KmRZ3OosnzW3bnwgtVFgowyuT1y2P9aG7Q8guXOn1
4m5lq+YuahYL6NKyA/aN6fSEVDGKbhVPMDtdrOke1AoAHqVECgdORpLzUXmXirH0OyiTO6hjFIlz
7pgbSa+604MstX08lg0VuAxiexXLK1oeZ2CB3URFNFi4YgWqqtMYOlrSreQB6GYtfbK8KV1ZIn8c
O+55I8gSILb3ZKkEzZeC4uOoe+GzsUHZcDMc/kqPr685VZFNBZqBE+6FmZbnL4Rqb+Y5B253qHL6
iLnNE0Gb+n+oiKE3t+J93lEGUcAwZR7HrFy0LRd2JPWRfVlUZmtNAixScJILXdTZBXOkPpHSBJwl
TsI5sT0XnpZvBTufNAB0xou4E+1bRn164QXxscG2E8dcD11cHX/g32VrR1qY40BcixFlpBQh0EOv
YiAQDfqXXP6Wflo07yMzpMtGdPr4XkmAeDjWRsL2U0vxMDWMs7SCjk/ZI7zCsCh0UQdigXDVOlbP
ajxqINkW+dUAlJENGmbpKBxV5jgqob51xaiikM+N36PnvJAC6Dp+xfMdBU07fGzP6ewyuuxSwuMc
6UJ0J8yVhjSc50PeoYdpOhyh42w4G5TCDrTM6/pBrE0m6f9EH1BtLTCOjjdkG669byYjpzK8M5rI
aqdiyLp2hjSuVhgJon3W+UL92ek2qrs/iNlZab8wX5QZ3BhGlC4RtAI9gSAaxz29t6O382ZbzYQX
lXNWxmz5uZmi3Ohm6CP01vC3jXhI1NCkqA2rDw18fVpk0ev0VjE2aoKajy32O6pN8ihMMC2gwBix
boz3dRf1kLZIqMmJUOGU1/h4SttPKCuYCSynNd/wsXYXXYuJxf7rh45fcyDNrHoBKvS5CylV+Qqg
QM3u09qOANOdZCFDzDIIMtQWgYvi4hjdpSNv3r7zB0umX3+m46hLzm3BNignzN+aNtvMNw+FzT0c
UirPqNRlhWPp6WWbeEEsRGAsNDTIr7Ly7Xe2g4BFxcenKiP6MuX4uBO04ejr+EEGUZblBqBebjuW
7gjpHBKYJ9ijEsbBU53yJqOePimSnLHGcMC3JLyiB79prCVBcqFXlA8uGS7imcJ4jWAnXAOnyz30
+pgWzJRUvK3KNRfkss2i/gzRVxV0BcbiGAzmrb0yWQWFp5/zUwTQGdDTeuI7r0hzGna4w3LXMmO0
jz8fO4rs52eXG7iocFXp5h23vGUsmAnKqyCC+hD65rbeCRHYMMw40hF6eBPC975gQuqVfPEtmlbh
GMYIK1qaAiAsiZW0gRVceEkkxFLltG3S6tEcEBZuM2rwxUF+hYiQbiMnfqLsltYXjonV89Lgi76i
p/Ba2tVo+B+Kyi1tzYKwfwoySN1wSMM2Yyub/UVSWEgZM2pII39F8lsfLcGwqC1kocXTciZF2cBQ
/eMXaHDG0Wp4butkNqKe27X+7mAD5iB3calmsBdkGCA8NFGZeLGsLqhoizE2Ors1sjt0cNcpphAP
6UC//PWjxVdpsDpIEL9LC7uDDHZYC1aKoGuX0kssdtV5D743YNXFq5DSlTyo+hYW6egvyXawItte
QCCzZEwC0kb5PBC/EzCJhL7LP5C6KfCT/cHramLAH7KY6BKfTxsANxFmgNIE1el91bHmLjqqYhsm
ykxd/LKKikH0HBdWAfl7xSyF1Bj6SjLlNJVKz7qMmYcXkLI34+itrjkM9P6Xnrz8+Goe0iKOm3N2
XT0jCAhAeHtUWuziOorPBqaiEQPd5pleqSIIUlmbAApo+YvEmMMX+3+zVDqCdxQfPL3N4Rjv/+uy
mEaiIjyzCJpqBbMCZgY+38jGYlAbUstAm5uxRn7tve/Gm25b5Bv33Ti7AIqLfYg9OEVymNCY4KuU
meK4cR7BliO8hEI4ssPfRoD2ZRnY37VfYYr4yqvScg82He6mRkQv8gBoE5wFoqTWmkDNSFAWMqDY
0BpMqtfSMXQkcSWSTqxx6Zi/2Vw5IZIWiZG1dm8tnLFtuK5fu8g7SQe9pD+TPmmjAa7StwxhC8qm
CcBhDi8q6Qk3MiNX39gnkQls/f4tDHVNruCyvRVG8tn0vn5wP+BT3LkuecIR1KHYsijCKz00YNfr
HaL7sllNJHJN3ki/9Nocpe8NRBs66Qs/q+VC0kTW+6KerV+7swu95MwZDxd/G+v4eQXIlolNL4XG
5FbsiWPQ6391HcAy4QKVX7QDaUMFOP+jrhJmY3fmWzfmkVSM/TL8mZLNJ4D+QJlXKgXHUp5qOCOi
U8NjLPAhJt+Edt5XhaJVVqCx4mQji9Qg3eNbB4Ac5yLJJ5cXQkCijNRqMWmNAy6RO0TlAtjJYdM7
RgkvyIFCG3bYZ1rAGu4c9thFXl4yXwSeOHaHuqyq66Cv5vHIL5G7nl6ML5Jj5sCAWvBsG8rsWsEY
kSC6WQOTpjhyTLv79CzahXriFdfPScED5snP8FkSoL9kXwcZNttUa5xjg/kEr7U6re3vsU643BGh
8Mc4Ts6MZke8pV/QMNlaBkdqEdn93UKN/53D9UYkFcN4H7ivrqUjHNg3wF58+qrI+4yyyx2rk1sG
pxnpH786cuWnncC8afDyHetJMJrypDrRCfTxzgDMP4iVcGXkzJ87X6EDaJtCkS1pSR8NvvV+KFWq
Hdjk+vuONdAtIU2NZA3UOYo5a64xRObHR6NQJpBH3I/KuSzThxvUJTqJU1MaxaTeGLdQMuBoRnGt
4uJTVGiRXxo22Z2Foap2/A+y38ZlskPPUFAnplsPyvbpU6DBTN1Ik6gU9z4zrJS683UAutszuFQP
va1HPQzjeTQF7DaQEmbvouissDLLutMvNeDxYg9RFa125RzOrNEAfcyajtdGSjdijDUPqv4cUpQa
GjMihuDViSsEeTxuJn79zDHdMV/ChlIlMa/kPImPoVcv1lgfKiUe5XAz7BTelE4w3g3/TsLQJqQJ
UMG0kCLbsin2DOY54pF6jzJNhhxmkU3l3soIeCeBmNoexsuWe7Omuxb/XmDH0MC5O751d233r3sX
tALCZ8d6MTQDgsDWKX49t0BUn51Ck3tAwMjP1J0tSQ3I5Q+ZsGjGSE9O8I42lwQKSskhqVixMm2K
07jlq5B2T13cEtrtnoL2fNy4+OyiIrqFV4SIjzCJ4YM4Exwem1NNnTMOW22CTI71NVVze979orAg
mWZUxYbgvDBu3XRadpzImtsVEH7g7DTklQgCGK/T1teH64YuCzcCarma2xuEQXa3bMeQ4L8ZRixQ
pz/y/6ILQ/4QYOg2qlV0ncbkeu7ytzAllQyKdquYYaLA4znEvrgYtDH0jngXIio+OAGuMvSLQIfa
8w9/i5SVG6nux8vRsMVJLk7FLVf7+mbQLZrOiXsxkjdQ8BCPlAMmEV+aUiN77YHstjsfwSzrGZDC
dUpeg7Zc1yJQBHDGItWwi33UU0mcAZy3jQ2oN0ppOkFxLRKahlHOGXFMv9r5dukw9QGxtAzWZrzO
fC80Hp/yS4KiMMlNQLT154meFTrXkAn0BxFBxkiPN/0hQj3ZPTyQfpiVkfbvJiAYpO5wU3qYG3Ga
D8MmpGO8AAZ8ToW8pzQz6cl10qdu5TdPjSDZbZTk+WR0hmmbsElqSROKySIvnq6Smr6HyYKI2iRW
5AS24Af0E4uMhuATQCt45q600GJNAfu+gxWEkNFmV0a60iOBkII3SdHtqCeRkl0SYhtR16ymFDE3
Se+t9yNeIeQhWEH6eb1DlQrBGiCzdGquYMTQoNotBxel9iFq3htre+JA2YbbpwTCYcgP6uDkhYw6
w86elROX+32rUuQ2/EY1eN/d8tFa/u5TzGtxFrRdmPhp5r2tvjH0xtL7QIwz/MtJqzzLqduNzUmE
q12NcvG5ZTORDOKJpmz1puTRrw34qM42CiH74Vf77WTt22f6HYxYfM1PF2r9Kc3hYul34CAfa12m
2c7EuWIo8ezg93tlw1V7Y0J104afT+F9pWFDOc/GxX+mePqIMio24XvMuBq8wgBxYwcZ8bXuoKZT
KCpolf9O8lxtcCC+uN1bw142I7tWoXn1vCFZAROV2xDA4DXSKygckeFLxf06EmufYu+vgXmvsRsQ
ylZf+7LgI0kJvBLsq90A43OYJg3SwbtLoBHewgVZ2sym0IRhdffwbokIWywoVqn7z3yYtteZaFRV
08HvtiFoZkzcNSEH4sB1ZMRreSHJ0dDSSn8gsMrmR7NQC6WwnhDVcOxI4Dh8I9F8j5COGuwON1Gl
SCyMkntsuv+9NF8z97Q4//eIrqYslfx4Pw5/c0agBEQFk6N1geQlWrCvEcQDx1i2mRUNjikUVS0N
qfXXlwqId/dRmfAdgJVhsnscHUyLvTmPpc0gqsMxJPovTF/c
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
