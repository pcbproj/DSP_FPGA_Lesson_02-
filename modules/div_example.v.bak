module div_example
(
	input clk,
	input signed [7:0] dividend, divisor,
	output signed [7:0] quotient, remainder
);
    reg signed [7:0] quot, remain;
    
    assign quotient  = quot;
    assign remainder = remain;
    
    always @(posedge clk) begin
		// защита от деления на 0 - насыщение c сохранением знака	
		if (divisor == 0) begin
			if (dividend[7] == 1'b0) quot = -128;
			else quot = 127;
		end
		else begin
			quot  = (dividend / divisor);
			remain = (dividend % divisor);
		end
		$display("quot = (%d / %d) = %d", dividend, divisor, quot); 
		$display("remain = (%d / %d) = %d", dividend, divisor, remain); 
	end
endmodule
