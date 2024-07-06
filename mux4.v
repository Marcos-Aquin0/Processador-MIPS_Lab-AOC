module mux4 (entrada1, entrada2, chave_mux4, saida_mux4); 

input [13:0] entrada1, entrada2;
input chave_mux4; //in
output reg [13:0] saida_mux4;


	always @(*) begin
		case(chave_mux4)
			1'b0: saida_mux4 = entrada1;
			1'b1: saida_mux4 = entrada2;
		endcase
	end

endmodule 