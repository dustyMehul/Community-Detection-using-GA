function popNext = crossover(A, pop, Pc, a)
S = Smat(A,a);
Pn = length(pop(1,1,:));

fit = sorting(A, pop);  %% Sorting population by fitness

pop(:,:,fit(1,1));
Nc = Pn*Pc;  %% participating in CrossOver
if mod(Nc,2)~=0
    Nc = Nc +1;
end


nodes = length(A);

parentGene = -1* ones(nodes, nodes-1, Nc);

OfspringGene = zeros(nodes, nodes-1, Nc);

for i=1:Nc
    parentGene(:,:,i) = pop(:,:,fit(i,1));
    parentGene(:,:,i) = gene_sort(S,parentGene(:,:,i));
end

for i=1:Nc/2
    
    gene1 = parentGene(:,:,i);
    gene2 = parentGene(:,:,Nc+1-i);
    
    %randPt = randi(min (community(parentGene(:,:,i)),community(parentGene(:,:,Nc+1-i))));
    %pause
    randPt =1;
    tmp = i;
    tempGene = gene1(:,1);

    
    gene1(:,1) = gene2(:,1);
    
    gene2(:,1) = tempGene;
    %of1 = validate(A,gene1,S);
    %of2 = validate(A,gene2,S);
    OfspringGene(:,:,tmp) = validate(A,gene1,S);
    OfspringGene(:,:,Nc+1-tmp) = validate(A,gene2,S);
    
    
end
    popNext = zeros(nodes, nodes-1, Pn + Nc);
    
    popNext(:,:,1:Pn) = pop (:,:,:);
    popNext(:,:,Pn+1:Pn+Nc) = OfspringGene(:,:,:);
    
end