module PC(clock_pc, prox_end, halt, pc);
	input wire clock_pc;
	input wire [31:0] prox_end;
	input wire halt;
	output reg [31:0] pc;
	

	always @(posedge clock_pc)
	begin
		if(halt == 0) begin
			pc = prox_end;
		end
	end

endmodule 