function [w]=RungeKutta2(f, t, y0,h)
% this function implements Runge-Kutta scheme of order two for an IVP. The IC is given as
% argument together with the domain vector t and the function of the RHS of
% the ODE f and the mesh spacing h.

w(1) = y0;
n=length(t);
for i = 1:n-1 % subtract one because the value for t0=0 is already assigned by the IC, so we don't need to solve for that
    v1=f(t(i) , w(i))';
    v2=f(t(i) + h , w(i) + h.*v1)';
    w(i+1) = w(i) + (h/2).*(v1+v2);
end


end
