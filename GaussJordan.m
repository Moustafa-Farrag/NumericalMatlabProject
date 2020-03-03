function [ c , b , time ] = GaussJordan(a , b )
[a , b] = M2magic(a , b);
f = horzcat(a,b);
c = num2cell(f);
[row , col] = size(a); 
tic;
for k = 1 : 1: row
   for i = 1 : 1 :row 
       if (i ~= k)
           factor = a(i ,k ) / a(k , k);
           for j = k:1:col
               a(i , j ) = a( i , j ) - a(k , j) * factor ;
           end
            b(i,1) = b(i,1) - factor * b(k ,1) ; 
       end
   end
    f = horzcat(a,b);
    h = num2cell(f);
    c = [c ; h];
end
for i = row : -1 : 1
    b (i , 1)= b(i, 1)  / a(i , i);
    a(i, i ) = 1;
end
 time = toc;
 f = horzcat(a,b);
 h = num2cell(f);
 c = [c ; h];
end