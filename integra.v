module integra(input clock, reg_write, enable,
					input [3:0] AluOP,
					input [3:0] funct,
					input [5:0] rs, //Lê reg1
					input [5:0] rt, //Lê reg2
					input [5:0] rd, //escreve reg
	
					output ZERO,
					output [31:0] out_integra);
					


wire [3:0] sinal_aux;
wire [31:0] aux_saida_ULA;
wire [31:0] dado1, dado2;

ULA_controle Chamada1(.AluOP(AluOP), .funct(funct), .sinal_controle(sinal_aux));
//aluop e funct inputs, sinal_controle output 

ULA Chamada2(.A(dado1), .B(dado2), .enable(enable), .controle_ULA(sinal_aux), 
             .ZERO(ZERO), .saida(aux_saida_ULA));
//A, B, enable, controle_ULA inputs, ZERO e saida outputs

BANCO_REG Chamada3(.clock(clock), .reg_write(reg_write), .reg_leitura1(rs), 
          .reg_leitura2(rt), .reg_escrita(rd), .escreve_dado(aux_saida_ULA), 
			 .dado1(dado1), .dado2(dado2));
//clock, reg_write, reg_leitura1, reg_leitura2, reg_escrita, escreve_dado inputs
//dado1 e dado2 outputs

assign out_integra = aux_saida_ULA;

endmodule 