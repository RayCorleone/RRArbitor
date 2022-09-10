`timescale 1ns / 1ps

/////////////////////////////////////////////////////////////////
// ���ȼ�����: 0123
// ��ת���ȼ��㷨:
// a.�����ǰֻ��һ���ź���������.
// b.���û��������ô��¼��һ��0�������.
// c.���ͬʱ�ж���ź����󣬿�����һ�������ź�.
module rr_arbitor_4(
    input   clk,        // ʱ���ź�
    input   rst_n,      // ��λ�ź�
    input   [3:0] req,  // �����ź�
    output  reg [3:0] grant // Ȩ�޷���
    );
    wire request;       // ������
    reg [3:0] last = 0; // ǰһ�η���
    
    assign request = |req[3:0];
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin    // �͵�ƽ��λ
            grant <= 4'b0;
            last  <= 4'h01; end
        else begin          // �Ǹ�λ�ٲ�
            if(!request) begin  // ������(û������ʱ����¼��һ�η����0)
                grant <= 4'b0;
                last  <= 4'h01; end         // ��last <= last;
            else begin          // ������
                if(|(req[3:0] & last[3:0])) begin   // ά����Ȩ
                    grant <= last[3:0];
                    last  <= last[3:0]; end
                else if(|(req[3:0] & {last[2:0],last[3]})) begin    // �ٷ���
                    grant <= {last[2:0],last[3]};
                    last  <= {last[2:0],last[3]}; end
                else if(|(req[3:0] & {last[1:0],last[3:2]})) begin  // �ٷ���
                    grant <= {last[1:0],last[3:2]};
                    last  <= {last[1:0],last[3:2]}; end
                else if(|(req[3:0] & {last[0],last[3:1]})) begin    // �ٷ���
                    grant <= {last[0],last[3:1]};
                    last  <= {last[0],last[3:1]}; end
            end
        end
    end
endmodule