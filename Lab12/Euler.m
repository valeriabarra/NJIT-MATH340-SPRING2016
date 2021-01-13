function [w]=Euler(f, t, y0,h)
% this function implements Euler scheme for an IVP. The IC is given as
% argument together with the domain vector t and the function of the RHS of
% the ODE f and the mesh spacing h.
w(1) = y0;
n=length(t);
for i = 1:n-1 % subtract one because the value for t0=0 is already assigned by the IC, so we don't need to solve for that
    w(i+1) = w(i) + h.*f(t(i),w(i))';
end
end