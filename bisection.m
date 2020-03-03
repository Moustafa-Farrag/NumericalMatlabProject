function [errors , errorsCell , root , ul ,time , numOfit ] = bisection (f , upper , lower , epsilon , it , hAxes , draw )
errors = magic(1);
root = magic(1);
ul = magic (2);
ul(1,1) = upper;
ul(2,1) = lower;
numOfit =1 ; 
tic;
if (f(lower) * f(upper) < 0 )
    for i = 1 : 1 : it
        root(1,i) = (ul(1,i) + ul(2,i) ) /2.0 ;
        checker = f(ul(2,i)) * f(root(1,i));
           if(checker < 0)
               if (i > 1)
                 errors(1,i) = (abs( root(1,i) - root(1,i-1) )/abs(root(1,i))) *100; 
                  if (errors(1,i) < epsilon )
                     break;
                  end
               end
               
               ul(1,i+1) = root (1,i);
               ul(2,i+1) = ul(2,i);
               
           elseif (checker > 0)
                if (i > 1)
                 errors(1,i) = (abs( root(1,i) - root(1,i-1) )/abs(root(1,i))) *100;
                  if (errors(1,i) < epsilon  )
                     break;
                  end
                end
               ul(1,i+1) = ul(1,i);
               ul(2,i+1) = root(1,i);
              
           else
               errors(1,i) = 0;
               break;
           end   
        numOfit = i  ;
    end
        time = toc;
        if (draw == 1)
            syms x;
            hold on;
            m = upper-((lower + upper) /2);
            fplot (hAxes, matlabFunction(f(x)) , [lower - m , upper + m]);
            pause(1);
         for i =1 : 1 : numOfit
         m = ul(1,i)-((ul(1,i) + ul(2,i)) / 2);
         n = f(ul(1,i))-(f(ul(2,i))+f(ul(1,i)) / 2);
         fplot (hAxes, matlabFunction(f(x)) , [ul(2,i)-m , ul(1,i)+m]);
         plot(hAxes, [ul(1,i) ul(1,i)],[f(ul(2,i))-n f(ul(1,i))+n] , 'r');
         plot(hAxes, [ul(2,i) ul(2,i)],[f(ul(2,i))-n f(ul(1,i))+n] , 'g');
         plot(hAxes, [root(1,i) root(1,i)],[f(ul(2,i))-n f(ul(1,i))+n] , 'b');
         pause(2);
         cla;
        end
        fplot (hAxes, matlabFunction(f(x)) , [ul(2,i)-m , ul(1,i)+m]);
        plot(hAxes, [ul(1,i) ul(1,i)],[f(ul(2,i)) f(ul(1,i))] , 'r');
        plot(hAxes, [ul(2,i) ul(2,i)],[f(ul(2,i)) f(ul(1,i))] , 'g');
        plot(hAxes, [root(1,i) root(1,i)],[f(ul(2,i)) f(ul(1,i))] , 'b');
       end
        errors = errors.' ;
        root = root.' ; 
        ul = ul.';
        errorsCell = num2cell(errors);
        errorsCell{1 , 1} = 'N/A' ; 
else 
    warndlg('Error in bounds','Bisection Warning');
end 

end
