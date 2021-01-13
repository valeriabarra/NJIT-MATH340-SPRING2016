function c=MyBisection(f,a,b,tol)
c = 0; % it initializes the returning value, in case of failure
ainit = a;
binit = b;
if sign(f(a))*sign(f(b)) >= 0
    disp('f(a)f(b)<0 not satisfied!')     
    return %ceases execution
end
fa=f(a);
fb=f(b);
i=0; % counter variable
while (b-a)/2>tol
     i = i+1;
    c=(a+b)/2;
    fc=f(c);
    if fc == 0 %c is a solution, done
        disp(['At the step i = ',num2str(i),' the exact root is c = ',num2str(c),' in the interval [a, b] = [',num2str(a),', ',num2str(b),']']);
        fprintf('The maximum number of steps estimated was %d \n',ceil( -log2(tol) + log2(binit - ainit)))
        return
    end
    if sign(fc)*sign(fa)<0 %a and c make the new interval
        b=c;
        fb=fc;
    else %c and b make the new interval
        a=c;
        fa=fc;
    end
    fprintf('At the step i = %d the best approximated root is c = %8.6f in the interval [a, b] = [ %g, %g ]\n',i,c,a,b );
end
c=(a+b)/2;
fprintf('At the step i = %d , the root found is %8.7f\n',i+1,c)
fprintf('The maximum number of steps estimated was %d \n',ceil( -log2(tol) + log2(binit - ainit)))
end