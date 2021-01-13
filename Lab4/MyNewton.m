function [X,err]=MyNewton(x,f,x0,tol,N)

% Input Arguments: 
% - x, the symbolic variable we are passing the function of
% - f, the symbolic function we have in terms of x
% - x0, the initial guess, starting point of our iteration
% - tol, the desired tolerance up to which we accept our solution
% - N, the max number of iterations reached in case of NOT convergence

% Output Arguments:
% - X is the vector of iterates
% - err is the vector of all errors at each iteration


flag=1; % case of insuccess
der_f=diff(f);
root=0; err=0; % initialize the output to zero
X(1)=x0; % first entry of the array X of iterates is the initial guess

for i=1:N
    if subs(der_f,{x},{X(i)})==0
        disp('ERROR: The derivative must not be zero!');
        break;
    else        
        X(i+1)= X(i) - subs(f,{x},{X(i)})/subs(der_f,{x},{X(i)});
        err(i)=abs(X(i+1)-X(i));
        if (err(i)<tol)
            %this is the check of convergence of our iterations. In
            %positive case, we change the value of our flag variable to 0
            flag=0;
            root=X(i+1);
            disp(['We have converged to the root, r = ',num2str(root),' in ',num2str(i),' steps.']);
        break;
        elseif (i==N)
            disp('We have NOT converged. We have reached the maximum number of steps allowed.');
            break;
        end
    end
end