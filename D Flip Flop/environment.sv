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
  
  virtual flipflop ff;
  mailbox gen2drv;
  mailbox mon2scr;
  event myevent;
  
  function new(virtual flipflop ff);
    this.ff=ff;
   
    gen2drv=new();
    mon2scr=new();
    
    gen=new(gen2drv);
    drv=new(ff,gen2drv);
    mon=new(ff,mon2scr);
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
