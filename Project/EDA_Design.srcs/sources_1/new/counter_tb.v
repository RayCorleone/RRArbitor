`timescale 1ns / 1ps

module counter_tb;
    // 求寄存器位宽
    function integer clogb2 (input integer depth);
        begin
            for (clogb2=0; depth>0; clogb2=clogb2+1) 
                depth = depth >>1;                          
        end
    endfunction
    
    // 定义常数
    parameter M = 8;
    parameter Width = clogb2(M-1);
    
    reg  clk = 1;   // 工作时钟
    reg  rst_n = 0; // 异步复位信号
    reg  ena = 0;   // 启停控制信号
    wire pause;     // 计数成功标志
    wire [Width-1:0] count;   // 计数的结果   
    
    // 设置模块
    defparam uut.CNT_MAX = M;
    counter uut(.clk(clk),.rst_n(rst_n),.ena(ena),.count(count),.pause(pause));
    
    // 提供时钟
    always begin
        #5 clk = ~clk;
    end
    
    initial begin   // run 570ns
        ena <= 0; rst_n <= 0;
        # 30 rst_n <= 1; ena <= 1;
        # 100 ena <= 0;
        # 20  ena <= 1;
        # 30  ena <= 0;
        # 20  ena <= 1;
        # 100 ena <= 0;
        # 10  ena <= 1;
        # 200 rst_n <= 0; ena <= 0;
    end
endmodule