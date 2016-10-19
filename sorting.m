function fit = sorting(A, pop)

[a, population] = size(pop);

fit = zeros(population, 2);

for i = 1:population
    fit(i,1) = i;
    fit(i,2) = fitness(A,pop(i,:));
end

fit = fitSort(fit);
end