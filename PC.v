module PC(clock_pc, reset, prox_end, halt, pc);
	input wire clock_pc;
	input wire reset;
	input wire [31:0] prox_end;
	input wire halt;
	output reg [31:0] pc;
	

	always @(posedge clock_pc or posedge reset)
	begin
		if (reset) begin
            pc <= 32'h0;// Reset síncrono
        end
        else if (halt) begin
            pc <= pc;// Atribuição não-bloqueante
        end
		  else begin
				pc <= prox_end;// Atribuição não-bloqueante
		  end
    end

endmodule 