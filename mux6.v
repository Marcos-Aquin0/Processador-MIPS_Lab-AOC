module mux6 (entrada1, entrada2, shamt, chave_mux6, saida_mux6); 

input [31:0] entrada1, entrada2; 
input [3:0] shamt;
input [1:0] chave_mux6; //AluSrc
output reg [31:0] saida_mux6;
wire entrada3 = {{32-4{shamt[3]}}, shamt};

	always @(*) begin
		case(chave_mux6)
			2'b00: saida_mux6 = entrada1;
			2'b01: saida_mux6 = entrada2;	
			2'b10: saida_mux6 = entrada3;
		endcase
	end

endmodule 