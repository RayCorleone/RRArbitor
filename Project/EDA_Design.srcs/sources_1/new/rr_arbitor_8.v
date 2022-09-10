`timescale 1ns / 1ps

/////////////////////////////////////////////////////////////////
// 优先级排序: 01234567
// 轮转优先级算法:
// a.如果当前只有一个信号请求，则处理.
// b.如果没有请求，那么记录上一次0获得总线.
// c.如果同时有多个信号请求，考虑上一个请求信号.
module rr_arbitor_8(
    input   clk,        // 时钟信号
    input   rst_n,      // 复位信号
    input   [7:0] req,  // 请求信号
    output  reg [7:0] grant // 权限分配
    );
    wire request;       // 有请求
    reg [7:0] last = 0; // 前一次分配
    
    assign request = |req[7:0];
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin    // 低电平复位
            grant <= 8'b0;
            last  <= 8'h01; end
        else begin          // 非复位仲裁
            if(!request) begin  // 无请求(没有请求时，记录上一次分配给0)
                grant <= 8'b0;
                last  <= 8'h01; end         //p.s.last  <= last;
            else begin          // 有请求
                if(|(req[7:0] & last[7:0])) begin   // 维持授权
                    grant <= last[7:0];
                    last  <= last[7:0]; end
                else if(|(req[7:0] & {last[6:0],last[7]})) begin    // 再分配
                    grant <= {last[6:0],last[7]};
                    last  <= {last[6:0],last[7]}; end
                else if(|(req[7:0] & {last[5:0],last[7:6]})) begin  // 再分配
                    grant <= {last[5:0],last[7:6]};
                    last  <= {last[5:0],last[7:6]}; end
                else if(|(req[7:0] & {last[4:0],last[7:5]})) begin  // 再分配
                    grant <= {last[4:0],last[7:5]};
                    last  <= {last[4:0],last[7:5]}; end
                else if(|(req[7:0] & {last[3:0],last[7:4]})) begin  // 再分配
                    grant <= {last[3:0],last[7:4]};
                    last  <= {last[3:0],last[7:4]}; end
                else if(|(req[7:0] & {last[2:0],last[7:3]})) begin  // 再分配
                    grant <= {last[2:0],last[7:3]};
                    last  <= {last[2:0],last[7:3]}; end
                else if(|(req[7:0] & {last[1:0],last[7:2]})) begin  // 再分配
                    grant <= {last[1:0],last[7:2]};
                    last  <= {last[1:0],last[7:2]}; end
                else if(|(req[7:0] & {last[0],last[7:1]})) begin    // 再分配
                    grant <= {last[0],last[7:1]};
                    last  <= {last[0],last[7:1]}; end
            end
        end
    end
endmodule