function [ roots,error ] = MySecantMethod(f,x0,x1,tol,max_iter)
% Input Arguments: 
% - f, the function handle
% - x0 and x1, the two initial guesses, starting points of our iteration
% - tol, the desired tolerance up to which we accept our solution
% - max_iter, the max number of iterations reached in case of NOT convergence

% Output Arguments:
% - roots is the vector of iterates
% - error is the vector of all errors at each iteration

% put the first two initial guesses given inside of the vector roots of
% iterates
roots(1)=x0;
roots(2)=x1; 
for i=3:max_iter % why do we start this loop at 3? because the first two entries 
                      % of the vector of iterates roots have already been assigned
    if (f(roots(i-1))-f(roots(i-2)))==0
        disp('Error: we are dividing by zero!');
       break; 
    end
    roots(i)=roots(i-1) - f(roots(i-1))*(roots(i-1)-roots(i-2))/(f(roots(i-1))-f(roots(i-2)));
    error(i-2)=abs(roots(i-1)-roots(i-2)); % assign the error as the difference of the 
                                          % two last iterates found
    if (error(i-2)<=tol) % the error assignment is shifted by 2 because the for loop 
                           % started from i=3 
       fprintf('At the step i = %d , the root found is %8.7f\n',i,roots(i))
       return;
    end
end
if (i == max_iter)
    disp('We have diverged!')
end
fprintf('At the step i = %d , the root found is %8.7f\n',i,roots(i))
end

