module binary_representation (
   input        [7:0] a_unsigned,       // беззнаковое число
   input signed [7:0] a_signed  // то же, но интерпретируется со знаком
);
    
	reg [7:0] 	num_unsigned;
	reg signed [7:0]  num_signed;
	initial begin
       num_unsigned = 8'b10101010; // двоичная запись
       num_signed   = 8'b10101010; // тот же набор бит
		
        $display("Unsigned interpretation:");
        $display("num_unsigned = %d (in binary %b)", num_unsigned, num_unsigned);

        $display("Signed (additional code):");
        $display("num_signed = %d (in binary %b)", num_signed, num_signed);
    end
endmodule
