module single_port_ram #(parameter DATA_WIDTH = 8,parameter ADDR_WIDTH =4)
   (input clk,
	input we,
	input [ADDR_WIDTH-1:0] addr,
	input [DATA_WIDTH-1:0] data_in,
	output reg [DATA_WIDTH-1:0] data_out);

  reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1]; //left shifting of the 1 and it becomes 16

	always@(posedge clk)begin
		if(we)begin
			mem[addr]<=data_in;
		end 
        else begin
			data_out <= mem[addr];
		   end
	end


endmodule

//https://edaplayground.com/x/kU8b
