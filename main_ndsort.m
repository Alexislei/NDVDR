
clear all;clc;
BITs = [64];
% L=[535];
% 1
% L=[85 104	108	132	154	171 186 283 386 436]';
% 2 
% L=[25 129 137 159 166 242 321 325 364 384]';
% 3
% L=[13 48 74	81 257	266 441 456 482 535]';
% 4
% L=[8	52	56	83	100	134	153	164	169	222]';
% 8
% L=[12	15	19	50	57	92	162	178	207	215]';
% 9 
% L=[34 43 63 344 416 479 526 561 707 776]';
% 10 
% L=[38 65 228 294 339 353 472 551 610 647]';
% 11 
% L=[117 481 620 684 686 705 727 758 897 1148]';
% 12
% L=[33	78	194	211	212	218	252	278	281	336]';
% 13 
% L=[4 67 245 299 434 439 510 590 624 639]';
% 14 
% L=[813 1289 1309 1347 1387 1572 1755 2044 2150 958]';
% 15
% L=[61	77	106	107	182	193	213	254	261	285]';
% % 17
% L=[5	9	59	80	86	105	109	130	214	216]';
% % 19
% L=[11	35	44	54	60	90	152	160	192	200]';
% % 22
% L=[36	55	139	188	208	221	230	250	259 264]';
L_all=zeros(10,15);
L_all(:,1)=[85 104	108	132	154	171 186 283 386 436]';
L_all(:,2)=[25 129 137 159 166 242 321 325 364 384]';
L_all(:,3)=[13 48 74	81 257	266 441 456 482 535]';
L_all(:,4)=[8	52	56	83	100	134	153	164	169	222]';
L_all(:,5)=[12	15	19	50	57	92	162	178	207	215]';
L_all(:,6)=[34 43 63 344 416 479 526 561 707 776]';
L_all(:,7)=[38 65 228 294 339 353 472 551 610 647]';
L_all(:,8)=[117 481 620 684 686 705 727 758 897 1148]';
L_all(:,9)=[33	78	194	211	212	218	252	278	281	336]';
L_all(:,10)=[4 67 245 299 434 439 510 590 624 639]';
L_all(:,11)=[813 1289 1309 1347 1387 1572 1755 2044 2150 958]';
L_all(:,12)=[61	77	106	107	182	193	213	254	261	285]';
L_all(:,13)=[5	9	59	80	86	105	109	130	214	216]';
L_all(:,14)=[11	35	44	54	60	90	152	160	192	200]';
L_all(:,15)=[36	55	139	188	208	221	230	250	259 264]';

P=[];N_P=[];DP=[];N_DP=[];
P1=[];N_P1=[];DP1=[];N_DP1=[];
P2=[];N_P2=[];DP2=[];N_DP2=[];
P3=[];N_P3=[];DP3=[];N_DP3=[];
P4=[];N_P4=[];DP4=[];N_DP4=[]; 

for c=1:15
    
    L=L_all(:,c);
    P=[];N_P=[];DP=[];N_DP=[];
    P1=[];N_P1=[];DP1=[];N_DP1=[];
    P2=[];N_P2=[];DP2=[];N_DP2=[];
    P3=[];N_P3=[];DP3=[];N_DP3=[];
    P4=[];N_P4=[];DP4=[];N_DP4=[];
    P5=[];N_P5=[];DP5=[];N_DP5=[];
    P6=[];N_P6=[];DP6=[];N_DP6=[];
    P7=[];N_P7=[];DP7=[];N_DP7=[];
    P8=[];N_P8=[];DP8=[];N_DP8=[];
    P9=[];N_P9=[];DP9=[];N_DP9=[];

    
    for i=1:size(L) %!!!!!!!!
        T=L(i);
        run ndsort_nuswide_df
        K=10;
        AP=cat_ap_topK(cateTrainTest,HammingRank,K);
        N_AP=cat_ap_topK(cateTrainTest,divRank,K);
        ADP=cat_adp_topK(cateTrainTest,HammingRank,K,Ddiv);
        N_ADP=cat_adp_topK(cateTrainTest,divRank,K,divS);
        P=[P;AP];
        N_P=[N_P;N_AP];
        DP=[DP;ADP];
        N_DP=[N_DP;N_ADP];
        
        K=20;
        AP1=cat_ap_topK(cateTrainTest,HammingRank,K);
        N_AP1=cat_ap_topK(cateTrainTest,divRank,K);
        ADP1=cat_adp_topK(cateTrainTest,HammingRank,K,Ddiv);
        N_ADP1=cat_adp_topK(cateTrainTest,divRank,K,divS);
        P1=[P1;AP1];
        N_P1=[N_P1;N_AP1];
        DP1=[DP1;ADP1];
        N_DP1=[N_DP1;N_ADP1];
