module mux5 (entrada1, entrada2, sinal_branch, zero, saida_mux5); 

input [31:0] entrada1, entrada2;
input sinal_branch, zero; //branch
output reg [31:0] saida_mux5;


	always @(*) begin
		case(sinal_branch & zero)
			1'b0: saida_mux5 = entrada1;
			1'b1: saida_mux5 = entrada2;
		endcase
	end

endmodule 