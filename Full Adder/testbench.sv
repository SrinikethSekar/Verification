`include "interface.sv"
`include "test.sv"

module testbench;
  int_if inst();
  
  test tt(inst);
  
  full_adder fa(inst);
  
endmodule
