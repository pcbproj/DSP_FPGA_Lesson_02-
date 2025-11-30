// 16x16-битный умножитель со знаком (формат Q1.15)
`timescale 10ns/1ns

module mult_q15 (
    input  signed [15:0] a,
    input  signed [15:0] b,
    output signed [15:0] y
);
	
	reg signed [15:0] reg_a, reg_b;
	wire signed [15:0] y_s;

   wire signed [31:0] mult_full;  
    
	assign mult_full = reg_a * reg_b;
	
	
	assign y_s = ((reg_a == 16'sh8000) && (reg_b == 16'sh8000))  ? 16'sh7FFF : mult_full >>> 15;

	
	
	
//	assign y_s = mult_full >>> 15;
	
	initial begin
//		reg_a <= 16'shC000;		// -0.5
//		reg_b <= 16'sh2000;		// 0.25

		
		// проверка крайних значений из таблицы
//		reg_a <= 16'sh4000;
//		reg_b <= 16'sh4000;

//		reg_a <= 16'sh7FFF;
//		reg_b <= 16'sh7FFF;		
		
		reg_a <= 16'sh8000;
		reg_b <= 16'sh8000;
		
		#5 
		$display("mult_full HEX = 0x%h * 0x%h = 0x%h[30:15] = 0x%h ", reg_a, reg_b, mult_full, mult_full[30:15]); 
		$display("mult_full = %f * %f = %f[30:15] = %f", reg_a/32768.0, reg_b/32768.0, mult_full/32768.0, y_s/32768.0); 
      $display("y_s = mult_full[30:15] = %f", y_s/32768.0); 
	
	end
	
endmodule
