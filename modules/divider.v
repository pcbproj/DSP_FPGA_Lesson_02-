// Последовательный делитель на цело без знака

module divider#(parameter N=16) (
    input  clk, start,
    input  [N-1:0] dividend,
    input  [N-1:0] divisor,
    output reg [N-1:0] quotient,
    output reg done
);
    reg [2*N-1:0] remainder;
    reg [N-1:0] div;
    reg [5:0] count;

    always @(posedge clk) begin
        if (start) begin
            remainder <= { {N{1'b0}}, dividend };
            div <= divisor;
            quotient <= 0;
            count <= N;
            done <= 0;
        end 
        else if (count != 0) begin
            remainder = remainder << 1;
            quotient = quotient << 1;
            if (remainder[2*N-1:N] >= div) begin
                remainder[2*N-1:N] = remainder[2*N-1:N] - div;
                quotient[0] <= 1;
            end
            count <= count - 1;
        end
        else done <= 1;
    end
endmodule
