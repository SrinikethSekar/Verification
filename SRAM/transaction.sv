

class transaction;
  
  rand bit we;
  rand bit [2:0] addr;
  rand bit [7:0] data_in;
       bit [7:0] data_out;
  
  constraint valid_we{we dist{1:=60,0:=40};} 
  constraint valid_addr{addr inside {[0:7]};}
  constraint valid_data_in{data_in inside {[8'h00:8'hFF]};}
  
  function void display(string name);
    $display("%s",name);
    $display("Time=%0t WE=%b ADDR=%d DATA_IN=%d DATA_OUT=%d",$time,we,addr,data_in,data_out);
  endfunction
  
endclass
    
