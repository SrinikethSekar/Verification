class monitor;
  
  transaction tr;
  mailbox montoscr;
  virtual int_if vi;
  
  function new(virtual int_if vi, mailbox rcb);
    this.vi=vi;
    this.montoscr=rcb;
  endfunction;
  
  task main();
    tr=new();
    repeat(10)
    	begin
          
          #1;
          tr.a=vi.a;
          tr.b=vi.b;
          tr.c=vi.c;
          tr.sum=vi.sum;
          tr.carry=vi.carry;
          
          montoscr.put(tr);
          tr.display("Monitor Class Signals");
          
          #1;
        end
  endtask
  
endclass
