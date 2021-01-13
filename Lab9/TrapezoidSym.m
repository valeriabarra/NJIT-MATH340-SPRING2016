function T = TrapezoidSym(f,x,b,h,n)
    S = 0;
    for i = 1:n-2
        S = S + subs(f,x+i*h); % calculate the summation S of the internal grid points only
    end
    T = h*(0.5*subs(f,x) + S + 0.5*subs(f,b)); % calculate the summation considering the first and the last cases separate
end