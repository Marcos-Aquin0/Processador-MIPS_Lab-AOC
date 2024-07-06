module mux2 (entrada1, entrada2, entrada3, chave_mux2, saida_mux2); 

input [31:0] entrada1, entrada2, entrada3;
input [1:0] chave_mux2; //emd, memtoreg, loadi
output reg [31:0] saida_mux2;


	always @(*) begin
		case(chave_mux2)
			2'b00: saida_mux2 = entrada1;
			2'b01: saida_mux2 = entrada2;	
			2'b10: saida_mux2 = entrada3;
		endcase
	end

endmodule 