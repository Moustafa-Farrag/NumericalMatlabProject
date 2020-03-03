function [errors , errorsCell , numOfit , root , ul, time] = falsi1 (f , upper , lower , epsilon , it , hAxes , draw)
errors = magic(1);
root = magic(1);
ul = magic (2);
ul(1,1) = upper;
ul(2,1) = lower;

tic;
if (f(lower) * f(upper) < 0)

   for i=1 : 1 : it
        root(1,i) = ((ul(2,i)*f(ul(1,i))) - (ul(1,i)*f(ul(2,i)))) / (f(ul(1,i))-f(ul(2,i)));
        checker = f(root(1,i));
        if (checker < 0)
             if (i > 1)
                errors(1,i) = abs( root(1,i) - root(1,i-1) )/abs(root(1,i)) *100; 
                if (errors(1,i) < epsilon )
                 break;
                end
             end
              
             ul(2,i+1) = root(1,i);
             ul(1,i+1) = ul(1,i);
        elseif (checker > 0)
             if (i > 1)
                errors(1,i) = abs( root(1,i) - root(1,i-1) )/abs(root(1,i)) *100; 
                if (errors(1,i) < epsilon )
                 break;
                end
             end
             
             ul(2,i+1) = ul(2,i);
             ul(1,i+1) = root(1,i);
           
        else
            errors(1,i) = 0;
            break;
        end 
        
    end
    time = toc;
    numOfit = i ;
    if (draw == 1)
        syms x ;
hold on;
fplot (hAxes, matlabFunction(f(x)) , [lower , upper]);
plot(hAxes, [lower upper] , [0 0] , 'k');
pause(2);
        for i = 1 : 1 : numOfit
        fplot(hAxes, matlabFunction(f(x)) , [lower , upper]);
        plot(hAxes, [lower upper] , [0 0] , 'k');
        plot(hAxes, [ul(1,i) ul(1,i)] , [f(ul(1,i)) f(ul(1,i))] , 'r*');
        plot(hAxes, [ul(2,i) ul(2,i)] , [f(ul(2,i)) f(ul(2,i))] , 'b*');
        plot(hAxes, [ul(2,i) ul(1,i) ] ,[f(ul(2,i)) f(ul(1,i))] , 'g');
        plot(hAxes, [ul(2,i) root(1,i) ] ,[f(ul(2,i)) 0] , 'g');
        plot(hAxes, [ul(1,i) root(1,i) ] ,[f(ul(1,i)) 0] , 'g');
        plot(hAxes, [root(1,i) root(1,i)] , [0 0] , 'm*');
        pause(2);
        cla;
        end
        fplot(hAxes, matlabFunction(f(x)) , [lower , upper]);
        plot(hAxes, [lower upper] , [0 0] , 'k');
        plot(hAxes, [ul(1,i) ul(1,i)] , [f(ul(1,i)) f(ul(1,i))] , 'r*');
        plot(hAxes, [ul(2,i) ul(2,i)] , [f(ul(2,i)) f(ul(2,i))] , 'b*');
        plot(hAxes, [ul(2,i) ul(1,i) ] ,[f(ul(2,i)) f(ul(1,i))] , 'g');
        plot(hAxes, [ul(2,i) root(1,i) ] ,[f(ul(2,i)) 0] , 'g');
        plot(hAxes, [ul(1,i) root(1,i) ] ,[f(ul(1,i)) 0] , 'g');
        plot(hAxes, [root(1,i) root(1,i)] , [0 0] , 'm*');
        
    end
        errors = errors.' ;
        root = root.' ; 
        ul = ul.';
        errorsCell = num2cell(errors);
        errorsCell{1 , 1} = 'N/A' ; 
else
    warndlg('Error in bounds','False-Position Warning');
end