function [ w ] =ImplicitEulerForLab13(t, y0,h)
% this function implements Implicit Euler scheme specifically for the IVP y'=2*y. The IC is given as
% argument together with the domain vector t, and the mesh spacing h.

w(1) = y0;
n=length(t);
 for i=1:n-1
     w(i+1)=w(i)/(1 + 5*h);
 end
end

