class generator;
  
  transaction tr;
  mailbox gen2drv;
  event my_event;
  
  function new(mailbox gen2drv);
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
    tr=new();
    repeat(4)
      begin
        #0;
        tr.randomize();
        tr.display("[GENERATOR SIGNALS]");
        gen2drv.put(tr);
        
        
        @(my_event);
        #1;
        
      end
  endtask
  
endclass
