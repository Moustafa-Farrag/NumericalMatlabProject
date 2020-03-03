function  [a , b] = M2magic(a , b)
[row , col ] = size(a);
l = magic(1);
for i = 1 : 1 : row
    for j = 1 :1: row
        l(i ,j) = a(i , j);
    end
end
temp = magic(1);
for j = 1 :1: row
        temp(j , 1) = b(j , 1);
end
b = temp;
a = l ;
end