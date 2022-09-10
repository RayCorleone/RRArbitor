`timescale 1ns / 1ps

module counter #(parameter CNT_MAX = 7, WIDTH = clogb2(CNT_MAX - 1))(
    input clk,      // ����ʱ�ӣ���������Ϊ������
    input rst_n,    // ��λ�źţ��첽��λ�ҵ͵�ƽ��Ч
    input ena,      // ��ͣ�����ź�,�ߵ�ƽΪ�������͵�ƽΪ��ͣ
    output reg [WIDTH - 1:0] count = 0, // �����Ľ��
    output reg pause = 0                // ������ m ʱ�仯 
    );
    // ��Ĵ���λ��
    function integer clogb2 (input integer depth);
        begin
            for (clogb2=0; depth>0; clogb2=clogb2+1)
                depth = depth >> 1;
        end
    endfunction

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin    // �͵�ƽ��λ
            count <= 0;
            pause <= 0;
        end
        else if(ena) begin  // ����ʹ��
            if(count >= CNT_MAX - 1) begin  // ������ CNT_MAX
                count <= 0;             // count ��ֵ���� 0
                pause <= ~pause; end    // ���������ɹ��ź�
            else begin  // δ�� CNT_MAX
                count <= count + 1;     // count ��ֵ +1
                pause <= pause; end     // pause ��ֵ����
        end
    end
endmodule