function mat = validate (A, mat, S)
    com = community(mat);
    nodes = length(mat);
    
    
    temp = zeros(nodes,1);
    for i=1:nodes
        for j=1:com
            temp(i,1) = temp(i,1) + mat(i,j);
        end
    end
    
    invalid=0;
    for i=1:nodes
        if temp(i,1)~=1
            mat(i,1:com)=0;
            invalid = invalid+1;
        end
    end
    %invalid;
    mat;
    invNodes = zeros(invalid,1);
    
   temp2 = zeros(invalid,com);
   inv=1;
    for i=1:nodes
        if temp(i,1)~=1
            invNodes(inv) = i;
            
            %temp2 = zeros(1,com);
            for j=1:com
                for k=1:nodes
                    if mat(k,j)==1
                        if A(i,k)==1
                            temp2(inv,j) = temp2(inv,j)+1;
                        end
                    end
                end
                
            end
            inv=inv+1;
            
        end
    end
    temp2;
    invNodes;
    
    
 
    for inv=1:invalid
        [maxNeigh,X] = max(temp2(inv,:));
        mat(invNodes(inv),X) = 1;
    end
    
    mat = gene_sort(S, mat);
    
    for i=1:com
        if sum(mat(:,i))==0
            mat(:,i) = -1;
        end
    end
    
    
    
    
    
end