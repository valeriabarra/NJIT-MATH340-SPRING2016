function [x,err]=MyRegulaFalsi(f,x0,x1,tol)

% assign the given initial guesses to the first two entries of the array x
% of iterates
x(1)=x0;
x(2)=x1;
n=2;
x(n+1)=x(n)-f(x(n))*(x(n)-x(n-1))/(f(x(n)-f(x(n-1)))); % we need the calculation for the next point the first time

err(1)=tol +1; % something for sure greater than the tolerance to enter the while loop the first time
while err(n-1)>tol
    if f(x(n-1))*f(x(n+1)) <= 0 % this part is like bisection method with a = n-1, b = n, and c = n+1
        x(n)=x(n+1);
    else
        x(n-1) = x(n+1);
    end
    % calculate the new point
    n=n+1; % increment the index first
    x(n+1)=x(n)-f(x(n))*(x(n)-x(n-1))/(f(x(n)-f(x(n-1))));
    % calculate the corresponding new error
    err(n-1)=(abs(x(n+1)-x(n)));
end

fprintf('At the step i = %d , the root found is %8.7f\n',n,x(n+1))
end