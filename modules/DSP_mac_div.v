// Умножитель с накоплением (MAC)
// деление, проверка генерации DSP 

module DSP_mac_div (
	input reset,
   input  clk,
   input  signed [15:0] a,
   input  signed [15:0] b,
   output reg signed [31:0] acc,
   output reg signed [31:0] quout
);
   always @(posedge clk) begin
		if (reset) begin
			acc <= 0;
		end else begin
			acc <= acc + a * b;
			quout <= a / b;
		end
   end
endmodule
