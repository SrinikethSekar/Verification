interface sram_if #(parameter ADDR_WIDTH=4,DATA_WIDTH=8);
  
  logic clk;
  logic we;
  logic [ADDR_WIDTH-1:0] addr;
  logic [DATA_WIDTH-1:0]data_in;
  logic [DATA_WIDTH-1:0] data_out;
  
endinterface
