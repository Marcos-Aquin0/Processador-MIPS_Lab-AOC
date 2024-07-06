module saida_fpga(entrada_modulo, clock_out, sinal_out, dp4, dp3, dp2, dp1);

input [31:0] entrada_modulo;
input clock_out, sinal_out;
output [3:0] dp4, dp3, dp2, dp1;

wire [3:0] r_dp1 = (entrada_modulo % 10);
wire [3:0] r_dp2 = (entrada_modulo % 100) / 10;
wire [3:0] r_dp3 = (entrada_modulo % 1000) / 100;
wire [3:0] r_dp4 = (entrada_modulo % 10000)/ 1000;

assign dp1 = (sinal_out ? r_dp1 : 4'b1111);
assign dp2 = (sinal_out ? r_dp2 : 4'b1111);
assign dp3 = (sinal_out ? r_dp3 : 4'b1111);
assign dp4 = (sinal_out ? r_dp4 : 4'b1111); 

endmodule 