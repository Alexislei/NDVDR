
clear all;clc;
BITs = [64];
% L=[535];

P=[];N_P=[];DP=[];N_DP=[];

for c=1:15
    L=L_all(:,c);
    P=[];N_P=[];DP=[];N_DP=[];
    
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
    end
end
