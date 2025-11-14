module mult_booth_wooly (
	input clk,
    input  signed [7:0] a, b,
    output reg signed [15:0] product
);
    reg signed [15:0] acc;
    reg [8:0] b_ext;
    integer i;

    always @(posedge clk) begin
        acc = 0;
        b_ext = {b, 1'b0};

        for (i = 0; i < 4; i = i + 1) begin
            case (b_ext[2:0])
                3'b001, 3'b010: acc = acc + (a <<< (2*i));
                3'b011:         acc = acc + ((a <<< 1) <<< (2*i));  // +2A
                3'b100:         acc = acc - ((a <<< 1) <<< (2*i));  // -2A
                3'b101, 3'b110: acc = acc - (a <<< (2*i));
            endcase
            b_ext = b_ext >>> 2;
        end
        product = acc;
    end
endmodule
