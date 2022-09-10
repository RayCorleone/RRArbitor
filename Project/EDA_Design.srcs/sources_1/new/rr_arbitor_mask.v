`timescale 1ns / 1ps

////////////////////////////////////////////////////////////
// 4�û���ת���ȼ�
// - ��ת����0->1->2->3->0
// - ��ת����������һ�θ�ֵ��λ���𣬰���ת���ȼ���Ȩ
////////////////////////////////////////////////////////////
module rr_arbitor_mask(
    input  clk,        // ʱ���ź�
    input  rst_n,      // ��λ�ź�
    input  [3:0] req,  // �����ź�
    output busy,       // æ�ź�
    output reg [3:0] grant // Ȩ�޷���
    );

    wire hold;          // ���󱣳�
    wire [3:0] mask;    // ������Ĥ
    reg  [3:0] granted = 4'b0;  // ��һ�η���
    reg  [1:0] shifted = 2'b0;  // ��һ�η���ʱ�����ȼ���λ
   
    // ��ǰ������
    assign busy = |req;
    // ���󱣳�
    assign hold = |(req & granted);
    // ѡ��ʵ�ʵ�����
    wire [3:0] qualifer = (hold) ? granted : req;

    wire [7:0] request_copy = {qualifer,qualifer};  // �����������չ
    wire [3:0] request_shift = request_copy[shifted +: 4];    // ��λ��ı�������

    // ������λ�����Ĥ
    wire [3:0] mask_shift;
    assign mask_shift[0] = request_shift[0];
    assign mask_shift[1] = request_shift[1] & ~(|mask_shift[0]);
    assign mask_shift[2] = request_shift[2] & ~(|mask_shift[1:0]);
    assign mask_shift[3] = request_shift[3] & ~(|mask_shift[2:0]);

    // ����ʵ�ʵ���Ĥ
    wire [7:0] mask_copy = {mask_shift,mask_shift};
    assign mask = mask_copy[(7-shifted)-:4];
    
    // ���㱾�����ȼ���λ
    wire [1:0] shift;
    assign shift[1:0] = (mask[0]) ? 2'b00 : 
                        (mask[1]) ? 2'b01 :
                        (mask[2]) ? 2'b10 :
                        (mask[3]) ? 2'b11 : 2'b00;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin    // �͵�ƽ��λ
            grant   <= 4'b0;
            granted <= 4'b0;
            shifted <= 2'b0; end
        else begin          // �Ǹ�λ�ٲ�
            grant   <= mask;
            granted <= mask;
            if(|mask)   // ����Ȩʱ����¼ shifted
                shifted <= shift[1:0];
            else        // ����Ȩʱ������ shifted Ϊ 0
                shifted <= 0;
        end
    end
endmodule