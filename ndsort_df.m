
rand('seed',1013);
%********************************************************************
% load database
% database should contain traindata, testdata, traingnd, testgnd
%% Caltech
trainnum = 86180;
testnum = 1;

load nuswide-gist.mat % HCSDH retrieval
testdata = testdata(T,:);
testgnd = testgnd(T,:);
traindata=traindata(1:trainnum,:);
traingnd=traingnd(1:trainnum,:);
cateTrainTest = bsxfun(@eq, traingnd, testgnd');


%***************************************************************
% Feature transformation
%***************************************************************
method    = 'HCSDH';
feature   = 'kernel';
n_anchors = 1500;
% Kernel trans
anchor = traindata(randsample(trainnum, n_anchors),:);
sigma  = 0.4; % for normalized data
X      = exp(-sqdist(traindata,anchor)/(2*sigma*sigma));
testX  = exp(-sqdist(testdata,anchor)/(2*sigma*sigma));
%************************************************************

%*********************************
% iterating by code length L
bit = BITs;  
%***************************************************************
% run FSDH
%***************************************************************
tic;
[~, R] = HCSDH(X, traingnd, bit);
trainTime = toc;    
%****************************************************************
% Hamming Ranking
%****************************************************************
B  =     X*R > 0;
tH = testX*R > 0;    
H  = B;
hammRadius = 2;
B  = compactbit(H);
tB = compactbit(tH);   

tic;
hammTrainTest = hammingDist (tB, B)';
[~, HammingRank]=sort(hammTrainTest,1);
retrievalTime1 = toc;

% % %% evaluate top-K precision & diversity precision
% K=500;
% AP = cat_ap_topK(cateTrainTest,HammingRank,K)

%%  %****************************************************************
    % ND Rerank
    %****************************************************************
   load nuswide-res.mat
%     N=1000;
%     N=sum(hammTrainTest<=16);
    topNrank=HammingRank(1:N,:); 
    dataN=traindata_res(topNrank,:); 
    testdata_res=testdata_res(T,:);
  
    Dsim=relScore(dataN);
    [div]=divScore(dataN);
    PopObj=[div Dsim];

    %% Ndsort
   divRank=[];
   [FrontNO,MaxFNO] = NDsort(PopObj,inf);
   
%    cond_exit=0;
%    while cond_exit ~= N
%        for i=1:MaxFNO
%            index_ndsorted=find(FrontNO==i);
%            if ~isempty(index_ndsorted)
%                divRank(end+1,:)=index_ndsorted(1,1);
%                FrontNO(index_ndsorted(1,1))=0;
%            end
%        end
%        cond_exit=length(find(FrontNO==0));
%    end

 for i=MaxFNO:-1:1
     index_ndsorted=find(FrontNO==i);
     divRank=[divRank index_ndsorted];
  end
   
   %%
    Ddiv=divEval_DRR(dataN);
    divRank=topNrank(divRank);
    dataN_reranked=traindata_res(divRank,:); 
    divS=divEval_DRR(dataN_reranked);
    
