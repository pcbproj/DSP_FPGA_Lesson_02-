`timescale 10ns/1ns

module div_q15q16 (  
    input signed [15:0] a, b,  
    output signed [15:0] y_s, // для знакового числа очень важно соблюдать разрядность
    output [31:0] y_u
);
	
	reg signed 	[15:0] reg_a_s, reg_b_s;
	reg 		[15:0] reg_a_u, reg_b_u;
	reg signed 	[31:0] reg_y_s;
	reg 	 	[31:0] reg_y_u;
	
	always @* begin
        //======= беззнаковое деление ============
        // защита от деления на ноль беззнковая. насыщение
        if (reg_b_u == 0)
            reg_y_u = 32'hFFFFFFFF;     
        else
            reg_y_u = (reg_a_u <<< 16) / reg_b_u;
            
		//========= знаковое деление ==================
		// защита деления на ноль знаковая
        if (reg_b_s == 0)	
            reg_y_s = (reg_a_s[15]) ? -32768 : 32767; // знак сохраняем и насыщение
        else
			reg_y_s = (reg_a_s <<< 15) / reg_b_s;
		// насыщение при переполнении 	
		if (reg_y_s < -32768) 	// -32768
			reg_y_s = -32768;
        else if (reg_y_s > 32767) // +32767.0
			reg_y_s = 32767;
		
    end
    
    assign y_u = (reg_y_u > 32'h0000FFFF) ? 16'hFFFF : reg_y_u[15:0]; // насыщение без знака при штатном делении
	assign y_s = reg_y_s[15:0];
	
	initial begin
		reg_a_s <= 16'sh4000;	// 0.5
		//~ reg_b_s <= 16'sh1000;	// 0.125
		reg_b_s <= 16'shEFFF;	// -0.125
		
		reg_a_u <= 16'h4000;	// 0.25
		reg_b_u <= 16'h1000;    // 0.0625
		
	
		#5
		$display("----- SIGNED ---------");
		$display("reg_y_s = (%f / %f) = %f", reg_a_s/32768.0, reg_b_s/32768.0, reg_y_s/32768.0); 
		$display("y_s = (%f / %f) = %f", reg_a_s/32768.0, reg_b_s/32768.0, y_s/32768.0); 
		$display("----- UNSIGNED ---------");
		$display("reg_y_u = (%f / %f) = %f", reg_a_u/65536.0, reg_b_u/65536.0, reg_y_u/65536.0); 
		$display("y_u = (%f / %f) = %f", reg_a_u/65536.0, reg_b_u/65536.0, y_u/65536.0); 
	
	end
endmodule
