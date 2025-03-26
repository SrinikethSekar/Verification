`include "interface.sv"
`include "test.sv"
module testbench;

  int_if inst();
  
  test tt(inst);
  
  half_adder hf(inst);
  
  
endmodule
    
    
