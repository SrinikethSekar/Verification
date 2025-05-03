`include "interface.sv"
`include "test.sv"

module testbench;

  sram_if sr();

  test tt(sr);

  single_port_ram st(
    .clk(sr.clk),
    .we(sr.we),
    .addr(sr.addr),
    .data_in(sr.data_in),
    .data_out(sr.data_out));

  initial sr.clk = 0;
  always #5 sr.clk = ~sr.clk;  

  initial begin
   
    $dumpfile("waves.vcd");
    $dumpvars;

  
  

    #2000;
    $finish;
  end

endmodule
