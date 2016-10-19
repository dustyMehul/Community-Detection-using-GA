function A = Amat(V)

mat= rand(V);

A = mat + mat';
A=(A/2) - 0.5;

for i = 1:V
    for j = 1:V
        A(i,j) = ceil(A(i,j));
    end
end

for i = 1:V
    A(i,i) = 1;
end

end

