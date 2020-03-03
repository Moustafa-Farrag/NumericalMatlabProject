function [lower,upper,sol , AllCell , time ] = LUDecomp (coeff, const, numOfEq, pivot)
tic;
refrence = magic (numOfEq);
    [lower,upper,refrence] = Decompose(coeff, numOfEq, refrence, pivot);
    [sol] = Substitute(lower, upper, refrence, numOfEq, const); 
    time = toc;
sol = sol.' ;
[lower2 ] = M2magic(lower , sol );
[upper2 , sol2] = M2magic(upper , sol );
sol2 = sol2.' ;
f = vertcat(lower2, upper2 ,sol2);
AllCell = num2cell(f);
end 
function [lower,upper,refrence] = Decompose (coeff, numOfEq, refrence, pivot)

    for i=1 : 1 : numOfEq
        refrence(i,1) = i;
    end
upper = magic(numOfEq);
lower = magic(numOfEq);
        for i=1 : 1 : numOfEq
            if(pivot)
                refrence = Pivot(coeff, refrence, numOfEq, i);
            end
           % if (abs(coeff(refrence(numOfEq,1),numOfEq)) / scaling(refrence(numOfEq,1),1) < tol)
            %     error = -1; 
            %end
            for j=1 : 1 : numOfEq
                upper(i,j) = coeff(refrence(i,1),j);
                if (j<=i-1)
                    f=0;
                    for k=1 : 1 : j-1
                        f = f + (lower(i,k)*upper(k,j));
                    end
                    lower(i,j) = (1/upper(j,j)) * (coeff(refrence(i,1),j)-f);
                end
                if (j>=i)
                    f=0;
                    for k=1 : 1 : i-1
                        f= f + (lower(i,k)*upper(k,j));
                    end
                    upper(i,j) = coeff(refrence(i,1),j) - f;
                end
            end
        end
    for i=1 : 1 : numOfEq
        for j=1 : 1 : numOfEq
          if (j<i)
            upper(i,j) = 0;
          elseif (i==j)
            lower(i,j) = 1;
          else 
            lower(i,j) = 0;
          end
        end
    end
end
function [refrence] = Pivot (coeff, refrence, numOfEq, itrator)
  s = abs(coeff(refrence(itrator,1),1));
  p=itrator;
  for i=itrator+1 : 1 : numOfEq
     if (abs(coeff(refrence(i,1),itrator)) > s)
        p=i;
     end
  end
  temp = refrence(itrator);
  refrence(itrator) = refrence(p);
  refrence(p) = temp;
end
function[sol] = Substitute(lower, upper,  refrence, numOfEq, const)
    y = magic(numOfEq);
    sol = magic(1);
    y(refrence(1,1),1) = const(refrence(1,1),1);
    for i=2 : 1 : numOfEq
        t=0;
        for j=1 : 1 : i-1
            t = t + (lower(refrence(i,1),j)*y(refrence(j,1),1));
        end
        y(refrence(i,1),1) = const(refrence(i,1),1) - t;
    end
    sol(1,numOfEq) = y(refrence(numOfEq,1),1) / upper(refrence(numOfEq,1),numOfEq);
    for i=numOfEq-1 : -1 : 1
        sum = 0;
        for j=i+1 : 1 : numOfEq
           sum = sum + (upper(refrence(i,1),j) * sol(1,j)); 
        end
        sol(1,i) = (y(refrence(i,1),1) - sum) / upper(refrence(i,1),i);
    end
end










