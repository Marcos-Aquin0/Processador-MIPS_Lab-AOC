module processador#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=8)
				  (congela, clock_fpga,
					switches, segdp1, segdp2, segdp3, segdp4);  
					 
divisor_freq Chamada0 (.congela(congela), .clock_fpga(clock_fpga), .new_clock(clock));
		
input congela, clock_fpga;
wire clock;	
		
PC Chamada1 (.clock_pc(clock), .prox_end(aux_saida_jump), .halt(halt), .pc(aux_pc));
//input clock, prox endereco vem do muxjump, halt da unidade de controle; output pc

wire [31:0] aux_pc;
parameter soma1 = 32'd1;

adiciona Chamada2 (.entrada1(aux_pc), .entrada2(soma1), .saida_adiciona(aux_saida_adic), 
						 .clock_adiciona(clock));
//input entrada1, entrada2 = 1, clock; out saida do adiciona
						 
wire [31:0] aux_saida_adic;

mem_rom Chamada3 (.rom_addr(aux_pc), .clock_rom(clock), .saida_rom(saida_rom));

wire [(DATA_WIDTH-1):0] saida_rom;
				
reg [5:0] opcode, rs, rt, rd;		
reg [3:0] shamt, funct; 
reg [13:0] imediato; 
reg [25:0] salto;
			
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
end
 

extensor_sinal2 Chamada4 (.in_sinal(salto), .out_sinal(aux_out_sinal2));

wire [31:0] aux_out_sinal2;
//concatenar com pc e mandar pro muxjump


unidade_controle Chamada5 (.opcode(opcode), .AluOP(AluOP), .regdst(regdst),
									.memtoreg(memtoreg), .alusrc(alusrc), .emd(emd),
									.loadi(loadi), .jump(jump), .out(out), .jumpreg(jumpreg),
									.branch(branch), .memread(memread), .memwrite(memwrite),
									.regwrite(regwrite), .halt(halt), .nop(nop), .in(in));

wire [3:0] AluOP;
wire [1:0] regdst, memtoreg, alusrc, emd, loadi;
wire jump, out, jumpreg, branch, memread, memwrite, regwrite, halt, nop, in;

ULA_controle Chamada6(.AluOP(AluOP), .funct(funct), .sinal_controle(sinal_aux_con));
//aluop e funct inputs, sinal_controle output

wire [3:0] sinal_aux_con;

mux3 Chamada7 (.entrada1(rt), .entrada2(rd), .ra(reg31), .chave_mux3(regdst), 
					.saida_mux3(aux_saida_reg_mux3)); 
//ra tem que ser um reg do banco de registradores
wire reg31 = 32'd31;

wire [31:0] aux_saida_reg_mux3;

BANCO_REG Chamada8(.clock(clock), .reg_write(regwrite), .reg_leitura1(rs), 
          .reg_leitura2(rt), .reg_escrita(aux_saida_reg_mux3), 
			 .escreve_dado(aux_saida_mux_loadi), 
			 .dado1(dado1), .dado2(dado2));
//clock, reg_write, reg_leitura1, reg_leitura2, reg_escrita, escreve_dado inputs
//dado1 e dado2 outputs
			 
wire [31:0] dado1, dado2;

mux6 Chamada9(.entrada1(dado2), .entrada2(aux_out_sinal1), .shamt(shamt), 
				  .chave_mux6(alusrc), .saida_mux6(aux_saida_mux6));

wire [31:0] aux_saida_mux6;

ULA Chamada10(.A(dado1), .B(aux_saida_mux6), .enable(~nop), 
              .controle_ULA(sinal_aux_con), .ZERO(ZERO), .saida(aux_saida_ULA));
//A, B, enable, controle_ULA inputs, ZERO e saida outputs

wire [31:0] aux_saida_ULA;
wire ZERO;

entrada_fpga Chamada11 (.switches(switches), .entrada_switch(aux_switch));

wire [13:0] aux_switch;
input [7:0] switches;

mux4 Chamada12(.entrada1(imediato), .entrada2(aux_switch), 
               .chave_mux4(in), .saida_mux4(aux_saida_mux_in));

wire[13:0] aux_saida_mux_in;

extensor_sinal1 Chamada13 (.in_sinal(aux_saida_mux_in), .out_sinal(aux_out_sinal1));

wire [31:0] aux_out_sinal1;


mux2 Chamada14 (.entrada1(aux_saida_mux_mem), .entrada2(aux_out_sinal1), .entrada3(dado1), 
                .chave_mux2(loadi), .saida_mux2(aux_saida_mux_loadi));

wire [31:0] aux_saida_mux_loadi;

mux2 Chamada15 (.entrada1(aux_saida_ULA), .entrada2(dado2), .entrada3(aux_out_sinal1), 
					 .chave_mux2(emd), .saida_mux2(aux_saida_emd)); 

wire [31:0] aux_saida_emd;


mem_ram Chamada16(.data(dado2), .read_addr(aux_saida_emd), .write_addr(aux_saida_emd),      
                 .memwrite(memwrite), .memread(memread), .read_clock(clock), 
					  .write_clock(clock), .saida_ram(aux_saida_ram));
//read clock pode precisar de um delay do clock, como visto no teste inicial, para evitar lixo
					  
wire [31:0] aux_saida_ram;	  
			
	
mux1 Chamada17 (.entrada1(aux_saida_adic), .entrada2(dado2), 
               .chave_mux1(jumpreg), .saida_mux1(aux_saida_jumpreg));

wire [31:0] aux_saida_jumpreg;
					
adiciona Chamada18 (.entrada1(aux_saida_adic), .entrada2(aux_out_sinal1), 
						  .saida_adiciona(aux_saida_adic2), .clock_adiciona(clock));
						 
wire [31:0] aux_saida_adic2;
							
mux5 Chamada19 (.entrada1(aux_saida_jumpreg), .entrada2(aux_saida_adic2), 
              .sinal_branch(branch), .zero(ZERO), .saida_mux5(aux_saida_branch));

wire [31:0] aux_saida_branch;
	
mux1 Chamada20 (.entrada1(aux_saida_branch), .entrada2(entrada_jump), 
               .chave_mux1(jump), .saida_mux1(aux_saida_jump));

wire [31:0] entrada_jump = {aux_saida_adic[31:28], aux_out_sinal2[27:0]};				
wire [31:0] aux_saida_jump;				

mux2 Chamada21 (.entrada1(aux_saida_ram), .entrada2(aux_saida_ULA), 
					 .entrada3(aux_saida_adic), .chave_mux2(memtoreg), 
					 .saida_mux2(aux_saida_mux_mem));
					 
wire [31:0] aux_saida_mux_mem;

saida_fpga Chamada22 (.entrada_modulo(dado1), 
							 .clock_out(clock), .sinal_out(out), 
							 .dp4(dp4), .dp3(dp3), .dp2(dp2), .dp1(dp1));

wire [31:0] dp4, dp3, dp2, dp1;

decodificador_BCD Chamada23 (.bcd(dp1), .segmentos(segdp1));
decodificador_BCD Chamada24 (.bcd(dp2), .segmentos(segdp2));
decodificador_BCD Chamada25 (.bcd(dp3), .segmentos(segdp3));
decodificador_BCD Chamada26 (.bcd(dp4), .segmentos(segdp4));
output [0:6] segdp1, segdp2, segdp3, segdp4;

//mudar os testes memram, incluir o nop em cada coisa


endmodule 