`timescale 1ns/1ps      // (1) масштаб времени

module tb_DSP_modules;     

    // (3) Объявляем сигналы, которые подключим к DUT
    reg clk;
    reg rst;
    reg unsigned [15:0]  in_a, in_b;
    wire unsigned [31:0]  out1, out2;
	 wire done;

    // (4) Встраиваем тестируемый модуль (Device Under Test)
    DSP_modules dut (
        .clk(clk),
        .reset(rst),
        .in_a(in_a),
        .in_b(in_b),
        .out_a(out1),
        .out_b(out2),
		.done(done)
    );

   
    // (6) Основной блок стимула
    initial begin
        // инициализация сигналов
        clk = 0;
        rst = 1'b1;
		in_a = 16'sh0000;
		in_b = 16'sh0000;

        // снимаем сброс через 20 нс
        #20 rst = 1'b0;

        // подаём входные данные
		// #10 in_a = 16'sh4000; in_b = 16'shC000;
		// #10 in_a = 16'sh0200; in_b = 16'sh4000;
		// #10 in_a = 16'sh6000; in_b = 16'sh6000;
 
        // ждём 50 нс и завершаем
//        #50 $finish;
    end
	
	 // (5) Генератор тактового сигнала
    always #5 clk = ~clk;    // период 10 нс → частота 100 МГц
	
	
	// генерация входных значений 
	always @(posedge clk) begin
		// целочисленное умножение
		in_a <= 16'sh0043;
		in_b <= 16'sh0007;
		
		// in_a <= 16'sh7F40;
		// in_b <= 16'sh01C0;
		
		// in_a <= 16'd20000;
		// in_b <= 16'd4000;
	
	end

    // (7) Мониторинг сигналов
    // initial begin
        // $monitor("t = %0t \t | \t rst = %0d \t in_a = %0d \t in_b = %0d \t out1 = %0d \t out2 = %0d \t done = %0b", $time, rst, in_a, in_b, out1[15:0], out2[15:0], done);
    // end

endmodule
