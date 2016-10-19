function y = gene_sort(S,mat,com)

sz = size(mat);

fitn = zeros(com,2);
final_pop = zeros(sz(1),sz(2));

for i=1:sz(1)
    for j=1:sz(2)
        final_pop(i,j) = -1;
    end
end

for i =1:com
    temp = zeros(1,sz(1));
    t = 1;
    for j=1:sz(1)
        if(mat(j,i)~=0)
            temp(t) = j;
            t =t + 1;
        end
    end
    t = t-1;
    den = (t*(t-1))/2;
    sum = 0;
  
    for j = 1:t-1
        for k = j+1:t
            sum = sum + S(temp(j),temp(k));
        end
    end
    
    fitn(i,1) = i;
    if(sum == 0)
    fitn(i,2) = 0;
    else
        fitn(i,2) = sum/den;
    end
end

fitn = fitSort(fitn);

for i = 1:com
    final_pop(:,i) = mat(:,fitn(i,1));
end

y = final_pop;
    


    
    
        

