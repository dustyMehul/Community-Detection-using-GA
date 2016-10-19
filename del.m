function y = del(A,i)
d = 0;
sz = size(A);

for j = 1:sz(1)
    if(A(i,j) == 1)
        d = d + 1;
    end
end

y = d;