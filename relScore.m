function relevance = relScore(data)
   % based on initial ranking order, the relevance scores are measured. 

    D=pdist2(data(1,:),data,'euclidean');
    delta=median(D(:));
    D=exp(-D/(delta^2));    
    
    z=100; 
    for i=1:size(data,1)
        rel(i,:)=(2*exp(-(i-1)/z))/(1+exp(-(i-1)/z));
    end
  
        relevance=rel.*D';
%         relevance=D';
end

