%% Lab 4 Solution
% Lab Instructor: Valeria Barra
% DUE Tuesday 02-16-2016

%% First Problem: Probl. 28 in the Homework

% the interval found
x0 = 2;
x1 = 3;
tol= 10^(-3);
N = 50;
f1 = @(x)(x.^3 -9);
disp(['Execution of problem 1 by Secant Method:'])
[ roots,error ] = MySecantMethod(f1,x0,x1,tol,N);
disp(['Execution of problem 1 by Regula Falsi:'])
[x,err]=MyRegulaFalsi(f1,x0,x1,tol);
disp(['Execution of problem 1 by Bisection:'])
c=MyBisection(f1,x0,x1,tol);
disp(['Execution of problem 1 by Newton:'])
syms x;
[X,err]=MyNewton(x,sym(f1),x0,tol,N);


%%
% *Conclusions:*
% When the intial guess is close enough to the actual solution, Newton's method is the fastest. In fact its convergence is quadratic, while secant method has order equal to
% the golden ratio (approximately 1.62). For this particular problem
% though, we can see that Regula Falsi performs as Newton's method.
% Bisection method was the slowest, and Secant the second slowest.


%% Second Problem: Probl. 29 in the Homework

f2 = @(x)(6 + (cos(x)).^2 -x);
x0=6;
x1=7;
disp(['Execution of problem 2 by Secant Method:'])
[ roots,error ] = MySecantMethod(f2,x0,x1,tol,N);
disp(['Execution of problem 2 by Regula Falsi:'])
[x,err]=MyRegulaFalsi(f2,x0,x1,tol);
disp(['Execution of problem 2 by Bisection:'])
c=MyBisection(f2,x0,x1,tol);
disp(['Execution of problem 2 by Newton:'])
syms x;
[X,err]=MyNewton(x,sym(f2),x0,tol,N);

%% 
% *Conclusions:*
% For this initial guess instead, Newton's method does not converge. Regula
% Falsi in this case is still the fastest method, and we are guaranteed
% that we don't migrate away from the root, because of the bracketing
% imposed by the method.