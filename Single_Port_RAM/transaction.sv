

class transaction;
  
  localparam ADDR_WIDTH=4;
  localparam DATA_WIDTH=8;
  int val=100;
  rand bit we;
  randc bit [ADDR_WIDTH-1:0] addr;
  rand bit [DATA_WIDTH-1:0] data_in;
  bit [DATA_WIDTH-1:0] data_out;
  
  constraint valid_we{we dist{1:=50,0:=50};} 
  constraint valid_addr{addr inside {[0:15]};}
  constraint valid_data_in{data_in inside {[8'h00:8'hFF]};}
  
  function void display(string name);
    $display("%s",name);
    $display("Time=%0t WE=%0b ADDR=%0d DATA_IN=%0d DATA_OUT=%0d",$time,we,addr,data_in,data_out);
  endfunction
  
endclass
    
