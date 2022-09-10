`timescale 1ns / 1ps

////////////////////////////////////////////////////////////
// 8用户固定优先级
// - 优先级：0->1->2->3->4->5->6->7->8
// - 轮转条件：从 0 位置起，按上述优先级授权
////////////////////////////////////////////////////////////
module fp_arbitor_8(
    input  clk,        // 时钟信号
    input  rst_n,      // 复位信号
    input  [7:0] req,  // 请求信号
    output busy,       // 忙信号
    output reg [7:0] grant // 权限分配
    );
    
    wire hold;          // 请求保持
    wire [7:0] mask;    // 请求掩膜
    reg  [7:0] granted; // 上一次的分配
    
    // 当前有请求
    assign busy = |req;
    // 请求保持
    assign hold = |(req & granted);
    // 选择实际分析的请求
    wire [7:0] qualifer = (hold) ? granted : req;
    
    // 计算掩膜
    assign mask[0] = qualifer[0];
    assign mask[1] = qualifer[1] & ~(|mask[0]);
    assign mask[2] = qualifer[2] & ~(|mask[1:0]);
    assign mask[3] = qualifer[3] & ~(|mask[2:0]);
    assign mask[4] = qualifer[4] & ~(|mask[3:0]);
    assign mask[5] = qualifer[5] & ~(|mask[4:0]);
    assign mask[6] = qualifer[6] & ~(|mask[5:0]);
    assign mask[7] = qualifer[7] & ~(|mask[6:0]);
    
    // 分配权限
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin   // 低电平复位
            grant   <= 'b0;
            granted <= 'b0; end
        else begin          // 其他情况授权
            grant   <= mask;
            granted <= mask; end
    end
endmodule