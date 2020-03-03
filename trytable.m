function [] = trytable()
equ(1) = str2sym('2*x + 1*y + 4*z = 1');

equ(2) = str2sym('x + 2*y + 3*z = 1.5');

equ(3) = str2sym('4*x - 1*y + 2*z = 2');
[a , b] = equationsToMatrix(equ);
%[R , k , time] = GaussJordan(a , b )
[lower,upper,sol , all] = LUDecomp (a, b, 3, true)
end