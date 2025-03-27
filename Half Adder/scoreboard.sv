class scoreboard;
  
  virtual int_if vi;
  transaction tr;
  event my_event;
  mailbox mon2scr;
  
  
  function new(mailbox jana);
    this.mon2scr = jana;
  endfunction
  
  task main();
    tr=new();
    repeat(10)
      begin
        
        mon2scr.get(tr);
     tr.display("Scoreboard Class Signals");
        
     
        
        if(((tr.a ^ tr.b) == tr.sum) && ((tr.a & tr.b) == tr.carry))begin
          $display("*****************************************");
          $display("              PASSED");
          $display("*****************************************");
        end
        else
          begin
            $display("*****************************************");
            $display("              FAILED");
            $display("*****************************************");
          end
     
       #1; 
        -> my_event;
       
      end
  endtask
endclass
  
    
