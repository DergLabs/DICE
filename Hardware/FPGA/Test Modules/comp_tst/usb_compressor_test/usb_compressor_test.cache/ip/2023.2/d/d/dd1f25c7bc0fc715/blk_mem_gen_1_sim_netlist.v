// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Feb  1 20:53:01 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_1_sim_netlist.v
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [2:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [127:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [5:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;

  wire [2:0]addra;
  wire [5:0]addrb;
  wire clka;
  wire clkb;
  wire [127:0]dina;
  wire [15:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [127:0]NLW_U0_douta_UNCONNECTED;
  wire [5:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [5:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "3" *) 
  (* C_ADDRB_WIDTH = "6" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     6.158622 mW" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_1.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "8" *) 
  (* C_READ_DEPTH_B = "64" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "128" *) 
  (* C_READ_WIDTH_B = "16" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "8" *) 
  (* C_WRITE_DEPTH_B = "64" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "128" *) 
  (* C_WRITE_WIDTH_B = "16" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(NLW_U0_douta_UNCONNECTED[127:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[5:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[5:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 53040)
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
