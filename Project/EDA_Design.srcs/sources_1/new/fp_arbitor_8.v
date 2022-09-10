`timescale 1ns / 1ps

////////////////////////////////////////////////////////////
// 8�û��̶����ȼ�
// - ���ȼ���0->1->2->3->4->5->6->7->8
// - ��ת�������� 0 λ���𣬰��������ȼ���Ȩ
////////////////////////////////////////////////////////////
module fp_arbitor_8(
    input  clk,        // ʱ���ź�
    input  rst_n,      // ��λ�ź�
    input  [7:0] req,  // �����ź�
    output busy,       // æ�ź�
    output reg [7:0] grant // Ȩ�޷���
    );
    
    wire hold;          // ���󱣳�
    wire [7:0] mask;    // ������Ĥ
    reg  [7:0] granted; // ��һ�εķ���
    
    // ��ǰ������
    assign busy = |req;
    // ���󱣳�
    assign hold = |(req & granted);
    // ѡ��ʵ�ʷ���������
    wire [7:0] qualifer = (hold) ? granted : req;
    
    // ������Ĥ
    assign mask[0] = qualifer[0];
    assign mask[1] = qualifer[1] & ~(|mask[0]);
    assign mask[2] = qualifer[2] & ~(|mask[1:0]);
    assign mask[3] = qualifer[3] & ~(|mask[2:0]);
    assign mask[4] = qualifer[4] & ~(|mask[3:0]);
    assign mask[5] = qualifer[5] & ~(|mask[4:0]);
    assign mask[6] = qualifer[6] & ~(|mask[5:0]);
    assign mask[7] = qualifer[7] & ~(|mask[6:0]);
    
    // ����Ȩ��
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin   // �͵�ƽ��λ
            grant   <= 'b0;
            granted <= 'b0; end
        else begin          // ���������Ȩ
            grant   <= mask;
            granted <= mask; end
    end
endmodule