module ULA_controle(AluOP, funct, sinal_controle);

//duas entradas: o sinal AluOP e o funct
input [3:0] AluOP;
input [3:0] funct;
//saida de controle da ULA
output reg [3:0] sinal_controle;

always @ (*)
begin
	case(AluOP)
		4'b0000: sinal_controle = 2;//load and store - soma de endereco
		4'b0001: //tipo R
			begin
				case (funct)
					4'b0000: sinal_controle = 0; //and 
					4'b0001: sinal_controle = 1; //or 
					4'b0010: sinal_controle = 2; //add
					4'b0011: sinal_controle = 3; //sub
					4'b0100: sinal_controle = 4; //mul
					4'b0101: sinal_controle = 5; //div
					4'b0110: sinal_controle = 6; //shamt direita
				   4'b0111: sinal_controle = 7; //shamt esquerda
					4'b1000: sinal_controle = 8; //nor
					4'b1001: sinal_controle = 15; //jr
					default: sinal_controle = 15; 
				endcase
			end

		4'b0010: sinal_controle = 9;//beq
		4'b0011: sinal_controle = 10;//blt 
		4'b0100: sinal_controle = 11;//bgt 
		4'b0101: sinal_controle = 12;//bnq
		4'b0110: sinal_controle = 0;//andi
		4'b0111: sinal_controle = 1;//ori
		4'b1000: sinal_controle = 2;//addi
		4'b1001: sinal_controle = 3;//subi
		4'b1010: sinal_controle = 13;//bge
		4'b1011: sinal_controle = 14;//ble
		
		default: sinal_controle = 15; 
	endcase
	
	
end	

endmodule 