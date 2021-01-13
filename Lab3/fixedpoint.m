function [xc,i]=fixedpoint(xx,g, x0, N, tol)


y=g(xx);
figure; % evry time we use this command we open a new figure
plot(xx,y);
hold on % to add more graphs in the same figure
plot(xx,xx,'r:'); % plot the bisector line x=y to visualize the fixed point as the intersection of the two curves
box on; % it just looks prittier with a frame

xlabel('x');
ylabel('y');
title('cobweb diagram')

x(1)=x0;
x(2)=g(x(1));

%i = 2; % initializes a counter at 2, since we have already assigned the first two x's
err(1) = abs(x(2)-x(1)); % initializes the error needed the first time to enter the loop
error = tol + 1; % something larger than tol for sure
for  i = 2:N % the first two values of x are already found 
    if  error < tol
        disp('We have recahed the desired tolerance');
        xc = x(i);
        return;
    end
    
    plot([x(i) x(i)], [x(i) g(x(i))], 'r.-'); % draw the vertical line
    hold on;
    plot([x(i)  g(x(i))], [ g(x(i))  g(x(i))], 'r.-'); % draw the horizontal line
    drawnow; % drawnow serves not to wait until the end of the loop for the plot to be executed
    
    x(i+1)=g(x(i));
    err(i)= abs(x(i+1) - x(i));
    error = err(i);
end
xc=x(i+1); % we store last value in a separate variable xc
