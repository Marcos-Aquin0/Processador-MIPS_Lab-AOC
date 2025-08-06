module divisor_freq(congela_sw, congela, halt, clock_fpga, new_clock, led_pc);

input congela_sw, halt, clock_fpga, congela;
output reg new_clock, led_pc;
reg [23:0] OUT;


//divisor de frequencia
always @ (posedge clock_fpga or posedge congela_sw or posedge congela)
	begin
		if(congela_sw) begin
			OUT <=24'd0;
			new_clock <= 1'b0;
			led_pc <= 1'b0;
		end
		else if(congela) begin
			OUT <=24'd0;
			new_clock <= 1'b0;
         led_pc <= 1'b0;
		end
		else if (halt) begin
			OUT <= OUT;
			new_clock <= 1'b0;
         led_pc <= 1'b0;
		end
		else if (OUT == 24'd1562500) //3125000
			begin
				OUT <= 24'd0;
				new_clock <= 1;
				led_pc <= 0;
			end 
		else
			begin
				OUT <= OUT+1;
				new_clock <= 0;
				led_pc <= 1;
			end 
	end 
endmodule 