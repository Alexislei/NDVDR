function [FrontNO,MaxFNO] = NDsort(PopObj,nSort)
%NDSort - Do non-dominated sorting on the population by ENS
%规模为N的种群中的每个个体都要针对M个目标函数和种群中的N-1个个体进行比较，复杂度为O(MN)，
%因此种群中的N个个体都比较结束的复杂度为O(MN2)，即每进行一次Pareto分级的时间复杂度为O(MN2)
%   FrontNO = NDSort(A,s) does non-dominated sorting on A, where A is a
%   matrix which stores the objective values of all the individuals in the
%   population, and s is the number of individuals being sorted at least.
%   FrontNO(i) means the number of front of the i-th individual.
%
%   [FrontNO,K] = NDSort(...) also returns the maximum number of fronts,
%   except for the value of inf.
%
%   In particular, s = 1 stands for find only the first non-dominated
%   front, s = size(A,1)/2 stands for sort only half of the population
%   (which is often used in the algorithm), and s = inf stands for sort the
%   whole population.
%
%   Example:
%       [FrontNO,MaxFNO] = NDSort(PopObj,1)
[N,M] = size(PopObj);
FrontNO = inf(1,N);
MaxFNO  = 0;
[PopObj,rank] = sortrows(PopObj); %sorts the rows of a matrix in ascending order based on the elements in the first column

while sum(FrontNO<inf) < min(nSort,N)
    MaxFNO = MaxFNO + 1;
for i = 1 : N
    if FrontNO(i) == inf
        Dominated = false;
    for j = i-1 : -1 : 1
        if FrontNO(j) == MaxFNO
             m = 2;
        while m <= M && PopObj(i,m) >= PopObj(j,m)
            m = m + 1;
        end
        Dominated = m > M;
        if Dominated || M == 2
            break;
        end 
        end
    end
    
    if ~Dominated
        FrontNO(i) = MaxFNO;
    end
    end
end
end
FrontNO(rank) = FrontNO;
end