function [c, Result , time ] = Gauss(a , b)
[row , col ] = size(a);
[a , b] = M2magic(a , b);
f = horzcat(a,b);
Result = zeros(1);
tic ; 
for k = 1 : 1 : row-1
    for i = k +1 :1:row
        factor = a(i , k ) / a (k , k);
         a(i ,k ) = 0;
        for j = k+1 :1:col
            a(i , j ) = ( a(i , j ) - factor * a(k, j) );
        end
        b(i,1) = b(i,1) - factor * b(k ,1) ; 
    end
    f = horzcat(a,b);
    h = num2cell(f);
    c = [c ; h];
end
Result(row , 1) = b (row , 1) / a(row , row) ;
for i = row -1 : -1 : 1
    sum = 0 ; 
    for j = i+1 : 1 : row
      sum = sum + a(i , j) * Result(j , 1);
    end
    Result(i , 1) = (b(i, 1) - sum) / a(i , i) ;
end
time = toc ; 
end 