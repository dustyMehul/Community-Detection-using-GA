function mat= fuse(mat, A)
    nodes = length(A);
    com = community(mat);
    
    lastcomMem = sum(mat(:,com));
    temp = zeros(lastcomMem,com-1);
    
    comMem = zeros(lastcomMem,1);
    
    mem =1;
    for i=1:nodes
        if mat(i,com)==1
            comMem(mem,1)=i;
            for j=1:com-1
                for k=1:nodes
                    if mat(k,j)==1
                        if A(i,k)==1
                            temp(mem,j) = temp(mem,j)+1;
                        end
                    end
                
                end
            end
            mem = mem +1;
        end
        
    end
    
    
    for i=1:lastcomMem
        [maxNeigh, X] = max(temp(i,:));
        mat(comMem(i),X) = 1;
    end
    
    mat(:,com) =-1;


end