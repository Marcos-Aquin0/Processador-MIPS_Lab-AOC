module mux1 (entrada1, entrada2, chave_mux1, saida_mux1); 

input [31:0] entrada1, entrada2;
input chave_mux1; //jump, jumpreg
output reg [31:0] saida_mux1;


	always @(*) begin
		case(chave_mux1)
			1'b0: saida_mux1 = entrada1;
			1'b1: saida_mux1 = entrada2;
		endcase
	end

endmodule 

