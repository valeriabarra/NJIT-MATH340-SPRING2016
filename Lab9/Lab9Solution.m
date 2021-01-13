%% Lab 9 Solution
% Lab Instructor: Valeria Barra
%%
% DUE Tuesday 03-29-2016

%% Problem 1: Numerical Integration: Trapezoid Rule and Simpson's rule
% Use Trapezoid Method and Simpson's Method to find the approximations $I_n(f)$ of integrals $I(f)=\int_a^b f(x)dx$, with $n=2^1, 2^2, 2^3, \ldots , 2^9$, for the functions:
%
% $$ (a)  \int_0^\pi e^{\cos(4x)} dx=\frac{e^{\pi} -1}{17} $$
%
% $$(b) \int_0^1 x^{5/2}  dx= {2}{7} $$
%
% $$(c) \int_0^5 \frac{1}{1+(x-\pi)^2} dx= \arctan(5 - \pi)+ \arctan(\pi) $$
%
% $$(d) \int_{-\pi}^{\pi } e^{\cos x} dx= 7.95492652101284 $$
%
% $$(e)  \int_0^{\pi/4}  e^{\cos(x)} dx = 1.93973485062365 $$
% 
% $$(f) \int_0^1 \sqrt{x} dx =\frac{2}{3} \\$$
% 
%%
% For each of the approximated integrals $I_n(f)$ calculate the error from the exact value of the integral $I(f)$, given by
% $Err_n=| I(f) - I_n(f) |$
%
%%
% *Solution*:
clear all; clc;
format long e
% all functions handles in a cell array
f = {@(x) exp(x).*cos(4.*x), @(x)(x.^(5/2)), @(x) 1./(1+(x-pi).^2), @(x) exp(cos(x)), @(x) exp(cos(x)), @(x) sqrt(x)};
% an array of lower endpoints of integration for all exercises
a = [0, 0, 0, -pi, 0, 0];
% an array of upper endpoints of integration for all exercises
b = [pi, 1, 5,  pi, pi/4, 1];
% an array exact solutions:
I = [(exp(pi) -1)/17,2/7,atan(pi - 5) + atan(pi), 7.95492652101284,1.93973485062365,2/3];
% a vector with all n's for each exercise:
n = 2.^(1:9);

% an array of character strings to be diplayed in the table of results
Strings=['a' 'b' 'c' 'd' 'e' 'f'];

% we will call the three methods Trapezoid, Simpson's and Midpoint in a
% nested loop. One loop goes over each single exercise ((a) to (f)); one
% for each of them goes over all the n's
for i=1:length(a)
    fprintf('Execution of part (%s) \n',Strings(i))
    fprintf('  n       Trap Rule         Error_n Trap       Ratio_n Trap     Simpson''s Rule    Error_n Simps      Ratio_n Simps\n')
    fprintf('===============================================================================================================================\n')
    for j = 1:length(n)
        Tr = Trapezoid(f{i},a(i),b(i),n(j));
        S = Simpson(f{i},a(i),b(i),n(j));
        ErrTrap(j)=abs(I(i)- Tr);
        ErrSimps(j)=abs(I(i)- S);
        if j<2
            fprintf('%3i  %15.8f    %15.8f    %15s   %15.8f   %15.8f   %15s \n', n(j),Tr,ErrTrap(j),'',S,ErrSimps(j),'')
        else
            RatioTrap(j-1)=ErrTrap(j-1)/ErrTrap(j);
            RatioSimps(j-1)=ErrSimps(j-1)/ErrSimps(j);
            fprintf('%3i  %15.8f    %15.8f    %15.8f   %15.8f   %15.8f   %15.8f  \n', n(j),Tr,ErrTrap(j),RatioTrap(j-1),S,ErrSimps(j),RatioSimps(j-1))
        end
    end
    % end of each table
 fprintf('===============================================================================================================================\n')
end



%% 
% *Conclusions:*
% 

%% Problem 2
% *Solution:*
% To solve this problem, we need to test monomial functions $1, x, x^2,
% x^3,\ldots$ on a general interval [a,b]=[x,x+4h], where both x and h are
% symbolic variables. Note that we apply to all integration rules the same number of points $5$,
% since Boole's rule needs at least this number of nodes. But the results
% would be unchanged, even if we tested Trapezoid and Simpson's rules with
% fewer nodes.

n = 5;
syms x h;
monomials = sym(zeros(1, n));

for k=0:n+1
    monomials(k+1) = sym(x^k);
    Real(k+1)= collect((( x + 4*h)^(k+1)  - x^(k+1) )/(k+1),h);  
end


for k=0:n+1
    T=collect(TrapezoidSym(monomials(k+1),x,x+4*h,h,n),h);
    testT=isequal(T,Real(k+1));
    if (testT==0)
        fprintf('The order of precision for Trapezoid is is %d\n',k-1)
        break
    end
end

for k=0:n+1 
    S=collect(SimpsonSym(monomials(k+1),x,x+4*h,h,n),h);
    testS=isequal(S,Real(k+1));
    if (testS==0)
        fprintf('The order of precision for Simpson is is %d\n',k-1)
        break
    end
end

for k=0:n+1
    B=collect(Boole(monomials(k+1),x,x+4*h,h,n),h);
    testB=isequal(B,Real(k+1));
    if (testB==0)
        fprintf('The order of precision for Boole''s is %d\n',k-1)
        break
    end
end




