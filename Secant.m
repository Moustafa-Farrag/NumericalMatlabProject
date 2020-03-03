function [errors , errorsCell , result , numOfit , allx, time ] = Secant(f, x1 , x2 , maxerror , iteration , hAxes , draw)
allx = magic(1);
errors = magic(1);
errorsCell =  cell(1);
x3 =  x2 - ( (f(x2) * (x2 - x1 )) / (f(x2) - f(x1))) ;
error = abs ( (x3 - x2) / x3) *100;
numOfit = 1;
errorsCell { 1 , 1} = 'N/A';
errorsCell { 2 , 1} = 'N/A';
errorsCell { numOfit +2 , 1} = error;
errors (numOfit + 2 , 1) = error;
allx(1 , 1) = x1;
allx(2 ,1) = x2;
allx( numOfit + 2 , 1) = x3;
tic;
while ( (error > maxerror ) && (numOfit < iteration ))
 x1 = x2 ;
 x2 = x3 ;
 x3 =   x2 - ( (f(x2) * (x2 - x1 )) / (f(x2) - f(x1))) ;
error = abs ( (x3 - x2) / x3) *100;
numOfit = numOfit + 1 ;
errors (numOfit + 2 , 1) = error;
errorsCell { numOfit + 2 , 1} = error;
allx( numOfit +2 , 1) = x3;
end
time = toc;
if (draw == 1 )
lowest = min(allx(:)) - .5;
largest = max(allx(:))+ .5;
syms x
hold on
fplot( hAxes , matlabFunction(f(x)) , [lowest , largest] )
hold on
plot(hAxes ,[lowest, largest ] ,[ 0, 0]);
pause(2);
for i = 1:1:numOfit
  hold on 
  plot( hAxes , [allx(i , 1 ) , allx(i +1 , 1 ) , allx(i+2 , 1)  ],  [ f(allx(i , 1)) , f(allx(i+1 , 1)) , 0 ] , '--or' ,'Color', [0 0.7 0])
  hold on 
  plot(  hAxes , [allx(i+2 , 1) , allx(i+2 , 1)  ],  [ 0 , f(allx(i+2 , 1))] , '--or', 'Color' , [1 0 0])
  pause(2);
end
end
result = x3 ;
   
    
    
    
    
