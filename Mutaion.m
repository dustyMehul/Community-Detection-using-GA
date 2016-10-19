function mutatedGene = Mutaion(pop, A, Pm, a)
    population = size(pop);
    nodes = length(A);
    Pn = population(3);
    
    S=Smat(A,a);
    
    Nm = Pn*Pm;  %% participating in CrossOver
    if mod(Nm,2)~=0
        Nm = Nm +1;
    end
    
    fit = sorting(A, pop);
    
    parentGene = -1*ones(nodes, nodes-1, Nm);
    mutatedGene = -1*ones(nodes, nodes-1, Nm);
    
    for i=1:Nm
        parentGene(:,:,i) = pop(:,:,fit(Pn+1-i,1));
        parentGene(:,:,i) = gene_sort(S,parentGene(:,:,i));
    end

    for i=1:Nm
        com = community(parentGene(:,:,i));
        
        if com<=2
            mutatedGene(:,:,i) = split(parentGene(:,:,i));
        elseif com>=nodes-1
                mutatedGene(:,:,i) = fuse(parentGene(:,:,i), A);
        else
            toss = randi(2);
            if toss ==1
                mutatedGene(:,:,i) = split(parentGene(:,:,i));
            else
                mutatedGene(:,:,i) = fuse(parentGene(:,:,i), A);
            end
        end
    end
                
            
        
end