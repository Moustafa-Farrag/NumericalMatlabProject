function [errorsCell , errors , result , numOfit , time]= newtRaph(x0,es,max_iter,eqn , hAxes , draw)
equation = strcat('@(x)', eqn);
f = str2func(equation);
df = diff(sym(f));
d = matlabFunction(df);
errors=magic(1);
result=magic(1);
xr=x0;
result(1,1)=xr;
numOfit=0;
tic;
while(1)
 xr_old=xr;
 xr = xr_old - (f(xr_old)/d(xr_old));
 numOfit=numOfit+1;
 result(numOfit+1,1)=xr;
  if xr~=0 
      ea =abs((xr-xr_old)/xr)*100; 
  end
 errors(numOfit+1 ,1)=ea; 
 if(ea<=es||numOfit>=max_iter)
   break;
 end

end
time = toc;
errorsCell = num2cell(errors);
errorsCell{1 , 1} = 'N/A' ;  

if (draw == 1 )
lowest = min(result(:,1)) - .5;
largest = max(result(:,1))+ .5;
syms x
hold on
plot(hAxes, [lowest, largest ] ,[ 0, 0]);
hold on
fplot(hAxes, matlabFunction(f(x)) , [lowest , largest],'k' )
pause(2);
 y = ylim; 
 for i = 1:1:numOfit
     hold on
     plot(hAxes, [result(i,1) result(i,1)],[y(1) y(2)],'r')
     hold on
     plot(hAxes, [result(i+1,1) result(i+1,1)],[y(1) y(2)],'g')
     hold on
     plot(hAxes, [result(i,1) result(i+1,1)],[f(result(i,1)) 0],'b--');
     pause(2);
 end  
    
end


end