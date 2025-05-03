class scoreboard;
  
  transaction tr;
  mailbox mon2scr;
  bit[7:0] mem [0:15];
  event my_event;
  
  function new(mailbox mon2scr);
    this.mon2scr=mon2scr;
  endfunction
  
  task main();
    tr=new();
    
     foreach(mem[i])
      mem[i] = 0;

 
    repeat(tr.val)
      begin
        
        
        mon2scr.get(tr);
        
        tr.display("[SCOREBOARD SIGNALS]");
       
        
        if(tr.we)begin
          mem[tr.addr]=tr.data_in;
        end
        else begin
          if(tr.data_out==mem[tr.addr])begin
            $display("-----------------------------------------------------------------------------");
            $display(" ---------------------------------PASSED-------------------------------------");
            $display("-----------------------------------------------------------------------------");
            end 
        else begin
          $display("-----------------------------------------------------------------------------");
          $display(" ---------------------------------FAILED-------------------------------------");
          $display("-----------------------------------------------------------------------------");
        end
      end
        -> my_event;
      end
    
  endtask
  
endclass
