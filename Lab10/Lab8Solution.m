%% Lab 8 Solution
% Lab Instructor: Valeria Barra
%%
% Friday Lab 03-27-2015, DUE Tuesday 03-31-2015 ;
% Monday Lab 03-30-2015, DUE Thursday 04-02-2015

%% Problem 1: Gaussian Quadrature
% Use the transformation for your integrand $I(f) = 
% \int_{-1}^{1} f \left( \frac{(b-a)t +b+a }{2} \right)\frac{b-a}{2} dt$ to approximate
% the Gaussian quadrature for n=2,4,6,8 for the functions:
%
% $$(a) \int_1^2 \ln x dx=2 \ln 2 -1 \approx 0.38629436111989 $$
% 
% $$(b) \int_0^4 \frac{x}{\sqrt{x^2+9}} dx=2  $$
%
% $$(c) \int_{0}^{1 } x e^x  dx= 1 $$
%
% $$(d) \int_{-1}^{2} x^5 dx = 10.5 $$
% For each of the approximated integrals $I_n(f)$ calculate the error from the exact value of the integral $I(f)$, given by
% $Err_n=| I(f) - I_n(f) |$ and the Ratio $Ratio_n=\frac{Err_{n-1}}{Err_n}$
% and put your results in tabular form
%%
%*Solution*:
clear all; clc
format long e
% an array of lower endpoints of integration for all exercises
a = [1,  0, 0, -1];
% an array of upper endpoints of integration for all exercises
b = [2, 4, 1, 2];
% an array with the tranformation variables needed
c= (b-a)./2;

% an array exact solutions:
IExacts = [0.38629436111989,2,1,10.5];
% a vector with all n's for each exercise:
n = 2:2:8;

% an array of character strings to be diplayed in the table of results
Strings=['a' 'b' 'c' 'd'];
% all original functions handles in a cell-array
f={@(x) log(x), @(x) x./(sqrt(9 + x.^2)), @(x) x.*exp(x),@(x) x.^5};

for i=1:length(a)    
    % first define another function handle cell-array with the proper tranformation
    F{i} =@(t) c(i)*f{i}((b(i)+a(i) + t.*(b(i)-a(i)))./2);
    fprintf('______________________________________________________________\n \n')
    disp(['Execution of part (',Strings(i),') f = ',char(f{i})])
    fprintf('______________________________________________________________\n')
    fprintf('\n Exact solution of part (%s) = %f \n \n ',Strings(i),IExacts(i))
    fprintf('\n  n     Gaussian Quadrature      Error_n         Ratio_n\n')
    fprintf('______________________________________________________________\n')
    for j = 1 : length(n)
        % calculate and print results
        In(j)=Gaussian(F{i},n(j));
        Err(j)=abs(IExacts(i)- Gaussian(F{i},n(j)));
        if j<2
            fprintf(' %2i  %20.8e  %15.6e \n',n(j),In(j),Err(j));
        else
            Ratio(j-1)=Err(j-1)/Err(j);
            fprintf(' %2i  %20.8e  %15.6e  %15.6e \n',n(j),In(j),Err(j),Ratio(j-1))
        end
    end    
    fprintf('______________________________________________________________\n \n \n')
end
%% 
% *Comments on Results:*
%
% We can see that for each execution of the code the error decreases as n
% increases. Generally Gaussian quadrature is better than other integration
% rules seen in the previous assignment (Trapezoid rule, Simpson rule and
% Midpoint rule). The degree of precision of a quadrature method is the degree for which all polynomial
% functions are integrated by the method with no error. In this case, you
% can see it from the polynomial function in ex. (d) of degree 5 (n+1 with n=4), the
% Gaussian quadrature with four points is already exact up to the 9th digit.
