`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  
  transaction tr;
  generator gen;
  driver dr;
  monitor mon;
  scoreboard scr;
  event myevent;
  
  virtual int_if vi;
  mailbox gentodrv;
  mailbox montoscr;
  
  function new(virtual int_if vi);
    this.vi=vi;
    
    gentodrv=new();
    montoscr=new();
    
    gen=new(gentodrv);
    dr=new(vi,gentodrv);
    mon=new(vi,montoscr);
    scr=new(montoscr);
    
    gen.my_event=myevent;
    scr.my_event=myevent;
    
  endfunction
  
  task main();
    
    fork
      gen.main();
      dr.main();
      mon.main();
      scr.main();
    join
    
  endtask
  
  
endclass


