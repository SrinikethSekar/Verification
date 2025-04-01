class transaction;
  
  rand bit data;
       bit rst;
  		bit q_b;
  		bit q;
  
  function void display(string name);
    $display("%s",name);
    $display("Time=%0t Data=%b Q=%b Q_b=%b",$time,data,q,q_b);
  endfunction

endclass
