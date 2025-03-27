module full_adder(int_if inst);
  
  assign inst.sum  = inst.a ^inst.b ^ inst.c;
  
  assign inst.carry=(inst.a & inst.b)|(inst.b & inst.c)|(inst.c & inst.a);
  
endmodule
