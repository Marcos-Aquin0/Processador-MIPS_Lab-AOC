module entrada_fpga(switches, entrada_switch);

input wire [7:0] switches;
output wire [13:0] entrada_switch;

assign entrada_switch = {{14-8{switches[7]}}, switches};

endmodule 