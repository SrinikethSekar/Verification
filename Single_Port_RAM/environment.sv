`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  transaction tr;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scr;
  
  virtual sram_if sr;
  mailbox gen2drv;
  mailbox mon2scr;
  
  event myevent;
  
  function new(virtual sram_if sr);
    this.sr=sr;
    
    gen2drv=new();
    mon2scr=new();
    
    gen=new(gen2drv);
    drv=new(sr,gen2drv);
    mon=new(sr,mon2scr);
    scr=new(mon2scr);
    
    gen.my_event=myevent;
    scr.my_event=myevent;
    
  endfunction
  
  task main();
    
    fork
      
      gen.main();
      drv.main();
      mon.main();
      scr.main();
      
    join
    
  endtask
  
endclass
