module d_ff(
  input clk,
  input rst,
  input data,
  output q_b,
  output reg q);
  
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        q<=0;
      else
        q<=data;
      
    end
  
  assign q_b=~q;
 
endmodule
