module mux3 (entrada1, entrada2, chave_mux3, saida_mux3); 

input [5:0] entrada1, entrada2; //ra return adress
input [1:0] chave_mux3; //regdist (registradores)
output reg [5:0] saida_mux3;

	always @(*) begin
		case(chave_mux3)
			2'b00: saida_mux3 = entrada1;
			2'b01: saida_mux3 = entrada2;	
			2'b10: saida_mux3 = 6'b011111;
		endcase
	end

endmodule 