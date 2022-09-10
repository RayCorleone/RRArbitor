`timescale 1ns / 1ps

////////////////////////////////////////////////////////////
// 4用户轮转优先级
// - 轮转次序：0->1->2->3->0
// - 轮转描述：从上一次赋值的位置起，按轮转优先级授权
////////////////////////////////////////////////////////////
module rr_arbitor_mask(
    input  clk,        // 时钟信号
    input  rst_n,      // 复位信号
    input  [3:0] req,  // 请求信号
    output busy,       // 忙信号
    output reg [3:0] grant // 权限分配
    );

    wire hold;          // 请求保持
    wire [3:0] mask;    // 请求掩膜
    reg  [3:0] granted = 4'b0;  // 上一次分配
    reg  [1:0] shifted = 2'b0;  // 上一次分配时的优先级移位
   
    // 当前有请求
    assign busy = |req;
    // 请求保持
    assign hold = |(req & granted);
    // 选择实际的请求
    wire [3:0] qualifer = (hold) ? granted : req;

    wire [7:0] request_copy = {qualifer,qualifer};  // 本次请求的扩展
    wire [3:0] request_shift = request_copy[shifted +: 4];    // 移位后的本次请求

    // 计算移位后的掩膜
    wire [3:0] mask_shift;
    assign mask_shift[0] = request_shift[0];
    assign mask_shift[1] = request_shift[1] & ~(|mask_shift[0]);
    assign mask_shift[2] = request_shift[2] & ~(|mask_shift[1:0]);
    assign mask_shift[3] = request_shift[3] & ~(|mask_shift[2:0]);

    // 计算实际的掩膜
    wire [7:0] mask_copy = {mask_shift,mask_shift};
    assign mask = mask_copy[(7-shifted)-:4];
    
    // 计算本次优先级移位
    wire [1:0] shift;
    assign shift[1:0] = (mask[0]) ? 2'b00 : 
                        (mask[1]) ? 2'b01 :
                        (mask[2]) ? 2'b10 :
                        (mask[3]) ? 2'b11 : 2'b00;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin    // 低电平复位
            grant   <= 4'b0;
            granted <= 4'b0;
            shifted <= 2'b0; end
        else begin          // 非复位仲裁
            grant   <= mask;
            granted <= mask;
            if(|mask)   // 有授权时，记录 shifted
                shifted <= shift[1:0];
            else        // 无授权时，保持 shifted 为 0
                shifted <= 0;
        end
    end
endmodule