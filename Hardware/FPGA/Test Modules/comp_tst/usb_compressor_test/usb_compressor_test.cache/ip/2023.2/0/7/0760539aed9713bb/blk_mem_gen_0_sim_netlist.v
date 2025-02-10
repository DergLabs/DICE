// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Feb  1 19:58:49 2025
// Host        : DESKTOP-U9NB2CD running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    rsta_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [2:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [127:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [127:0]douta;
  output rsta_busy;

  wire [2:0]addra;
  wire clka;
  wire [127:0]dina;
  wire [127:0]douta;
  wire ena;
  wire rsta;
  wire rsta_busy;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
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
  wire [127:0]NLW_U0_doutb_UNCONNECTED;
  wire [2:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [2:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [127:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "3" *) 
  (* C_ADDRB_WIDTH = "3" *) 
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
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     11.862564 mW" *) 
  (* C_FAMILY = "kintexuplus" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "8" *) 
  (* C_READ_DEPTH_B = "8" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "128" *) 
  (* C_READ_WIDTH_B = "128" *) 
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
  (* C_WRITE_DEPTH_B = "8" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "128" *) 
  (* C_WRITE_WIDTH_B = "128" *) 
  (* C_XDEVICEFAMILY = "kintexuplus" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[127:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[2:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[2:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[127:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 59968)
`pragma protect data_block
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
X6WyZg==
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
