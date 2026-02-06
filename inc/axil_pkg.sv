`ifndef AXIL_PKG__SV
`define AXIL_PKG__SV 

`include "axil_dpmem_defines.svh"

package axil_pkg;

  typedef logic [`AXIL_ADDR_WIDTH-1:0] addr_t;
  typedef logic [`AXIL_DATA_WIDTH-1:0] data_t;
  typedef logic [`AXIL_STRB_WIDTH-1:0] strb_t;

endpackage : axil_pkg

`endif