%        
        K=30;
        AP2=cat_ap_topK(cateTrainTest,HammingRank,K);
        N_AP2=cat_ap_topK(cateTrainTest,divRank,K);
        ADP2=cat_adp_topK(cateTrainTest,HammingRank,K,Ddiv);
        N_ADP2=cat_adp_topK(cateTrainTest,divRank,K,divS);
        P2=[P2;AP2];
        N_P2=[N_P2;N_AP2];
        DP2=[DP2;ADP2];
        N_DP2=[N_DP2;N_ADP2];
        
        K=40;
        AP3=cat_ap_topK(cateTrainTest,HammingRank,K);
        N_AP3=cat_ap_topK(cateTrainTest,divRank,K);
        ADP3=cat_adp_topK(cateTrainTest,HammingRank,K,Ddiv);
        N_ADP3=cat_adp_topK(cateTrainTest,divRank,K,divS);
        P3=[P3;AP3];
        N_P3=[N_P3;N_AP3];
        DP3=[DP3;ADP3];
        N_DP3=[N_DP3;N_ADP3];

        K=50;
        AP4=cat_ap_topK(cateTrainTest,HammingRank,K);
        N_AP4=cat_ap_topK(cateTrainTest,divRank,K);
        ADP4=cat_adp_topK(cateTrainTest,HammingRank,K,Ddiv);
        N_ADP4=cat_adp_topK(cateTrainTest,divRank,K,divS);
        P4=[P4;AP4];
        N_P4=[N_P4;N_AP4];
        DP4=[DP4;ADP4];
        N_DP4=[N_DP4;N_ADP4];
        
        K=60;
        AP5=cat_ap_topK(cateTrainTest,HammingRank,K);
        N_AP5=cat_ap_topK(cateTrainTest,divRank,K);
        ADP5=cat_adp_topK(cateTrainTest,HammingRank,K,Ddiv);
        N_ADP5=cat_adp_topK(cateTrainTest,divRank,K,divS);
        P5=[P5;AP5];
        N_P5=[N_P5;N_AP5];
        DP5=[DP5;ADP5];
        N_DP5=[N_DP5;N_ADP5];
        
        K=70;
        AP6=cat_ap_topK(cateTrainTest,HammingRank,K);
        N_AP6=cat_ap_topK(cateTrainTest,divRank,K);
        ADP6=cat_adp_topK(cateTrainTest,HammingRank,K,Ddiv);
        N_ADP6=cat_adp_topK(cateTrainTest,divRank,K,divS);
        P6=[P6;AP6];
        N_P6=[N_P6;N_AP6];
        DP6=[DP6;ADP6];
        N_DP6=[N_DP6;N_ADP6];
        
        K=80;
        AP7=cat_ap_topK(cateTrainTest,HammingRank,K);
        N_AP7=cat_ap_topK(cateTrainTest,divRank,K);
        ADP7=cat_adp_topK(cateTrainTest,HammingRank,K,Ddiv);
        N_ADP7=cat_adp_topK(cateTrainTest,divRank,K,divS);
        P7=[P7;AP7];
        N_P7=[N_P7;N_AP7];
        DP7=[DP7;ADP7];
        N_DP7=[N_DP7;N_ADP7];
        
        K=90;
        AP8=cat_ap_topK(cateTrainTest,HammingRank,K);
        N_AP8=cat_ap_topK(cateTrainTest,divRank,K);
        ADP8=cat_adp_topK(cateTrainTest,HammingRank,K,Ddiv);
        N_ADP8=cat_adp_topK(cateTrainTest,divRank,K,divS);
        P8=[P8;AP8];
        N_P8=[N_P8;N_AP8];
        DP8=[DP8;ADP8];
        N_DP8=[N_DP8;N_ADP8];
        
        K=100;
        AP9=cat_ap_topK(cateTrainTest,HammingRank,K);
        N_AP9=cat_ap_topK(cateTrainTest,divRank,K);
        ADP9=cat_adp_topK(cateTrainTest,HammingRank,K,Ddiv);
        N_ADP9=cat_adp_topK(cateTrainTest,divRank,K,divS);
        P9=[P9;AP9];
        N_P9=[N_P9;N_AP9];
        DP9=[DP9;ADP9];
        N_DP9=[N_DP9;N_ADP9];
    end
    
        
        
%     [mean(P);mean(N_P);mean(DP);mean(N_DP)]
%     [mean(P1);mean(N_P1);mean(DP1);mean(N_DP1)]
%     [mean(P2);mean(N_P2);mean(DP2);mean(N_DP2)]
%     [mean(P3);mean(N_P3);mean(DP3);mean(N_DP3)]
%     [mean(P4);mean(N_P4);mean(DP4);mean(N_DP4)]

    result1(1:4,c)=[mean(P);mean(N_P);mean(DP);mean(N_DP)];
    result1(8:11,c)=[mean(P1);mean(N_P1);mean(DP1);mean(N_DP1)];
    result1(16:19,c)=[mean(P2);mean(N_P2);mean(DP2);mean(N_DP2)];
    result1(24:27,c)=[mean(P3);mean(N_P3);mean(DP3);mean(N_DP3)];
    result1(32:35,c)=[mean(P4);mean(N_P4);mean(DP4);mean(N_DP4)];
    
    result1(40:43,c)=[mean(P5);mean(N_P5);mean(DP6);mean(N_DP5)];
    result1(48:51,c)=[mean(P6);mean(N_P6);mean(DP6);mean(N_DP6)];
    result1(56:59,c)=[mean(P7);mean(N_P7);mean(DP7);mean(N_DP7)];
    result1(64:67,c)=[mean(P8);mean(N_P8);mean(DP8);mean(N_DP8)];
    result1(72:75,c)=[mean(P9);mean(N_P9);mean(DP9);mean(N_DP9)];
    
    
end