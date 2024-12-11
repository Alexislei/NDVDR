clear all;clc;
BITs = [64];
% T=[27]';

rand('seed',1013);
%********************************************************************
% load database
% database should contain traindata, testdata, traingnd, testgnd
%% Caltech
testnum = 1; %
trainnum=19800; %
load caltech256-gist.mat
test data = testdata(T,:);
testgnd = testgnd(T,:);
traindata=traindata(1:trainnum,:);
traingnd=traingnd(1:trainnum,:);
cateTrainTest = bsxfun(@eq, traingnd, testgnd');

%***************************************************************
% Feature transformation
%***************************************************************
method    = 'HCSDH';
feature   = 'kernel';
n_anchors = 1000;
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

%% evaluate top-K precision & diversity precision
K=1000;
AP = cat_ap_topK(cateTrainTest,HammingRank,K)
