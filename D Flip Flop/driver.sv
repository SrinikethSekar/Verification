class driver;
  
  transaction tr;
  mailbox gen2drv;
  virtual flipflop ff;
  
  function new(virtual flipflop ff,mailbox sandy);
    this.ff=ff;
    this.gen2drv=sandy;
  endfunction

  task main();
    tr=new();
    
 
      repeat(10)
      
      begin
        #1;
        
        gen2drv.get(tr);
        
        @(posedge ff.clk)
        #2;
       
        ff.data<=tr.data;
        
        tr.display("[DRIVER CLASS]");
        
      end
    
  endtask
  
endclass
