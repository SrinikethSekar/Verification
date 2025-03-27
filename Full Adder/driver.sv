class driver;
  
  transaction tr;
  mailbox gentodrv;
  virtual int_if vi;
  
  function new(virtual int_if vi, mailbox mi);
    this.vi=vi;
    this.gentodrv=mi;
    
  endfunction
  
  
  task main();
    tr=new();
    repeat(10)
      begin
        
        gentodrv.get(tr);
        vi.a=tr.a;
        vi.b=tr.b;
        vi.c=tr.c;
        
        tr.display("Driver Class Signals");
        
        #1;
      end
  endtask
  
endclass
