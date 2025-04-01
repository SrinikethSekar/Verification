`include "environment.sv"
program test(flipflop ff);
  environment env;
  initial begin
    env=new(ff);
    env.main();
  end
endprogram
    
  
