module extensor_sinal2
	#(parameter InputWidth = 26,
	  parameter OutputWidth = 32) 
	 
	 (input [InputWidth-1:0]  in_sinal,
     output [OutputWidth-1:0] out_sinal);
	  
assign out_sinal = {{OutputWidth-InputWidth{in_sinal[InputWidth-1]}}, in_sinal};
	  
endmodule 