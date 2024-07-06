module divisor_freq(congela, clock_fpga, new_clock);

input congela, clock_fpga;
output reg new_clock;
reg [23:0] OUT;


//divisor de frequencia
always @ (posedge clock_fpga)
	begin
		if(congela) begin
			OUT <=24'd0;
		end
		else if (OUT == 24'd12500000)
			begin
				OUT <= 24'd0;
				new_clock <= 1;
			end 
		else
			begin
				OUT <= OUT+1;
				new_clock <= 0;
			end 
	end 
endmodule 