function [ D ] = FirstForwardDiff(f,x,x0,h)
% this function computes the first order derivative of a given function
% (given as a function handle in input), using the forward divided difference of
% first order about the point x0 passed as an argument as well. The
% spacing between two consecutive points h is also given as a parameter.

D=(double(subs(f,{x},x0+h))-double(subs(f,{x},x0)))/h;

end