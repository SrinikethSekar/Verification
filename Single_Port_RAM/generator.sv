class generator;
  
  transaction tr;
  mailbox gen2drv;
  event my_event;
  
  function new(mailbox gen2drv);
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
    tr=new();
    repeat(tr.val)
      begin
        
        tr.randomize();
        tr.display("[GENERATOR SIGNALS]");
        gen2drv.put(tr);
        
        
        @(my_event);
       
        
      end
  endtask
  
endclass
