function [ D ] = CenteredDiffRoundedOff(f,x0,h )
% this function computes the second order derivative of a given function
% (given as a symbolic function in input), using the centered divided difference of
% second order about the point x0 passed as an argument as well. The
% spacing between two consecutive points h is also given as a parameter.
% This version cuts off the evaluation of the function to 6 digits of
% precision, to show the effects of roundoff errors in the derivative as h
% decreases

D=(round(double(subs(f,x0+h))*10^6)/10^6  - round(double(subs(f,x0-h))*10^6)/10^6)/(2*h);

end
