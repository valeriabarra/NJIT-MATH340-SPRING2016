%% Lab 2 Solution
% Lab Instructor: Valeria Barra
%%
% DUE Thuesday 02-02-2016

clc; % clears the command window
%clear all; %clears all variables

%% Problem 1
a = 2;
b = 3;
tol= 10^(-4);
f1 = @(x)(x^3 -9);
disp(['Execution of problem 1:'])
c1=MyBisection(f1,a,b,tol);

%% Problem 2

a = 6;
b = 7;
tol= 10^(-4);
f2 = @(x)(6 + (cos(x)).^2 - x);
disp(['Execution of problem 2:'])
c2=MyBisection(f2,a,b,tol);

%% Problem 3
f3=@(r)( ( 50000 + 10000./r ).* exp(20.*r) -10000./r - 1000000);
a = 0;
b = 1;
tol = 10^(-6);
disp(['Execution of problem 3:'])
c3=MyBisection(f3,a,b,tol);

%% Problem 4
f4= @(x)( (abs(x-2))./(x.^3 - 2* x.^2 + x -2) );
a = 1;
b = 4;
tol = 10^(-4);
disp(['Execution of problem 4:'])
c4=MyBisection(f4,a,b,tol);

%% Problem 5
a = 4;
b = 6;
disp(['Execution of problem 5:'])
c5=MyBisection(f4,a,b,tol);

%% Problem 6
f6= @(x) (abs(x).*exp(x) - 0.25);
a1 = -3; b1 = -2;
a2 = -1; b2 = 0;
a3 = 0; b3 = 1;
disp(['Execution of problem 6: first root'])
c61=MyBisection(f6,a1,b1,tol);
disp(['Execution of problem 6: second root'])
c62=MyBisection(f6,a2,b2,tol);
disp(['Execution of problem 6: third root'])
c63=MyBisection(f6,a3,b3,tol);

%% Problem 7 
f7 = @(x)(27* x.^3 - 27 *x.^2 + 9.*x - 1);
tol = 1e-6;
a = 0; 
b = 1;
disp(['Execution of problem 7:'])
c7=MyBisection(f7,a,b,tol);

%% Problem 8 
f8 = @(x) (64 .*x.^3 - 48.*x.^2 + 12.*x - 1);
disp(['Execution of problem 8:'])
c8=MyBisection(f8,a,b,tol);