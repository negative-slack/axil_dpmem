`ifndef AXI_IF__SV
`define AXI_IF__SV 

interface axi_if
  import axi_pkg::*;
(
    bit ACLK,
    bit ARESETn
);

  ////////////////////////////////////////////
  // Write channel signals
  ////////////////////////////////////////////

  // WRITE ADDRESS CHANNEL SIGNALS
  bit AWVALID;
  bit AWREADY;
  addr_t AWADDR;
  size_t AWSIZE;
  burst_t AWBURST;
  // logic [3:0] AWCACHE;
  // logic [2:0] AWPROT;
  // logic [$:0] AWID;
  logic [7:0] AWLEN;  // up to 256 transfers in the one transaction
  // logic AWLOCK;
  // logic [3:0] AWQOS;
  // logic [3:0] AWREGION;
  // logic [$:0] AWUSER;

  // WRITE DATA CHANNEL SIGNALS
  bit WVALID;
  bit WREADY;
  bit WLAST;
  data_t WDATA;
  strb_t WSTRB;
  // logic [$:0] WUSER;

  // WRITE RESPONSE CHANNEL SIGNALS
  bit BVALID;
  bit BREADY;
  bit [1:0] BRESP;
  // logic [$:0] BID;
  // logic [$:0] BUSER;

  ////////////////////////////////////////////
  // Read channel signals
  ////////////////////////////////////////////

  // READ ADDRESS CHANNEL SIGNALS
  bit ARVALID;
  bit AREADY;
  addr_t ARADDR;
  size_t ARSIZE;
  burst_t ARBURST;
  // logic [3:0] ARCACHE;
  // logic [2:0] ARPROT;
  // logic [$:0] ARID;
  logic [7:0] ARLEN;  // up to 256 transfers in the one transaction
  // logic AWLOCK;
  // logic [3:0] ARQOS;
  // logic [3:0] ARREGION;
  // logic [$:0] ARUSER;

  // READ DATA CHANNEL SIGNALS
  bit RVALID;
  bit READY;
  bit RLAST;
  data_t RDATA;
  strb_t RRESP;
  // logic [$:0] RID;
  // logic [$:0] RUSER;

endinterface : axi4_if

`endif
