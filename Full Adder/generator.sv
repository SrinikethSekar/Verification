class generator;
  
  transaction tr;
  mailbox gentodrv;
  event my_event;
  
  function new(mailbox csk);
    this.gentodrv=csk;
  endfunction
  
  task main();
    tr=new();
    repeat(10)
      begin
        #0;
        tr.randomize();
        tr.display("Generated Class Signals");
        
        gentodrv.put(tr);
        @(my_event);
        
      end
  endtask
  
endclass
