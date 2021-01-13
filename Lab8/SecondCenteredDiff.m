function [ D ] = SecondCenteredDiff(f,x0,h)
% this function computes the second order derivative of a given function
% (given as a symbolic function in input), using the centered divided difference of
% second order about the point x0 passed as an argument as well. The
% spacing between two consecutive points h is also given as a parameter.

D=(double(subs(f,x0+h)) -2*double(subs(f,x0)) +double(subs(f,x0-h)))/(h^2);

end

