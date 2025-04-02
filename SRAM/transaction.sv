

class transaction;
  
  rand bit we;
  rand bit [2:0] addr;
  rand bit [7:0] data_in;
       bit [7:0] data_out;
  constraint valid{addr inside {[0:7]};}
  
  function void display(string name);
    $display("%s",name);
    $display("Time=%0t WE=%b ADDR=%b DATA_IN=%b DATA_OUT=%b",$time,we,addr,data_in,data_out);
  endfunction
  
endclass
    
