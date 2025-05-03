class monitor;
  
  transaction tr;
  mailbox mon2scr;
  virtual sram_if sr;
  
  function new(virtual sram_if sr,mailbox mon2scr);
    this.sr=sr;
    this.mon2scr=mon2scr;
  endfunction
  
  task main();
     tr=new();

    repeat(tr.val)
      begin
     
           
        @(posedge sr.clk)
     
        
        tr.data_in  <= sr.data_in;
        tr.data_out <= sr.data_out;
        tr.we       <= sr.we;
        tr.addr     <= sr.addr;
        #1;
         mon2scr.put(tr);
        
  
		
        tr.display("[MONITOR SIGNALS]");
       
       
        
      end
  endtask
  
endclass
        
