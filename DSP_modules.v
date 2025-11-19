module DSP_modules
(
	(* altera_attribute = "-name VIRTUAL_PIN ON" *) input 					clk,
	(* altera_attribute = "-name VIRTUAL_PIN ON" *) input 					reset,
	(* altera_attribute = "-name VIRTUAL_PIN ON" *) output 					done,
	(* altera_attribute = "-name VIRTUAL_PIN ON" *) input 			[15:0] 	in_a,
	(* altera_attribute = "-name VIRTUAL_PIN ON" *) input 			[15:0] 	in_b,
	(* altera_attribute = "-name VIRTUAL_PIN ON" *) output 		 	[31:0] 	out_a,
	(* altera_attribute = "-name VIRTUAL_PIN ON" *) output 		 	[31:0] 	out_b
		
	
);	
	
/*
// представление двоичных чисел
binary_representation binary_representation_inst
(
	.a_unsigned(in_a) ,	// input [7:0] a_unsigned_sig
	.a_signed(in_b)    	// input [7:0] a_signed_sig
);
*/

	
// 16-bit сложение и вычитание целочисленнное
/*
 add_sub_example add_sub_example_inst
(
	.a(in_a) ,	// input [15:0] a_sig
	.b(in_b) ,	// input [15:0] b_sig
	.sum(out_a) ,	// output [15:0] sum_sig
	.carry_out(done) ,	// output  carry_out_sig
	.diff(out_b) 	// output [15:0] diff_sig
);
*/

 
 // целочисленнное умножение
 /*
 mult_example mult_example_inst(
	.clk(clk),
	.a(in_a), 
	.b(in_b),
    .product(out_a)
);
*/

 
 
/*
// умножение методом Бо-Вули (ModelSim + Quartus RTL)
mult_booth_wooly mult_booth_wooly_inst (
	.clk(clk),
    .a(in_a), 
    .b(in_b),
    .product(out_a)
);
*/


/*
// целочисленное деление с остатком
div_example div_example_inst
(
	.clk(clk),
	.dividend(in_a) ,	// input [7:0] dividend_sig
	.divisor(in_b) ,	// input [7:0] divisor_sig
	.quotient(out_a) ,	// output [7:0] quotient_sig
	.remainder(out_b) 	// output [7:0] remainder_sig
);
*/


/*
// последовательный делитель без знака (деление вычетанием) (ModelSim + Quartus RTL)
divider divider_inst
(
	.clk(clk) ,	// input  clk_sig
	.start(reset) ,	// input  start_sig
	.dividend(in_a) ,	// input [(WIDTH-1):0] dividend_sig
	.divisor(in_b) ,	// input [(WIDTH-1):0] divisor_sig
	.quotient(out_a) ,	// output [(WIDTH-1):0] quotient_sig
	.done(done) 	// output  done_sig
);
defparam divider_inst.N = 16;
*/


/*
// сложение чисел с фиксированной точкой Q1.15
fixed_point_add_sub fixed_point_add_sub_inst
(
	.clk(clk),
	.a(in_a) ,	// input [15:0] a_sig
	.b(in_b) ,	// input [15:0] b_sig
	.sum(out_a) ,	// output [15:0] sum_sig
	.diff(out_b) 	// output [15:0] diff_sig
);
*/


/*
// 16x16-битный умножитель со знаком (формат Q1.15)	
mult_q15 mult_q15_inst
(
	.a(in_a) ,	// input [15:0] a_sig
	.b(in_b) ,	// input [15:0] b_sig
	.y(out_data) 	// output [31:0] y_sig
);
*/


// 16-битное деление с фиксированной точкой Q1.15 Q0.16
	div_q15q16 div_q15q16_inst(  
    .a(in_a), 
    .b(in_b),  
    .y_s(out_a),
    .y_u(out_b)
);

 
/*
 // Умножитель с накоплением (MAC) и деление (ModelSim + Quartus RTL)
DSP_mac_div DSP_mac_div_inst 
(
	.reset(reset),
	.clk(clk) ,	
	.a(in_a) ,	
	.b(in_b) ,	
	.acc(out_a), 	
	.quout(out_b)
);
 
*/		

/*
// БОНУС! использование LPM_DEVIDE из бибилиотеки Altera (Quartus RTL)
altera_divider altera_divider_inst 
(
	.dividend(in_a) ,	
	.divisor(in_b) ,	
	.clk(clk) ,	
	.reset(reset) ,	
	.quotient(out_a) ,
	.remainder(out_b) 
);	
*/
	
	
endmodule
