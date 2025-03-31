class transaction;
  
  rand bit data;
  		bit clk;
  		bit rst;
  		bit q_b;
  		bit q;
  
  function new(string name);
    $display("%s",name);
    $display("Time=%0t clk=%b Data=%b Q=%b Q_b=%b",$time,clk,data,q,q_b);
  endfunction

endclass
