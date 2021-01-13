%% Lab 8 Solution
% Lab Instructor: Valeria Barra
%%
% DUE Tuesday 03-22-2016

%% Problem 1: Numerical Differentiation - First Order Forward Derivative VS  First Order Centered Derivative
% Use the first order forward and centered finite difference scheme to approximate the first derivative of the function $f(x)=exp(x)$ at the point $x_0= 0$, with $h= 10^{-n}$, with $n=1,2, \ldots, 9$. Write your results and errors in a table to compare the order of accuracy of the two schemes. 

%%
% *Solution:*
clear all; clc; close all;
syms x;
f=exp(x);
x0=0;
h=10.^-(1:9);
FirstDiffExact=diff(f);
FirstDiffEval=double(subs(FirstDiffExact,0));
fprintf('_________________________________________________Problem 1 Table________________________________________________________________________________\n\n')
fprintf('      %s           %s          %s           %s               %s           %s        %s   \n','h','D_f(f)','Err D_f(f)','D_c(f)','Err D_c(f)','Ratio Err_D_f(f)','Ratio Err_D_c(f)')
fprintf('________________________________________________________________________________________________________________________________________________\n\n')
for i=1:length(h)
    DFirstForward(i)=FirstForwardDiff(f,x,x0,h(i));
    DFirstCentered(i)=FirstCenteredDiff(f,x,x0,h(i));
    ErrorForward(i)=abs(FirstDiffEval - (DFirstForward(i)));
    ErrorCentered(i)=abs(FirstDiffEval -(DFirstCentered(i)));
    if i>=2        
        RatioForward(i-1)=ErrorForward(i)/ErrorForward(i-1);
        RatioCentered(i-1)=ErrorCentered(i)/ErrorCentered(i-1);
        fprintf(' %2.0e    %16.14f    %16.14f     %16.14f       %16.14f           % 8.2g              % 8.2g \n',h(i),(DFirstForward(i)),ErrorForward(i),(DFirstCentered(i)),ErrorCentered(i),RatioForward(i-1),RatioCentered(i-1) );
    else
        fprintf(' %2.0e    %16.14f    %16.14f     %16.14f       %16.14f \n',h(i),(DFirstForward(i)),ErrorForward(i),(DFirstCentered(i)),ErrorCentered(i));
    end
end
fprintf('________________________________________________________________________________________________________________________________________________\n\n\n')

%% 
% *Conclusions:*
% We can see that the centered derivative is more accurate than the forward
% one (second order of accuracy vs first). Since we divide h by ten,
% we can see that the error ratio is roughly 0.1 for the first order scheme
% (i. e. the error also is divided by ten), while it is roughly 0.01 for
% the second order scheme. These ratios eventually blow up for small
% values of h due to h being to small (dividing approximately by zero propagates the error)

%% Problem 2: Numerical Differentiation - Centered VS Truncated Derivative
% Use the centered finite difference scheme to approximate the second derivative of the function $f(x)= \cos(x)$ at the point $x_0= \pi / 6$, with $h= 2^{-n}$, with $n=1,2, \ldots, 9$. Do the same with a truncated version of the evaluations of the function $\hat{f}(x_i)$, up to 6 digits of precision. Write your results and errors in a table and compare the exact evaluations and the truncated ones. 
%%
% *Solution:*
syms x;
f=cos(x);
x0=pi/6;
den=(2.^(1:9));
h=1./den;

CenteredDiffExact=diff(f,2);
CenteredDiffEval=double(subs(CenteredDiffExact,pi/6));

fprintf('_____________________________________________Problem 2 Table_______________________________________________________________________________\n\n')
fprintf('      %s           %s          %s         %s        %s      %s      %s \n','h','D_c^2(f)','D_c^2(hat(f))','Err D_c^2(f)','Err D_c^2(hat(f))','Ratio Err_E','Ratio Err_Tr')
fprintf('___________________________________________________________________________________________________________________________________________\n\n')
for i=1:length(h)
    D(i)=SecondCenteredDiff(f,x0,h(i));
    DRound(i)=SecondCenteredDiffRoundedOff(f,x0,h(i));
    ErrorExact(i)=abs(CenteredDiffEval - (D(i)));
    ErrorRound(i)=abs(CenteredDiffEval - (DRound(i)));
    if i>=2        
        RatioExact(i-1)=ErrorExact(i)/ErrorExact(i-1);
        RatioRound(i-1)=ErrorRound(i)/ErrorRound(i-1);
        fprintf(' %3.0i / %3.0i    %16.14f    %16.14f     %16.14f     %16.14f       % 8.2g         % 8.2g \n',1,den(i),(D(i)),(DRound(i)),ErrorExact(i),(ErrorRound(i)),RatioExact(i-1),(RatioRound(i-1)) );
    else
        fprintf(' %3.0i / %3.0i    %16.14f    %16.14f     %16.14f     %16.14f \n',1,den(i),(D(i)),(DRound(i)),ErrorExact(i),(ErrorRound(i)));
    end
end
fprintf('___________________________________________________________________________________________________________________________________________\n\n\n')

% plotting here
line_fewer_markers(h,ErrorExact,5,'o-.r','MarkerFaceColor','r','MarkerSize',6,'LineWidth',1.5);
hold on
line_fewer_markers(h,ErrorRound,8,'p--','MarkerSize',10,'MarkerFaceColor','b','LineWidth',1.5);
legend({'Error of Exact Evaluation','Error of Rounded Evaluation'});
title('Problem 2: Errors vs h');
box on;
xlabel('h');
ylabel('Error');

%% 
% *Conclusions:*
% We can see how with the truncated version of the function, the round off
% errors affect the accuracy of the calculation of the second derivative.
% In fact, while the error for exact evaluated $D_c^2(f(x_0))$ decreases
% as h decreases, the one for the truncated one $D_c^2(\hat{f}(x_0))$
% decreases initially but then after a certain treshold, increases rapidly,
% giving a less accurate result.