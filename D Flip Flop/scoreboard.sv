class scoreboard;
  
  transaction tr;
  mailbox mon2scr;
  virtual flipflop ff;
  event my_event;
  
  function new(mailbox sek);
    this.mon2scr=sek;
  endfunction
  
  task main();
    tr=new();
    repeat(10)
      begin
        #10;
        
        mon2scr.get(tr);
        tr.display("[SCOREBOARD SIGNALS]");
        
        if(((tr.data == tr.q) && (tr.q_b == ~tr.q)) ||  ((!tr.rst) && (tr.q == 0) && (tr.q_b == 1)))
          begin
            $display("------------------------------");
            $display("	     [PASSED]");
        	$display("------------------------------");
          end
        else
          begin
            $display("------------------------------");
            $display("	     [FAILED]");
            $display("------------------------------");
          end
        -> my_event;
      end
  endtask

endclass
