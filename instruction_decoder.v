// Novo módulo para decodificação
module instruction_decoder(
    input clock,
    input [31:0] instruction_reg,
    
    output reg [5:0] opcode,
    output reg [5:0] rs,
    output reg [5:0] rt,
    output reg [5:0] rd,
    output reg [3:0] shamt,
    output reg [3:0] funct,
    output reg [13:0] imediato,
    output reg [25:0] salto
);

// Decodificar a instrução registrada
always @(posedge clock) begin
    opcode <= instruction_reg[31:26];
    rs <= instruction_reg[25:20];
    rt <= instruction_reg[19:14];
    rd <= instruction_reg[13:8];
    shamt <= instruction_reg[7:4];
    funct <= instruction_reg[3:0];
    imediato <= instruction_reg[13:0];
    salto <= instruction_reg[25:0];
end

endmodule 