function [Ddiv Ddiv1] = divScore(data)
%% diversity score is defined as
% the minimal difference with the images appearing before it
     
    M=size(data,1);
    D=pdist2(data,data,'euclidean');
%     delta=median(D(:));
%     A=exp(-D/(delta^2));
    
    Ddiv=zeros(M,1);
    weight=0.5;
    % calculate min distance
    for i=2:length(D)
        te1=D(i,1:i-1);
        if i<length(D)
            te2=D(i,i+1,end);
            Ddiv(i,:)=weight*min(te1)+(1-weight)*min(te2);
        else
            Ddiv(i,:)=min(te1);
        end
    end
    
    Ddiv(1,1)=1;
end

