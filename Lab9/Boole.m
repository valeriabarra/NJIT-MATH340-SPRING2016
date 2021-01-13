function B=Boole(f,x,b,h,n)
B=0;

for i=1:n-2
    if mod(i,2)==0 % if i is even we multiply the corresponding coefficient in the summation
        B=B+12*subs(f,x+i*h);
    else % else, i is odd
        B=B+32*subs(f,x+i*h);
    end
end
B=((2*h)/45)*(7*subs(f,x)+B+7*subs(f,b)); % calculate the summation considering the first and the last cases separate
end