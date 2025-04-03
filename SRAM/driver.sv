class driver;
  
  transaction tr;
  mailbox gen2drv;
  virtual sram_if sr;
  
  function new(virtual sram_if sr,mailbox gen2drv);
    this.sr=sr;
    this.gen2drv=gen2drv;
  endfunction
  
  task main();
    tr=new();
   
    repeat(4)
      begin
        
        
       
        gen2drv.get(tr);
      
        @(posedge sr.clk)
        #2; 
        sr.we      = tr.we;
        sr.data_in = tr.data_in;
        sr.addr     = tr.addr;
      
        //$display("[DRIVER] Applied transaction at Time=%0t | WE=%b | ADDR=%b | DATA_IN=%b",$time, tr.we, tr.addr, tr.data_in);

            
        tr.display("[DRIVER SIGNALS]");
        
        #2;
        
        
      end
    
  endtask
  
endclass
