function T = Trapezoid(f,a,b,n)
    h = (b-a)/n;
    S = 0;
    x = a; % initialize x as the first grid point
    for i = 1:n-1
        x = x + h; % this way we create the equispaced grid everytime adding h 
        S = S + f(x); % calculate the summation S of the internal grid points only
    end
    T = h*(0.5*f(a) + S + 0.5*f(b)); % calculate the summation considering the first and the last cases separate
end