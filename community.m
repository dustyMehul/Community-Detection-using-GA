function [ com ] = community( individual )

x = size(individual);
y = x(2);
com = y;
temp=0;
for i=y:-1:1
    if individual(1,i)==-1
        com = i;
        temp=1;
    end
end

if temp==1
    com = com-1;
else com;
end
end

