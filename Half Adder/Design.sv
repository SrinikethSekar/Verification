// Code your design here
module half_adder(int_if inst);
  
  assign inst.sum   = inst.a ^ inst.b;  //sum
  
  assign inst.carry = inst.a & inst.b; //carry
  
endmodule
