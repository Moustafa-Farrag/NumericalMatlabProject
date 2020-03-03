function [] = compare2 (Jordan , JN , Seidel , SN, hAxes)
for i=1 : 1 : JN
       plot(hAxes, [i i] , [Jordan(i,1) Jordan(i,1)] , 'g*'); 
       if (i>1)
          plot([i i-1] , [Jordan(i,1) Jordan(i-1,1)] , 'g'); 
       end
end
    for i=1 : 1 : SN
       plot(hAxes, [i i] , [Seidel(i,1) Seidel(i,1)] , 'r*'); 
       if (i>1)
          plot(hAxes, [i i-1] , [Seidel(i,1) Seidel(i-1,1)] , 'r'); 
       end
    end
end