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

	// Initialize the ROM with $readmemb.  Put the memory contents
	// in the file single_port_rom_init.txt.  Without this file,
	// this design will not compile.

	// See Verilog LRM 1364-2001 Section 17.2.8 for details on the
	// format of this file, or see the "Using $readmemb and $readmemh"
	// template later in this section.

	initial
	begin
		$readmemb("rom_init.txt", rom); //dois ultimos parametros, onde começa onde termina
	end

	always @ (posedge clock_rom)
	begin
		saida_rom <= rom[rom_addr];
	end

endmodule
