// Quartus Prime Verilog Template
// Simple Dual Port RAM with separate read/write addresses and
// separate read/write clocks

module mem_ram
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=8)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] read_addr, write_addr,
	input memwrite, memread, read_clock, write_clock,
	output reg [(DATA_WIDTH-1):0] saida_ram
);
	
	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	
	always @ (posedge write_clock)
	begin
		// Write
		if (memwrite)
			ram[write_addr] <= data;
	end
	
	always @ (posedge read_clock)
	begin
		// Read
		if(memread)
		saida_ram <= ram[read_addr];
	end
	
endmodule
