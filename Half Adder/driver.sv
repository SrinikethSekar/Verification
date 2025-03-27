class driver;
  
  virtual int_if vi;
  transaction tr;
  mailbox gen2drv;
  
  function new(virtual int_if vi,mailbox valan);
    
    this.vi=vi;
    this.gen2drv=valan;
    
  endfunction
  
  task main();
    repeat(10)
      begin
              

        gen2drv.get(tr);
        vi.a=tr.a;
        vi.b=tr.b;
        
        tr.display("Driver Class Signals");
        #1;
      end
  endtask
 
endclass
        
