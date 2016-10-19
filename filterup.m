function pop = filterup(pop1, pop2, A, Pn,iter)

    nodes = length(A);
    l1 = size(pop1);
    l2 = size(pop2);
    
    len1 = l1(3);
    len2 = l2(3);
    
    popAll = zeros(nodes,nodes-1,len1+len2);
    
    popAll(:,:,1:len1) = pop1;
    popAll(:,:,len1+1:len1+len2) = pop2;
    
    fit = sorting(A, popAll);
    
    pop = zeros(nodes, nodes-1, Pn);
    
    for i=1:Pn
        pop(:,:,i) = popAll(:,:,fit(i,1));
    end
    
    fit(1,:);
    var = sum(fit(:,2))/Pn;
    plot(iter,var,'b*')
    %plot(iter,fit(1,2),'b*')
    
    if iter == 100
        bestComm = pop(:,:,fit(1,1));
    end
    
    
    
end