class generator;
  
  transaction tr;
  mailbox gen2drv;
  event my_event;
  
  function new(mailbox rohit);
    this.gen2drv=rohit;
  endfunction
  
  task main();
    tr=new();
    repeat(10)
    	begin
          #1;
          tr.randomize();
          tr.display("[GENERATOR CLASS]");
          gen2drv.put(tr);
          
          @(my_event);
          
        end
  endtask
  
endclass
  
