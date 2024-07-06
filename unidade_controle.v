module unidade_controle(
	input [5:0] opcode,
	output reg [3:0] AluOP,
	output reg [1:0] regdst, memtoreg, alusrc, emd, loadi,
	output reg jump, out, jumpreg, branch, memread,
	output reg memwrite, regwrite, halt, nop, in);
	
	always @ (*) begin
		case(opcode) 
			6'b000000:begin //AND, OR, ADD, SUB, MUL, DIV, NOR
				loadi = 2'b00; 
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'b01;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'b01;
				AluOP = 4'b0001;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b1;
				alusrc = 2'b00;
				emd = 2'bXX;
			end
			
			6'b000001:begin // SR, SL
				loadi = 2'b00;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'b01;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'b01;
				AluOP = 4'b0001;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b1;
				alusrc = 2'b10;
				emd = 2'bXX;
			end
			6'b000010:begin //JR
				loadi = 2'bXX;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b1;
				regdst = 2'bXX;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'bXX;
				AluOP = 4'b0001;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b0;
				alusrc = 2'bXX;
				emd = 2'bXX;
			end
			6'b000011:begin //ANDI
				loadi = 2'b00;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'b00;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'b01;
				AluOP = 4'b0110;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b1;
				alusrc = 2'b01;
				emd = 2'bXX;
			end
			6'b000100:begin //ORI
				loadi = 2'b00;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'b00;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'b01;
				AluOP = 4'b0111;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b1;
				alusrc = 2'b01;
				emd = 2'bXX;
			end
			6'b000101:begin // ADDI
				loadi = 2'b00;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'b00;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'b01;
				AluOP = 4'b1000;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b1;
				alusrc = 2'b01;
				emd = 2'bXX;
			end
			6'b000110:begin //SUBI
				loadi = 2'b00;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'b00;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'b01;
				AluOP = 4'b1001;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b1;
				alusrc = 2'b01;
				emd = 2'bXX;
			end
			6'b000111:begin //LI
				loadi = 2'b01;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'b00;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'bXX;
				AluOP = 4'bXXXX;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b1;
				alusrc = 2'bXX;
				emd = 2'bXX;
			end
			6'b001000:begin //LW1
				loadi = 2'b00;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'b00;
				branch = 1'b0;
				memread = 1'b1;
				memtoreg = 2'b00;
				AluOP = 4'b0000;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b1;
				alusrc = 2'b01;
				emd = 2'b00;
			end
			6'b001001:begin //LW2
				loadi = 2'b00;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'b00;
				branch = 1'b0;
				memread = 1'b1;
				memtoreg = 2'b00;
				AluOP = 4'b0000;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b1;
				alusrc = 2'b01;
				emd = 2'b10;
			end
			6'b001010:begin //LW3
				loadi = 2'b00;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'b00;
				branch = 1'b0;
				memread = 1'b1;
				memtoreg = 2'b00;
				AluOP = 4'b0000;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b1;
				alusrc = 2'b01;
				emd = 2'b01;
			end
			6'b001011:begin //SW
				loadi = 2'bXX;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'bXX;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'bXX;
				AluOP = 4'b0000;
				memwrite = 1'b1;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b0;
				alusrc = 2'b01;
				emd = 2'b00;
			end
			6'b001100:begin //BEQ
				loadi = 2'bXX;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'bXX;
				branch = 1'b1;
				memread = 1'b0;
				memtoreg = 2'bXX;
				AluOP = 4'b0010;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b0;
				alusrc = 2'b00;
				emd = 2'bXX;
			end
			6'b001101:begin //BLT
				loadi = 2'bXX;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'bXX;
				branch = 1'b1;
				memread = 1'b0;
				memtoreg = 2'bXX;
				AluOP = 4'b0011;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b0;
				alusrc = 2'b00;
				emd = 2'bXX;
			end
			6'b001110:begin //BGT
				loadi = 2'bXX;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'bXX;
				branch = 1'b1;
				memread = 1'b0;
				memtoreg = 2'bXX;
				AluOP = 4'b0100;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b0;
				alusrc = 2'b00;
				emd = 2'bXX;
			end
			6'b001111:begin //BNQ
				loadi = 2'bXX;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'bXX;
				branch = 1'b1;
				memread = 1'b0;
				memtoreg = 2'bXX;
				AluOP = 4'b0101;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b0;
				alusrc = 2'b00;
				emd = 2'bXX;
			end
			6'b010000:begin //IN
				loadi = 2'b01;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'b00;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'bXX;
				AluOP = 4'bXXXX;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b1;
				halt = 1'b0;
				regwrite = 1'b1;
				alusrc = 2'bXX;
				emd = 2'bXX;
			end
			6'b010001:begin //OUT
				loadi = 2'b00;
				jump = 1'b0;
				out = 1'b1;
				jumpreg = 1'b0;
				regdst = 2'b00;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'bXX;
				AluOP = 4'b1111;
				memwrite = 1'b0;
				nop = 1'b1;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b0;
				alusrc = 2'b11;
				emd = 2'bXX;
			end
			6'b010010:begin //MOVE
				loadi = 2'b10;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'b00;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'b01;
				AluOP = 4'b1111;
				memwrite = 1'b0;
				nop = 1'b1;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b1;
				alusrc = 2'bXX;
				emd = 2'bXX;
			end
			6'b010011:begin //J
				loadi = 2'bXX;
				jump = 1'b1;
				out = 1'b0;
				jumpreg = 1'bX;
				regdst = 2'bXX;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'bXX;
				AluOP = 4'bXXXX;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b0;
				alusrc = 2'bXX;
				emd = 2'bXX;
			end
			6'b010100:begin //JAL
				loadi = 2'b00;
				jump = 1'b1;
				out = 1'b0;
				jumpreg = 1'bX;
				regdst = 2'b10;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'b10;
				AluOP = 4'bXXXX;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b1;
				alusrc = 2'bXX;
				emd = 2'bXX;
			end
			6'b010101:begin //HALT
				loadi = 2'bXX;
				jump = 1'b0;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'bXX;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'bXX;
				AluOP = 4'bXXXX;
				memwrite = 1'b0;
				nop = 1'b0;
				in = 1'b0;
				halt = 1'b1;
				regwrite = 1'b0;
				alusrc = 2'bXX;
				emd = 2'bXX;
			end
			6'b010110:begin //NOP
				loadi = 2'bXX;
				jump = 1'b1;
				out = 1'b0;
				jumpreg = 1'b0;
				regdst = 2'bXX;
				branch = 1'b0;
				memread = 1'b0;
				memtoreg = 2'b00;
				AluOP = 4'bXXXX;
				memwrite = 1'b0;
				nop = 1'b1;
				in = 1'b0;
				halt = 1'b0;
				regwrite = 1'b0;
				alusrc = 2'bXX;
				emd = 2'bXX;
			end
			
			default:
				begin
					AluOP = 3'b000;
					regdst = 2'b00;
					memtoreg = 2'b00;
					alusrc = 2'b00;
					emd = 2'b00;
					loadi = 2'b00;
					jump = 0;
					out = 0;
					jumpreg = 0;
					branch = 0;
					memread = 0;
					AluOP = 0;
					memwrite = 0;
					regwrite = 0;
					halt = 0;
					nop = 0;
					in = 0;
				end
		endcase
	end




endmodule 