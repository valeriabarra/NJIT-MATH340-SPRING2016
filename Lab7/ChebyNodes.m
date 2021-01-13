function xi = ChebyNodes( n,a,b )
% Input arguments: 
% - n, the number of Chebyshev nodes we want to find (to calculate an (n-1)-degree interpolating polynomial)
% - a, b, the endpoints of the interval [a,b]
% Ouput argument:
% - xi, the Chebyshev nodes found

% to find the Chebyshev nodes
for i = 1: n
    xi(i)=((a+b)/2) + ((b-a)/2)*cos( ((2*i -1)*pi)/(2*n) );
end
% flip the array xi, since with this construction they are in decresent
% order
xi = fliplr(xi);

end

