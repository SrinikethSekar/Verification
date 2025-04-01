class monitor;
  
  transaction tr;
  mailbox mon2scr;
  virtual flipflop ff;
  
  function new(virtual flipflop ff, mailbox swa);
    this.ff=ff;
    this.mon2scr=swa;
  endfunction
  
  task main();
    tr=new();
    repeat(10)
      begin
        
        
        @(posedge ff.clk)
        #1;
        
        tr.data <= ff.data;
        tr.q    <= ff.q;
        tr.q_b  <= ff.q_b;
        tr.rst  <= ff.rst;
        
        tr.display("[MONITOR SIGNALS]");
        
        mon2scr.put(tr);
        
      end
  endtask
  
endclass
        
        
        
