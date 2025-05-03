`include "environment.sv"
program test(sram_if sr);
	environment env;
  initial begin
    env=new(sr);
    env.main();
  end
endprogram
