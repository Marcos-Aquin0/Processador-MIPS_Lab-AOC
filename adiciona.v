module adiciona(entrada1, entrada2, saida_adiciona, clock_adiciona);

	input[31:0] entrada1;
	input[31:0] entrada2; //1 ou imediato
	output reg [31:0] saida_adiciona;
	
	input clock_adiciona;
	
	always @ (posedge clock_adiciona)
	
	begin
		saida_adiciona = entrada1 + entrada2;
	end


endmodule 