class monitor;
  
  virtual int_if vi;
  transaction tr;
  mailbox mon2scr;
  
  function new(virtual int_if vi, mailbox sri);
    this.vi=vi;
    this.mon2scr=sri;
  endfunction
  
  task main();
    tr=new();
    repeat(10)
      begin
		#1;
        tr.a=vi.a;
        tr.b=vi.b;
        tr.sum=vi.sum;
        tr.carry=vi.carry;
        
        mon2scr.put(tr);
        
        tr.display("Monitor Class Signals");

      end
  endtask
  
endclass
    
