module divisor_freq(congela, halt, clock_fpga, new_clock);

input congela, halt, clock_fpga;
output reg new_clock;
reg [23:0] OUT;


//divisor de frequencia
always @ (posedge clock_fpga or posedge congela or posedge halt)
	begin
		if(congela) begin
			OUT <=24'd0;
		end
		else if (halt) begin
			OUT <= OUT;
		end
		else if (OUT == 24'd12500000) //3125000
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