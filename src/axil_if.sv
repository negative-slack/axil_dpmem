`ifndef AXIL_IF__SV
`define AXIL_IF__SV 

interface axil_if
  import axil_pkg::*;
(
    input bit ACLK,    // Global Clock Signal
    input bit ARESETn  // Global Reset Signal
);

  ////////////////////////////////////////////
  // Write Channel Signals
  ////////////////////////////////////////////

  ////////////////////////////////////////////
  // WRITE ADDRESS (AW) CHANNEL SIGNALS
  ////////////////////////////////////////////
  // Handshake signals
  bit AW_VALID;
  bit AW_READY;
  // AXI-Lite signals
  addr_t AW_ADDR;
  logic [2:0] AW_PROT;

  ////////////////////////////////////////////
  // WRITE DATA (W) CHANNEL SIGNALS
  ////////////////////////////////////////////
  // Handshake signals
  bit W_VALID;
  bit W_READY;
  // AXI-Lite signals
  data_t W_DATA;
  strb_t W_STRB;

  ////////////////////////////////////////////
  // WRITE RESPONSE (B) CHANNEL SIGNALS
  ////////////////////////////////////////////
  // Handshake signals
  bit B_VALID;
  bit B_READY;
  // AXI-Lite signals
  bit [1:0] B_RESP;

  ////////////////////////////////////////////
  // Read Channel Signals
  ////////////////////////////////////////////

  ////////////////////////////////////////////
  // READ ADDRESS CHANNEL SIGNALS
  ////////////////////////////////////////////
  // Handshake signals
  bit AR_VALID;
  bit AR_READY;
  // AXI-Lite signals
  addr_t AR_ADDR;
  logic [2:0] AR_PROT;

  ////////////////////////////////////////////
  // READ DATA CHANNEL SIGNALS
  ////////////////////////////////////////////
  // Handshake signals
  bit R_VALID;
  bit R_READY;
  // AXI-Lite signals
  data_t R_DATA;
  strb_t R_RESP;

  modport slv_mp(
      input  // each channel will be in a sepearte line for better visualization

      ACLK, ARESETn,  // system

      AW_VALID, AW_ADDR, AW_PROT,  // WRITE ADDRESS CHANNEL SIGNALS

      W_VALID, W_DATA, W_STRB,  // WRITE DATA CHANNEL SIGNALS

      B_READY,  // WRITE RESPONSE CHANNEL SIGNALS

      AR_VALID, AR_ADDR, AR_PROT,  // READ ADDRESS CHANNEL SIGNALS

      R_READY,  // READ DATA CHANNEL SIGNALS


      output  // each channel will be in a sepearte line for better visualization

      AW_READY,  // WRITE ADDRESS CHANNEL SIGNALS

      W_READY,  // WRITE DATA CHANNEL SIGNALS

      B_VALID, B_RESP,  // WRITE RESPONSE CHANNEL SIGNALS

      AR_READY,  // READ ADDRESS CHANNEL SIGNALS

      R_VALID, R_DATA, R_RESP  // READ DATA CHANNEL SIGNALS

  );

endinterface : axil_if

`endif
