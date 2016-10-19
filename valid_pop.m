function y = valid_pop(A,mat)

com  = community(mat);
sz = size(mat);
valid = 0;

for i =1:sz(1)
    num = 0;
    for j=1:com
        if(mat(i,j) == 1)
            num = num +1;
        end
    end
    
    if(num > 1)
        valid = 0;
        break;
    end
end

if(i == sz(1)+1 && j == com +1)
    valid = 1;
end
y =mat;
if(valid == 0)
    for i = 1:sz(1)
        num = 0;
        for j =1:com
            if(mat(i,j)==1)
                num = num +1;
            end
        end
        if(num ==0)
            mat(i,com +1) = 1;
        elseif(num>1)
            nb = neighbour_most_cluster(A,mat,i);
            for j = 1:com
                mat(i,j)=0;
            end
            mat(i,nb) = 1;
        end
    end
    tmp = 0;
    for i =1:sz(1)
        if(mat(i,com+1) == 1)
            tmp = tmp+1;
        end
    end
    if(tmp>0)
        for i=1:sz(1)
            if(mat(i,com +1)~=1)
                mat(i,com +1) = 0;
            end
        end
    end
    
    y=mat;
end

t=1;
temp = zeros(1,com);
for i = 1:com
    nmb = 0;
    for j = 1:sz(1)
        if(mat(j,i) == 1)
            nmb = nmb +1;
        end
    end
    if(nmb ==0)
        temp(t) = i;
        t=t+1;
    end
end
t = t-1;
vct = zeros(sz(1),1);
for k = 1:sz(1)
    vct(k,1) = -1;
end
if(t~=0)
    for i = 1:t
        for j = temp(i):sz(2)-1
            mat(:,j) = mat(:,j+1);
        end
         for p = i+1:t
                temp(p) = temp(p)-1;
         end
    end
    for i = sz(2):sz(2) - t+1
        mat(:,i) = vct;
    end
    y = mat;
end

        

