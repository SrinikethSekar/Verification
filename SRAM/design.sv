module sram(sram_if sr);
  
  reg [7:0] ram [0:7];
  
  always@(posedge sr.clk or posedge sr.rst)
  begin
    
    if(sr.rst)
      begin
        for(int i=0; i<8; i++)begin
          ram[i]=8'b0;
        end
      end
    
    else if(sr.we)begin
      ram[sr.addr] <= sr.data_in;
    end
    
  end
     
  assign sr.data_out = ram[sr.addr];
  
endmodule
