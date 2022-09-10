`timescale 1ns / 1ps

/////////////////////////////////////////////////////////////////
// ���ȼ�����: 01234567
// ��ת���ȼ��㷨:
// a.�����ǰֻ��һ���ź���������.
// b.���û��������ô��¼��һ��0�������.
// c.���ͬʱ�ж���ź����󣬿�����һ�������ź�.
module rr_arbitor_8(
    input   clk,        // ʱ���ź�
    input   rst_n,      // ��λ�ź�
    input   [7:0] req,  // �����ź�
    output  reg [7:0] grant // Ȩ�޷���
    );
    wire request;       // ������
    reg [7:0] last = 0; // ǰһ�η���
    
    assign request = |req[7:0];
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin    // �͵�ƽ��λ
            grant <= 8'b0;
            last  <= 8'h01; end
        else begin          // �Ǹ�λ�ٲ�
            if(!request) begin  // ������(û������ʱ����¼��һ�η����0)
                grant <= 8'b0;
                last  <= 8'h01; end         //p.s.last  <= last;
            else begin          // ������
                if(|(req[7:0] & last[7:0])) begin   // ά����Ȩ
                    grant <= last[7:0];
                    last  <= last[7:0]; end
                else if(|(req[7:0] & {last[6:0],last[7]})) begin    // �ٷ���
                    grant <= {last[6:0],last[7]};
                    last  <= {last[6:0],last[7]}; end
                else if(|(req[7:0] & {last[5:0],last[7:6]})) begin  // �ٷ���
                    grant <= {last[5:0],last[7:6]};
                    last  <= {last[5:0],last[7:6]}; end
                else if(|(req[7:0] & {last[4:0],last[7:5]})) begin  // �ٷ���
                    grant <= {last[4:0],last[7:5]};
                    last  <= {last[4:0],last[7:5]}; end
                else if(|(req[7:0] & {last[3:0],last[7:4]})) begin  // �ٷ���
                    grant <= {last[3:0],last[7:4]};
                    last  <= {last[3:0],last[7:4]}; end
                else if(|(req[7:0] & {last[2:0],last[7:3]})) begin  // �ٷ���
                    grant <= {last[2:0],last[7:3]};
                    last  <= {last[2:0],last[7:3]}; end
                else if(|(req[7:0] & {last[1:0],last[7:2]})) begin  // �ٷ���
                    grant <= {last[1:0],last[7:2]};
                    last  <= {last[1:0],last[7:2]}; end
                else if(|(req[7:0] & {last[0],last[7:1]})) begin    // �ٷ���
                    grant <= {last[0],last[7:1]};
                    last  <= {last[0],last[7:1]}; end
            end
        end
    end
endmodule