
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  
  generator gen;
  driver dr;
  monitor mon;
  scoreboard scr;
  
  mailbox gen2drv;
  mailbox mon2scr;
  
  event myevent;
  virtual int_if vi;
  
  
  
  function new(virtual int_if vi);
    this.vi=vi;
    gen2drv=new();
    mon2scr=new();
    
    gen=new(gen2drv);
    dr=new(vi,gen2drv);
    mon=new(vi,mon2scr);
    scr=new(mon2scr);
    
    gen.my_event=myevent;
    scr.my_event=myevent;
    
  endfunction
  
  task test_run();
       fork

          gen.main();   
          dr.main();
         mon.main();
         scr.main();

       join

  endtask
  
endclass
    
    
