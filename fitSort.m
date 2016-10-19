function y = fitSort(fit)

nodes = length(fit);

for i =1:nodes
    max = fit(i,2);
    rw = i;
    for j =i+1:nodes
        if(max<fit(j,2))
            max = fit(j,2);
            rw = j;
        end
    end
    t1 = fit(i,2);
    fit(i,2) = fit(rw,2);
    fit(rw,2) = t1;
    
    t1 = fit(i,1);
    fit(i,1) = fit(rw,1);
    fit(rw,1) = t1;
end

y = fit;