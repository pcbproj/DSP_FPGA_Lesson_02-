`timescale 10ns/1ns
module add_sub_example(
	input        [7:0] a, b,
    output wire [7:0] sum,
    output wire carry_out,
	output wire [7:0] diff
);
    
	reg  [7:0] a_u, b_u;
	wire [7:0] sum_u, diff_u;
	wire [8:0] lsum_u;
	
	
	reg signed [7:0] a_s, b_s;
	wire signed [8:0] sum_s;	// !! разрядность выше на 1
	wire signed [8:0] diff_s;	// !! разрядность выше на 1
   wire signed [7:0] sum_s_SAT;
   wire signed [7:0] diff_s_SAT;
	
	wire overflow_s;
	wire carry_u;
	
	//----- unsigned sum sub ------------
	assign {carry_u, sum_u} = a_u + b_u;
	assign lsum_u = a_u + b_u;	// Борьба с переполнением. Увеличение разрядность результата до 9 бит. 
	assign diff_u = a_u - b_u;

	//-------- signed sum --------------
	assign overflow_s = (a_s[7] != b_s[7]) && (diff_s[7] != a_s[7]); // check overflow
	assign sum_s = a_s + b_s;
	assign sum_s_SAT = (sum_s > 127)  ? 8'sd127 : (sum_s < -128) ? -8'sd128 : sum_s[7:0];  // насыщение при знаковом сложении
	assign diff_s_SAT = (diff_s > 127)  ? 8'sd127 : (diff_s < -128) ? -8'sd128 : diff_s[7:0]; // насыщение при знаковом вычитании


	//--------- signed sub -----------
    assign diff_s = a_s - b_s;
    
    initial begin
      a_u = 8'd100;
      b_u = 8'd200;
		
		a_s = 8'sd60;
      b_s = -8'sd100;
		
      #5 
		$display("a_u=%d, b_u=%d, sum_u=%d, carry_u=%d, diff_u=%d", a_u, b_u, sum_u, carry_u, diff_u);
		$display("More bits number for sum_u: lsum_u[8:0]=%d", lsum_u);
		$display("a_s=%d, b_s=%d, sum_s=%d, overflow_s=%d, diff_s=%d", a_s, b_s, sum_s[7:0], overflow_s, diff_s[7:0]);
		$display("sum_s_SAT=%d", sum_s_SAT);
		$display("diff_s_SAT=%d", diff_s_SAT);
    end
endmodule





