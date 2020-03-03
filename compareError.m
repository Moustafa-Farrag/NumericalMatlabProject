function [] = compareError(bisection, biN , falsi , faN , fixed , fiN , newton , newN , secant , sN , vieta , vN)
   figure; 
   for i=1 : 1 : biN
        hold on
       plot([i i] , [bisection(i,1) bisection(i,1)] , 'r*'); 
       if (i>1)
          plot([i i-1] , [bisection(i,1) bisection(i-1,1)] , 'r'); 
       end
    end
     for i=1 : 1 : faN
          hold on
       plot([i i] , [falsi(i,1) falsi(i,1)] , 'g*'); 
       if (i>1)
          plot([i i-1] , [falsi(i,1) falsi(i-1,1)] , 'g'); 
       end
     end
    for i=1 : 1 : (newN+1)
         hold on
       plot([i i] , [newton(i,1) newton(i,1)] , 'b*'); 
       if (i>1)
          plot([i i-1] , [newton(i,1) newton(i-1,1)] , 'b'); 
       end
    end
    for i=1 : 1 : (sN+2)
         hold on
       plot([i i] , [secant(i,1) secant(i,1)] , 'm*'); 
       if (i>1)
          plot([i i-1] , [secant(i,1) secant(i-1,1)] , 'm'); 
       end
    end
    for i=1 : 1 : vN
       plot([i i] , [vieta(1,i) vieta(1,i)] , 'c*'); 
       if (i>1)
          plot([i i-1] , [vieta(1,i) vieta(1,i-1)] , 'c'); 
       end
    end
    for i=1 : 1 : (fiN+1)
        hold on
       plot([i i] , [fixed(i,1) fixed(i,1)] , 'k*'); 
       if (i>1)
          plot([i i-1] , [fixed(i,1) fixed(i-1,1)] , 'k'); 
       end
    end
    
end