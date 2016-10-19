function mat=split(mat)
    com = community(mat);
    nodes = length(mat);
    
    lastcom = sum(mat(:,com));
    lastComMem = zeros(lastcom,1);
    mem=1;
    for i=1:nodes
        if mat(i,com)==1
            lastComMem(mem) = i;
            mem=mem+1;
        end
    end
    
    mat(:,com:com+1) = 0;
    for i=1:lastcom
        toss = randi(2);
        if toss==1
            mat(lastComMem(i),com) = 1;
        else
            mat(lastComMem(i),com+1) =1;
        end
    end
end
