module fixed_point_add_sub_q1_15
(
	input clk,
	input signed [15:0] a, b,
	output signed [15:0] sum, diff

);
	reg signed [15:0] reg_a, reg_b;	
    reg signed [16:0] reg_sum, reg_diff; // 17-bit для обнаружения переполнения
    reg signed carry_out;
    
    assign sum  = reg_sum[15:0];   // Сложение в формате Q0.16
    assign diff = reg_diff[15:0];   // Вычитание в формате Q0.16
	
	always @(posedge clk) begin
		reg_a <= 16'shA000;
		reg_b <= 16'shC000;
		// переполнение суммы
//		 reg_a <= 16'hEA45;
//		 reg_b <= 16'hD076;
		
		reg_sum  <= reg_a + reg_b;
		reg_diff <= reg_a - reg_b;
		if(reg_sum > 17'h0FFFF) carry_out <= 1'b1;  // переполнение сложения
		else carry_out <= 1'b0;
		// только для моделирования. Не синтезируемая конструкция
		$display("reg_a = %f, reg_b = %f, reg_sum=%f, reg_diff=%f, carry_out = %d", 
			reg_a/32768.0 , reg_b/32768.0 ,reg_sum/32768.0, reg_diff/32768.0, carry_out); 
		
		$display("reg_a = 0x%h, reg_b = 0x%h, reg_sum=0x%h, reg_diff=0x%h, carry_out = %d", 
			reg_a, reg_b, reg_sum, reg_diff, carry_out); 
		
		$display("sum=%f, diff=%f, carry_out = %d", sum/32768.0, diff/32768.0, carry_out); 
		$display("sum=0x%h, diff=0x%h, carry_out = %d", sum, diff, carry_out); 
	end
endmodule
