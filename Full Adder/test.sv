`include "environment.sv"

program test(int_if inst);
  environment env;
  initial begin
    env=new(inst);
    env.main();
  end
           
endprogram
            
