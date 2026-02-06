`ifndef AXIL_DPMEM__SV
`define AXIL_DPMEM__SV 

`include "../inc/axil_pkg.sv"

module axil_dpmem
  import axil_pkg::*;
(
    axil_if.slv_mp axi_slv
);

  data_t MEM[0:`MEM_DEPTH-1];

  // this is the only way I found to get surfur waveform to print the memory ! wtf ! 
  generate
    genvar idx;
    for (idx = 0; idx < `MEM_DEPTH; idx = idx + 1) begin
      data_t tmp;
      assign tmp = MEM[idx];
    end
  endgenerate

  // declare handshake success registers !
  logic aw_handshake, w_handshake;
  logic ar_handshake;

  always_ff @(posedge axi_slv.ACLK or negedge axi_slv.ARESETn) begin

    if (!axi_slv.ARESETn) begin
      axi_slv.AW_READY <= 0;
      axi_slv.W_READY <= 0;
      axi_slv.B_VALID <= 0;
      axi_slv.B_RESP <= 2'h2;  //SLVERR
      aw_handshake <= 0;
      w_handshake <= 0;
    end else begin

      axi_slv.AW_READY <= 1;
      axi_slv.W_READY  <= 1;

      if (axi_slv.AW_READY && axi_slv.AW_VALID) begin
        aw_handshake <= 1;
      end

      if (axi_slv.W_READY && axi_slv.W_VALID) begin
        for (int i = 0; i < `AXIL_STRB_WIDTH; i++) begin
          if (axi_slv.W_STRB[i]) begin
            MEM[axi_slv.AW_ADDR][i*8+:8] <= axi_slv.W_DATA[i*8+:8];
          end
        end
        w_handshake <= 1;
      end

      if (axi_slv.B_VALID && axi_slv.B_READY) begin
        axi_slv.B_VALID <= 0;
        aw_handshake <= 0;
        w_handshake <= 0;
      end
    end
  end

  assign axi_slv.B_VALID = (aw_handshake && w_handshake) ? 1 : 0;
  assign axi_slv.B_RESP  = (axi_slv.B_VALID) ? 2'h0 : 2'h2;

  always_ff @(posedge axi_slv.ACLK or negedge axi_slv.ARESETn) begin

    if (!axi_slv.ARESETn) begin
      axi_slv.AR_READY <= 0;

      axi_slv.R_VALID <= 0;
      axi_slv.R_DATA <= 0;
      axi_slv.R_RESP <= 2'h2;  // SLVERR

      ar_handshake <= 0;

    end else begin
      axi_slv.AR_READY <= 1;

      if (axi_slv.AR_VALID && axi_slv.AR_READY) begin
        ar_handshake <= 1;
      end

      if (axi_slv.R_VALID && axi_slv.R_READY) begin
        ar_handshake <= 0;
        axi_slv.R_VALID = 0;
        axi_slv.R_DATA  = 0;
        axi_slv.R_RESP  = 2'h2;
      end
    end

  end

  always_comb begin
    if (ar_handshake) begin
      axi_slv.R_VALID = 1;
      axi_slv.R_DATA  = MEM[axi_slv.AR_ADDR];
      axi_slv.R_RESP  = 0;
    end
  end


endmodule : axil_dpmem

`endif
