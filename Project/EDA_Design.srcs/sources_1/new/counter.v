`timescale 1ns / 1ps

module counter #(parameter CNT_MAX = 7, WIDTH = clogb2(CNT_MAX - 1))(
    input clk,      // 工作时钟，上升沿作为工作沿
    input rst_n,    // 复位信号，异步复位且低电平有效
    input ena,      // 启停控制信号,高电平为启动，低电平为暂停
    output reg [WIDTH - 1:0] count = 0, // 计数的结果
    output reg pause = 0                // 计数到 m 时变化 
    );
    // 求寄存器位宽
    function integer clogb2 (input integer depth);
        begin
            for (clogb2=0; depth>0; clogb2=clogb2+1)
                depth = depth >> 1;
        end
    endfunction

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin    // 低电平复位
            count <= 0;
            pause <= 0;
        end
        else if(ena) begin  // 计数使能
            if(count >= CNT_MAX - 1) begin  // 计数到 CNT_MAX
                count <= 0;             // count 的值返回 0
                pause <= ~pause; end    // 发出计数成功信号
            else begin  // 未到 CNT_MAX
                count <= count + 1;     // count 的值 +1
                pause <= pause; end     // pause 的值不变
        end
    end
endmodule