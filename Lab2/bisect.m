%Program 1.1 Bisection Method
%Computes approximate solution of f(x)=0
%Input: function handle f; a,b such that f(a)*f(b)<0,
% and tolerance tol
%Output: Approximate solution xc
function c=bisect(f,a,b,tol)

if sign(f(a))*sign(f(b)) >= 0
    error('f(a)f(b)<0 not satisfied!') %ceases execution
end
fa=f(a);
fb=f(b);
i=0; % counter variable
while (b-a)/2>tol
     i = i+1;
    c=(a+b)/2;
    fc=f(c);
    if fc == 0 %c is a solution, done
        disp(['At the step i = ',num2str(i),' the exact root is c = ',num2str(c),' in the interval [a, b] = [',num2str(a),', ',num2str(b),']']);
        break
    end
    if sign(fc)*sign(fa)<0 %a and c make the new interval
        b=c;
        fb=fc;
    else %c and b make the new interval
        a=c;
        fa=fc;
    end
    %xc=c; %new midpoint is best estimate
    disp(['At the step i = ',num2str(i),' the best approximated root is c = ',num2str(c),' in the interval [a, b] = [',num2str(a),', ',num2str(b),']']);
end
end