clear all;clc;
BITs = [64];
T=[27]';

% 1
% L=[27	79	110	116	130	133	148	151	180	188]';
% 2
% L=[16	51	88	115	134	137	157	160	162	166]';
% 3
% L=[7	18	49	64	73	138	141	158	193	210]';
% 4
% L=[21	45	48	57	81	92	119	123	212	223]';
% 5
% L=[1	44	75	76	106	135	174	207	219	312]';
% 6
% L=[37	42	63	94	107	108	113	185	195	201]';
% 7
% L=[14	23	32	40	77	197	214	224	257	259]';
% 8
% L=[8	39	70	74	80	117	124	127	147	150]';
% 9
% L=[24	56	68	93	96	101	152	153	186	192]';
% 10
% L=[28	30	50	78	114	139	146	156	196	203]';
% 11
% L=[2	5	13	19	20	58	72	84	144	182]';
% 12
% L=[11	22	29	53	65	67	69	82	90	104]';
% 13
% L=[12	15	60	71	112	149	154	164	169	171]';
% 14
% L=[26	31	34	41	52	54	61	99	126	136]';
% 15
% L=[10	62	86	109	118	128	145	176	183	202]';
% 16
% L=[46	66	87	98	102	122	129	143	163	178]';
% 17
% L=[17	25	35	59	85	103	132	165	168	177]';
% 18
% L=[6	43	47	83	97	100	161	175	179	238]';
% 19
% L=[4	36	38	55	89	91	105	121	155	159]';
% 20
% L=[3	9	33	95	120	125	131	140	142	189]';
%

rand('seed',1013);
%********************************************************************
% load database
% database should contain traindata, testdata, traingnd, testgnd
%% Caltech
testnum = 1;
trainnum=19800;
load caltech256-gist.mat
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
