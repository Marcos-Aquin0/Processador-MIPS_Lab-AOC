module botao_enter(
    input wire clk,          // Clock do sistema (fundamental para lógica sequencial)
    input wire reset_n,      // Reset assíncrono ativo baixo (para inicializar)
    input wire botao,        // Botão "Enter" (pressione para descongelar)
    input wire req_congela_in,  // Sinal que solicita congelamento para input
    input wire req_congela_out, // Sinal que solicita congelamento para output
    output reg congela       // Saída: 1 se está congelado, 0 se está processando
);

// Sinal interno para detectar a borda de subida do botão (para ser sensível ao pulso)
reg botao_anterior;

wire botao_pressionado;
reg ignora;

// Detecta a borda de subida do botão
always @ (posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        botao_anterior <= 1'b0; // Reseta o estado do botão
    end else begin
        botao_anterior <= botao;
    end
end

assign botao_pressionado = (botao == 1'b1) && (botao_anterior == 1'b0); // Borda de subida

// Lógica principal do congelamento
always @ (posedge clk or negedge reset_n) begin
    if (!reset_n) begin
        congela <= 1'b0; // Inicia descongelado
		  ignora <= 0;
    end else begin
        // Se alguma das requisições de congelamento estiver ativa E não estivermos já congelados, congela
        if ((req_congela_in || req_congela_out) && (congela == 1'b0) && (ignora == 0)) begin
            congela <= 1'b1; // Congela
				ignora <= 1;
        end
        // Se o botão for pressionado E estivermos congelados, descongela
        else if (botao_pressionado && (congela == 1'b1)) begin
            congela <= 1'b0; // Descongela
				ignora <= 1;
        end
		  else if ((ignora== 1'b1) && (congela == 1'b0) &&(~req_congela_in && ~req_congela_out)) begin
				ignora <= 0;
		  end
        // Caso contrário, mantém o estado atual de congela
        // Não há 'else' explícito aqui porque o 'congela' é 'reg' e mantém seu valor
    end
end

endmodule