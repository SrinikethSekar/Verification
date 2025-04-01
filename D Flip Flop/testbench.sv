`include "interface.sv"
`include "test.sv"

module testbench;
 
  
  flipflop ff();
  
  test tt(ff);
  
  d_ff df(ff);
 
  initial ff.clk=0;
  always #5 ff.clk = ~ff.clk;
  
  initial begin
    
    $dumpfile("waves.vcd");
    $dumpvars;
    
  end
  
  initial begin
    

    #5;
    ff.rst=1;
    #5;
    ff.rst=0;
    
    #200;
    $finish;
    
  end
    
  
endmodule
  
