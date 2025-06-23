module BANCO_REG(clock, reg_write, reg_leitura1, reg_leitura2, 
					  reg_escrita, escreve_dado, dado1, dado2);

	input clock;
	input reg_write;

	input [5:0] reg_leitura1; //Le reg1
	input [5:0] reg_leitura2; //Le reg2
	input [5:0] reg_escrita; //escreve reg
	input [31:0] escreve_dado; //escreve dado

	output [31:0] dado1; //le dado 1
	output [31:0] dado2; //le dado 2

	reg [31:0] regs [63:0];
	
	//para testes, atribuir valores iniciais para os registradores
	initial begin
		integer i;
		for (i = 0; i < 61; i = i + 1) begin
			regs[i] = 0;
			
		end
		regs[61] = 1;
		regs[62] = 4;
		regs[63] = 0;
	end
	
	always @  (negedge clock) 
	begin
		if (reg_write == 1) //rd - registrador de destino receber um dado
		begin
			regs[reg_escrita] = escreve_dado;
		end

	end

	//atribuicao dos valores para as saidas le dado 1 e le dado 2 do dataph
	assign dado1 = regs[reg_leitura1];
	assign dado2 = regs[reg_leitura2];


endmodule 