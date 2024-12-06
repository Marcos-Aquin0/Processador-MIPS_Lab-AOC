module ULA(A, B, enable, controle_ULA, ZERO, saida);

//duas entradas de 32 bits
input [31:0] A;
input [31:0] B;
input enable; //~NOP - habilitar ou desabilitar a ULA

//uma entrada de controle da ULA
input [3:0] controle_ULA;

//uma saida zero para comparação do beq
output reg ZERO;
//uma saida do resultado da ULA
output reg [31:0] saida;

always @ (*)
begin
	if(enable == 1)
	begin
		case (controle_ULA)
       4'b0000: saida= A & B; //and 
		 4'b0001: saida= A | B; //or  
		 4'b0010: saida= A + B; //add 
		 4'b0011: saida= A - B; //sub 
		 4'b0100: saida= A * B; //mul
		 4'b0101: saida= A / B; //div
		 4'b0110: saida= A >> B[4:0]; //deslocamento shamt para direita, B limitado para nao exceder limites
		 4'b0111: saida= A << B[4:0]; //deslocamento shamt para esquerda
		 4'b1000: saida= ~(A | B); //nor
		 4'b1001: saida= (A == B)? 32'd0 : 32'd1; //beq
		 4'b1010: saida= (A < B)? 32'd0 : 32'd1; //blt
		 4'b1011: saida= (A > B)? 32'd0 : 32'd1; //bgt
		 4'b1100: saida= (A != B)? 32'd0 : 32'd1; //bne
		 default: saida= 32'd0; //se o controle não é nenhum desses
	endcase

	
		if(saida == 32'd0)
		begin
				ZERO = 1'b1;
		end	
		else
		begin
				ZERO = 1'b0;
		end
	end
	else
	begin
		saida = 32'd0;
		ZERO = 1'b0;
		//apagar display
	end
end	

endmodule 