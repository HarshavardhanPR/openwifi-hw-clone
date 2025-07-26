// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue Jul 22 22:15:09 2025
// Host        : MyASUS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ rot_lut_sim_netlist.v
// Design      : rot_lut
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "rot_lut,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (clka,
    addra,
    douta,
    clkb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [8:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [8:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;

  wire [8:0]addra;
  wire [8:0]addrb;
  wire clka;
  wire [31:0]douta;
  wire [31:0]doutb;
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
  wire [8:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [8:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "9" *) 
  (* C_ADDRB_WIDTH = "9" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     5.244 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "0" *) 
  (* C_HAS_ENB = "0" *) 
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
  (* C_INIT_FILE = "rot_lut.mem" *) 
  (* C_INIT_FILE_NAME = "rot_lut.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "4" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "512" *) 
  (* C_READ_DEPTH_B = "512" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
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
  (* C_WRITE_DEPTH_A = "512" *) 
  (* C_WRITE_DEPTH_B = "512" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(1'b0),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[8:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[8:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sbNGmomEbP78s1hfxgX3P1Jo01EKJk0i0C7iGpF+Yibr9EK0s4mcIifHDN/ag4jpPwW3bPllMHvn
U8AEY3mO8hCXVVoilrcRuCaEna/98GycCzy4G7FnYMfowsJb5k9ifRdE2jnurzeTLFbupUSpDF0H
Rl3Ci3DTGeExAZZ9UQE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zZZZoIprBFYfDWmCCcduELBM7HU98/+rvP9g8+y1mYyD3r3HEDm4ZwehwZvPoYWqoGXYoFqWZh3h
utt0abIfUW9/oF2vJ9hXn7nArtcm/Eui18rPYqp3aj/AItPNVXojk9zp7uFZLPTqcyig5v3Jtenl
qPnLi1Z84ZCW7NIRw6Y0bgmw6z26E8VPbYrZHs+0YW8Sztjo6CdIrQeEL5WBDolA0aHoKHWRZyFs
l5eRDmBAolj2uF07t/3eY3J7cYJmEDaoZ0TR1qcz25VFNu0OlcrEJ19IT+QdAxTah4jqJtknGZrT
6lUMwDZ7dBQwF1EuaE6p90gGNERhGAsbHLdvaw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KUbz0Iu2faeWqD6HFeuGLtSOAlqZmpKCCJfzym8tkcWUUNgNMn2mYvx6PTM7j4tyig8JdUG3uZYs
NfPgAsNXQtTI7b19u9CkMks9jR+oEzX1rW7QtTvSj/nHZLg2smoFwuB5Ieb7/B8IIs1NTUrIz6Rc
itLQVG+L+GMziamsrx4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
G7XYdRx9VGclyxTEtwMG+rjJHV8bfBxEGdkcN82UL3koN3Dt0M5AWkzEvHcskt1W0hTOjyYgmvYj
/p70w1nz96tlg226+e4UubpRmBH9QXBBX6UmqIwSiHj9H+XI1yNfTIdlwBKGQvfzwCAMwBwrrrGL
/804k5Ux3RhWRvwezZB4+sj9DFm4akREVXmNpfeqjI2X02LU/MxWMUbKxvjJnD9YxikAAO6ccTd6
8DKv76V76MEFVyXc7E2FeQDToW3lqkRTa6MTpIXbYSekRihQC+qPVuhPUneA4kepvQDfgFYE8/Ir
gu5gK+s/qNfuXhJUAqyLjslrUcY4+XD9ckpSvQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YXkYRXpUPv/tETnwnThdQ46UaPmI23lN9vrxHQjIOhq3WNJCuz7TYZK9hyzSdo6k0U6QE9ihQy2L
rYZg68RGbrK8bzlcnQ41r18LZb4GYlAn9PH7IrF1B+aHm3578doOZHf8wzUE2s+d1aHQIn6VIZjL
14pCTAjErJfMO13fgX6h8sgxb4GFC3eIORmkrq2J/fB9HALyh/qdGiLi7DejMfmdsssbOcPQTZUh
6Belf7fHTkIEr9B44rFZgMyrMVx4N9p0XpXD3JPe7Xeg6a3jxdqxHATaMuLdIa4s+ZiAz1TRx0EO
FFihCnLLb7weBBITQyTIncRL817BrF/ZXZD8Yw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g7FbNw1ywd4TBNHq8OmK/4zoKI/t7vKmyT8R8SeiyUtKywhn0/7DZ/lV0Lf4IhY8X5MYsKtOQ5l6
DIl3fxtOhxpi8NHn9Nw3Nfb8NnS38Zuy6DSpwOL0f/GSmUSf2/YdB5Ben6xibQT0Oy//oBl5/1kR
pV5fWjj8WRgI6cnmfyj3g1MxepxPu1A/UHxlm1/i9yUHHi114N/hEQ0iujjrn6GxfZSiJUVF+r6c
rnxD//eOAl/YaxhdU/KhUkfsMn+MxtA5m6hTYYE0bnze8rpmEU5UGYKyY0p8KUs+MgsdTe+m/7gV
HSf6puBqQmEa1qksRfl742aL9B9y169or7Jp9Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kd1A2zIphLxXB0RyfHIqLkHXfWl0n38vROERuDghYrhK0ItcWGEP0XBrri6k1VZCSPYwiSu//pM6
83BfcPKbk09/A+ksvDIa3xS8Tg7DJK2AS+0pdnzBSjVWh+QD+glA3Hjk6LG9OMbjXyqD3hnMKacA
VRMwxKktV+KT5NXj5a7fMxXjo9exc0xM+woUJiSYs8onoUSwfBeH5/xhUy+iu+w0/OOydQE2LXZ0
1y+RObiz5C22dD4GGCfuvUCGAthYpUf633ZxRYN45mmAn5PxPsH4o+l2GhH/50Gu/VPVoAWDhgXQ
e93oPri++HinkK2uvDhDl4PI9HtRkq11Ky3uXQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gDrrFgXHVyBo+Cn0bYn+SOSOCXPg7besukY6l0JmA/nu4gap105Wxbg11c7TJZ9ctHVLc5DXAxr+
EIvFpAIepoZBREtMjTlaIdNJ8k1nUpwAv2jaQeseq1TudTjugV1jtOYYk0RKd88z/6SJ8t9urDW0
yKqsfEWU3PwGcUGHOWtTn2hfAceNznmEIFWLmFmzSQJ1hQNdsIQn3jHnfMVYu8cAz5xvPVQWYyJW
pMHXhNYk6GyAjIshh991slb1g01K1ilR2tKD1EmxH5WGrX9BEUqBjHQo6uluC/d3mvcEQ5nJ1v+P
hIlj4qzUQT1wXjpk6d/BvNx7LyWmj5iq35dzNm+cdhfGwaFGG//vgmB6D/dFfs2BYSjHsa6VlpVM
7e2OgoFenuG9p1SVPI6gAs2MuFtnDKfxW7jS3RGhvsquS3tg1iFCDH/OU7E5aWfY7twF3yyN6G10
l72RZw62DfNoCdyUMG9sA8nc4qf6dEhyrr5S6XxpJhoBDJvkeq0TCUQZ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XR7vRF1m+9DS2Pv4r/O4uHwmvtXkChnKbsJCYczn1dvkZbcZSbBm/2UH78dXUaNorOh9XAuCvSjb
ER73y7e0anAfaIf1tJ9Y9pIb8EuNxGS/Pqdvg36cWarwGac9tsscdv/HWfb5Z+qWEk0/uFcLI7pH
CZO7fF2/ONQjA0NtUFBjW4idlx8WrySIuJgDs4jyGkMhbHR3U/ghF1YhMhwgwsbbcptfC1XLrIqQ
OecZnZu8E2hyc5eK/ccYdKcHnXoL55z1p5amI6Fuvz0wKTz2QQ/mwXodfGjEC1ZRWwTn7zCFM91M
qrA1Is49i6pSa7/VICjgn8ULMT1oKGfJLPm7hg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27056)
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
