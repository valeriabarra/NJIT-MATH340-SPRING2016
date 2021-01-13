%% Lab 11 Solution
% Lab Instructor: Valeria Barra
%%
% DUE Tuesday 04-12-2016 ;

%% Problem 1: Euler's Method
% Reproduce the first table in Example 6.2 in your textbook,  with columns $t_i, w_{h=0.2}, w_{h=0.1}, w_{h=0.05}$, the actual solution $y_i$ and the error $e_i= |y_i - w_{h=0.05}|$, all at the same grid points $t_i = 0, 0.2, 0.4, 0.6, 0.8, 1.0$. To compute the error at each grid point $e_i= |y(t_i) - w_i|$ use the value for the actual solution given $y(t) = 3 e ^{{t^2}/2} - t^2 - 2$.

%%
% *Solution:*
clear all; close all;
% function handle of the RHS function for the problem
f=@(t,y)(t.*y + t.^3);
% the actual solution
y=@(t)( 3*exp((t.^2)./2) - t.^2 -2);
h=[0.2 0.1 0.05];

% the IC given
w0=1;

% strings to be displayed in the headers of the tables
% Strings=['a','b','c'];
Markers = ['o' '^' 's']; % just different symbols to plot
Colors = ['r' 'g' 'b']; % different colors used for the different markers


fprintf('\nExecution of Problem 1, \n')
fprintf('__________________________________________________________________________________________\n\n')
fprintf('t        w_{h=0.2}(t_i)  w_{h=0.1}(t_i)  w_{h=0.05}(t_i)     y_i       Error w_{h=0.05} \n')
fprintf('__________________________________________________________________________________________\n')
% the main cycle of the call of the function and display starts here


for j=1:length(h)
    % print the header of the table
    
    t{j}=(0:h(j):1); % domain 
    % the call of the method
    w{j}=Euler(f, t{j}, w0,h(j));
    % plots of all the approximations here
    line_fewer_markers(t{j},w{j},6,Markers(j),'MarkerFaceColor',Colors(j),'MarkerSize',5);
    hold on
    % plotting here
    if j==length(h)
        plot(t{j},y(t{j}),'--r') % plots the real solution only the last time
    end
end

% now we only read those values that we want to display

for i=1:length(h)
%for i=1:h(1)/h(j):length(t{j})% we start by 1/h +1 because of the initial zero, with an increment of 1/h
    %TPrint{i}=t{i};
    %WPrint{i}=w{i};
    %if i==2
        TPrint{i}=t{i}(1:h(1)/h(i):end);
        WPrint{i}=w{i}(1:h(1)/h(i):end);
    if i==length(h)
        Error=abs(y(TPrint{i}) - WPrint{i}); % error calculated point-wise only with the third execution 
    end

end
% print the table
tent=(TPrint{1,3})';
table=[(TPrint{1,3})'; (WPrint{1,1})'; (WPrint{1,2})'; (WPrint{1,3})';(y(TPrint{1,3}))'; (Error)'];
fprintf('%2.1f        %6.4f          %6.4f          %6.4f          %6.4f          %6.4e \n',table')

   

%end
fprintf('__________________________________________________________________________________________\n')

% attributes of the figure here
title('Problem 1')
xlabel('t')
ylabel('w')
box on
legend({'$w_{h=0.2}$','$w_{h=0.1}$','$w_{h=0.05}$','y'},'interpreter','latex','location','northwest');

%%
% *Comments on results:*
% We can see that Euler's explicit scheme is only of order one. In fact, as
% h is halved for each execution, also the corresponding error for each grid point is roughly
% halved.
