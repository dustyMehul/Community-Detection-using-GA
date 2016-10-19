function pop= InitPop( A, a, Pn )
    
S = Smat(A,a);

nodes = length(A);

pop = -1 *ones(nodes,nodes-1,Pn); %population matrix of each layer of 3D martix is one individual of GA
communities = randi(nodes-2,Pn,1,'uint32') + 1;


for i=1:Pn
    centerV = randperm(nodes, communities(i));
    pop(:,1:communities(i), i) = 0;
    
    for j=1:nodes
        com =0;
        max = -1;
        for k=1:communities(i)
            if max<S(j,centerV(k))
                max = S(j,centerV(k));
                com = k;
            end
        end
        pop(j,com,i) = 1;
    end
end

end

