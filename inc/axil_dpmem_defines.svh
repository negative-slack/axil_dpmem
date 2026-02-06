`ifndef AXIL_DPMEM_DEFINES__SVH
`define AXIL_DPMEM_DEFINES__SVH

`ifndef AXIL_ADDR_WIDTH 
`define AXIL_ADDR_WIDTH 10
`endif

`ifndef AXIL_DATA_WIDTH 
`define AXIL_DATA_WIDTH 32
`endif

`ifndef AXIL_STRB_WIDTH 
`define AXIL_STRB_WIDTH `AXIL_DATA_WIDTH / 8
`endif

`ifndef MEM_DEPTH 
`define MEM_DEPTH (1 << `AXIL_ADDR_WIDTH)
`endif

`endif