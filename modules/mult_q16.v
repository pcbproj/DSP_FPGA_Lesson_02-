// 16x16-битный умножитель со знаком (формат Q1.15)
`timescale 10ns/1ns

module mult_q16 (
    input  unsigned [15:0] a,
    input  unsigned [15:0] b,
    output unsigned [15:0] y
);
	
	reg unsigned [15:0] reg_a, reg_b;
	wire unsigned [15:0] y_s;

   wire unsigned [31:0] mult_full;  
    
	assign mult_full = reg_a * reg_b;  
	assign y_s = mult_full >>> 16;
	
	initial begin
//		reg_a <= 16'hC000;		// 
//		reg_b <= 16'h2000;		// 

		
		// проверка крайних значений из таблицы
//		reg_a <= 16'h4000;
//		reg_b <= 16'h4000;

		reg_a <= 16'hFFFF;
		reg_b <= 16'h8000;		
		
//		reg_a <= 16'hC000;
//		reg_b <= 16'h8000;		
		
		#5 
		$display("mult_full HEX = 0x%h * 0x%h = 0x%h[30:15] = 0x%h ", reg_a, reg_b, mult_full, mult_full[31:16]); 
		$display("mult_full = %f * %f = %f[31:16] = %f", reg_a/65536.0, reg_b/65536.0, mult_full/65536.0, y_s/65536.0); 
      $display("y_s = mult_full[31:16] = %f", y_s/65536.0); 
	
	end
	
endmodule
