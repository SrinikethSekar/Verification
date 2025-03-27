// `include "transaction.sv"
class generator;
  
  transaction tr;
  event my_event;
  mailbox gen2drv;
  
  function new (mailbox nithish);
    this.gen2drv=nithish;
  endfunction
  
  task main();
    tr=new();
    repeat(10)
      begin
        #0;
        
        tr.randomize();
       // $display("------------------------------------------");
        tr.display("Generator Class Signals");
        gen2drv.put(tr);
        
        
        
      @(my_event);
      end
  endtask
  
endclass
