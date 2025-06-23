// Quartus Prime Verilog Template
// Single Port ROM

module mem_rom
#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=8)
(
	input [(ADDR_WIDTH-1):0] rom_addr,
	input clock_rom, 
	output reg [(DATA_WIDTH-1):0] saida_rom
);

	// Declare the ROM variable
	reg [DATA_WIDTH-1:0] rom [2**ADDR_WIDTH-1:0];

	initial
	begin
		$readmemb("gcd.txt", rom); 
	end

	always @ (posedge clock_rom)
	begin
		saida_rom <= rom[rom_addr];
	end

endmodule
