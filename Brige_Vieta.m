function [ result , numOfit , errors , errorsCell , allx , time ] = Brige_Vieta(f , x0 , maxerror , iteration)
syms x 
a = sym2poly(f(x)); 
sz = size(a , 2);
a = a.' ;
b = magic(1);
c = magic(1);
allx = magic(1);
errors = magic(1);
allx(1,1) = x0 ; 
numOfit = 1;
tic ; 
while (numOfit < iteration)

b( 1, 1 )   = a(1 , 1);
c(1 ,1 ) = a(1 , 1);

for i = 2 : 1 : sz 
    b(i , 1 ) = double(a( i  , 1) + x0 * b( i - 1 ,1)) ;
end 
for i = 2 : 1 : sz -1 
    c( i, 1 ) = double(b(i, 1) + x0 * c( i - 1 , 1  )) ;
end 
xold = x0 ; 
x0 = double(x0 - (b( sz , 1 ) / c(sz -1 ,1) ));
es = 100 * abs(x0 - xold )/ x0;
errors(numOfit + 1 , 1)  = es ; 
allx(numOfit+ 1 , 1) = x0 ; 
if (es < maxerror)
    break;
end
numOfit  = numOfit + 1 ;
end
time = toc ;
errorsCell = num2cell(errors);
errorsCell{1 , 1} = 'N/A' ; 
result = x0 ;
end 