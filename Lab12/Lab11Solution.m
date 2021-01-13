%% Lab 11 Solution
% Lab Instructor: Valeria Barra
%%
% Friday Lab 04-17-2015, DUE Tuesday 04-21-2015 ;
% Monday Lab 04-20-2015, DUE Thursday 04-23-2015

%% Problem 1: Runge-Kutta 4
% Implement your own R-K4 method to solve the same IVP seen last week. Reproduce the three tables for $h=0.2,0.1,0.05$, showing the grid points $t_i$, approximated solution $w_i$, the actual solution $y_i$ and the error $e_i$, all at the same grid points $t_i = 0, 0.2, 0.4, 0.6, 0.8, 1.0$ for all three tables. To compute the error at each grid point $e_i= |y(t_i) - w_i|$ use the value for the actual solution given $y(t) = 3 e ^{{t^2}/2} - t^2 - 2$.

%%
% *Solution:*

% the solution to this problem is pretty identical to last one's. Other than
% the call of the function and the definition of the scheme used of course.
clear all; close all;
% function handle of the RHS function for the problem
f=@(t,y)(t.*y + t.^3);
% the actual solution
y=@(t)( 3*exp((t.^2)./2) - t.^2 -2);
h=[0.2 0.1 0.05];

% the IC given
w0=1;

% strings to be displayed in the headers of the tables
Strings=['a','b','c'];
Markers = ['o' '^' 's']; % just different symbols to plot
Colors = ['r' 'g' 'b']; % different colors used for the different markers

% the main cycle of the call of the function and display starts here


for j=1:length(h)
    % print the header of the table
    fprintf('\nExecution of Problem 1, part (%s)\n',Strings(j))
    fprintf('_____________________________________________\n\n')
    fprintf('h      t       w_i        y_i          Error \n')
    fprintf('_____________________________________________\n')
    t{j}=(0:h(j):1); % domain 
    % the call of the method
    w{j}=RungeKutta4(f, t{j}, w0,h(j));

    % now we only read those values that we want to display

    for i=1:h(1)/h(j):length(t{j})% we start by 1/h +1 because of the initial zero, with an increment of 1/h
        Error=abs(y(t{j}(i)) - w{j}(i));
        % print the table
        if i==1 
            fprintf('%3.2f  %2.1f    %6.4f    %6.2f      %6.4e \n', h(j),t{j}(i), w{j}(i) ,y(t{j}(i)) , Error)
        else
            fprintf('      %2.1f    %6.4f    %6.2f      %6.4e \n',t{j}(i), w{j}(i) ,y(t{j}(i)) ,Error)
        end
    end
   
    % plots of all the approximations here
    line_fewer_markers(t{j},w{j},6,Markers(j),'MarkerFaceColor',Colors(j),'MarkerSize',5);
    hold on
    % plotting here
    if j==length(h)
        plot(t{j},y(t{j}),'--r') % plots the real solution only the last time
        hold on
    end

end
fprintf('_____________________________________________\n')

% attributes of the figure here
title('Problem 1')
xlabel('t')
ylabel('w')
box on
legend({'$w_{h=0.2}$','$w_{h=0.1}$','$w_{h=0.05}$','y'},'interpreter','latex','location','northwest');

%%
% *Comments on results:*
% We can see that this Runge-Kutta scheme is of order four locally. In fact, as
% h is halved for each execution, the corresponding error for each grid point is roughly
% divided by sixteen.

%% Problem 2
% Do problem 69 in your homework, comparing the Euler, the R-K2 and the
% R-K4 methods.

%%
% *Solution:*

% the RHS function defined as a function handle
f=@(x,y)(2*sqrt(y) - 2./x -2./(x.^3));
% the IC given
x_0=1; y_0=4;
% the vector of all h's
h=2.^(0:-1:-9);

% actual solution
Y=@(xx)((xx + 1./xx).^2 );

% header of the table for Eluer's method
fprintf('\nProblem 2: Euler''s table \n')
fprintf('___________Values for x=3_____________________\n\n')
fprintf('h           y_i             Error       Ratio\n')
fprintf('______________________________________________\n')
for j=1:length(h)
    % print the header of the table

    x{j}=(1:h(j):3); % domain 
    % the call of the method
    ynE{j}=Euler(f, x{j}, y_0,h(j));
    
    
    % corresponding errors
    ErrorE(j)=abs(Y(x{j}(end)) - ynE{j}(end));

    % print the table
    if j==1 
        fprintf('%5.4f     %7.4f      %8.4e  \n',h(j), ynE{j}(end) , ErrorE(j))
    else
        RatioE(j-1)=ErrorE(j-1)/ErrorE(j);
        fprintf('%5.4f     %7.4f      %8.4e     %7.4f \n',h(j), ynE{j}(end)  ,ErrorE(j), RatioE(j-1))
    end

end
fprintf('________________________________________________\n\n')

% second method: RK-2
fprintf('Problem 2: RK-2 table \n')
fprintf('___________Values for x=3_____________________\n\n')
fprintf('h           y_i             Error       Ratio\n')
fprintf('______________________________________________\n')
for j=1:length(h)
    % print the header of the table

    x{j}=(1:h(j):3); % domain 
    % the call of the method
    ynRK2{j}=RungeKutta2(f, x{j}, y_0,h(j));
    % corresponding errors
    ErrorRK2(j)=abs(Y(x{j}(end)) - ynRK2{j}(end));
    
    % print the table
    if j==1 
        fprintf('%5.4f     %7.4f      %8.4e  \n',h(j), ynRK2{j}(end) , ErrorRK2(j))
    else
        RatioRK2(j-1)=ErrorRK2(j-1)/ErrorRK2(j);
        fprintf('%5.4f     %7.4f      %8.4e     %7.4f \n',h(j), ynRK2{j}(end)  ,ErrorRK2(j), RatioRK2(j-1))
    end

end
fprintf('________________________________________________\n\n')

% third method: RK-4
fprintf('Problem 2: RK-4 table \n')
fprintf('___________Values for x=3_____________________\n\n')
fprintf('h           y_i             Error       Ratio\n')
fprintf('______________________________________________\n')
for j=1:length(h)
    x{j}=(1:h(j):3); % domain
    
    % the call of the method
    ynRK4{j}=RungeKutta4(f, x{j}, y_0,h(j));
    % corresponding errors
    ErrorRK4(j)=abs(Y(x{j}(end)) - ynRK4{j}(end));


    % print the table
    if j==1 
        fprintf('%5.4f     %7.4f      %8.4e  \n',h(j), ynRK4{j}(end) , ErrorRK4(j))
    else
        RatioRK4(j-1)=ErrorRK4(j-1)/ErrorRK4(j);
        fprintf('%5.4f     %7.4f      %8.4e     %7.4f \n',h(j), ynRK4{j}(end)  ,ErrorRK4(j), RatioRK4(j-1))
    end

end
fprintf('________________________________________________\n')

%%
% *Comments on results:*
% From the ratios in tables we have confirmation that explicit Euler's
% method is of order 1 (as h is halved the ratio between consecutive errors is 2, i.e. the error is halved as well);
% RK-2 is of second order and this is showed by the fact that as h is halved, the error gets divided by 4 (or the ratio between consecutive errors is 4);
% Rk-4 scheme is instead of order four locally. In fact, as h is halved for each execution, the corresponding error is roughly
% divided by sixteen, i.e. the ratio of two consecutive error is roughly
% 16.
