function S=SimpsonSym(f,x,b,h,n)
S=0;
for i=1:n-2
    if mod(i,2)==0 % if i is even we multiply the corresponding coefficient in the summation
        S=S+2*subs(f,x+i*h);
    else % else, i is odd
        S=S+4*subs(f,x+i*h);
    end
end
S=(h/3)*(subs(f,x)+S+subs(f,b)); % calculate the summation considering the first and the last cases separate
end