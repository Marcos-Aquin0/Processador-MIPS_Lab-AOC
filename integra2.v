module integra2 #(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=8)
				  (input clock, reg_write, enable,
					input [3:0] AluOP,
	
					output ZERO,

					//ram
					input we, re, 
					input [(ADDR_WIDTH-1):0] addr,
					//rom
					input[(ADDR_WIDTH-1):0]rom_addr,
					input clock_rom,
					output [(DATA_WIDTH-1):0] saida_rom,
					
					output reg [5:0] opcode, rs, rt, rd,
					output reg [3:0] shamt, funct, 
					output reg [13:0] imediato, 
					output reg [25:0] salto,
					output reg [31:0] saida_integra2
					);
					

wire [3:0] sinal_aux;
wire [31:0] aux_saida_ULA, aux_saida_ram;
wire [31:0] dado1, dado2;
reg [31:0] aux_saida;

ULA_controle Chamada1(.AluOP(AluOP), .funct(funct), .sinal_controle(sinal_aux));
//aluop e funct inputs, sinal_controle output

ULA Chamada2(.A(dado1), .B(dado2), .enable(enable), .controle_ULA(sinal_aux), 
             .ZERO(ZERO), .saida(aux_saida_ULA));
//A, B, enable, controle_ULA inputs, ZERO e saida outputs


BANCO_REG Chamada3(.clock(clock), .reg_write(reg_write), .reg_leitura1(rs), 
          .reg_leitura2(rt), .reg_escrita(rd), .escreve_dado(aux_saida), 
			 .dado1(dado1), .dado2(dado2));
//clock, reg_write, reg_leitura1, reg_leitura2, reg_escrita, escreve_dado inputs
//dado1 e dado2 outputs

mem_ram Chamada4(.data(dado2), .addr(aux_saida_ULA),      
                 .memwrite(we), .memread(re), .clock(clock),
					  .saida_ram(aux_saida_ram));


mem_rom Chamada5(.rom_addr(rom_addr), .clock_rom(clock_rom), .saida_rom(saida_rom));
		

		
always @(*)
begin
	opcode = saida_rom[31:26];
	rs = saida_rom[25:20];
	rt = saida_rom[19:14];
	rd = saida_rom[13:8];
	shamt = saida_rom[7:4];
	funct = saida_rom[3:0];
	imediato = saida_rom[13:0];
	salto = saida_rom[25:0];
	
	if(opcode == 6'b000000)
	begin
		aux_saida = aux_saida_ULA;
		saida_integra2 = aux_saida;
	end
	else
	begin
		if (opcode == 6'b000110)
		begin
			aux_saida = aux_saida_ram;
			saida_integra2 = aux_saida;
		end
	end
end

endmodule 