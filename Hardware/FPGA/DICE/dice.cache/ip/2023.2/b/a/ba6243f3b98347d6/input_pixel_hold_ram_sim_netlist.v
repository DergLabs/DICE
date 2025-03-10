// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Thu Feb 27 16:17:28 2025
// Host        : john-linux-desktop running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ input_pixel_hold_ram_sim_netlist.v
// Design      : input_pixel_hold_ram
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku3p-ffva676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "input_pixel_hold_ram,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    rstb,
    enb,
    addrb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [15:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [11:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [15:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [11:0]addra;
  wire [11:0]addrb;
  wire clka;
  wire clkb;
  wire [15:0]dina;
  wire [15:0]doutb;
  wire ena;
  wire enb;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [15:0]NLW_U0_douta_UNCONNECTED;
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [15:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     6.641901 mW" *) 
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
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "input_pixel_hold_ram.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4096" *) 
  (* C_READ_DEPTH_B = "4096" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "16" *) 
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
  (* C_WRITE_DEPTH_A = "4096" *) 
  (* C_WRITE_DEPTH_B = "4096" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "16" *) 
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
        .douta(NLW_U0_douta_UNCONNECTED[15:0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[15:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 57056)
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
