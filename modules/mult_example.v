module mult_example(
	input 				clk,
	input 		[7:0] a, b,
   output		[15:0] product
);
  
	reg  [7:0] reg_a, reg_b;
	reg  [15:0] result;
	wire  [15:0] product_trunc;
	
	assign product = result;
	assign product_trunc = result[7:0];
	
	always @(posedge clk) begin
        reg_a <= a;
        reg_b <= b;
		result <= reg_a * reg_b;
        $display("product= %d * %d = %d", reg_a, reg_b, result); 
        $display("product_trunc= (%d * %d)[7:0] = %d", reg_a, reg_b, product_trunc); 
    end
endmodule
