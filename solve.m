function solve( )
s =  'x^2 - 2' ;
f= str2func(['@(x)' s]);
[errors ,root , ul , a] = Secant(f , .5 , 1 , 5 , 100)
end