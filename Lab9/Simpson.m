function S=Simpson(f,a,b,n)
h=(b-a)/n;
S=0;
x=a; % initialize x as the first grid point
for i=1:n-1
    x=x+h;  % this way we create the equispaced grid everytime adding h 
    if mod(i,2)==0 % if i is even we multiply the corresponding coefficient in the summation
        S=S+2*f(x);
    else % else, i is odd
        S=S+4*f(x);
    end
end
S=(h/3)*(f(a)+S+f(b)); % calculate the summation considering the first and the last cases separate
end