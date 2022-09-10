`timescale 1ns / 1ps

module rr_arbitor_mask_tb;
    reg  clk = 0;       // ʱ���ź�
    reg  rst_n = 0;     // ��λ�ź�
    reg  [3:0] req;     // �����ź�
    wire busy;          // æ�ź�
    wire [3:0] grant;   // Ȩ�޷���
    rr_arbitor_mask uun(clk, rst_n, req, busy, grant);

    integer cnt = 0;
    integer file;
    initial file = $fopen("C:/Users/14065/Desktop/result.txt","w");
    always begin
        #50  $fwrite (file, "## Count:%d\n", cnt);
        $fwrite (file, "request:%b\n", req[3:0]);
        $fwrite (file, "shifted:%h\n", uun.shifted);
        $fwrite (file, "grant:%b\n\n", grant[3:0]);
        cnt = cnt + 1;
    end

    always begin
        #5 clk = ~clk;
    end
    
    initial begin   // run 40600ns
        // ��λ
        rst_n <= 0;         #40 rst_n <= 1;
        // ��׼����
        #5 req <= 4'h0;
        #50 req <= 4'h1;    #50 req <= 4'h3;    #50 req <= 4'h4;    #50 req <= 4'h5;
        #50 req <= 4'ha;    #50 req <= 4'h7;    #50 req <= 4'h9;    #50 req <= 4'h0;
        // �������
        #50 req <= 4'hf;	#50 req <= 4'h1;	#50 req <= 4'h6;	#50 req <= 4'ha;	
        #50 req <= 4'h9;    #50 req <= 4'ha;    #50 req <= 4'he;    #50 req <= 4'ha;    
        #50 req <= 4'hd;    #50 req <= 4'hf;    #50 req <= 4'hb;    #50 req <= 4'h1;    
        #50 req <= 4'hd;    #50 req <= 4'hc;    #50 req <= 4'h8;    #50 req <= 4'hd;    
        #50 req <= 4'h1;    #50 req <= 4'he;    #50 req <= 4'h0;    #50 req <= 4'he;    
        #50 req <= 4'h6;    #50 req <= 4'h5;    #50 req <= 4'h0;    #50 req <= 4'ha;    
        #50 req <= 4'hc;    #50 req <= 4'hb;    #50 req <= 4'he;    #50 req <= 4'h1;    
        #50 req <= 4'hf;    #50 req <= 4'h4;    #50 req <= 4'hb;    #50 req <= 4'h3;    
        #50 req <= 4'h3;    #50 req <= 4'h6;    #50 req <= 4'h5;    #50 req <= 4'h1;    
        #50 req <= 4'h6;    #50 req <= 4'hc;    #50 req <= 4'h0;    #50 req <= 4'h2;    
        #50 req <= 4'h0;    #50 req <= 4'h5;    #50 req <= 4'h5;    #50 req <= 4'h7;    
        #50 req <= 4'he;    #50 req <= 4'h2;    #50 req <= 4'hb;    #50 req <= 4'h1;    
        #50 req <= 4'h0;    #50 req <= 4'h1;    #50 req <= 4'h6;    #50 req <= 4'h1;    
        #50 req <= 4'hf;    #50 req <= 4'h3;    #50 req <= 4'hd;    #50 req <= 4'h0;    
        #50 req <= 4'h3;    #50 req <= 4'h4;    #50 req <= 4'h0;    #50 req <= 4'h0;    
        #50 req <= 4'h4;    #50 req <= 4'hc;    #50 req <= 4'ha;    #50 req <= 4'h3;    
        #50 req <= 4'h0;    #50 req <= 4'h1;    #50 req <= 4'h3;    #50 req <= 4'ha;    
        #50 req <= 4'hc;    #50 req <= 4'h0;    #50 req <= 4'h9;    #50 req <= 4'h1;    
        #50 req <= 4'he;    #50 req <= 4'hc;    #50 req <= 4'h1;    #50 req <= 4'h9;    
        #50 req <= 4'hb;    #50 req <= 4'h5;    #50 req <= 4'h8;    #50 req <= 4'h6;    
        #50 req <= 4'hc;    #50 req <= 4'hd;    #50 req <= 4'hf;    #50 req <= 4'ha;    
        #50 req <= 4'h6;    #50 req <= 4'h7;    #50 req <= 4'h6;    #50 req <= 4'h1;    
        #50 req <= 4'ha;    #50 req <= 4'h1;    #50 req <= 4'h7;    #50 req <= 4'hf;    
        #50 req <= 4'ha;    #50 req <= 4'h4;    #50 req <= 4'h7;    #50 req <= 4'h7;    
        #50 req <= 4'hd;    #50 req <= 4'h9;    #50 req <= 4'h9;    #50 req <= 4'he;    
        #50 req <= 4'h5;    #50 req <= 4'hf;    #50 req <= 4'h4;    #50 req <= 4'hf;    
        #50 req <= 4'hf;    #50 req <= 4'ha;    #50 req <= 4'h5;    #50 req <= 4'hf;    
        #50 req <= 4'hb;    #50 req <= 4'hd;    #50 req <= 4'h8;    #50 req <= 4'h4;    
        #50 req <= 4'hd;    #50 req <= 4'hb;    #50 req <= 4'h3;    #50 req <= 4'h2;    
        #50 req <= 4'h2;    #50 req <= 4'ha;    #50 req <= 4'h3;    #50 req <= 4'h6;    
        #50 req <= 4'h7;    #50 req <= 4'ha;    #50 req <= 4'hc;    #50 req <= 4'h6;    
        #50 req <= 4'h7;    #50 req <= 4'h5;    #50 req <= 4'hb;    #50 req <= 4'h8;    
        #50 req <= 4'h3;    #50 req <= 4'h7;    #50 req <= 4'he;    #50 req <= 4'h3;    
        #50 req <= 4'h7;    #50 req <= 4'h0;    #50 req <= 4'h6;    #50 req <= 4'h4;    
        #50 req <= 4'hb;    #50 req <= 4'h7;    #50 req <= 4'hc;    #50 req <= 4'h1;    
        #50 req <= 4'h7;    #50 req <= 4'h1;    #50 req <= 4'h2;    #50 req <= 4'h3;    
        #50 req <= 4'ha;    #50 req <= 4'h3;    #50 req <= 4'hb;    #50 req <= 4'hf;    
        #50 req <= 4'hd;    #50 req <= 4'h4;    #50 req <= 4'hd;    #50 req <= 4'h5;    
        #50 req <= 4'h3;    #50 req <= 4'h6;    #50 req <= 4'h6;    #50 req <= 4'hd;    
        #50 req <= 4'h4;    #50 req <= 4'h7;    #50 req <= 4'hd;    #50 req <= 4'hf;    
        #50 req <= 4'ha;    #50 req <= 4'h3;    #50 req <= 4'ha;    #50 req <= 4'h2;    
        #50 req <= 4'hc;    #50 req <= 4'hc;    #50 req <= 4'h9;    #50 req <= 4'h8;    
        #50 req <= 4'h9;    #50 req <= 4'hc;    #50 req <= 4'hb;    #50 req <= 4'h8;    
        #50 req <= 4'h7;    #50 req <= 4'ha;    #50 req <= 4'he;    #50 req <= 4'hb;    
        #50 req <= 4'hd;    #50 req <= 4'hc;    #50 req <= 4'he;    #50 req <= 4'ha;    
        #50 req <= 4'hd;    #50 req <= 4'hc;    #50 req <= 4'hb;    #50 req <= 4'h8;    
        #50 req <= 4'h6;    #50 req <= 4'he;    #50 req <= 4'hd;    #50 req <= 4'hd;    
        #50 req <= 4'h9;    #50 req <= 4'h1;    #50 req <= 4'h5;    #50 req <= 4'h2;    
        #50 req <= 4'ha;    #50 req <= 4'h3;    #50 req <= 4'h6;    #50 req <= 4'h4;    
        #50 req <= 4'ha;    #50 req <= 4'ha;    #50 req <= 4'h4;    #50 req <= 4'h3;    
        #50 req <= 4'h3;    #50 req <= 4'h1;    #50 req <= 4'hc;    #50 req <= 4'ha;    
        #50 req <= 4'h3;    #50 req <= 4'hf;    #50 req <= 4'h4;    #50 req <= 4'h4;    
        #50 req <= 4'hc;    #50 req <= 4'hf;    #50 req <= 4'h4;    #50 req <= 4'hc;    
        #50 req <= 4'hb;    #50 req <= 4'hb;    #50 req <= 4'h5;    #50 req <= 4'h5;    
        #50 req <= 4'h8;    #50 req <= 4'h9;    #50 req <= 4'h9;    #50 req <= 4'hc;    
        #50 req <= 4'hd;    #50 req <= 4'hb;    #50 req <= 4'hc;    #50 req <= 4'hb;    
        #50 req <= 4'hb;    #50 req <= 4'h2;    #50 req <= 4'h9;    #50 req <= 4'h0;    
        #50 req <= 4'h9;    #50 req <= 4'h3;    #50 req <= 4'h0;    #50 req <= 4'hd;    
        #50 req <= 4'hf;    #50 req <= 4'hd;    #50 req <= 4'h6;    #50 req <= 4'h0;    
        #50 req <= 4'h2;    #50 req <= 4'h9;    #50 req <= 4'hd;    #50 req <= 4'h6;    
        #50 req <= 4'h0;    #50 req <= 4'h3;    #50 req <= 4'h6;    #50 req <= 4'hc;    
        #50 req <= 4'he;    #50 req <= 4'h8;    #50 req <= 4'h4;    #50 req <= 4'h6;    
        #50 req <= 4'h0;    #50 req <= 4'h0;    #50 req <= 4'h3;    #50 req <= 4'h3;    
        #50 req <= 4'ha;    #50 req <= 4'he;    #50 req <= 4'h9;    #50 req <= 4'h1;    
        #50 req <= 4'h4;    #50 req <= 4'h6;    #50 req <= 4'hb;    #50 req <= 4'hd;    
        #50 req <= 4'h3;    #50 req <= 4'hf;    #50 req <= 4'h3;    #50 req <= 4'he;    
        #50 req <= 4'h6;    #50 req <= 4'h9;    #50 req <= 4'h1;    #50 req <= 4'h3;    
        #50 req <= 4'hd;    #50 req <= 4'h0;    #50 req <= 4'h0;    #50 req <= 4'h9;    
        #50 req <= 4'h1;    #50 req <= 4'h1;    #50 req <= 4'hb;    #50 req <= 4'h1;    
        #50 req <= 4'h0;    #50 req <= 4'hc;    #50 req <= 4'hf;    #50 req <= 4'h2;    
        #50 req <= 4'h8;    #50 req <= 4'hb;    #50 req <= 4'h2;    #50 req <= 4'hb;    
        #50 req <= 4'h6;    #50 req <= 4'h2;    #50 req <= 4'h4;    #50 req <= 4'hb;    
        #50 req <= 4'hf;    #50 req <= 4'h8;    #50 req <= 4'h5;    #50 req <= 4'h5;    
        #50 req <= 4'he;    #50 req <= 4'h5;    #50 req <= 4'h7;    #50 req <= 4'he;    
        #50 req <= 4'hf;    #50 req <= 4'hc;    #50 req <= 4'h6;    #50 req <= 4'h9;    
        #50 req <= 4'hd;    #50 req <= 4'hb;    #50 req <= 4'h5;    #50 req <= 4'h5;    
        #50 req <= 4'h7;    #50 req <= 4'h0;    #50 req <= 4'hb;    #50 req <= 4'h5;    
        #50 req <= 4'h7;    #50 req <= 4'he;    #50 req <= 4'he;    #50 req <= 4'h0;    
        #50 req <= 4'h6;    #50 req <= 4'h1;    #50 req <= 4'he;    #50 req <= 4'ha;    
        #50 req <= 4'ha;    #50 req <= 4'hf;    #50 req <= 4'h6;    #50 req <= 4'h3;    
        #50 req <= 4'h2;    #50 req <= 4'hf;    #50 req <= 4'he;    #50 req <= 4'hf;    
        #50 req <= 4'h4;    #50 req <= 4'he;    #50 req <= 4'h4;    #50 req <= 4'h5;    
        #50 req <= 4'h4;    #50 req <= 4'hf;    #50 req <= 4'hc;    #50 req <= 4'hc;    
        #50 req <= 4'h8;    #50 req <= 4'h2;    #50 req <= 4'h5;    #50 req <= 4'h3;    
        #50 req <= 4'h9;    #50 req <= 4'h9;    #50 req <= 4'he;    #50 req <= 4'hf;    
        #50 req <= 4'hd;    #50 req <= 4'h7;    #50 req <= 4'ha;    #50 req <= 4'ha;    
        #50 req <= 4'h3;    #50 req <= 4'ha;    #50 req <= 4'h0;    #50 req <= 4'ha;    
        #50 req <= 4'he;    #50 req <= 4'hb;    #50 req <= 4'h5;    #50 req <= 4'h0;    
        #50 req <= 4'h6;    #50 req <= 4'h4;    #50 req <= 4'he;    #50 req <= 4'h2;    
        #50 req <= 4'hb;    #50 req <= 4'h1;    #50 req <= 4'h1;    #50 req <= 4'hc;    
        #50 req <= 4'hb;    #50 req <= 4'h9;    #50 req <= 4'hb;    #50 req <= 4'h2;    
        #50 req <= 4'h6;    #50 req <= 4'hf;    #50 req <= 4'h7;    #50 req <= 4'h9;    
        #50 req <= 4'h0;    #50 req <= 4'h4;    #50 req <= 4'hd;    #50 req <= 4'h7;    
        #50 req <= 4'h8;    #50 req <= 4'hf;    #50 req <= 4'ha;    #50 req <= 4'h7;    
        #50 req <= 4'h6;    #50 req <= 4'h0;    #50 req <= 4'hf;    #50 req <= 4'h1;    
        #50 req <= 4'ha;    #50 req <= 4'h1;    #50 req <= 4'hc;    #50 req <= 4'ha;    
        #50 req <= 4'h2;    #50 req <= 4'he;    #50 req <= 4'he;    #50 req <= 4'h8;    
        #50 req <= 4'hc;    #50 req <= 4'h7;    #50 req <= 4'h6;    #50 req <= 4'h9;    
        #50 req <= 4'hd;    #50 req <= 4'h3;    #50 req <= 4'hc;    #50 req <= 4'h5;    
        #50 req <= 4'h1;    #50 req <= 4'h7;    #50 req <= 4'h4;    #50 req <= 4'h0;    
        #50 req <= 4'h5;    #50 req <= 4'h8;    #50 req <= 4'h0;    #50 req <= 4'h4;    
        #50 req <= 4'h0;    #50 req <= 4'hd;    #50 req <= 4'h6;    #50 req <= 4'hf;    
        #50 req <= 4'h9;    #50 req <= 4'h8;    #50 req <= 4'h3;    #50 req <= 4'h9;    
        #50 req <= 4'h5;    #50 req <= 4'h7;    #50 req <= 4'h0;    #50 req <= 4'h9;    
        #50 req <= 4'h0;    #50 req <= 4'h6;    #50 req <= 4'h4;    #50 req <= 4'h8;    
        #50 req <= 4'he;    #50 req <= 4'h7;    #50 req <= 4'hb;    #50 req <= 4'h6;    
        #50 req <= 4'h2;    #50 req <= 4'h5;    #50 req <= 4'h6;    #50 req <= 4'hb;    
        #50 req <= 4'hf;    #50 req <= 4'h5;    #50 req <= 4'h2;    #50 req <= 4'h1;    
        #50 req <= 4'he;    #50 req <= 4'hd;    #50 req <= 4'hd;    #50 req <= 4'h0;    
        #50 req <= 4'hf;    #50 req <= 4'ha;    #50 req <= 4'h6;    #50 req <= 4'ha;    
        #50 req <= 4'h2;    #50 req <= 4'hd;    #50 req <= 4'h5;    #50 req <= 4'h9;    
        #50 req <= 4'h8;    #50 req <= 4'h5;    #50 req <= 4'hb;    #50 req <= 4'h5;    
        #50 req <= 4'h6;    #50 req <= 4'h3;    #50 req <= 4'hb;    #50 req <= 4'ha;    
        #50 req <= 4'hb;    #50 req <= 4'ha;    #50 req <= 4'h9;    #50 req <= 4'h9;    
        #50 req <= 4'h2;    #50 req <= 4'h6;    #50 req <= 4'h1;    #50 req <= 4'he;    
        #50 req <= 4'ha;    #50 req <= 4'he;    #50 req <= 4'hb;    #50 req <= 4'h3;    
        #50 req <= 4'h3;    #50 req <= 4'hd;    #50 req <= 4'he;    #50 req <= 4'h2;    
        #50 req <= 4'hb;    #50 req <= 4'hd;    #50 req <= 4'h3;    #50 req <= 4'h0;    
        #50 req <= 4'hb;    #50 req <= 4'h5;    #50 req <= 4'hc;    #50 req <= 4'h9;    
        #50 req <= 4'hc;    #50 req <= 4'h5;    #50 req <= 4'h4;    #50 req <= 4'h6;    
        #50 req <= 4'hd;    #50 req <= 4'he;    #50 req <= 4'h8;    #50 req <= 4'h6;    
        #50 req <= 4'h9;    #50 req <= 4'h8;    #50 req <= 4'h7;    #50 req <= 4'hc;    
        #50 req <= 4'h5;    #50 req <= 4'he;    #50 req <= 4'h6;    #50 req <= 4'h5;    
        #50 req <= 4'h8;    #50 req <= 4'hd;    #50 req <= 4'h6;    #50 req <= 4'hd;    
        #50 req <= 4'he;    #50 req <= 4'hd;    #50 req <= 4'ha;    #50 req <= 4'h3;    
        #50 req <= 4'he;    #50 req <= 4'hf;    #50 req <= 4'h4;    #50 req <= 4'h9;    
        #50 req <= 4'ha;    #50 req <= 4'h8;    #50 req <= 4'h0;    #50 req <= 4'h0;    
        #50 req <= 4'h6;    #50 req <= 4'hc;    #50 req <= 4'h3;    #50 req <= 4'h4;    
        #50 req <= 4'hd;    #50 req <= 4'hf;    #50 req <= 4'h5;    #50 req <= 4'h4;    
        #50 req <= 4'h1;    #50 req <= 4'h8;    #50 req <= 4'hd;    #50 req <= 4'h6;    
        #50 req <= 4'h2;    #50 req <= 4'h7;    #50 req <= 4'hb;    #50 req <= 4'h8;    
        #50 req <= 4'h1;    #50 req <= 4'h8;    #50 req <= 4'hc;    #50 req <= 4'h9;    
        #50 req <= 4'h5;    #50 req <= 4'h8;    #50 req <= 4'h9;    #50 req <= 4'h9;    
        #50 req <= 4'he;    #50 req <= 4'h7;    #50 req <= 4'h2;    #50 req <= 4'he;    
        #50 req <= 4'h8;    #50 req <= 4'hf;    #50 req <= 4'h9;    #50 req <= 4'h8;    
        #50 req <= 4'h1;    #50 req <= 4'h4;    #50 req <= 4'h1;    #50 req <= 4'h8;    
        #50 req <= 4'he;    #50 req <= 4'hd;    #50 req <= 4'h9;    #50 req <= 4'hd;    
        #50 req <= 4'hb;    #50 req <= 4'h2;    #50 req <= 4'h3;    #50 req <= 4'he;    
        #50 req <= 4'h3;    #50 req <= 4'h6;    #50 req <= 4'hb;    #50 req <= 4'hf;    
        #50 req <= 4'hf;    #50 req <= 4'h7;    #50 req <= 4'h4;    #50 req <= 4'he;    
        #50 req <= 4'h1;    #50 req <= 4'h4;    #50 req <= 4'h4;    #50 req <= 4'hd;    
        #50 req <= 4'h4;    #50 req <= 4'he;    #50 req <= 4'h3;    #50 req <= 4'h5;    
        #50 req <= 4'hc;    #50 req <= 4'h2;    #50 req <= 4'h0;    #50 req <= 4'h8;    
        #50 req <= 4'h4;    #50 req <= 4'h5;    #50 req <= 4'h5;    #50 req <= 4'h8;    
        #50 req <= 4'h8;    #50 req <= 4'h1;    #50 req <= 4'hc;    #50 req <= 4'h7;    
        #50 req <= 4'hf;    #50 req <= 4'h0;    #50 req <= 4'h2;    #50 req <= 4'he;    
        #50 req <= 4'he;    #50 req <= 4'h6;    #50 req <= 4'hb;    #50 req <= 4'h2;    
        #50 req <= 4'h9;    #50 req <= 4'h3;    #50 req <= 4'h6;    #50 req <= 4'h3;    
        #50 req <= 4'ha;    #50 req <= 4'h9;    #50 req <= 4'h2;    #50 req <= 4'h7;    
        #50 req <= 4'h7;    #50 req <= 4'hc;    #50 req <= 4'h1;    #50 req <= 4'h7;    
        #50 req <= 4'h0;    #50 req <= 4'h8;    #50 req <= 4'hc;    #50 req <= 4'h8;    
        #50 req <= 4'h6;    #50 req <= 4'h7;    #50 req <= 4'h8;    #50 req <= 4'hd;    
        #50 req <= 4'h2;    #50 req <= 4'h2;    #50 req <= 4'h7;    #50 req <= 4'hb;    
        #50 req <= 4'h5;    #50 req <= 4'h7;    #50 req <= 4'h1;    #50 req <= 4'hd;    
        #50 req <= 4'hb;    #50 req <= 4'hd;    #50 req <= 4'h5;    #50 req <= 4'h9;    
        #50 req <= 4'h6;    #50 req <= 4'h4;    #50 req <= 4'hb;    #50 req <= 4'h2;    
        #50 req <= 4'h8;    #50 req <= 4'h0;    #50 req <= 4'hc;    #50 req <= 4'h0;    
        #50 req <= 4'h1;    #50 req <= 4'h8;    #50 req <= 4'h4;    #50 req <= 4'hd;    
        #50 req <= 4'ha;    #50 req <= 4'h9;    #50 req <= 4'h6;    #50 req <= 4'h0;    
        #50 req <= 4'h0;    #50 req <= 4'h1;    #50 req <= 4'h0;    #50 req <= 4'h0;    
        #50 req <= 4'h6;    #50 req <= 4'h9;    #50 req <= 4'h1;    #50 req <= 4'h1;    
        #50 req <= 4'h4;    #50 req <= 4'h2;    #50 req <= 4'h9;    #50 req <= 4'h3;    
        #50 req <= 4'h4;    #50 req <= 4'h3;    #50 req <= 4'h0;    #50 req <= 4'hc;    
        #50 req <= 4'hf;    #50 req <= 4'h1;    #50 req <= 4'ha;    #50 req <= 4'h2;    
        #50 req <= 4'h3;    #50 req <= 4'h1;    #50 req <= 4'h8;    #50 req <= 4'he;    
        #50 req <= 4'h8;    #50 req <= 4'ha;    #50 req <= 4'h2;    #50 req <= 4'hd;    
        #50 req <= 4'h3;    #50 req <= 4'hf;    #50 req <= 4'h5;    #50 req <= 4'h9;    
        #50 req <= 4'ha;    #50 req <= 4'hb;    #50 req <= 4'h7;    #50 req <= 4'h7;    
        #50 req <= 4'ha;    #50 req <= 4'hd;    #50 req <= 4'h3;    #50 req <= 4'h2;    
        #50 req <= 4'h5;    #50 req <= 4'h6;    #50 req <= 4'h1;    #50 req <= 4'h8;    
        #50 req <= 4'h0;    #50 req <= 4'h1;    #50 req <= 4'h4;    #50 req <= 4'h3;    
        #50 req <= 4'hc;    #50 req <= 4'h3;    #50 req <= 4'hb;    #50 req <= 4'hb;    
        #50 req <= 4'h2;    #50 req <= 4'h3;    #50 req <= 4'h0;    #50 req <= 4'ha;    
        #50 req <= 4'h5;    #50 req <= 4'hb;    #50 req <= 4'h5;    #50 req <= 4'h1;    
        #50 req <= 4'h3;    #50 req <= 4'hf;    #50 req <= 4'h1;    #50 req <= 4'h9;    
        #50 req <= 4'hc;    #50 req <= 4'he;    #50 req <= 4'h5;    #50 req <= 4'hc;    
        #50 req <= 4'h6;    #50 req <= 4'h7;    #50 req <= 4'h3;    #50 req <= 4'h4;    
        #50 req <= 4'h0;    #50 req <= 4'he;    #50 req <= 4'h1;    #50 req <= 4'h4;    
        #50 req <= 4'h6;    #50 req <= 4'hf;    #50 req <= 4'ha;    #50 req <= 4'h7;    
        #50 req <= 4'h5;    #50 req <= 4'h1;    #50 req <= 4'h6;    #50 req <= 4'h5;    
        #50 req <= 4'hf;    #50 req <= 4'hf;    #50 req <= 4'hc;    #50 req <= 4'hd;    
        #50 req <= 4'h0;    #50 req <= 4'h3;    #50 req <= 4'h5;    #50 req <= 4'hf;    
        #50 req <= 4'h2;    #50 req <= 4'h4;    #50 req <= 4'h2;    #50 req <= 4'h9;    
        #50 req <= 4'he;    #50 req <= 4'h2;    #50 req <= 4'h0;    #50 req <= 4'h5;    
        #50 req <= 4'h4;    #50 req <= 4'hf;    #50 req <= 4'hb;    #50 req <= 4'h1;    
        #50 req <= 4'hd;    #50 req <= 4'h0;    #50 req <= 4'h1;    #50 req <= 4'hf;    
        #50 req <= 4'hf;    #50 req <= 4'h4;    #50 req <= 4'h9;    #50 req <= 4'he;    
        #50 req <= 4'h1;    #50 req <= 4'h4;    #50 req <= 4'h4;    #50 req <= 4'h9;    
        #50 req <= 4'h0;    #50 req <= 4'hc;    #50 req <= 4'h2;    #50 req <= 4'he;    
        #50 req <= 4'h1;    #50 req <= 4'h9;    #50 req <= 4'h8;    #50 req <= 4'h1;    
        #50 req <= 4'h7;    #50 req <= 4'h4;    #50 req <= 4'h1;    #50 req <= 4'h2;    
        #50 req <= 4'h7;    #50 req <= 4'he;    #50 req <= 4'h2;    #50 req <= 4'hc;    
        #50 req <= 4'hb;    #50 req <= 4'hc;    #50 req <= 4'h2;    #50 req <= 4'h0;    
        #50 req <= 4'h4;    #50 req <= 4'h5;    #50 req <= 4'ha;    #50 req <= 4'h1;    
        #50 req <= 4'h3;    #50 req <= 4'h8;    #50 req <= 4'ha;    #50 req <= 4'h1;    
        #50 req <= 4'h9;    #50 req <= 4'h4;    #50 req <= 4'hc;    #50 req <= 4'hd;    
        #50 req <= 4'he;    #50 req <= 4'h3;    #50 req <= 4'hc;    #50 req <= 4'h4;    
        #50 req <= 4'hf;    #50 req <= 4'h6;    #50 req <= 4'h8;    #50 req <= 4'he;    
        #50 req <= 4'hb;    #50 req <= 4'h7;    #50 req <= 4'h5;    #50 req <= 4'ha;    
        #50 req <= 4'h1;    #50 req <= 4'hb;    #50 req <= 4'h3;    #50 req <= 4'h8;    
    end
endmodule