module d_ff(flipflop ff);
  
  always@(posedge ff.clk or posedge ff.rst)
    begin
      if(ff.rst)
        ff.q<=0;
      else
        ff.q<=ff.data;
      
    end
  
  assign ff.q_b=~ff.q;
 
endmodule
