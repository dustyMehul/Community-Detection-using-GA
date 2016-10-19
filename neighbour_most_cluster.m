function y = neighbour_most_cluster(A,mat,i)
com = community(mat);
sz =size(A);
adj = zeros(1,sz(1));
t = 1;
for j =1:sz(1)
    if(A(i,j) == 1)
        adj(t) = j;
        t =t +1;
    end
end
t = t-1;

maxN = zeros(1,com);

for k = 1:t
    for j = 1:com
        if(mat(adj(k),j) == 1)
            maxN(j) = maxN(j) + 1;
        end
    end
end

max =intmin;
nbr = 0;
for j=1:com
    if(max<maxN(j))
        max = maxN(j);
        nbr = j;
    end
end

y = nbr;
    
        

