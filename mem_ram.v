// Quartus Prime Verilog Template
// Simple Dual Port RAM with separate read/write addresses and
// separate read/write clocks

module mem_ram
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=8)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input memwrite, memread, clock,
	output reg [(DATA_WIDTH-1):0] saida_ram
);
	
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	
	always @ (negedge clock)
	begin
		// Write
		if (memwrite)
			ram[addr] <= data;
	end
	
	always @ (posedge clock)
	begin
		// Read
		if(memread)
		saida_ram <= ram[addr];
	end
	
endmodule
