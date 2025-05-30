// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Jan 13 17:09:45 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/johnh/Desktop/DICE/Hardware/FPGA/Gradient
//               Core/gradient_core/gradient_core.gen/sources_1/ip/dsp_macro_add_22b/dsp_macro_add_22b_sim_netlist.v}
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
6bGVZ798CD0ChlMbp2gnYPGUGmGUeKvEvcLqrBp3XSCan1cy1durF2x2UM/XeeKLNYO1rIBtBYy8
+Y6jbPTbe6/wswc8tXhhH5eSVsj9jyx1hih8qwAoga8TcKgEfUBzSQOijMToQU8q5R9yGmxuoOc3
oS3YACP1PDR5T+zDgVSduqSwj9JMzOD5JHK7d1I9pl06b9MMY6+a/DX+cEoQMJedt2padQCEZKVU
+NdgvrvwKkGF2LONMPDoI0XH38I6SS9/zUpsL9/CYUUBSGE42z/V0cIcxmZcEyJZ/FAiP/LPWDeW
Jdzg6dhQNItKITQ9QGsPjbo434FxkUc4DDDGuLWPuEJZeXhEajioQdQB5rGkRoTZZTz5Z5mxWSmS
Ce/QQUEIcTaMhtanycqWJkP6eVg7+qVAlwuAvIn+nKvANCLrlwDXDrNueNlGBbW5LiotspzJHsTy
rnXkbiDVEI47iRNSrPM3Uv0RskRIZTFkeubwyP2Zoz9jaj408fi323HhT2VuUh7UI7HthFkSAe+8
Ik1oCyYDpj9HBJkIKeAjKAvZ/cXr5FdiFL5FIEYq4i4HvPPUY9e51d0tUJCO1PhnYYE/jXQrslVt
kv/c7zOPizQkDu4r1bzFdXSow8FnMrbYdV+yCjv6iQT9x86u7s4OP8FJ4aH2xofMTsBhhFo7DGP4
Tl3GSADl6LCEeFLlKgWYNZN/6tA469ITIC3Wpoe6NmsDgI9lBQHHK48IA+ju/Rty12+SvxQO7O2R
qlnVabErKbuTrGw8+hU6+hKYM03E1/lK/SQcz4/HS7wRLEkVTwalP5a6KkL2Meup5fkGYLZO08Jj
JGJQPzWoZE3iegW4ljIwTXZi2LL1yUuli0s0X3nh+fDuROpgZyT140wWqMxh5whR+H+sMfvFKsdO
CWksEp6DIPWzfPGDpdoX0lcoshvCmzQgeRm6oCgzFDfMDxf1tiWxU4iJNrWrpkXAOQxx+5UvIewP
5RgBcIheMw8rjJg+JLIJUXRYCDA3AhflH9n6DMnB4nqzOHquINZ1jaZiDQmSqkyFbvA2EDB9hoUg
rFnboVPBUJ/VoPiGR8YoMGcczU/mGY1kKYVLZWB6BqUhNi4ELF7EEsEF8GvA4lv2DsYRnFli6aJd
Ciwu7Nf+kHZue2wZt6ABlF7vtHHu92SM3ELhRJ1g9Q+eIghp+04/HpXOtC3CmnXmEyy/5dPWtBQA
RotGitZ7l6CCFuKqO8GnHFJCviDeRO1WYvMaKcy7X0hOz3AjvT2f5gqJ+RywAS0eqmKplw4tgRK4
387+GN93hfPhQBXKY8lz4uSittY54S0xq9bpCR3xBnl81/sVhZXSO5zs9no7IJLHziG0ReAKJmDF
iSqOv2/3egawM4QObz9QUd5+mbIA4t2akJQt0hq4KiFjqthJlmB9N654tXQo1zxcepxQQgWcepB8
/tvIN0pavs2to2EPkI6+WUSUzVGCXxY0pwAm5ZmsbunNX4OWQ0y/eG6Zi1NiDAVyadYHaj3X7cFX
z+dGPYvTu+38IassCA+vq6gTl9+w5wsPg2Zf+YDNmd0JQiz7cuX059PvAJ2ZaiGQvwBWWXD4Dkep
asNXqNurCRnvdCF7iJXgtQpRVTZLec+wXedTiapSRaDx0/YweENrontTvH7GxxfgGTykDbBPSWPx
RWRs25OAj06ps7rBbN1l/FZtKgirJUPkK3Uwg5TWdeTnTLcciGTGHoO1HjsT1vAsxTi6E4OhWxuc
lY7HpG/RDZkRSsxitn2IHnxw0NL1HJzkNHIqlHUNtsBtUj6vBqyV6FUCggIOBMf5xsfwd66Bc6Ua
V2bSoSrzBFsrIXgrtoyAzBTUzEwbnGBLyWNgHxcIx5HffLrSxuHyMED8s9PE0kDCB1WCRp7FZ1/0
z1IDwBF5xaPNTAwpUmwkC5PixWzXg3pNIxjcUJkWYBvO3LKdWRu8gz+hb+Wzl6RDTH2Hy+3JL0n0
pqyLIHHH+sDxQFNSwxzQERpsLrm5FfTX6iZSa5xzwcrUMvyPpTDYmwsWU4I7xHN8gFm2t2oVlv3Y
VstBOwc/NXtUe8FYcXwF27kQ8PhShVtQylM/Q6edI1qaMjvV2i9SNWL0ERUHXd13rZNhyFQaR/Bg
GZNMYnT5GvNIYh4Pdc5MzJ6/TrQqQL7HcP0txmWZYsL5hYGxr8iV/nRa0la+jsyA3/v4CmEVDMxC
oVLaih5Buhsh9pOoYeZ47eeyDNxn4jL8jOrbmLm2NuChSSTXLmSa+i+3y+GDyAMZltGwj2sFqD2X
INiOdaglp3WHKqjCXlqssKmJ/j4dU/qZHObCfrWbmoaKqeX/5SJT9+oE0OBN258wFtjup5zdghyi
ZVz+nFBKeMEZCIgFxRPgHraEnDttVBrleigMobYwKV0owi8eAifCKJLHG14rgYvu+xD5pL22d2Jv
oprPf0kaqDUF5lTTejvzW1Y5eh2Yq/is+5VJ60cWYlEFZyzn7syb8hn7dIgSY661BO1OrPonFgML
gl0JSXqGxvCk7C4D4y79Lrh7ZonrslLQuCEQ7NnEyiI77VD0JUVccA3fVHKRCDaKJyIOlD++PK9o
953wB5NMGpbtE8tpebLDipow38HgCtS6FX29qdZxdsZ/HKmk1XxVMx7Yk5NtKb6zF4K04hoDHTVC
5n5y3Z0MXINOEk5tHbijqHEkDbpS32x9/e4GBGKpQjuIZNRJ2nNvRsInC5OzAorTN6kPrdpgd1zo
hyBh8/gZuacyZRu1qMGlwwSAotLC0aasRRPN9gsHiSoctMgLsbQo58D+2XmmyDeYZyVA2rcmsaDd
syq+fhE4+mPfQokGpzJm0zwDv6Jtig5vYRhHIjO7k3w2iiGJRKzkweW0r5KpCef6Wc2dvg7dTUH7
kSy5+JMFT9Z1xhVPeAZNoLkN2q5FGEBABPA/G1OBQZRPb4xKafKS5cXQ9aLd3Kr3x2j7WXOIpMPH
RJBSqG6Ylm3Csb1NmqN+Q2LDfpXsp8Dmr5NygxviN7FyYMyKvjwXweaa2EXTeZF4rLXkNe7YzvS0
iOQZxDVrisWrlfqLzSpu8pLZuDodVLXrbQgPI8/QUfR5fllCSQWd/Nee1b8+RyA5S5HiCYDUKwQb
yJa96RuQJpR8pvY8oSPr+EdPR6BPKxAbyD+JCLDEqe6aVnsiwqwxoqXjUJZILiGTlDyOIFbgsZ7v
9U+GvW90r6gFAxVJVXEv3WJQOkafYgp3Lms+sj+9+7mySRweDH7UqIDbR+k+AFM4VNydYOksmsHt
C+KmlkUgcFXOrtrOCjj0elFNGJQhFnPM53+7mb2cH8AVzx4HVDEQJaZsv9AcaDGdmLRmHSl1yDsJ
xkxl15XN06NfN0VF7W2XHqTEpiRK7dxkTpmwJY6n+hDtP1APO6tWOKYKNUVWIEdKHOr+O3TNu/zr
55XbMmyqdNZTmsZetELpDaxjryEozboW9NVCY5MRl86zGerooG5cD8z5p373Ig9aGUuVw3kuthWq
9qnn8m8C1wpJVnqv7ScPaUrw3PVYV3bmxmgnr6KrsjGSF7H2RZTMR5avsX0Pjtm/98MWjHovjtWL
hvFtTmo5icwQkIVxiSL2+7+/zmoaHfFnATEw80qpkyZnPyQqM3+mfKAOFXIc39ei5Coiyg7Bcq75
EayPQb2BUQbeDuPEwpFlqRPtWl9THC4wMFj6UlberKprbnHvyRO4Yhyk3q8Zp36A0bKMVwVM7BOk
7ThEyCBDLW3vYrlVa8Bze9LZ1dsIwezaIQyVC1oFVK7rkjupUnJaqgmshP94otl4/FXrgl1BzFSn
431hKceR+Kq509HU+awVyg5SfOMBlDJAr2Jtl4WrQ7Wm48E4Lc2V+imBkqH0PS3xf3gB83xsP6HQ
RkHC0ZxWayyQir9D52CaB3IjzWi/IPK4dsbx0MchQbw4eeoDuZez8N+zdLKr40lQ9dBeZssCuXIg
DgGAcIhsgTjVnkKqnTx/ui5KzOxCNUjSI5M+qAsM2R8Qre8i1Kv/VSVG2ben0sHLEhLBviPsc0fT
le3rYDCW8zYst5P7MarAFMCPnlPV0FGn7XqlNbEYHceYvB1XE62+aEsnsmOUBwvvPSDh99+6hdjJ
rBc8O+SnrYnl52ngZ1rV7xfebmqsikjEylr5UO5JZZanFkQofp90V3k0VvocbiwNOS0lSyjhvhyC
DcpVPaSBwmPXcz2su5b8AqpaF532lrdSBE04uTn6jaErv5tQWXvQNnk3QLESI7bKg5b7UC31ifDs
/aE1ANMtY8YBWUCqOc+OQ9Qs1OjmeKvoUgpSUUZQsieDMa/BGJ2+CnmCIhOcQzzHwqdfYXOnvd7x
X5T7Qd+Tk4ckywS0tRtP0BwqrNC5RCR0NPYTBKluqy1pZLiCbv6np/iw4Q04xtKcL1WnvNAulX7H
ldktPWy4HnPP8Y3yKv2Uyi5xldSNIxL9aRUIMlNjIcB3X5M6/A2PfDySJGB0yR7myDZuEJogYXfB
v2I2XRTe1jIrDVVI5cha6ZQtKYH7R6FCv9STGfNaToCHug6qKDT1dxjcTEzHde/sDkaeVM/b5O/C
Y/uAlKl4Wz9n70cVi4n6+X1OmdFejvmGbTuhZwpWwP5Babk1p4UL1LgQ4Z55sPc01aqXSsE3qMbs
YSkbT6UYpq7Jn/mi0q6fTH2UOP/ZZQC4JtNU+RqS3JJ7MckkhcZwNhzvIwYBbVcuxF9jppMZ9xK9
YKF3OQkavQcqee/6PkDXbak7iHglWUQRLPpQY0rfRO39dK1ruF5i0izYVYIYhZR6NmwlMHhvfu3l
cDyHr5WNpkBX8diz5sXeSj3aPgmn8YjoEiLRYS8HBth3b4C+aJ340lYo3REEZz4A9IVVVg5fDPyu
JK7YC6DUtcZwi6pJZQcXRyiyDvgaK5Wb6SMyqT6ZHeyniq1RMwWUDRuH53yrAb4kKuKxDsohmYvY
+4qtg2mGEaV30yTfvqg7AAcQo3rNgahrU6gPkhf26QGbZFCc98rV5XYSenRNyeLxU3qYwUO6sl1X
+QxmRehqt8cQuFEvYs/1nJlORZu7oIm9CbAC8ms3roSKkFT30Thlyx2Ee1wwG95XSOQ+r/zDGjVq
ZqLufAw3i/8UL2Mv4imBWU3QU59t9+L5LoCewBUBGuOGrl9W6ddEE262kHsKtdgbClpojNypK533
O15C5QKrpAVJcnpKTZjjj+zFNri0j4+p8sEswCFqfbHrDiPr/RUTVMHzoxLjTGp1cWoWY1vjuUso
+Ed8v2zbtK4gq++n52seJzGPcUX2nMAwWJOSdNO/advRZEePpQBE4RxH4cVk23tvBy7cKxlcXPKi
oTh6JZu6i5D/65hllR7Qv+MaY5LWAxlf+o1SmWWH0vTV3HeLu3YLcUsZwI7sszy0R1hxa2gyU0Xf
HxOJXjAvSJ1Gjj2b89V4te2QPEbKwDBjKcQ/Bw6qbZZobszNZvU/uGfryDboEHgIQELFskMzsdkb
d9qhjbC4p/0fjMx5+VMVwdAt7W0M3ArT8RZwJJ0JBpHzdj6Tf+oQPqsvRBQcurCv60YFaw7Xbuek
jpTrT7abpO0hNbSKk/Ljn7cKplwREHLSf3YcLs0/g4T0D8x2jwRwo5concvSFoK5oPsvhnp6n9Sr
s9QOvfZFPsTsf+z9EKHekA/EBvVIzJJbn8QHLHS+pi9s+yLMjTKX5ufjBWaQM52eexYvjw5M0gnz
dykjM52Q9cHj3VfFKW2Cg4OBuYcUUeWiBiu6rON4++Omdsr+HtjMqDaxpg9VqiFRrUatvlP4fPkN
OVlks66+SceqJikCRGAogotfSrA/3yt1M5FIP97lDib2rjWeHYQ5ydeIhoe6z2+MRZbAlTIRCy7g
ctOPrgNV83RaCfT0H2aRl4ij/+aaCyG86IQA2RSDs5OkcBNT/im+Ec85Carons0VW/GoUNGnPp1f
CvfXq3g7YMS6koLWD8hA3udNQ9LVgoETxKdeQe+PrY5WgZGsmzjtA7mNJ0oUbMHW/u/dOtODd8nN
pQ5CfJmlM8oizmFVOqkprPUOaGK5oCFRJPX9RGV62Q7rjz8/TgPgJMq2CFXhjAFjY7NlqHs9buEm
GJfuV+0MaPYmELn0BfANbMPQoa23peWqSZGSTOM91ZL8DwvWQDMjeHghf/smMIoyrHbRHAnben46
U5XIVVUr4e+gA4EegfW28Fs8EUhtni9x+DvWp3Hi5GgQW0W7ssG8FgQXNJmepABXiNhQvODA3I3M
TxrOBoODhX5/PggqQoCvAD7qlL5+eGUVG54HZ59WJ8gEl/YKv/zQVpXyqGUgVsYN12W939p1z9iE
tnYwCA4ve4+5hHqfRN0x82ESUPcz1WUmkL7WNGP425e9eBZ/IsWLocyY1B3cHbBo5JpM1END3kN/
fOdR9TpUAbGH6CfW4teW/FCkB1+UiKwDNr/rn+neyK7Vvo+8sTUwWj0y7UXDguoYV3SgrLHCtdm8
GRuGbMXG3+4a7azfiMIUz+AzrivpzblGseMACKTFjsW48P6QeHMAsTMyTZ6V8e6YQctWe8H/SslQ
9bdfyPjFk586Os1OW/x2F11irB39wtMhnjSdFLtT66ps+BisTJ7Hksu2TKb5pTx8UROAq4cpRDsj
NfS8c7YDm7tYZRylotAoH6f/XzqMqKfFTdiVY3qcwjTx17dZwg3MjHf6lROV3hvvcExb1oK2pxIo
pfg7RxXVnGNNu3XAHQDoK1jPw2sxoYHdnaaSIX1srqnthCw2dF1Djuw7fpN38Ny7FxOrLZg0XdWt
qsFq2H3mjq9XSdQrj7N0QT+P/k3bJ2jN6DcqG9i5roasg1NQIdlVPfZ6AC/ctz6irlRhq5X/IpKD
0eVfmlih54ZPBP34hfQA42xiuTASGoXAHtucbv4pqFlE6jtdyPD6Dme7eZET5FQTezLAGa8WPXXz
7LKqCn3fIRVzmofVHIJHFBYf12lky2PFkHv+pO/u4L4NU1/TrPoNabnAy5if9TQ5SllVXax0AFTJ
agtXmvFSHJm8pakhXX6mtTJIZsqTUr1gwVhKpFETnJoGv3sG4XXQThRSNZVGe1ShrUAreVmENrf+
JtwB+M6NMvBhowWy51Fm/WgEnpFMmst4KBLX5JF/WSe8WtKzXHwQHJegUSoPaFKPB6DFsFeLXmBW
YeGnxa0RQCwkPk00eE7QIHmQZpQd8ZiB/nmExPh9ZkgvIRwhQDHTM+BWtGF7I7yuwB68EkZaYF5O
BpH7/Gq3H5eMeZL39m/MdsQubupWA1eI5typvUEhk2XX9UhAy6ZwcUcVlZolPKjDyl5LVb6GzuzV
rZvPb30FuLGHBD6i7yXDa94AdfGFBuPHhzDnXDsROJEsLHe+76eH8z8hedqNpIVwlhZc38BBhXp/
d3RARQatYlebAfaH6vIhBaKRTFFyUzvFBB8W5wGWaDR7PcgEUuZzHsvxEV4xA5Ru/13KnNK4Nno9
U2luE98PLWDpcWQaVYpVkZRhPGK6zq8QQosS3sO9qSkMx6qAkRYiyU9KpjouLwnnDEUuojDE1gjn
aqiV0tO7bU7Xps6LQjHja4BvGy+2+47O4ytojnmmEYnyQrbR5vp6uMdmgkZOrzBgs9YXjp6T36n7
0w0i2rFpoyetlxPdzk4m6EtI924gkligrf3gMWV47HjF41FSiuox5AQqSbbCH4n471NMrAuWx1Ps
DXhzMNiV2IvvP8khkS6na5RPqp8kH+MAfTwuZY2wPyrcnUNfUe3E4S9ltUPVqWwDj3rp9Z5HT2vq
pjzOgyNjSluFA3sY7wTY9/Mv3vNcIX9XDusbsa4n8VVHgQXREIJprydAUb1mw0ssf+PIfe8ZHnE+
TGcmqPJyyIRvO6rwrAJMzh3mQHW8k5/As006rNdlbd+FUSI+Q583yQ/NKAfgHRaxhit0+ZiBGYWe
znE/lX2keixF1bvZUf/vBny/eZh0NF5OsdLJ2pJV+x8GZksrTGoa4KUef706XCJI2FPRxns3hgWo
7HFQcc4WUWO1Aj+hY8hxo26qYrkye+YDkqFphNJieoCKSe6c7DLo3Q72e0tu+NZmKIY7shaOdgDu
227a75+ZrjWH3nGRQBFCUbfN2IcbaeKRVet1J6mwALvgfMCIKHUkMLxtUZLvvWL6AwIVFRPAyUlB
Nne4Gpw9EAqHGmaukXZ4B0aEuGYpWOzTJDR9sdPA6zY2QHRWlHDXdo4pSv4tMaa4LZvtRTpQctrH
a4nWS9igvCxo62zLmdx+CWFBPsOnvl91GMzhqxK688WINuSqHrtbWoWwRtjBFo3k8qaJjTreA0WP
+aUgC1+kZLmPnBLm0zgvrsplOtUghTQtE6UZClrC5ewBw1zoFuzDDEHA4lGyXf34r9cQO3fHgySH
DKWOWa+wufQAdzd+93FHUp+iw5NExr+dOIT4JM7fT478kc6nI3aTcqmvOsDTwGKQItF0Zw/N1uzn
tCCHIYtJXEaf2FDie02HFVEoMFV9DjSRsp6i1eQxrCg1rrWMBRZY1o2kPQ9AaNt4/smmHeDtSP1+
LAKXXWzu8GhEH/DHhgvLnaZ4iK7xkXxPta3IFbqx2/QFdQTB9Dr/LFVmJnWXaf3u/X7IFqhKcjIL
zSG6QQ1g/smlsL2df3H4RJ/TnhCcIb9XL20qLeYM10n31xoh5YvtLFrSPq4CCc1glNtmRhkGL7YN
y8Nvrkz4TCgPsmT0OXqRHbSjkRlivR9rVhGNf5ZffF4nkrZ9HvpytGy574pZP6fomTXWXf9L4XGO
w2YC0BuH4GV274vYGe+rKlyFpPRS6o7MWrXBnBSMcbI2k8vWnH3bEWG8JEsCm7ZktdsHaesBJLT+
Y5T+tUpBtqNm3U52GhvKk9D+473cvY3gls1evyr0ggwYZMdiyYMpv4ZwLN2DfcWwyE/rjARXl+zV
Fja34/GvAbNVandoObMIovtEOjVAZwt2hjBcyIj97amY/XEKpG6TGRC4oldZ5IZq9QB1gdbLQV+R
1aARC6t+TzWdLRHSLTkbG/bxLomybtP3FlUUni8+laV8A4rgWZCaXkcTCoH4Yyp8b2LQJt+HG5/l
rYjNEHLnkJcWipKZtkXgcEfbmA0d0M32zQg1srcZZHxe9YiioF4F5YzlFmsO+LJJqwzdPjOAefq0
aUUp9+/HLShdKPyiPk1KdYHvieIOl7/+DGEp5xfOb4j+FJlrOqUjoCvIwmtSFq4rJKCfIzxpO3aU
LLmqq99LK18hevuMYQVmZSGmkoOv2UxyaSE3HNfUBJL67ylbUzb/o4kflZ73EZ+B4rNLX1Ha6iGQ
Z/BufW7HJWzPy5HS0WwGKyUrSIwVttezRCNnQVszCZQOaL6GZk0p7QoTHiwxNBoRDimIvtjfy2yP
VJ+qgzlgiDHBfz08C/sQDomdRxqcpSRbxA7i5hiFPb4y/OSv3ErSnRx+HNwcdJbKG44Ps5JdZRvb
I3r6YUMMF/pNylknvOrj9qmnaNXj96p+GQRQIONFmca+sapfZgwS949hvF13L6YIwmHmI86bijOQ
INMnifRMByDCuuOPbP429g4ZOAtjUm6kp50VMk4dzvcXcxFyOYXNL2vmYmVYNc3ZRh0pnfxu36UP
sPs+GJruy8n9t6y5lp99PXI3ZcXpXP74w+CA0HGir4retyAksGhy1gFb1dX9LzLHkk36NuVIc3lz
T0fdw5N+kt0UJ0Py+EZ/nejstM1i2CQa1OohVUjsslHcv+IWy/sWt+f5bZ3vMKe/Wi8aakBAGCfB
8M2PE+rZkNSVjTBZpDnK5AyFB1HuqW3dI+lPNQAT24Qh/r1ktHOxDI101rqx4olOhtFkrtrRjYah
SCV43Orihq6Rp/ICtJxOXzxbN2RmluyOqRAbmJhyaDniulqef65WajXEOLdDwRqX2na89tJRys9H
sDz4dIqZpXbkOVUuqCl9z58EW2AWCgFORhjxgC7TJIIVzxYwk4f2QWodoyHFdtFML1kHShEJHaDj
qZuoL4Y0dGeDGX28jWYVyWlgWOXBfdHa61JevMy6sZmBKSJWccVocg61beaO6jsEpQQlbXuQcMu9
tM1Qbfdw1z6Zq10H48fQf9/pUAeVaoQn0tg9/ay2uy10L9Evs+J5wh63Rxm5Bg2VYsZ7+WTs1orX
mGYiWgnvDNup1RBAsRkyb4NGD4/lQdrxQf5NdXy1xYHdnhdgKKDzoq1IFmCC6KEbHsWHDmnTceGR
Y/MPhWx7s6sTTwZ3BDigMr0mrztaMKQbsO9d34hGbuk6DmAjd7SsYfDsjLEl4Yu9fl00bYU1eN5M
lfp/6dyd6AzkX5OjyO+INeU0qNh6+2m8/Sg8rEyoJYBPkLhLB3ma/waLdOcygLOV+CIwGZgz7MjK
EiLIDj7jWE01gazvCZms9jC5rtuu+oPlAme1UdqR5iSWV0Fr2i7OrqT1AcUCjx0lXY/Wspx5a2Mf
3TtvAXTrvNl3LAnz01RpIYqJMtik3QEm23i3njkaPjermadL2OxFHbMC/xqMCQUQjkci9uafuT16
/pt0piIyh+U1x6qxmRKcdv7Aw9NzaqmljEIWl5/HMk7sNd5PY/6Ymk0MyKwLp7Kutw99RmqVRCIP
GGCNaAFIG39V4nKY5iueCMtkfeSuMwj9evqrODqi54Xt2PXt/QxSW0bnd/cugt5u/7VGU6aBDVG6
ejP9shSjzegMpDaJykqXv33uEDD9QXLKW44z709BnqoF/vs0KiT4UyCpda3KdQFSit7zkVD7hDuS
FKVB9oGk8fhwe3EzZG2h09ghM1naKze0GtP/Ml+/RRY+3vcjAWWyEHVQbElJ7UizdrMP5cB7nQHf
oTxW/rBLTJ6LtLFREcpoVPSHJYMOb1o1RYko+FUQV4123vlkuWyY8zRFMtaXtdShEaewmbdGMfVY
GsvtvxsLNorV+RdOeP2f3U777ltaTaj9PoPBMqIm7aqbvTWpvdqrNFTJS2w/h13GvxfBIo6MzuNo
e1QpOT+vQlDeSJqDhxHQSxtCe99Tr52MeR/l3t18mOEnXgqQ7LCUgf/UsOgXMPSG9KT10MldyM48
qnblf9uYts++bIzc4CWHqwXur540Y2OBY2F+DsbiC+22q6r6OQKpIjYl5sNEfhgeTzmznrtN4F9h
7cwl77UplLJSHweuEyYx7ogl3rzweMty0maSqZyS+13me6/qQ53m1xZLeGStuTqNyVd5s/LBJoig
pptb/mhOm7ItOBhNn4HkvqZQJ7SF3/Yd9bmrX0mSCSNIgK0wXJl2rF1aQBv0r7L93UcrtAy3ePTh
RWDLRguG8n+4woa8fFn0UaX1P124qD2liUfnBv08t1NzJ20cLeXBWkoSlUCREG85TWMLKcYiw+R0
gjYdrAmDnBFWyHhPLCvlqGoMPS/iyqMUbVpZJ2OvW+2TwlhPCY5SUT31ZuPkbqpFyICMQjtF039f
KKIgHvr4SusvTtjhI48mjDHwhAGhRA8xAE84qr2FzRXDGnZ67Y4OZc4dEtm7QcoYd/2olUaPJ8eV
+wxMGjTN42T2oIxx9HeCDqI7ju7nxFAbh8gh3or5yGG015aMWQZvFY99yG29LPId2nlyz5hLNTgk
AuNqwOB258awre66hCa0r96HZ2qPv5BBXy1i3cYODv2c8JF9oPWa704IpLMhBUjKfDUm9EFmnBYZ
B1RM/SH+J1Ud3eUMYOvZnvI86llXOaEno9/FtODwN90Yn5dD2/aAhKkcmWzejvPAYzT0jFxp9uuO
MCJ1H6eWi6PdEK4koUHR1RYvIp3PtB7IyOgHvkWSOS/vAWaIiOFlZ9C1/karu94VaK4MbkSL7veR
mAH+gpySSsogKmlIHl25imFZZ9o2ni4quEOQG8Vfz81penZpE8bGi+5iAqo58W+XAwdczo/bPAtA
FBEE6MouRsODai2IfvaQTWed3CvFJxW+lshI19TB7IpR7zxhDF23P0yhY08w0+egBhhlRGwEjQAJ
FQZ0KQgLD/LSyyh9Zl7yCvyiL1k8D9r+zeC4cWVGGEpTSkv3oWqQOmPJUytvhOBUjy2Li6Laf9h7
iEGnTJQVHPLgyuEXhJvERjaO7PDDiczK5nZdiSigFuml3N7gRcm1113btQ69QjpFZkbUUberyqFx
BqVyY+R4e6OcCSxCcjPD/4QhcWfrK34OZrqkiGta7us+5lB+d3QdGXnrLOWWajDK8C6FEWf88RWc
v5gf2JlmVnJH5kDW1EdOnm2rOAoyccbNNLNtIag2b7/XQ3TWQYhkI/zRGGfApvK1Xvw7XjKkDKmh
ZN1QlYRmwKiTsJT3d8lY3Ovm4725L5qFJOSMeVMYFgA7+Oll/5AEfabnBWqr8qwLHLd/KZBdAEha
yonzEil/U1VWspPXFGUWA+USo/2o2DOxfiwgrz6Kk+Z3Fj+b+c0N2lIJKlI9fpt78oUElYRXemhT
JbqWw2262ubMkbceqaf8al5DGnctWf50J2VWyId5ULeSUnAZIZ92cZSEJhoe7dqsUw5LXW7Wj7H2
PWBymhyopMNm+a4H3/y5MOF5Wc8W4IVpWHQftjuGSoVxCuapE47qt3Niyt247/w4jkG09+r3yetT
1zXntqg3PW4A+kIcXMElf8pvdtrniFdLCRLwRCLNWQM24BUEnUfvGwDN0mdt1AcWKbjW/NFAkfYI
SY2wNbQuzlWPipfpwcXNVnnL0ulqzOacjTW4aHXuuygQxZeAx3pdQd1rINSz0dac4OaDoUPuvp78
lxlBQChQ0ePC8Qv/RCRWBXdBDRhskRAzG8hV039D8VuFP1hMCtR9SWwWZ/7QWznHl/sZr7MoPh/2
eovwxRTPYkwABtVzlN+mOnTBpH67suawHmmutx0ENAZsxss767Dviqqm6MuIe9IgQ+zKCTWZjxrg
xMj7nt5avLadUsazZ0Nsnjzf2Ws0COC+aNQOiYi5HP6m9OlDCBTmf57AdFk6qx6sQ2HoZUtwehr2
islc+yyppM+WE70+lNF3ed2xOrro58U/XACIfVEX4nKt4WYxtdnXr2vGUC3Dmt3Ipdv7Ps3O1+jN
4ejyjxkdXIZYLZlTNFCR19nKIxpVfFxqf3rawKhI1RvKu1cWjofUIOKTRQwIKOUbvwvTKSsUlIDZ
YwMOgv8tqFgT18NnBUh8BEkDZomzfOgf/G/OMX6FchZto5t/qin1wiVomOrL0xjW/O6M26QtrkIn
FDvWaW4X2uffukki6A3B1FW4CE3I6o+ZMFlncUsSC78D1X//L5nPCIupxChAqtK/d+taTioEmI/w
M/Lm9tmOwQdfcdxeCQIUzgdQvjIHeEs8Q7xjVgqmNrqaGp/aiYFm2ycgizMZy60d6Kv2LvymYcPY
2qrIu5Vqk2R+ilV+JLDSowSxoLL6+972Yz4dwnwq/M8V10y88E1b3VZVskZKm2K1DYSTqXy38KJm
DGDaK5HPSB7WuPvUIsRU7ItzSd0DWtKaV37nOy8bAZx/lDD2uuME63TyZUqba7UjRLT9rAIEni+6
Fz/ZdpS9zvqCLVrUSCo46/7DTfVLe8+NJyULhlmezBaHXbP3DOfPVdBEF3z5nWjD+x6UBg6MzH/B
/Vo1YF0GrIJ27cgnFZPL8Xd0wuSUSASeMz39+DXox45ZMvYM2mD0lJx7/4pQhU/aKaFervzGDbJh
qpE0V0nI+5MOsgc6gX6Xa/6hYIdNRCfuNdv91S5rS3xDGRtm9pYmpRjTCsXDeFGPrMgJqa2SwwOY
/q9q4ALYH6cS7xoknEllBD2kxSL/iTQiQ+Of79+l6BM/oDTJojIOY0qf1C9ns02XredLJlKTGT2Z
DZi16zJ3iDDBvYTydn8cOfJInBQYVZhnoOns+VYAVZMG7yX6mBB4PJEd9u+kViBEHXvNkngfNL4n
cShgslOldZbrFibKiygs8uTNDOt+6vXSevqm6u5cop5jbtUmO3MapJULQNvvZhhUMY8yJktm8Web
3mzBH6qvqa/nxebA0g7Y7KZjCsA5Mjd6dJpzONYtR47NlR0b1+bLfNwMx3xh9GcsURQQXr3pDUT7
o6dvWrhO+H5BhG0TDBc4cobWmroDzZlVftIxBPwEby7GKjpObKJm8rnBNZh7Voe3UqH+pRcY9+3T
3dMxToXJm2FFd1Giiq4BRnIbjggfu2zuzoM7JXSmynAgt9wlebvjoKL6ZrSHXVPzAOcI6BDBNlyU
SEl35xjsYBfHRBi+huqhac0BpGngjZHZ2zzhuOM0s3nnZHU7RmEd2IjjjIx30pgZN92D8wz8FPFW
eHywDEI6Kpwu7y2u56M9pfZgq76t+VfSnjjFtFvPRB0vRtkmcYUTIVcAFeiT
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
qqZr6SmZz7buUCpTkAtekwPGz/0nQVWQKjn2ENmQwV2+UKdkVPuFc9Ug1ueoOZnTLD8FaYZioI4O
8v+lrZdpBaZ1mDkVapE4uB70bzfKYg2nDCEPcUc3t6OFDUWrMhfj5xzHKpSfX5CEBZfpmZioVinz
qSlrJHwjp+34zzX9sDB1rnPR4Usbud/CuENQOQvot4IGVskaB9oAHpm8NKKcRTzA49SDY273x3KY
K6TPu1nK9SA3hqL6knOEJmn7jtVG3V4a/MNnVqtcq+81LR5p/FFrYFN+Cihrr0Vh5il4udpUeYc1
+c9ZUPriW6ccNYYL7QIOAo7rV4AWWD/fWRgo8w==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
avjBjFTHL5kicORBI91hEjHygmMX/lFI9TO0mXpBapgfBgTiuy1TUFqb+hQt9aSztRpiq+wZTKnL
+LZqYkIIE/xXowHdRAx3/Y2Zq8FYUQ6hmMOnQdLw5asIccVD0friin0IiZwy8Wk0ai/dr3un43Er
SP/5IheNFOwcz5zpi0+6UrvI4hPzs81oYmZyeuLAGQQZs3zB1i9AzJjIgzoN9jRO4HQMGxCTjfyC
flozzSAAUhc4kQYLnO1BrihpXIM/npGxg3c3Fu9aKzu+/Utr8amDedVDjrWhA497wUo6FUPvwN8O
/qj1gyTyLanWm0A3JQeCfC7RCYW7+QVlhAtvUg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 28992)
`pragma protect data_block
6bGVZ798CD0ChlMbp2gnYOBd7IOsTx7jZamcjmNxXe+g+OFA6P+JwCnkE5zQ+kv18gD04bYSdbRB
D2KyFqIneTyIO+ub/Vw7qPXQq3wUqdlzfutpHKgnhffS31cbe4jFibmmT0+hXn3yFj5N1p0iRFCI
xS3IAKsBBaT1RZJVlcJbmrv/8W7taD73pr+LCGT/h9mr+/QBpFiAoFHwQVwRrh0OkpCZQoNK2Xdi
1IJxjzPsrVvBaLSOQItcrCR+0c6NzBVykwSFHE/bp4cLCrtLA2zQIJUctTwkaRLi8k621jhGEyC8
pqad/atMEJ9Fw5mQvsusbWnygD+o5BVWUHXS4UvkPKTCpOfmmcuetOjDGXyd3Krh4cbkkRGoNsDf
Cgj84tuUvG7oGjT3cEW6L/3Ql5x7s/o5lUzvsG3oQikXBUC5zJSkySgQzkUYOIkda655q6Zmce49
Iu9BKnFM+wefjduFUSjBx7ffeMgnJVWySZJEXw4KKE0S+c2LHt309gUgsMZLvyQgzG7hvqbWZGKe
EyFDmjvVbCYfYsXBBEHleDlm5yK7YsGEJvBBIDVGgZc36mBJLENH9EJpCjazb8zynvowf0hAU4hY
QpVYdILGM2MY0yDF7nNrXiEfAG8ZAtRaKUeBOZfr2mMruXBU+xfLhTAqdKBFKP567747xGIaaNaK
Cjnrs33icvh3/ZdWtCX5mzTRtmlnzqINI0j/A4zoeh72gtBmVFmMMtRrhqGPy8/DwJIjwNSHdDqj
TM2vE0o1ur7fHPlaOcmq6pHI/8EzVemBBKbDNmCtrseMiz31rfpqk8IlPoSAuX16jscVOASXhWK6
ESYWE+JLMUmOS8UKesqJAo/8qKu0z0csKKozFf3eoLSlsAS8YGRJLdoRu9t+nxhrTMRh0AWe+51Q
nryTXBTUur9W87M5cuWGPWEk9rGvPxVfj3hIgxG5WxCAoDS9gzhriTqVJKpD3mv24J2t24RTN5K7
S0mWXlNHjbzR3tLR8AUVP1sDsuVxWvH89rhR6DTFE9FBjpC+TX1sjuaPo//Ec7t5k21ZZD86cT2n
u3WnflJ5HuyV84prXf0XpuI2ZGkqmo0hdw71n6FokW/znp4ora135jzyEiaX10Na0QdK5wfqMkaS
js9NAPCuLaVnWzKNt7FcOi9RzPHorI+M6VApPmO2TINK3rVcC5cqdGD8v9vez/CUQwvsoBRRwQET
Cd9TJBQIavRZqzR3sIUeBD1iMigdTR3diosbfSWnmKz6wBc3CZfVUKPLzv6bwKjfBsD9KJzZMyGn
KtOH0suTj10Vi35XWhqFb5yoyi6J4XtWzcMlmSILR40cdHsQkUDtMFNlkr086ji0Ic+or89wcivV
b8FccZVVmtMyc6LSwcd9gZwh3cIuiRg/jQI3JIKgsEP7qb3khDGpTDRCGAusJ+kdO/vyc9Rpao/c
+xFMODsloHotY4y3hnTG+s8K7+q5d7Ko7lJSnNXfWtnjVAgMNiiXUv2KRpin0H2ITaSyPdV83gfI
oUYMePR1w+AIj0lAA82dCsHLektCvcl8HlVVygqZN7mHG6QjKBFdfHS4Zy+wEjdDxWMtx19GU+6k
48qD3MS/AajAANy4IHSM3yii/YTTBPumFE0kQXH6NYsbs6xXZKaPPHofTFMkjbFE3CcawZn2GsDI
qZfdyJs5GHGCGvH98RGqaBckDgBqyvc+1aTXgBLQ1KJl+W1PDiZhw4SPJT/KfGhZkY2jhUOd9l0+
mtkYRO/LA4V+K/eb9RIzkUSdMTeVSRrPdXm51C3sgbIKamJQ/mxvBX1mcmurwayG84XSpPs4hvsi
j7cD/ZjC/bmDOlmHGSzsRP4xtUY6srNyUhmGZnJ50l06B2C4sFanvfs8JggyT70oOgE3pafuSTcD
0QlgfafL/4iQn4tif2baZPVSd6E7+uObsUrMWjxILlP50Cmaz2XN+EFaSUJYs6GdpbpBv1eoXb7W
jQVEoBbiZsq+MqkvLv/P8axrbnnZ+Iqr+szrd+wGfZb37zDz292WBtk643geBe+A7AKDlEd5Qyc3
3qfLFxdcIRsKHe/Lu8hmSiakq6D5WRy4wEOiD0c0k0MtrjzjjKnF1VNDLplSWcgQ+21aHUcEVR+s
HZKwQOP7e03tBPN7KG4j71qeab57dO+N16vliu3i5DUanaHpWAmDWc0nPIdgVmVnE7A6HGNPtaAu
lNcYb2vcsbpn294qtCtQHpiz3vdAPo7VlIVzu1cd+FZv/EedWdaTiooG6q9Ps9TbiDDuwiehedKs
XC8JRP7Nux4g9o1wGvb6f3N/tMWCDnfo6+gRZG6ko0YXEFeFBkhE0tayZm8EptM3qh3Vty00Ak9C
kiHlqv8IBrl/TBII6jPJo+keyLA89suza9miKClIO7yzavl5ysx0vZKfaB/NFAR5QbQbI69A90JR
+TW+9wt8e+7yP+QsPuwRI9sKUKOb4tj3UtNHP00O15NCwTr3gYNKM9lnUABK6pHcgcCKlFf75dSs
/d4iP3bfGc+ySS7RQ4uZko+QZb8cJOe2rFmHjxBK8eoB8jai0pZBmQ1P+Jl/gMLQiRr4QuhAOMh3
bXPWve7V6isWM0NCF3R0qbkI21vsas189MSsLO+FYIWoE1nD7WuMnHvq/28mfN2PMmwruylEw5qz
QOCJOe7XK5xiyh2Bkazi8nQTPLPGrwVDaOHz0qFKTIHEp88NI7N/poXMRf7qsCHvPXOsAeC6RnRm
OU3lV9sPmmCLIgfnXix0Se7yX+TXkJxh8IrTqEhXEY27+h3RDpLoE+FdWP7PwaOYBn5KjANWqo+k
dYsr7q6hTtSjKddprdTE4Czmniy5LYhB51YvgTU5SidXz8oQH5RbNukrx21C+pJ7bX7XTujy9mZQ
uZdf5sSiDR3UGNrgRTo9T0WQ7igE+Jn7UGK/z2rWfOpFV5J9FkU2yboUqmvHrTRRAIv4LIDaEwf0
6N3NJ441N86MQC+RTJOnugtzWelhK4y/IkJ8jjD0RsU61zuaC6tAca4d7t2CaAXtlNry9mxq/OBE
XLwL+8Pb10+Rqqxo4QZDfUaEkrAQf7SYqwloyKkLAIodsRVVpkOHK/CmEDcqAnt58ty0nxJ5n0Sx
I5CFU3IdIN4s7LAo+t32aSYIQp0Oxza6seje4nYnvB7YyYNyMXRxm6c/Ihf1kNgijRrK4Xvf9CQB
GKUQUIg32CYzDp0599pRhiON0Lv600g0LoSHzDWaNIZQxLXBkaRB7i8g39tJp3oev0TK8yK2/W79
M86I2s5X1n1JNQ5XHIlnyDPCxU9b8vg6SEIQXR8m8YOycd9plvczYEHWQMtgIWitBxfMPy8bvCgU
V070Fu/MpJtZkx0tinJROTRJjcbjmvDDlWVTOjKftDeOxeEEOyyrp7GHitQbSyv6xOojo8HbFWVg
fVMO7Esd/G2DqHPwoXRIeGeTOJGcVWJd255ted+O++qC20NnK1z8Y9dx35kZfrAWPzpgQY5pXofj
DKxk1mdRNRUGv+5hGKJYHASOtxSikne7OSnuZjVOhWNUn1DPPjicUuyHf5g4NcyOUzlc+2GXt8g9
PDtRbwjrutTfDTk0MGlskzthtCdJtkxjCy87l7ho/NOxIqVmFEw76GqWYdtcMP1JwQWmVqDSz128
DQ2usjI0N6JNKgO6Mp2cAhav6/xrBxjx1RUTJgaUl0/4l1Fn3gOPC66kuPhzaLPKz+gQPCWf4CbA
UVm1PN8gexypadpX7DYvKh8J7K/P+jm699xEUxeFt7CbF8RaI47z1BBVj2W5qWEcEyR9rTnUBKqk
pFZkSo9o19zHfwuZuBiU9341eaH28PSyIPgA9hM2pdF9OaBGrEnlIYVy/Ovq+B0J3bB28fk6+sPl
Hbz5JY16tLKHZuEZjH67T0IyfmxVQpfjmeU4m2c/mDNYjE6zZfbdMYKArYkyVBSM7VnUxDUNs3IY
2Ef1tyMcQMIm1m3mBZaKrxkcoV0tj6PsOVCZy7RxSD6BqIahqDSioeNwyUu+yKAX4me7Gqn0WK0c
OWV1FsCNc65avdDmAOKpnoTbf0TeR9iCx9Dmg6PtFnyDHYFr9A9kMxskRFN3RwbjIzuB9Lg+PcdJ
q3oDB6lY5B2/1SARIXl5bGIfD/opDvzfqXu3h/Qq7PprwImLg9rzg+mnDU54+vjH8UzX5Dgux8Bi
kb/LbJdkqIeWz7DqzX/ytffg7m2dDtWvkmKYjOaHv0W2t1epow33lF4mKfjw0b8Wsz4B5n/NHw9R
p9PWWEs1z0sC75XqmWuV6hH5Xg6fGsE1dpo4FXxESeF10G+F3owu/DYHHxIAmjFKvQF9HYnm12ax
KQFuCKEuEJVgNCMYk0GQoWklV2UJat08IYXQSYOxnBhSIszbYdE9WvrcRl56ZLC13HyaEvZ7ijpE
avbOPZgcjTUGyOAVYxFc4NL7hYY0sXlTmfJJryPBezsFlFSZQuf6UByCwJuWW5cx+ApAlgEsoqLO
0KWo0Aia1fmArOfYpHoDW99fLimxNn+RxFz/3XDcRJONh/LdvdKnpfmUAWUwFMJ27X6DvT3ZiVsF
doniTQaDlEE20Dy1+ioqzi3IDESrGPvhU7McmlF5GuTP5j637XN0nb92ZgqG3g5bUBcy+p+5y0yA
rUCXqRW+hpzvXv3Id9O6lsPYPp40WdD4dnRWwcJpeQ8+sb9JBCeHAsWoaHklDoez2E+yqoMlTsL/
A7a0NyDq8KJibZKg+7xg4D9RKWcm9sUjWGmJOFZof7T7TiU2realMo8f0eofEvlEJUEcaCYFy5UJ
t2+B+U2lnXuJx5EvKSDXBkGsYSKTLUd3jKc0oj9CC3BJ7RA7OGN9pgLp4qPULkmBVf9PyjmXyg1+
MeKrY+EHkpOTMxvSfQMzi4f71M+uv1bBKDXDYjc8brF8RP1l0glStJNWxFApZqZWNTjX4XCe77N1
t157snB1X9WJfEPlg5h05j5RD+jlGybfac8k8BrtOHKi/lZgJZzFlXzRTGs8gfp0U2aaZr15b0yz
x6SK2l4Z5KH3Ekl8sJlVAXziq9WDzSnT+McZkwwRPh8xTzlyYA7DZwkNwgrCjwD0tYC8dwdZ6+ro
UcJMKj+zUeq3lLUe0JXlsTU7XuCBHXVKscKPivVFuFUj/EnIUbXqIt3QiHY7vIXqejuPw1EH4KLT
JU1t/vwv2Ya7c3Gf89OXRM0M0cemxPKdPuDE2cEvmdbMX+VEh2J+dOfM7IQnnhdX7AVDPJe3S/QG
C6icu0+mYahBENvDx7Z4kLMxbvYdCjLyWhXhWigvS47OB6yTMPyz726OITMA/kgbGhXDlrIcLBGA
2BJfY/OnVoDVz03RvFSHOIXpNe4eQAEDpIZhOGvnCUzbFs82qhhunJHf/CmNOj1wxU2XIzHUuneV
0vc4w+/3WkahozwXcw+/wtGWpupHhcYeRN+ACJHXpTBGQWIEk9AQPJMSC31jjTMUgKg5pmS4CAoA
4GldsGwuuAkfcFcUc/wXnpEvw5kbkCUZIVOoCplp6t+tca8VqjCvycnhXbJ9gQXIYOUz78RFwU7I
Krw+bsV/J7vdlmzuK5DKjoYBVi4RvL2/kcDFrcti+RoDOyPi/x8Xy/FgG6xHtKIFiGwFFx+MCUTP
XX9Ib9JiY3iYz2WJIwzn54IkA8RgAv/CxgQ7vYewj7R8+uhR301zW3fo9d5XQzuOWWz7Y0zJmKyD
aJPba9XY1IANFilGDlVeFYgEBB/d9oeRizmlhiniYbS7KPhfXnM4gy17cmFMVv4BqYEGwVPWuMO8
5GyHTMe82HzUmLHpsb52JMQJcIeAjG8CKhXTPXLXG64FeYKv90oahxC/qsGBG847vmF4sekHQ1EU
WyExkGkukkRBP+vWKrW8WifXrOUUEl7/kbr/f1BvNAUhrKdutmJwQOhXHTu9ca4q3GNznxWkV7XW
NBzuazB3VdWcfjbh+mKvmwiPB0SeefQLejYPyuhAUOC6k60eBaDQgnisygKfCWKGDYXFyGwhSQVw
Vykh1NdhJXzq2W9CWzK/zyDKyZq/vvLnuHk3kRTl+TgIYA+BUXiXtbDVDIVZPEL4AkU2yEcbHBAS
A+Wx10CP+NIpSkz/Pt7KxwYGzvMSvgCWOlOf0vh9W95EDuUdoHkyOFBnKRum2ocBWP01nhVsrYd5
XR2F4TmYryBQZ668Iq/Gj4FGuPnd8GhwaP49a41afU2qOyCJ9s548VG7ZEPCCkbtt00+xAtgxU0+
EFQP/RFzRt0Zjydp7c6LYFTSVByGSCuJ0vzbAXJk7z7iqDqjZ7S1W0KFuxcmPwXT1MtraG3xUE93
Atqj0K1MqD1+R6vKkHn4bigosluhGs26c/bpWoo+wcKSi5A2zKbWO2VI3J4NY4QkROaqsGaGKlOW
ZXDMfbVH2ADcv2ZAi0dwBMXZIOc3J6bPORYQzerx7sZ0Hf6pgESc8zf7mC/nbGLKtObbCDM3J1xj
SzfvjLuX0vuXeqiCUx9mO1wiIax87uI4TFwIx5WeoXFZBQOxBpo2AsZ0IrmkIs7n8/i0ZKumd1YU
vHcHtpEIOjtYTisRoXP+v+Nl1Tjb76gb05nNjwUee7y3Wn5v8PvK3G8NnfXpv+FzfswmXDBKSJOx
Chp30I53DyTLC8eMkfcx8XyHLD6F1MbEl4xpSgf/xQHYKohFbq3SQLF1337YfERn9rynQpRsO9kP
2kKiHiLAGgSQ/QDXPPIGCGzr7siKzNM/DpVLLEs0+qWHez9MJ9y45Br35IKDFvZ+ueCzGcTblkq0
SAvPj3OGzp7JyI4C3aH8GuYmFp8hh4EIFILiVPxIivzjt6tmxHJVpfyk2otkcPPYbg04OYs3tL+S
+Y+ruI0w0BIGr7PQD6guudLxZlIXwpTYs33s6V8eEQ4BJQDGppYlLW6QWAnmr5urR5qCdJu4TB8p
E+mUk0wqxFjzeTElguXi79uiyBQ5QYYOOgJrFCynXXQ9ZcI6+1lcjTn5eWZwGho1Z6Zv56EuSvLt
RiYchfJkBM2eodZ9lBTKjaPqQb8d0j7B3Z52XUocDCkTqxMoOTggQA/w6hyCPlAArvyv4ZkUyqBb
rlaVExcClqvKtweKksOA8g0BRQoH4d8IFEFQf9H6Zm0q6DsPai/4Ks1WJ0QPMGq4DK99JFPlZep2
8Qv3ZObfcCHe+uPrYBZsyUt5wSNh/71cPdaoik/nNZ93MObxAygfO0oJNELPLQzVlfNNp9kmFlES
jWZYzu+ZBwW3IQJjTe4GHSQc8+CTcUU4MX57fBCbwMg35GMwIoetRfMiCXfFfV0yWBQoD+4jU5O/
jVAv7GV7rtdA+Jp01CNJ4h1z2Gd80R4hl7phZXrnGmNc+by/zeiIYhMN+esNR6EYx9mVNCUULnx9
Lmpscr7Px5huPbnJQI+fT/vbs7XlD4+nL66hsPRP6jeANs1+6EZU3eeNRypwEPZosCTAScKmnE4l
h/p+cWsMH/UtY8Bg7g+wakw+K6u9lcMNHfFRlLs3FQkZKf6zmiFIQwNRa0vdNVvnRl5LjssN+9da
v2InleqiRajSIYqaZbl1mhHq8XIlDHf4OdB6jwWM5899enYErl49dqkAw8UhBNrmMILyO1dPSvTg
hjAwqsGhMkVD4G5qSpGRT52LOYIGWtDv/lCgG8tzgBklSMeSnhIbw21bHK9ypW2hTr4o39AIMik8
HftAKDLxyAZLwFrXS4HiTqF078Z/UejVrHVpAUDjEFkHpCVRM8zgpCKZDPrukXusNMjQ8znw1899
q4DKuHObfZIudGvvRph2hfnVr7gUCE+19HUZJMS8Ro1o6PuzYh997vrbQk0DdF6XZQWumV5sF6vh
H/Aqyd5DgbPT/ODbHE7WtgyYi+vQGGQWDOX/0geihi9H2D61LKHALNJbhOI9Rp8XJ6nSUaAOod05
9byAiNjOAFLVlxz/ApwDBLCI0dG1boQSHxAdQYSHH3/PGn72rP54YF8Ysn0tniU0rvF8vh2y4jfM
oF0ZL8LIOgwZlW4dJgquTtxLji078Y0fgty+u/8TrcehCHg1UnnGv5Krre/iUXXAmoAgR9dCfc/c
bWgeuEnCSxQVyqXKa5nSIaS/Za3HQz5qNaieiO9boqRNKKpqMP8yZ881b4wLSlyKcd9EVRFdQrmV
uG/Ii33RTWk2Ydp75qucFriKR12DF4ob2O3ECuwqLVEJXBhlz4nAIP4CgvU1BGOcyTlK9IWdNAzV
9jAGG29Dc+CsWOFluQX7dx0brrwPitVcGfbNbfgSv28J0U9ZZucTjt7cXJFxF8A3Ioct5T1m2l6L
Z1cF6cd9h93yVk+YtJFOMpKRH+WzbObzK56roOSoAXGhA4EWJFxmgiv2XWgCeTWG9Qf2k0so/NuZ
L3E+/V0A8WoaevZrme9FLBt2C6w3HxDpufu1w2fAANZiKPrCwA7+6L8ZtMVyZNcqsLJV1rYebDqE
0gNZ4pOMAUcoUY6EgjZb+q0lCCysPZnVTMThEE1I/P4xXkzGqXEAQmi0Qo+9pr6IjQy1JyemSp9d
OapUBqTevDpTptylVkxERX7NMSraaiS7DV26mxFl1HkLdZbIQ1ahV+9L0npBgXEl3i8shnOu3XQz
qAoIUWoRkloWXa+4xOvWkDaM5+FlBpTJMfYbx9G04P8LZDLrdkiEjmMrpRzWg/gxya+Ogr+MN0E1
oQeUBiVckVz+5V+beWkDAI/xgevzvHIuGFuQ0G+nQbq1sODHKOaKBS9x+vy/ipP8jCPlXcZeWsUo
IsNEh2TtQogEncwP4Qrr71wUNlkp6Xr02yAyh9EdVFG8qxnvi+B5qcd2q63WYr04egYbGRPdfC4P
/oh/JQPTApxTkLuXGRkq/HfE/wd/TIgytkHCWlhUjJ7ZkqnfYkUuiT8Lqb/c63eXUcjnAf+7RTIx
exfPTZ/yMem6ooxR9sskvR5cDQc2mfvbw0bEuU+m2OvYNwIESlmP0IV9XDvrk+yj9QtdmJu1m3S/
uS9nStfcxs5YMVGAEbA8fVUAG+VnXg+SBkpscdLX82qeofk+bWb01IqZjeQH9Bt5syGRiP54dRt/
++RnACD3wkUguVxA150OKgDa0cfqTVQOt4i92+96j91W+QQgAgJGVQu90isegw1P8SvupBg3qrdo
hvPJUa8Z6/XkG7rcPvuliM03LUx3uMy5rBPFsSYmnKQ6FxYoc10R5j7uNZiRoFLJrnf/I6EXj8n+
LkuQXxiu2j1IFcL5+KObr6OJkeAAhXKBbjUzjJSq8M0FtGZZr7khH1sPKaVtLf1WsHXdEfsq+SLj
Kq3lwAxKxH6wEz78mnTcVIoztzZYGdW1UW4c7mXnJOdKt/shKfEOHuDFymEydJAtSioYBDLFh5dy
Ob4ZYBJ/dd0dNaAzIvkp4MAI3r00pM0Nl6cnZt26hh8lp7waA5UtlhFoKdyc/hwJA8cEx8Up9jND
7TqKZMwO2ZQUhnJx5crXak5ZLBJVvX7UfqGNANY8R2dc/ZC79phkxWl9tah8/IpPIyaz+0DF+hEb
8IDmMGiac6QEDqPSAXt7OS2hmFZCeaQfDd16+dt8fdzElZmNhp7f50deUelO/M4bFmSSy3oaENjA
5xM2FCbZLPFKa0Bnx/SZ/HmCC0vLXwmxz8kxHR4JDmGZjOCwe6gVM3iN34X0zdjdEmsal9nwh7e8
K3y897wRtKgnQObvyzcSvSL8ivF/WX1b7uO25rZk0jcoEg+xt2pfOaxdZafc0SSJMtJDXrKnZiMI
QsNlJdATfDCr+BlP/SVufXCfDw7dzq6Oq+8smRAhY0ZOvCIiRd2dmn15LO3Ef03VNqeo3i9OhS0f
w6EYwI/S8HLinSdoy8X/q8/1eOC0wZjjh99ovSpfwIlDRBPeCFIoQenzht+Kqovuf6+3FgBr4VQA
XB2Hkb8Wp+1nTBRYJ9OrLlThjqwUs5zyZkLWVMbmwallCTAgXT/2IrZ8+jKa9gHxmb6AaJpFlpN5
qLrknSIG1eCQOMnynI6TIjRPanmwFqXSezsthZ+2lMnOKBm/+d57xcvZ0XDdZvoWhUBNfJaXRi3v
x8qcsyU5WLehq2ukNcu4TvWcpfeZP1wZFPJPEu646oVlKgNfgZcbK6AeFaUwunk/ozSh6n7BYfpp
1LWsQ49PO6m4N5XBilyzPQakAyS4HdxYCaoi/q5mye7hcyLUpFhYrETpIYiDspa6BwymfRrCJfI5
+bhW0ZJNRPnoilX7BTq8A8BhiWXNzaxJXhz4wimGEvy12g4VgQ4NqcLI67kEJMvUfWwgH3i5kGtQ
ZjxhrCWnr1pF0qeMIJEge3yliWx+LqRmOcsnG3InsNRPVYUJWJnUXalqzLdfpF9LNnYtUGsYVjuX
Mzik0adktYiztZHdxn/QfrOy5wC6podWP4Vj/feeZQg/DWPjp7pimkVrM8TUb87CYLiqVIDfps39
XzszcXeqSISe6SldZQoy4d2vWOGqa1qThdEuZdtWTAWB4u0eflhSU/DGgKRo+RuOVLZqla4F7a9M
1cccg6hmhKdvMf6bQMu9zc8wgWegLH70zAR1Zjvn64OH80U7K/AoLVnNGSHHGhJO9NWqUgNHbTwF
7DIwfUp1OhvB3Na9Q3TQFabicv3/NNzwMxUMI+4YOcVeVijpolROmoTuS4z4RwkeiZSZHPYPcRid
1cy0umaAQEeaoHkZqZfeIGa1eq4Cv01APggEpZahmMTn11j396YV/oXyFkEeCmkDwNxhTN4gtdKC
0WbVoSD7jh9iUlXC64eKzP9tgOZPB6Ddt+QT4URwuvoyKrpjZO10kppJaCR5hSKINceMcvVRQKU4
uQfDICtJLtH94OyJn9wchdQaxNzotlObYZwEjngY1Qhy93Z5rVU1fzhQ/IiNKGdsbS2DZxLSBhgI
Kw+omKZCtzHWzRyfGOHmdpqSCvI+bgoMa6URDqFcNCceNQLvDR0x7uNp1FdW1awGLUCG1y4Pxo7U
UizSUPS8CbcxDEPOXUWOJkdZWHISeY49M54Mdqo9Z1VdckIU0+IQSOo6fg/s9ZQmYMNN9ox3pMzX
RlBpO1aWEeDnwFK+c4GzeekigzM3lUHAm4ubRhwkbsusnBoWYj3Lqv+nUr7pwi5u5wqhNRfVTSQk
ZKTOeBeU+fwk8ZrpOV7VWLqO+V2T6EFBZ27s5bkXqV5phoQ97APdG08CnmXwZvfpAnntOdh81db0
pEQRixt3f7fe/lwT1Np/qrdwi4UMUmeiiT5lmdjITZ8p87m68fZ27gMwZEKeLtJuR9+uQ6p7ph0X
pVoCWw2zYGWln/HenNuJLX8Gvwgo+R2v0hfkycq7RaUDgA/ODR+uWXBSlg790r/Sa51hkB+oSdxt
TgyNj61QPYupYhKq7I3NSjdNNmwewyHfoUOmlPlPEk0TPOMHeioNW6MN8r5GpHCtwyOzZwCxk1/d
0/BLs6pBUjOdKrYLFY5ssdUFYoPjTZhaiXOYo3dFIG//ye2LRYkM5Ge8JsqQ4tm6VC0JdrfzbfiA
SJi2QOzvE2ehPxG/VwBMhhHwiJHkJ3vvrNKhmEFgSLXEnqmZIrPkFAgoZdDSwaMXUfzMcgSFaGGQ
XjED4mhFYfFhMzdYnLSxx5iMIIdAmszl938PNtukVHXwMbPVzR28/ax90EqrX6MnSpZEgII1Gwjd
HseYe6lmRbIxbNItb6KRfIs7cJtQfwt10Ozdhb2MTeQ4jY6GAN6rph/DOcS+kS/a1SnoUdvzif51
9LNUaYJbplVxD6Pt8txXZUSK6DAIVpGHM4PEmXHSxp9vrLE7n7irQh5+XxUe6dAyA//msx9kHAB9
sMfiyLDg4Qx8cEhpEJfZ3ClUaku74d4aiFOjue8wLmHj8V7KQ78JoJVPLuD9XjN47JPAdu7fYaee
LT9hrF5thdNM1wNfYzaeeodzNMg5LO22E8foyT7g05/gUq+XjP+BI1Y0MUa+P09XP9PdUfat48ec
ppFgUslD4ev+Em9+XkaYRZX8MCBz/fdaDJywm88nJOv44x1ZZ198BaYkwPc0EhpW8FFxaiPM28Cc
AfatXMaFT1Es1pDlzITPNwci2gTlhb165HipKyExFoWOO5dZ5916+hsu81wjdADRQQjfUB8+edFL
FcbVZcWGZtb/NfDiwQAPB0ux4lQ+mjve97SRBWlQsUhLBS3IQxCSB0dNuQEdk1Iflv2zwmiQpiFd
SMR4K8cUpk7aLxZ6LkGm3q9Xp8If2Kr7O/R3XTIvABKTX7XylNDJzPhbJ4b7B+QHnycyMLzTV5Uf
YOClmx77RI02nBrRz41c8z6GJdeb5XV9/IV4z5uWgGWh0bnQ4Nk9UveDldOami1YAlpnDSKR6gIT
Od3DVCSwrm3Aa0YBnHgJRqJoaTALJsktpd9iuUtJKKsil0ajUTq4okbQbq3EelDk/MxDwI2bwcAp
yu8VGy9TVDyhlFmot26+JJ8p/QStJnUyA6HT/rNvT3HjEowjPxF9boKWs+GBmCPA+T8aPMEJ16AE
ZVvy8FCbIT/tYfVmy0BKnJBGddNLji9gUlwzHnidlk6a4/X+DXdBnpyTCaqQZfyAOUGGE0T9vaav
Yv+CF1QSIOnReOxhKxsgZPf/2XcjOWZ1/OOWrGWeU6KMj8cLnOzxErFPn+Fg6TfYBm42yOPJk5GQ
qjkgg+ZtY1nIP3sGJrBhwIW4sfzjV7buYpPoLEGNFD/RWg+71sK8pVCNckjGTYz1DJbxJj4NsYmg
L4KzP+KWZwhwXLRuhtHnlm3bZNaohNth4WxXg+kbOmtsrFLHfFSmc9pUkvN4LEuirzTK4m9ruQ3c
lxXCqmpkUstEdF/lKoemC/4HBKNF9Ke9fQIsKl54Pw7y9mmC+1eV1a3IYV5JyZJcJCdRv+ftDMbi
bLwk062BwY7/BgkbELwS90N2u13RZZb9SGMsFzFwwOdaDfl2sclpuzriCmo4Ug6pPunp7b6fnMqS
lFsx036oX6iDai89IOHbHm3xZbEjwuz43pFKRJ2QvI839xpBoqeMS9CzTIgYlHVNaYhKrLG35kVn
9XMc2dNhEGy8MyEgAQ9rjatzU6nlw8syhXOReWNku3/5XwOsXzw8RrzS19C4xpmb8jGFOeDy2RPI
PttpbiLAicKyHO5rKJk9kZFBsB6nA0Y3ifVlFuQS2eDI+jDf4zr2JDHhym2dDgSegvgkiLMxm774
YlkPEGujF5PrRmDAdNhqvt+7SJIhnfEzl0l5e5zxyjEC6cnn4oG/N75cgeoZsNTfk5O11FTiVCnQ
ioCnvCcZ5rRDzwFy6URA4+QdH2K/Uu5lNI0aZBR+q1TfHJ+q9Tvroz+XgzIneh4CMdLlU3qNuQs8
VNjjfdG78cPDFQIoJHI5VZqKib1E3ueKiFmozSHxcKPfDpLhR/VtpzYlbNT5S+sLNnVWlSiLAjOZ
q3qxiM5xXX3oJFF4ZHJcUo47ZrCz/DGsORxNn5rKiykCVHgK84mDZsRbvZxOeO3vZQoqPkpC/gAy
utbpNcRnB1KQIi8WBivPqW4tasFJUDtmKNDFNHOpBffg4w+ojPNdze2pPbEBvwiG8K9SpAstup9H
chwm36VZN9k0Q9v5CpnIliyC/UDCCgxprI/sVJBrok3D90/i4H6NKK3jwcAkFUljHeG6a3lWQvak
0NLd7DJqBVAxmBZuTkDC/lV3/bxgQBddcJLBOqCJEuhRP2pV55itpf0SAwyZt20KjWiBIhSl9vrL
HKNxF0fhZ0Ea+onltRLKv/p07uOjc8ovl3OuuiU1iDx8H1XoitYKvB+H699T5Wy7ZxxFuWIxamsz
Ao3vjF0IUO1xnImlfCBQotgaqxdT1ISYb8ACL57g74wV7yWKCaSpAuosdy5DEiiCWU8U2emPluJ0
zz9vQby9RkoPrz9m8U7Kvg7R0M0yDYVrqnRo4jCk+R5Cd2KyWbdqCLXgRikXacIQLfRKG77zh2U/
I9qtr8tSqiu00aYzWPIf+knzFUQVBJlkdRdtHUhoXpCTMw0cYe44o8gpercL3mUCccfjhnDxRQ39
UvG+yNal8dMk7sKwZJN7xAgUHn72BV6i08eOJKhq3B7ae5FYgDV7KoXSg6rMec+M3rezuoSuqKpF
XXKKmN00D7FCx4CP77ZJ3oByEP7JbVMls2ogcEnjhDCVENTkumWrkCbOHrSMN6h10p+nTvvT28aH
wpkh7+v/lnty7q8IU4itQWiOIpvEWYP+9Hw8msxvk+JIzPWHxu3pxnp9liX2LDx6HkMq7voazRoY
ecaeJZ2LGTlKuwUk8el7IDDRv46CmegdC6TLii1HgmTXfv1zFdSalGj/IQ2U9IgvclKKccKKyZF1
ruco2qNH+JL9QCbdhMHz91Y6dI09V2uZhzLg+UM2Q78PMyRkWqWqFahG/YJ/r9PA+WmVuWPYxGlV
LEEbfwOvFO+Ltv29dHLw791iH003b819U3ie/q9ZUSFdPyy2w2/Ia8IPPQWmp31s3IfGI8dM5vmN
ck0OTSBY7g25HbJWQyHqDkxS6rdv00x9PmDGCNtYjqoYvHsNKi97Ca/1f80De3JYyGN02ky974C6
z3/bDDZ1hftXLSlHV0/8D68Mkq3XQQn2YXK8JuyegdZMmzpGRpK3n2aChvkZTnzALWXdp6yXPDBo
ac/a+1+dyV2pj0CU9yHzCsxHCmzvATHKap68x3gfHYqEn4wc6mISXlCOYK2EbJb2KSkKbbBijBeS
LqBKyhtNaytySbmP/SK/VjT4eOOMdPZWclVx7eddb7CcIxz73q8dcq5PHEhnYPuHbv3Y6O2vL1Ii
5CgceMzy4cBmfMaNpBgeHpr/PxUiREYLOBLfDWf7gjLqTBhGBhynRN/evkaX0gdegDh52aJ96ZKg
CZsen+jNlUbsLnoc6LwvFNAT2FIpRye7aZyJdgnfEIni42VhAhQBKE1pXelM9AvUFA2dG2fNQNIQ
NU688mtGnsaTHFxDYb6tkq9wWJx1ucK/fXPQZVygUV+KSnC511VK7fbyhC5U17Wr2jSMDdGktE0I
ld+5Q7hdtunVGCxQfItWpIZKCdiUqXTEGJujt8mCgbVerdPlCuz1S32xz+OQ8JP6WYGbw0Yx97Kg
BHyD80ZBB+hMRy7fI4J7y97fDszvbf3sWiYYnH2FfPecrE+I0fjVlkBatWsD0XwWeif2k14jqInU
VxiRhmNdZHNGqWHmRvPQN+NP/hGaR14LPOBiCPxbxTgfALWqnqQRYPHrP78sc2Yr5cPeK+ezfff4
JAkI3lXlPZka1ahXnmEcmq/IW3iWWCm7o5qSoilb/Vr6y14K7PMO7RcOYWKDjMftWp6TbuAc+UB/
1huxgosMtnsw70GAqYjsHmXx6V2QtZg0gdldW+o1Wk4ppdQC8D/n5hOGfehppttSUiLqLAcjzAyK
YjlwDYybzVqny6+XiBJU0PVs8pJZxhrYSGemD/pgByAyrQJ/B7mLHXu9Ck6jkdQuKaiD/l0yeqnY
AexOcBFLnhNUWTd9WgDyP42uYnE4n2EQJ2XtTTXx7edVDFEv6KUVMwD/+u849uFn/1VEh+hQz9m6
VQy1Zk+Ri8NL++M+yavZzD2GdC5jtvqEYJ/DL8aBf+qferxFjXNvz/ngDz0O2Cz2uOkE5MdCZGhe
RNmst1kZjAWQFaTj4zVhBJrON1wqkpEiYzY0M8JDk7Hyz/qiqMoLCN8HBDaYT267u+CZrDlyABXr
Jb+8Xb0vGUV3f7jovvAiSAQ0muYxmiOX73LAnF+rxJoCIL1hqVzqJPh8Jh116D87aUxEchEkZGME
WVdyjUSlbE6ycZoEyAHN/A13MZaRFMUXT6uNE5iDalVNGGo33caYzm1JIdrPR65ZS/N3nCHaZP3a
R81dVkqPvWF5wmobFT/qLl2SoI7jtN53QQkomPSMMIZzseDP3Yanbg7ehFccmJKfA1LrdtsB1b9V
sCRohNFQb0MEdkLqi5h6p/FFQyWSMhM4PtqK/zx+Nm7H4z7H7D/CFS7BVQo5+REbTGrI95QeSOrq
XobKCjL8qb2WDrIZVWm9O1MJTfbFZDd8Cwx3XUrgCL1YOoYTfuuNeaEq8rF1XsDuvHRr+Podxj4C
mjR2KVDVAWG+xfdWWlU+8sBAw8vWu6C7uieHHfzr02bx5lm5I20nwMf9EhBhe6vhXGMDs+giONTp
BBuZfljRhDaPTx12vasnmPnmohoUvM3hI6f5clmCug1eaUxsb4AroG2ovUNCkxjD74szhGrzuWLQ
0GymMNa7INFq7mNh/VE/96BsZIGOw934bQxmUSSa4SDxu2/Hhi1oDBV82xPr3r9OVf5vYakueGoa
Ykv96q4kssXEawmNlsqeLXId7UQUzHGGmXgGqNPv0wfHjk2UhOHNsASi7daAgW5WTmwspXvCKMuq
D6LEUaHVQm5TD7mtrCHTYqRGWUU+R1PCQQbGZCeulLdS+MepnJjk+XkYTSD9PuDPDi4yGlrGRl8y
BhBCe5vyGprV+dpmsLPplMpYx6gwzO0It+4Lb+FVEwPs2jereTObuIioy3wW0UnxmqQJ7eAkCu1B
HuxvCN6hygCf9sWbDtv+DdWRONXx/NYZj1nWuauZBofha0/aKgH1Ac+PcfmWDVF8p3tFBycQ3N0U
hJdNcPh7TIbixw4h5NTdD0pwu/M0c/abZHw/5YKzVNEWvNZuViO3Z72GnsanKOpZv9kbE4W+D7Ik
WC1TQuJOBVSK0uOH85vwlgSi65C5+yfbB85FBtk+4RjHueQ+4Dvs6MkOvVsCu8VTHosBtYrU6L4H
NICfmG/euu6rYbOr+s8LSB7Y0mzKloH85QXAeczMZ2yzw727yMQWG0WInnwuczfYp27hjvPSvAHo
x8W7C8VaRnDRZlWLZBHB81qqC/QBBmEVJ8JgjSRafwhIA6Uhm2cgEIPK7NXo4St2kp7Zv7h7+AP8
WDhcOBgMa9hXiCYDumhjh+K0MMp37aYv+dDBUmqSeWsVekaP3+i+qEUHujui2Wju+7Vkt80sITyr
X+4NFtXm4LofICL7hr9YSyroFpreOKf/7jNUOmeS0cAOBtHCX3mH9dDDxSGUXh7Eata2uext3eF+
WwX5ATB0f1RfLOFTMzmLUatOL9eswj+iwlDA8P61aZlkFXuWXmijht/DoUW47dOeA4/xnal8NNza
MvCyl5ndqo2A0WVy8humuiTxfOch3JjQpcwyhb71y8mE+VHFXybNaJ1KshkL8EwmSFeYzGoM8qAY
OJPk6Ra6uB1RqWqYiEQaGg9xcxdYb25LSCU9KANOeBgF8Xa+7eN8O7gTcriRnpEsJRoiYeOXnytB
07qSwKmrKtpO4xZPoGpMEhb+3X6kqOnetbo9IpiORSCi8qVS/LzegwSizGzha5wFYGohOyAJ4eQ3
oorL1nchZsItxp3CbCsg48vnvjEr3O8926m2SwL6oHyvVABJhtYqh/njFFUQXGRXZj8ob4lxmhwV
59zFDSuSKIoHHsFQhZbihMzKVsjtl1TkTk0bgykQ6VVURSI5Ns98Xy7lHK0KHRGygyTkr2DxkWm/
e5UmfObZyJZqnPNDQmrkyQpC5JjENzYp89+tiM7ZYRlj/KPi3QCG7iAfjaf9gI5UuUS3sU2Ux3TE
Pzgi2NOYWnK2WbGYyi3zPO5dwxW6p0dsWLd7ANdAMlnwc8xJJ6CmAy5pl6D9Hw6YoZX1jLb/uycj
33J7siIH6Zwp1K2VRK2qPYJL7t+sHM2w1zTbSqGMCq9lotUZx8sYies+Zlg4746hzYiMaKy2AHtH
ByzFief7uAXu2V5sLVuENvsQmeL+UzSefuOoyNvi+38DeqInwuWnsmC+DRRv8HGquXcr4HfiOVRK
IZAZEQoOwjVmfjCO5KKYRq1/QqI7+2hCEolFCucHaqsjtkP3LGQiQGlDVwkm3wSfvKjC+6ar0c09
6pUxbPXZSfIstEp1lCJEUp4kKSfX+eCkuCpWXUd4wZ9e/hi1RxS9c2wUi9+Gx9T7mplGqYdZURxw
wnt+Lr10yX39JBphjo6pO7aJQeERPX69LJlC2r3SxCQDeGqIcwYG8wEw/9nTpMLNi+JXwzRjTXH2
xQTf2muX+HzcJWAY8Dx/tqDFtwgCmj4gr/gWf2h55KACRrnabScQZQa5po+6dcvn9D5XZVLOVuLn
Kkp7P5kGPTa8dvovl5v8/+pTl4FPxRJIadWWJtpJhwrlcPE3Q25eaAdXGmfXY+V6921RoHWci2ri
VuKlfREYzUyVTfRKLyXbQQnbPDWEldDXj/Zetr5FdUMHPqSrMZzexIihUAGEO957hVyxNT+2jvRL
nHAPHvKusr2BHptkXDnu+dK3exXyazWXAIiPC3rGjQSFG9q2pMNpOC7TYUL5GQrE4lzVk/P9g9Zn
xzcEicCrApP4tcSzG3OaoXDtFDCufHgsVObL+E2O2lOceEE8yUeyVZl4ZgTXUoigfBsEVE4DU0nH
hSt/H6KcBkolPRyMdoVB+pgXLS+ntUMIe2axORsylunY8TyUCvA3fKPExEDuuI03b46+at7BCprv
7fmor0wM/9S+SRxfbVxvB8VROsXwVNtm1FfPmOqMe5CO5b9nzaR6ChQdZZISfvfoQ7m+GJm+pVj2
KVZ602MYx7K27maLu91lp245fzz31PsuC4SNP4VcxyA26oFOn+QltcCb/xqxEoa2DON7U+qHRknK
mXhA9jU9scVsuNamGpTnmubfb75bLJB5sl3Wenf81Y/08Lrc7W3m7YN1gIT7Jlz1La+WFJuLiio+
dhy0JXxjxZ9wxkXxBuWV4EPfzR0904cBPESrX17yAgAun+xlnEwCQSqfU7z8JQQWymq/M7nwt6Cx
AUDFlgGPS3AqNQ1LQek6qXblpa12EiRe4qLdxF4KQvGePvSA7/AqRoI3XWJHl+n8cfTvRksueM+s
D2Fl+2+CVudTufp9XJcpaJwctEsf+QFY+4WFALO3paVa7WKaX+hznYTDD+oi/3Ehy+GL9yOsIKFH
eZaRktgbmHw+Ocp0w52PxSefteTzVEurrnNVNkMl4GKBLjZ+ztTON3pj4+HSoPqFd08Kqvm5ok5h
DMjw6psPMwZPfykm+wWHuldHSem/VwxXaLYh1bF7k8nJlcexmjH8H1dUGtT3jAsYeddiSQjXgerW
3FkspRz3GIRwTN+Y3yFXBpsAfexR8XJ3cEQYgGEiFnAd52gJfeH3ecLWBmGKsRhTTiBI7P4YIU5g
2GVdRpiPjL82LGOoKoU5oCVTtm6cHTDSjTWGWQR6Y5ISLNskPGfp8ludrwSjM+sYEq99iOU9QM1F
LLRCkMYoiO0t7xEWh9O6e/2Td2h5Pz1CxdGNCZ31dPQREJ2fEReavm+Hvb3AHE6bMmECluBzmQZ1
CjoriatncFgJfXtvcnWCWfQxHUgYK1iOL03UoIR0LLJBsTbfm3TvdKEMD3ePuyaNSanRGjQSZUVe
hr+y+3tyREw2haBe/HCvoD8/n4qu7yb6UI64qva5yDzx+HRGZpmLj+abtuqJJJiDo32p6arbbJHo
A/ytCw9oRQRsRv6x4CNs08IMvm6GuV0ReuJSkRc9kxqYMUX96UgFHImHP9Y9bmluOeDcCiXHtd8i
g/WvOI4UBlhuY6zn0UyPuS42M4nN5XPl1RRxI84oKB2FLSnOaibo2FxAdyop6YM4js22+EcJfnBA
nEp9A8fLPKgnrZu8iWRBNRQcGtccMIkq/zyOUPByxjTIZxE3Jy650eEVb4PoT8Jmo3YoQUonPT9+
aVJMhNez8EGR8yLOw6Ln4MNvAZtJJi/NQQtbQ8Ub7nundiUYSyhLRukjD+9C9S39FgSCtE783nM6
DfpNgrN4V9hoy+RC54HY3lA5qhz88VnwqiqekRL6W1SL8OoUxOVGW5DhvtJTfw/d93Ev/1o33LFN
DQyG9LS/6TGwT2FOizKX+oTqne1/3MkbCToTVNAbGp39aHlzLSU3DoBVWgXbipxe8w55Iw9PO8Wj
pChXH3roN9Aanrs1tYGd8E3zh5clN9abdoTt25S26F06cDQk5kKkUp0hjL14C4R4xFEQb4nm2E60
alGu29LBxVAjAEvDUl1JNqwhvd2Vp2Q17l07xAHB+8QjGC2XAfE5hbc441uIauijFNIy9hjfmE6R
glChgdctnepLjiBDZHu2tdz4AoHN9TbMptQdneiK+aVtinxQFB/vgS5VY7haBxqfiEVf/dFyTzHp
khIVN8aJZOrvv6+Dc49AXxN7eyTT+lHhoHEMXBeSEWKOfDiHjhYRxXWbzYLC3MNQX0HGjg2WPLz2
eUCxNQHvOJCQrlqfMrA+EV/CgJMQWcyg/0DTiMDCqlbpvsF7r4tRruWlhGWClv2BK4rM5raS9yoM
tqGm0GRbf80OfoeoA5EioUcBCjfGovixMTWbNuDsRVPN+5ARD+W+7zHIVtMbDByJzoxMleH+/j9b
U5halG3RBsR0wkcG1Sa6Yo4AAzD98mvQzfEy170x8i5v8ZP33SJ+TxuSQ7yJaSBCPVi1b1+zig6B
JrTrtqDYeENpJ57/+/uZJXrIY7CoBc5oF05TYaj/7KBKxdcHfyzoM39tYozuFKz7cBJ9ROBjgFat
3S6XruwERqn7uzo/uzjQHvNYh3BqajyHHrb5dqncvt3aWc/qMTgwgipISK41Vgo4E3qJauCIReR/
5aTmPHsFL+cnOVbPfkFR6Mi6TvlkE16TMZZQGpnAvndsIi6M801b/7f3X5QkYw75O5h8tN38FrPS
IrtZOuH72A6X3RXotAg4GT1a0Qk6c1zPPLHD9izQtPD/cBA1n1lIA1e474QIw18+B9SfzEyjRaNw
k0h5FIbyJV0zcenLUDnz2kawyYA7r8oeBxTZ1lJ3BfJBq2AnIs16PVKtTOW8r75/HflvY1SsXRp3
sOZ/jCl8x2EJB319gg5+tWrzYq0Hkg34+ebzspmtNTkaIbs0TeSTbzbjzCfiKyOxEAir+4DJ7U0g
zqz0Lyp12M+pZrC5lbVrbi67yRbzbehHu2iyo7jpvGTCa0OW/d759nzTDT3I6ihHBFBcAnNMYd7y
Ym0aYE40ZyFWyOpAPXX25XX5wPIIjXAAHa9YztB1OQ2XgsiaAmHtr8JTos6U8OhelqBf3pEwqFfA
UdsgSnRpXZoxyBEzz7IYS0bSv6erMGFw1Q1bkRi4LfruBymk0CNey1tAICoWYsApKMurprNq59RY
U3MMxVJcUoK9R6FDWTDX24rTsjRLvlc8HqHXrQe6TvswImiPfI+pZ7G6xIOVnVTiVuem4kAB3pqD
3gepzhOAnL0V8RvWExUNovRJSs383D8F09CL5OhHbeRzl9UmCq5PULMyg6qhfxXhR0sV0ku6+0wM
CRzvtQj6SIsugFX2vDlutJ6MplNIXiCoHQOs41sAiiAsiF+axKwlmoIe5JIACA6Y5Xezcc9YJqvZ
Tk82On7oKGVPpvKeSEUiVdEG7iNorEb3XXXVCQtL+kr9XRF50ljElPIj/P3FVNfUD3qErRMyjqdY
58+wtnkWO6m2zylm8eaLsXiqBkM8a3TAa8TIzUXQ2cJdYO3XuGZCbyDuNq/YBAK2ZBGpowlTjL9T
hVX5hgmzLXoaDLOv/0zKaP+C8mW8EyFNnnRbSS+BWAk+ftOTFNEzTBHanICqCYp20RXh2piRtEol
D7Mj0dflD1BkAECWeblrul1CzYIjjfGE+CUHeOEtcZ5meZeF4ldt3RIz4LebgCwkAkgkuBjSOvc2
RUNRIn20uuqZT2zqlNa0EqYL0lLNV6NBBj+snikWSd/jSx6UKjDbPoZ1Jow+bO4fadT9L6r4/okI
bwdP5eWlxiKsXzpx1KqapwchWEqB0bwpdDJ7xDdDo62lDTnCKs/oc57K1YavZoqVWKYNUpTHOQ+f
75vn7uUecVBKq4eRYiEu3HpCvl7qUoetGjgZkmDbosfKydUlKRQCU5bZqG0SSd+0iUIlIol65ZAw
QZ4Vq+o88rQpTDeMpYbiAq8TT0/uhvhSBxHSIjIR551oqyfL376xmizlA3P+E4Dk3iwxvdYxQd6R
ySlP5v3xkZ1jAleJP56+rPZ2vw6zDihpi7jMW5rM3NR6w/q2JW8YyLoqeRU5j/miH8HdRvuAjdhd
Or4LoEzcJeJC/8edW4aEbid+ghc8DOHkaV/h58ZlXud68dOZKMySRILGSqPA9LDKGnJt+C8QZIjh
+yDsOmgaqoTtTi/14VBpDhu7GryeyZUWLA9lXgPtZK13m3QYSZ3zEk3Ytn2kI7zUa4eYD+qTznhf
5QrpTwlt6XnbRNKA5KV2TgZXE/P5EzLfQmK2BE6lN+8m49pIXwD9+qdB+vTOHTlj15CMESHLCGth
MdRS3yMotDtLOFcBOcMy5jNg4JqMP1nXC7cbZHv+JwQ1mdD3L2fkdOnWL5Yv5vJQVBC4K6kavrpZ
NISt7fe8C3tE2ozTLlLMyE/F+ualODgRXwfe1VXcycgiXwPxguQRiHr+CFF4MV929GNHlM8mwNig
W8RZswBKoD8ZE+pHNxGXNuHo76ZxuJ0/rHoIuD4cSMWujH9LaTP7c9DjrE1mgj+JOHpvnL1UGq+A
Zrfa+4GI7OXGX840afCCMYX+RyI0sSpSD4f6ZOT05PRP7sqY7IFK/4EotEVqR+kb07EP2VE6JIon
MnresiSyUMybgsGTDj7k9S01PCc48rWcDS86b5OnBlrFMMJhEOyY6W/AnyidNZb677121jfKPE9J
59TnviT91HYomB+y7zjtrsdD+n31m80khTPoFIt6MVR2rqlwN6Tibyg+HJLif6FwZ+vyPrd1QFmc
l/yPYHXPzzf30OxM27MlxIKlA+JVLN8Dv3me2F7+DYDOz8z8puYlxKMGBhnH+LsOgg7yzbV+LEj9
felEEK1c/gca576BM5tK7Vga3SiIR99lhAQZ4qnoHHlVxi2gR8TnrymsNeLJv+sMTmgwbP7LGtj4
H5zmBGc727oLMXDEkrJPFY2TnTdJ9gk9ZrzSwy9OhK/c4t2vF5NPrmy9e887HhA8Hw95RnmzM+o2
zNbUtFrpWJ0ljT26UyF9CCkw6CyXnsh/mCKHEM/cVVfa2bvqK2Ukkgy9yqU1m2cxBxBr6oy8MgMz
EOpZl4/ZV/5FufRLM4X59aoAxqiRJQtcagFFTidydZKuDMn0blxZBOtaMOF46H7RyMR9KKWPAkBM
RUBKU7His/lHWFsxtMc9yLLQLdNJaW/Y50Jaoq4cczDuje+uFAIYtCgWKD0X1YsGxvYE0xYVwEQl
ncS4qW42RyqB19Gbcgioo9RPXFuAjrLxZTf4SrBdoLO7MJ8Sdf6ySbPJmk9azJtzjguP8OSY94gy
rSzO3yAryjv3zkwCtejG5ZED8LqedCPlKvuczTx2LJTUc42Xsvh2lU6UxP4uBX8FyF/YXRvB0qAJ
AxcH6jZe8zaNAsvPIX1vH4HpAQgCvtsF4kD0YlaAk2jWx/Ci6g2JW+ePwJYkNkdL1uWd1VNeClxC
ZDRTaghV/sTSSvrPvvND6AI9h7XYOHu0qsM7OzZfsZ/WsHjb/K0Yu3v2bENXF2C90NLuI1imefF+
R233U9yDwG2pGmRs30dnne/5SvFahmt6o2DK1pTApe+15vlwYOUodUW/c+zOwDsvG3IcaTi/hHI/
IT7URIa5McizeJRc2tzB8v85cIPafj7HKAm+0hNtNW4AUhGy4xjQc5DbvUet1UtKCBvTGNr9zXLm
1ifhJSKrFj+gbTR/k74KD/4zqJ4jQMbtPKOpx1y9Xo3QoIyOw+M4rAj6OGfCOxV5InyX5vE61jHH
zgyamSbh7GgttBVGxih4bG4o9NpRUMrR+xWVAvM01evXeNkT2yWQ2L07O3Iywbe2kFLyBomUrX+o
y5+1Ej046H2ALEEboN26f9tTbJimH6yKYP+kOYm9GDaTXBPhkGVZ62wzkJuRsVXm9YvJnVymT04p
PQJxglQlgPisE4inXbRqmVPmoYLuZvZN/CL5LKWEqJAl5GcJvOky4dtL1G14YOR5AsEqqrJmING5
1e3mcUgv2XGGAIBocRr2MarJPz2QDebtf3YCLW+O4iRtke6zg2jVapgnfK3owDUHUmrHKDSYX/7O
uZw1NwrN1s5evTSiOSCFLrwvu4Yftyi5sYue84E9sVSJLmOwThXwkVju/1K2pRJIKi1jq2pV7ULS
Y9TepdSNDQGbPwYJgEdOHN3ashKvpZb7qL83SU4OLnsGcs0UOZG1qKQ1oVn/gqOK4SSr/F9fbkW+
pctk3MzwugmbkuqgYWFUWbwOGt/zDkr3udd9H+OaB/dm4WTZt7xCKL/o8h97EH3e4PNGoZUgPwKr
Acx9MGoo2H9uwKvNnLmeXCKnFZR0BnJ0Ln8e3pokIwypJWmSbk91YB3C5xnuFvw1/zwDWI5td2Cm
36pSJl6uXxkfqjM/ARFf4E6IwRzCcIzs0DoVPUN0PGsOsiUXSFGdJH3gI1/t9zLEnbAI3THmeNuN
WtP760r62O1jqJVawmGP6SZPR7RqYv+lj73S1SCThiqSSQvsMhDHgedPor5GGSnmO0wkQTZ9n6F/
nnn4r39po9SRGEksRuyxOcYmDxTm25YOTlxYX25qVVlFZOKDODGRgJgoyoGvlea0PtY9p7i7aONA
4iWvBcmiSG8DMTBwhgRKSsSLAEjKMGgVtONs3QCmqObcPKlHf9C0nwjSeImm0L8SIaRc4tHG0txw
1as16XHeUVOb73Ytq5RnSnunvNsqepvDyrj4PKQ07Lumvg6WnF1KJ1BfOahMBUvHXz9kxZj37p+m
aoKrceTjNBLW7MSWTtB6uR+qycWdVFC0611uARK7mPbzFN53zoORFLA8im5i+Z67ylDKvuJG9azn
b6bvKOzqIBKAWIQLLRAMuuAwGNn5Ov0qTD0KMkaz3vLvGYXrZbSliydfspk+jL1wqQb/yncvlnWt
EurUtbOUAahP5Epx1H0PmGauMwQW+Z7cRrTZPevWcxAt9Xu5tHWxtcWxB7kabh8jtzMJ6rKcBJzA
2qGFOYb48FkXgV/iWgJNlOMAo8sa4KhJp5N3rQPF3vaDok5/m7Y2ZmlmqNZWTmiQQbLUHlP7TB9v
oXm1hHM89yR6CRV2X3umSXfca7eQX6ufLR2u5SkM29PaHR1Arj+W7SbyCYPRrPkuSdzmLQ1ZCF9s
9UWYB5KKwxWlz1wmlAM2OOSkIfLPMslQ4MIIlqcFjvPhZGXRxFGUcNuZRrAEN4pBDU6eATvfxMr2
oHTS7a+3WYJcNydzhIdbE8+borGcB6YB/66w5Fvb3ZI6eb67z/vTgbB/d2ioAPGnM/+hrYGqxTMG
afSdgNlPvqKgAHEjLT82SVk5+nqy+NtJAaFBSJYhCaKOqu2u7bOSQJm3W5hu/oGKt7jSuJnV3lQb
rLBzLczhZ3WYaIfAXopZYE92RnpzIA9HEB8X3aqcJLHQQCa4mBcFmsvgSbjTTZCLthd1n5RvbAb/
9vnx/PqejMcqzXwHkBG4kCqOqdisJj4bXy9860wVoC1s0C0HGIPZ+teLTCEA+17fMc2E/fSGuSMD
BEIMwzDRbbPiCwI3JQw2hsa9D4nEU5hm/On+owRWJPG/SHMZcN34wDGhz7kOSRJjvwGRiKhlGROt
C1c0Tz9hiXdY44v3+EFYToRVkCmohWxOHEXd5VI02aGAXhP67zreovDcEfwOVhQWhNSozLQ2Yj3A
2epV3lcr/VYkJ/VsB0xOvGrcU1wD5ej9LNxMRMUS8SoUnRDrxUO2L/Nm7MaJwmqOntNaDyH01K8Y
zFgSJvnNjGVMeOxIXgDC0/UpuKHBk+e3yMRBGpdIGSrHjcI21AZs2ZLqu9XuUssw8AAVQ5/aSI5p
Wjgnb079A9zFo1UOGuLHwS3iJtbhSFy+KhToJ5P+/c7dkWUbBDjyFxUzvDYc3pl2ZUEaEEygG24O
rkHmZiYUaSd8sHF2Zt324/cIK/dyWxx2GAyHUoQvvqOH3YwISq9ZQPRbU4GuBsPbGYBqkRW3UMX0
TaQgxZwFRjpEVyOE20dRIvIAWWq0kBIk01KURVJIGe/V/SiF5SrAeqShdzEx/S7CWlkWFKJQ/kF4
z9oQ/K4tKyeigP59lAkP2f1xBu/AR4x+t/BGOSTDJ2aFf34PFV8K4RM+7kit5sv7X3bJShb6YILn
ezQNcrYlAH0b+hEJzTNNscIbXQvuh/nZDa6Y/Vtbi7YSpPcIXCAoEHfRdBCb6QN4txto75ZKyxLj
IvlfYd0skUwLshvgkwm+WAXdiSISj3uKo50JUPZfFw9EwGnrLKVeSAaUKuQF9GQL7ZhwxW2ir4lL
X9LHZQc7LGIBncS0gc9JfbUQdkfDSItXVp1R6weMoq6ltrQhLwQhZ3JKOlCZhoTS9vl4THz2NG3t
Ct5CLSVBAc57bvk0eSWG8hiIzIyl4KOyWB1u1YUn2YdQclajyIWW7BnPzWqekT21yCP+yTX15ILR
RMx0dwtWA/HXha4i3QPPchEjwWQGgpgrZvpUd7tug9mMweTjWGg/lz9t3xaMYazkznpBFw0XBsX6
tAsFi5J9o45uZTU3gJUn6ICbp6K+G3RICtfuPurjMoV30wu9U+ZXF7MewfbMs5rV5HxYL3iQj6MP
3HlVhMeFaIjmyirE/1L66CMNu9Ayd8EKVZcGsrKn156yQnj6diyz82O0ygHDgn9ox5fpFwBilx1P
/uNWIOOKzpzUUEl76mLnMwyHsbjPW9l0SEzxJ2tDRSJE60L0gT7RRsW30Z3lKRdrQNsB94Thetlo
cr7g5MjqOx6eCBYhlAq3A4J+tPEWLzPZNBiAM2S1RHilIEI2kobTRllwNWf5bXtlxS00RpF49/2U
x05ibkL9pcRkhL0wG0bRo0eiPrFFT7T6hlLLJURXVMfFY4CbldWjEtAIgUiHzpImqehap+9yjIqN
PLwN+rfr491BYPfckD5N53RBUC4dRxgo+ghb2CV2Eu/I56zkFhNWTnHaO4+p579/eYpgZKR/hoG8
aIQPowz5WAseOMr8AVVIPVQ/NUduTLz1VqYo/kNIpXveBeBPCJ1IIWSZp0W7KYxwskf7NPjz0759
kdEHiMbC0u8TGcf7QPxJuoUAY+wWeY+Wcm4Pdsc3RdS1mGuEWboSeQ/UrXvPeObfmRZPh9h/U/9x
cafWaocaeudXC2tPTGUk5XGI3fzKp4JiVi6sieDlPxgBzHauwC6Wo8ZLk4tMoB/C/D+ZKvrmM6L1
n5TMqeO/cmNg06MFW3X2Q7heKzMphO12OhaYGEJ68UOwkEXRAQDFnBsZtp90icbGw+o05TbgxWvt
ccUcly2kLGWKSAWON07Lm3uAMCSWS42BJ3QJdb112x+5vO/TKfHqxwET5+dspmduozFZ//7Lr7zm
g77qO54s+gnM9LVb29gHe0uGsgcux/BXhNLcH5v2umT/C4lrfMOopVVjtc4/97Sc2DeuVQv9Qdkz
nTxfEzLdGkaaQ+D5ZXV12UcvmOuY7GHQoEuVVRjv+eLhHCXn9zjPyvrEWa78sHb6lNQL1NqYw8r1
LxDV397nYts4RS0sF7EWIH7BR59F4447C6eHa9P2LqhbVGkG1K26Xbq/90dsrZBkiJNKfMcDSiYB
CrdkOJVKJ6j743M0Jb/RW3eaEKQEVlJvkOkOnMndFDIaaBKpHdRdecASCrlGIwQX+/Qy9HVY2hN2
EUulDeZmXwFXcfNbFov8PD/o4tAbibFh9H7s50QvvFh5I7Z1ZlDPh4Xacj7i+DO/y+J7ygPBoTiL
7rUtYBEgg+H9F674t+BEZYbXtP4PrE45z7o79rM6Qlyt1dyRJixnlygKQE0NzNj0k+Q965KfczQu
s5iID4hpxznjmkINW7tGIkFIhou0mEoxADCyJ1CDOrH6A1MmPBXgET8HBfC5onyHcdfswNnlgUDf
0jGBHObHVnVEcYBr8ZCETvSAcxcvfhbtyieeJwZlSv/yPjV77Vzd3aRXm55bO3yOPKlOOnE23KQD
XUeoCXdAIlt4QPVcb6nHUPemeFhKdY45j6uxKmnxmLM0UJbUTqvrPkOD3i9JesVYVNq2VpRirpAn
cd/78j/Bl7zdu/LEIFRPy6RCqeUYe4LtGp6HyNHM4C1t1JgAU3BjvX3JANzpDmUW08egLNJkG8Wz
hiRp+7tCgQwkDVTdXq82Octeh3f6kf7mYrlugat3jLtQDHks7eXYGMPzeGuk1pErt26SZsIJocPj
dfqSeuJpKC8AdAYzZz8jy/bPqHy3D68piIN2E7K2puUNYasgoXlU6QtiLbzVM92Wk4R93t6xTVqn
bN33sRvRfpGj5A6mUUe1kaZKc6GK12CXGTHm/DCQmldKbD1mn1DaYxiBdR9uszY+U5OojSx6lTJ0
z0s16dXw4vCT9LxBoNUBjuodiTH6Kvew2BBaN6INK1HN+SFdu8zOgS5EfvMKa7B65qqJxXALs71m
MePFMJITNi/ilsEsuZKmWtMAq5ZSUNlZlGD+YDKtPQjac/NZh2FWJoDMbatCPKiZGxE6MarMjyR2
Ma7pM9sQ6snMMDIqTT2C+zUq0d6OhLPgwnCs1U9+d6ivYw6K9iNIyHe+NUoksvJMPCRweYWlMly8
mgtqf+MCW0HN6il9nag4ALSlqUGHs5B5dWPklEGxdezFojsKaLG2PqAsij3lfvqgEBqdyV7S9Ydy
gYk0r9Hrn2sDlD53JNxyMMjcTEx649aGQ0yaP56nH5mvF3X8TbChW0IEjwL2B2HsHhwvqPhCoIoK
g2P/vDuHnnDopFzBLBClRwccvlTVmAvc1kAwcgWJJP4h9xSo5q+xcDia2QekTSlwUoaDKkBV6BY5
57kk5j6XBTXaWvhjkiyL4XJEdzDhcWEmK6Z8yx6rMW57r6rXlPhyC68pNrxqQzZ6DI6R4GwDgVLg
WIEg/YbV/lvxqgECFW8f5iFPUAFzPKzZHFBxluVagOWHvUT7kf2EXiSxzi3ZPFLWbvVz/jubCRWC
NtGJAaVPKKnjgR+qbq2hW9VfFGFyqNdFc46oITiWsTlXl45/9ck7imSNN5HdHVoslIvGSRFUrTZX
csZ7by19fXEpQn8ClJL34YzUShzU0OrcmoiwaoCZ0NaG0GpxuuzZVgEbNd+N8yiQ+JBg5KXfNdOM
apY+D0Ri2mowXxX0lIL5mz6wucLXhzKWkRjnJGO345t6Escsccy/ki/jYAv7anIYICcsb4Q+0T9c
++v/sJA9wfRk02TC1+xM420jNv9ZtJ0/eAv0d1hK5vZdnjF7LXsc/jvJeUafrcQwjwprcpfQMje0
fnC5sAOz2svoiroiGh4IzBUYfzTqRWWZDJyG35tAh2iHit3EzV7LiaSDl00aUyh2TWZgl0dl2Npi
/LYTZI4s6yIufTXAyKuk4Z8YORE/kxGd4EyJIZkTUCbFqdDZApoHdK/A6aR3UYcW9GNtkE7kAdlp
goESLz6eD5QkIuzQPupZc1LQL6tLy0csCXqHzsWEMEy0YNksl/Wq01DH7i7QxgVh/v/VVQq8lEtQ
6GDldhLzkTUPjNIgPDaZODIOqbSTxozF6mBTTBXs8ojmFd41z12UXwki7OIG2NH4CK04i47CsOq1
XfmfWM0TLjLLg07k6Wfl6jXPnKDuxcjOVFuYFVt/tc8lnbtF8WdDS+/PUWtcxlux1kz44+j8XDun
/48MkyoTNByfWf1FwYHpvW/rl7LqNdphNPyeL3GsuoNDAKTxLFIfP+p7pNHhF/eELRuETGftti4H
zUGZKmOXjrngLwGuQVMpdDxDUMcyGpkGc+aNvGSf3BsPw4FTt3d8Ie/d40uqBhllKLflM+Y/H7D1
DvcslM+SsEgC5FA6JmTDg5rvn18o4Yi0HIFafH0LILldy1y8e1ObwY2KM5/ryznYGDjZu7waTFVH
dFL54R3LF4K3l2LW0Mbt9swgaAQNLAq1+qreohSiGS1jB957euC9+OFDkkLzzzcgvJaKOMZMqtbI
CJDHr2hMWjhLsASFJ0iqslXr7cqjYhwZiBVPPl772/GUYyWWmTwz95AURiq/ZoTNtlFBbrZ4d+/6
FKt8t3M/1ek4DEeVhRWV6PqivT/JMZO/Tl4eGyb/mhv0kfyRHj/rcakFUWOh+HXeASEKfWkBIclj
lBadEau6K3km98itEtoujkLN6brWbqa6FE+39+f9Xbpl6FpIQqxVxjABXyLrgO4/6i/a14AWOdOD
zpbcfwWqoH6pcDCPVd4LqoZQOLPRbJbpf++86X3NR8nnGV0FWcXbUNXPPcHBWH/M/Ic2EwlI4zWY
JSAzZo4F6Sqzl/R0y2vr5Cl9i6lo4F5JRjplTvXkjjonPdeY0tGJ7NkVY/3PwCigOhObhY3dDcf3
mduQFdbcXbbrnZFEbkq49ulMbvDJVP/Bxl0eO3Dwuivdn8/+h9n2NZExW3x+N50KYUGT2b3/vl77
ItJLIl1t73LLKhKvcHC8na7CpF/4zLCiuKvPNSNHZBl67NmUg44F15vLd5EjS9gTshoXRv973rLg
zMTUDSR/xkDR/J49bWuDy3xr7vw7h3U+FfJpHEMkWz24HYyoHTcyxxJmbWyWSmA7obGKk+KhBY7T
zFk9ga4MhqXvWYp+SxJJhy5Wbsh67E6hYzfDevb7w41paeiYKWgmahXgUJGrl0cup8NBvqtFUtqf
2WoXfbRxYa6xAKYz1D4MABKjWLKfmIV7jWsB7QbpjlZNr/Ow6XvSne/uv33hUDO9X0UjVRISCLkN
J1lWaiYWYVMhYVdNyp3xHV9BD4mFpLdEhOjzqDbP4Dy8MZYmB33GscURPZCPgd1+JOvidZy7wky7
ERqQEn/EGRAI7HEvQNfDNJDy4mwDuOvZaZUapEkpmpRBtmDDu3M1lZ5pr8h+7k6jClQK311fDF/+
8M0K1parRf79dw7GUBIuAcK/rfP5LEFNXU/136qakX9q/LynW4x5lgFNASYYDAK3HUI7cF9I+ajn
7RhtZNUiag62euBDeRUAjmmBkkoXYOemcOeFf0e7TPeVUmcplEjaWx06dUFWzJEXBzfLx2ZFnq5R
EHUcWGhudpp0QT4QOxdiOOux0s1kDeGa19x2B8ciqdr7E5e+RziCeHzq408/F/Kt7SmlEM/yZ9Zn
FiXObzg3pMnizLIPCK761gbO5Xia/8t0RsB3Gs6Ucd+x6k6aBzZN+YvkIkc5iLbyHC9MGYZN8l9l
PdJCf4iVp+wWpagTAv5DzLybW8ecJg0FLkDe9HBAISYywYG1No3KwNI2hd/FdiWz036q7Mt+PK3A
QLaFqabMRKB5zwo/AvS+XZ2sckPWSz+uE7KsCaw7DGLVkBFvgHyf7Tqt+r8Spf7vCm72/tHOpG/W
4wEYc43ao0okK/nWQWdmF5gPV0fXYHF6IueNZHQXVFmCe9u5Y1UdfvCM6KQsDqO+3qtkr02Hwfe1
2UYsEjIGvy4C5fNAVn9L/eWhUqq33XBFxnnI6zjSIxQZ2kzeKSOKSrg9FbRj2W52ORPvU2Zm1eW9
DvnNuF+6pM3FTJNflRSRmLcACVAi5q0ArbDZ8UEJmCCEcVcBtB+wuVsJ77L1esz85jnFH4Tbj3iV
ZHOfAO4jXzNlENxyeMhZJLpgR1wztBIXoU9KbDULVHc84eeEmeN4WBvpvYuvC0P1KIQVSeJqMwEI
z64fIvY0CRAQKyltGf76ZdRKYHQB+M+HtoaG3cNLsjbowyk/L9lPlxPWJRodM8rPvabyTB+XWD1s
2kF1nmMb/UsUusx1yiDssKiC2y+kMhNYGtq7IsXkkNp6EF+KDLSu6DVmOMByftZ7UEqfiDnq3U8f
aC29z7UXpMp9x+pEGfutm0dpzWQpyfMRm8By5WT/1vuko5atKWk0yv6oTFj10nenTSIZmug21kt8
5d4Osaaz7B2SiZywff0hzAcaEDO178KuZ1v7AdMMtbYhnDDK/nsU4KNYtJYzJP/Umr7EnMsGtlPK
2gq/nf+VHEWYpVPf4yWBt2HjhtNgTbiC9AhbBkt+tDJPBc6XBtorBy0RsB6YN7a7SPleJ5nTxsBr
VLx2y48g15uijPQvgfMMQmCXamfiI2uXgzhX9ATd4/t43aNVzyJIDcZjVYUY3Nb22iJwQWHI61Lt
uSBXAR65EBf3++aFk2S7Wo60LMGJ6d6q46nsjI2DjnYaLL0Bngld6NkpiXQ2OGI5DwrjZVmTV/5s
qephCIv7weGUPDArH6AWijrUbwYjCOJtIsqYFDf1/NGAWgYrL/JtjlQ/5f2VJvQmAR+nDKh9yQfZ
HXi0YsxVqOkkmVW88NVCp+NJMgm+IAA7F6q+wkYqbdc73nk59a6hUSrOEsafGcaDpbOdskSKTwQK
zdkFpGkAX+Z7uhBidkeBpmyVwRiwCe03xHR1DktRGpUgVhziR1sp7p8y0x0UHkFAZh5ICQvF8RmW
VMaxx8gHugkGehGDhTNJgS/mAc3hWaliZ5hBhGlYtCIQqMhqOOknK28qmzKY/hdk/YtKit+xue1x
JImIwSQNUd+RWmPuhPiTKTIuQG6m3vmkwnu7j6k6GDuSw40v5r7H6KxLmlUmaW8q3Sv6xWXq9HFi
VWPTvISdP9tIlRC/mRXuPst4dGxLAQAW4+r7IBGs3pRsCyC+0j+uZ6VYkdXBw5zsfTmV+cFYAQDc
ZNJ+G+uo+JgPhA7n+lSgqANqc01XCvOus5Cp5Y7A6HziZEwk/RyEaop38/RF6PuM1aYj6WoCalyT
Z0EcAcZ6+PmKUBS8e2yZb/gk8VrjlpitiAUYsiveF4v6LxYds24iHgNDx1qccahzeJcdMmBj78dr
5NINyIxQf+YxdER7tOXALbtGpzZW0PV7D7QLuYaNtYVbi0HoNbqlcHbDYBKz8iXDITC9YtdQKlc3
3qkTrQbC28dqLiV7VbaAQqvbQleWptPWZdYRHe1JhhEREjTcT0I1fBYUb+LBIAoeu5iycPn46iTP
LDy8ez/LTyzvv1VFjHzq7iYoIs0BizI0WbIlLCHNkzEWVU0KojONvJEqBwFp+3XrKsHERhbLXK9E
fEHnqzGhS/JvDs1DFHLYbgdrFckKcP8y/rb6LFqt2iJROR+5ZDC8JHqPEFeZR6jJlkdFmNu2HIi2
ZsTt9tanaYZcWzd13rj1jhrRByszhFBD10jqWXGCQvY6xoohtOIAMGbiHwX7WNULQu5mB7E6OxmT
8xQbDe8+3jw+IrC/sVTvHycG8n9ddAFNvbOzGIAXuIJjutqSRGHBmHqrbbiys9Obko6HP1XC9BGu
sCwD18MR+oJWPTi/MvVJfiyONtwxSlXY4VlYe/hobhm/oPg4jj/RbAT4s4yW4WkJnRDC+1CeRzqb
Qh0EmadzyxzCeRIEU3YbXwrEzyDjmbEIG6GJG15wY1wkm1N/PrUyst1vcq1jdG1kmuQ71NMNZjl+
0Fq74oEvpELEkbgTSJFTYAwfluvrZFfCTJd3a3MEk09pDrsOPHYNMqbTb3QoDw0b7Yy99V+UObeC
rr/nf9r3sglPqs5OnrYe6Fg9WgmE/epKISwEQ9SHVIEzt1TEFe8/wGCxqc76t6AtKZeU9cUj1ulw
DNjqskcQhSHP8x0pT37RxWqP9ZKi86Fdv95+wIEZerK/lelJSM7uvjNL0MyCP3yUHyPi9eOIsxyo
tj+Tk3IrTWsgbJhhTUYk8hUpsBWjC3xaghIc3aSslacjiKt79u8NSguALMTpBq7hNimONUUpdKf/
d6inr8p9QBSTDDWngxtCaIvidYayWSn5YulSVil6WHIwV798MQjR3Ja/DswJqxpsly0l8yselDKF
SJhiAYxW8Hqsu3Haqs6pLfWgs5NCBWG3sd9IhrdNph+6IDP1ev7juBJ2lo5g8WskeZvnvOWqihQG
B6eagDB7Wk92u5j8ntJQNQlBemWyOuOVuLkNLpXqWJklGryPCu6W4wRhWAP61QTrkh5lYBcJcMnl
r1YqhhTC9cp7Sxz62yJUGmuKa+a8El1lx5uddfHXgtR4HYtu+KhqVVURMLQ9bGOqxjbmQ0KLslpi
vgCDzxQaSnoFeW/koR5tSR6Pj8xHgBDY12dbKIKLjwUcWraFMgzYB/azr85SWdY9t3b8dYD72uzT
DKdxrOBCkXbsavTyXlJN6hDQ71Y7ip44kZvTzh0AL04DQxKfvv4nVqJZBNCP/TWhXbwWieOtdRs7
WeYPTaUs7HBTH5xeWPXY34MFwekVg4tW4b1VhzAXZRosls19m685aSmvyRNfW9O+GsaoxHpBApbr
q+uTYPX9+CbgceFKWHDlOIQrBEhHJoHGYZ7dJnlb7nrOVDNt88v9EA7u6d8kM0kpuE1ATwzOGig4
Lto57nC8qkzME7pRYmBu5ikNPFlaIiR6EMrQx8P5uTtEbadsAJcSKxvTleikNbVbzug1sGTHw/Ha
ZbOi4uho3u2MTz68IXbQ61h1F+qp7D6hOYeeVEC+/+YCc5EabWEEZOqOpIY2Rz7g6TxjZ74gR3v5
0vk67ZKNx0b3F2PaTQDzFpt5r7Gpt5L4realdeSkNDfUmInK4f2Ih83hKQnb/NPfk73YnxdLkU8R
xFYN/KBoRBcdUcwmVj0xGIHcCkxLX8fqga/lELll0oJIF7TkcZ6opzIUIZjAptfp5Xvsx5l8Qiz/
Wi0nf++9lKamyIVFwm2g/554VltWlqsdri7fWcZt7u6cCr1WQOqzbddSB6VeBgvwe6aRtC3jELv2
zfZXvqrl0FUrZ/iI8+PfQ+rCQfAvWinQkYclTSlq3JdtIs8NBuYQm3WVfAHd5IkgXPGWnBktzxBb
IMlw+fAt0P6f3Grl7PM5nObG6qCmADrKfPxczTIm35jpAbuQrvg+9/Q5h41iC0SZ2nOOMSoNjg+k
L8L7fWsvlF1KjP86qn9YYu2TpSvAczw7Vcq3XtRoT5m04EkIj8CQUwfXXMOuDq95JFPnVMzB6PoA
zl+qy8Yp5+eLUCf9zYNkWsraFhNO8DxcGSPNe9OJto+Wuf7XS8h4XQJGsG7UFykFW+HZounRgvsS
aPhG378xwKrYsp0yRLZNac68XdL/7Ui8xV4qsa5XMAZ8tXf4CuQIP3vCYSGCFMU8bS3+m/o509Ff
2bPGsImMwQsIBs0XZXmcGqNkGYoD0ZPWrifhsC3dygWzyWZ0T99lwfQyYVNAWmGmYbHCn9+wHuEq
J8Q35cOyzrr8OOrBC8tWdJ3ReX/twu4tkBvPG8WPlG972g3/oBb5bac11NkoQmOCAJUKYpkFZftt
epmEJzJ1GWhasBbxC0TUjEMzHHHwO/ZFQnYueRjNw676O72Fvv+/lxmU3IfEHeOdopbrql2K2puO
YX6+hIsMitjs+G0y3Llgszd/uuxBhkiPe8HVGK+Pa32P4OgXnjn7pnWxYpB7XrzAeW/xZeQgEhG4
lSAeRG+ti7TmwW9SpgOHJ0N6FjwlgGOcKB6HslJ+gCcJDUSu31YQIQZ7n1J/AJxj5QkTgth8ko9b
F7UzUEfjHA+NTTLCqj+SPPkhTChdk4zz/sQ4OaAw8KhNcQRbMgjCtji4O44/gQSBadzZuDrYaeXx
zBsxzbG2JC9W3nlLMzqK23IbOtP+8DijCnHiEB3PAMZEMddpqf3dcEVr4rPYJfC8vvFHekoFYXBe
288XK1PIs2t3GkTmqaEkV7sO2W7TExa65q/aFkfUCN5WyD2BAZoVIDJ8nokecOcL13Hzs2E4IxLX
+Rbb1F6kefjLaGQ/nFk/8RqxBZKDhdx5IBQGMCTSF5ddzWq9AUi+t/8QBmpVAred0f5xSLhqXNT1
M+DWSZt+jPNWCXiR0Os8DMujhIblgWgd08dER4SdTDM5GTUKzikY9CEkmXJGY/EGhHR8PYDHKlsj
YCHucydV2uO6/oFff/TMG0FSryKEp6mNe+nbL3kj2G/vPYH71M8LH5ERIDhZ1o5KNGamJxKU0259
bm/Cna39QwuCC4thoduUBGlmsIakrnJn/MzUT9yIsFWUPqfD1cX3sNwF8AJtEomcIJQRd3hdD6Xj
MFqsnPnlj0K7isB0wDbR2Q8VOBsFr/F/s0VFc5DDenDnAan4AV2s+2qwKVf+0S8qfLtcHxQePDqD
Y7uVfjRimx0M1AvYSYWktIdAwVwwHcJmUjOV05zHfR2trD04wMeW0BPappMLmdoxJc4dRPbi4QlY
dd7EHIpeUziXRp6K4UycJQVcF3AidzVqaR1Ha0EFwdG93wRCBLEGZhPvSV6wbKpGrf+hsiDKhtmt
UdgHCxz7FIjE8B7wKKDSjM3LIiy6fBTrfTvZlf26MB31fy8M9C0xbN0uYF1PXPyGPXl64JRSJLej
rQCqfC+IthanyLx9hkUDBWbvJB6QNkmtb8yD10NezSJgI293eZ9UWMCZspXbMyjY2FPEqxNTUVch
biiqt7uhECLSII5SToAnKFVouYyA0N93j3Akf3AfAB/cVYNbcbWoYcZ33ygZHa6AU2REQv6fj8LR
14mfMyEHWMoR7VX+AZmqbUColKhKuWkpVwK4QTwDP8ZjJdPYdQUnE2R4s0i00ex6i581YjgRTksH
9iL6320XM+bp0oWxT5rK8iypiVHgVM6oE1X2t/g1KMXKqeUkn4KQ6vpe/g8FVURZlt/wcQdiBe1J
kpO+YITcJ+CBH/A/arimJdaEj4XtmxhLQRsLcpABvVjokltVIpUYa+qX3cmjpLVIu9q3AAWLfb/B
024IZnmdY421vxIOlzI3GfbtWZfj+ERnVyJWZN0323HIQ6twefBPVhRBrHHr0pR7xkVOT7IIL8MN
Yq4j9LCdvkQa4GmvzdZ9AJIPnysjgCVku2C2Z+f4GfLipKbThB6Tjs16xORqpKal+DnWaH/AQ1e5
nggbeB+TUZ3ih7EdJEsLccxYvarDSf/dxAUJtZ2gttzP1JETocrN2ZUpx7iM2WWoyZnkQKqiTD83
qPwhMWuiFoVB6/TTMi/+Hi+DMAZvzxUCOMGdF4CTnjLq4Ln+hTW5+Fu05k0O+4q9ZNBluNJ7BUl8
J17BXSDbeM2/jD3nYXy+Px6kN6ktpTrmeRRhudA3Qz/w4QPLHjpjlFoFK4Sv/oWUlyFh450Maa3Z
7GWcTuoq+eBQuJUnZBZXGKrWQNTMiTBdVNbvW2Mlm2XAoUoUhaSB8D1GlCHOQ010qgkWUy244/R3
OLpLKqziaC/EZ5rLJxlnjQ9TevZRr8jBe5X2X3vXFw19He+C+X8lyO8zMAvCVkQlgosNilTegsNU
sM5FgI8Ff6M2o0jUC7LNY+NkD9ATJmitBYxhgCM7af/lY1x9OBkvaDk0Eg6Kj/28x96RgbuEaa02
tiU802hvY0gSjtQX5ulBIODauhP92RPvYowqJyIfPDZk5XjDCOxOKRJWycuQIJZ30tI/wvCvYsPA
3a30oLHpozISRN+Qw2bh1PQHWvebQ6mo86+DDOg6VfBI8X5P8MSXawyrSpMbolQCWnlfEwE4x1w+
XC3OdPGLbALO6qirOa7OipYg0ICqX66+0x6tZzdzkIm3YjSrjuN2eh4nheDLlkzaKbBAETkGqBE2
cl1fSRiAxnLsHPcoDOpvV0j6wUSRiArjkun/3rAId7rhrhEs90c23wR+RUb5qoGzqX2w5lNPne64
BgYtOKBn7gPU4yMO2Ym1mC9v4KwluH4wl5KgH4QY9yiZC8XW8WepSO9PO07qc9zGJRel5I8vBIPx
PI9QF5P52GU4xQn9aBqgyzjE1MasBC/OGmeQCHlGRqb8QL9dGuXrR6+Kgao96Zf+VTyOEHgPuApq
WEE3KgUlqwW3KHP3Aixq8ZwkcSWO4cVp4j9e0G5hRluN+eR5rd+2jOrSpB2hiCUOepnMpUXlHxPf
itTjri6Esw+RvpROiOxJtZ2zeZIEW+/SFvgLAXcgr22HTPDn7LHt9w6hjNdER2u6cE2RLZcbIeUf
uX1hJ5fACWpMrhexIJW7yJ+N0UsZxMYZB8HCAg8L29dJmxRDut+d9W1WTzlNN95BLQOXd0JjR/D5
3YQsOuEFTf68le5EApUwO4K6Fx/kGjuwtcEJbVn3hpWo3AoA05s59B1a7nhrr9XqkN41VHjy/8Ca
T6caGwsk8bKtl6/pH6jkFSMmIMlhKaokJ8NL41KVczOm/pgHXCeBkBHCUv7Og7jwl3//5PXovgpy
ZLoMesppi8aEmKDGvR93DpccMh+QBNUbteSQla6u7pVH6T6xsRSiO1GDJqxL5JLIpywuaKGRA8K4
Q3CxNI+3b3zornX+8PIZtzvAYemEONaPflCWm6qbWuvBWUTEbNtdqgNQzTAUKFQVD6q29m8iUALz
8/XifgBsoZGzC1i30Wun1P/9O8MFBnnwq/JqjLUpBa+Bgnbce0L8eGEucW5spEBYWAoXzoYf8uA/
geuhXbi0D4ubWxb68rTLratsPlhvcrHOaoNykxY6IUX7yeX2YfML9x56S9jyt0Jgat/Ruj+PbI3C
3/opnS1WyXlrM6rlTQtlyLdGjSSvN2KJcTV94Yi1/JWx/8LA6xYmUfG/B3yEeqgn4+t78nogoNFW
vPO3wfXmA56oBLqFgCxVHgG5x6N4pKvm1LkFuMPBIbSABEFaSlsFbT/v9upnXyB6y3dAjDBIiUcT
dBVof4FJvAyqHrcLy4tbuLozt8DhFf1midqqvXEHoAngdanBl7GdilaT2tyGbgMHA0BFLeoJ8PfG
pTVxQNlvCvISOsIHTp2JMZiqDGbFOy+UL3dCyuivlg30oX0QDGqrFl/VqqEfwsy+N0kvpH13RH2I
HWdYHWKiJPUDJIq3eNfCI3Qo8Gn5pm4gxV8MObfMA7W9GGaE
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
