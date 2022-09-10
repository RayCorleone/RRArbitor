`timescale 1ns / 1ps

module counter_tb;
    // ��Ĵ���λ��
    function integer clogb2 (input integer depth);
        begin
            for (clogb2=0; depth>0; clogb2=clogb2+1) 
                depth = depth >>1;                          
        end
    endfunction
    
    // ���峣��
    parameter M = 8;
    parameter Width = clogb2(M-1);
    
    reg  clk = 1;   // ����ʱ��
    reg  rst_n = 0; // �첽��λ�ź�
    reg  ena = 0;   // ��ͣ�����ź�
    wire pause;     // �����ɹ���־
    wire [Width-1:0] count;   // �����Ľ��   
    
    // ����ģ��
    defparam uut.CNT_MAX = M;
    counter uut(.clk(clk),.rst_n(rst_n),.ena(ena),.count(count),.pause(pause));
    
    // �ṩʱ��
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