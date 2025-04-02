interface sram_if;
  
  logic clk;
  logic rst;
  logic we;
  logic [2:0] addr;
  logic [7:0]data_in;
  logic [7:0] data_out;
  
endinterface
