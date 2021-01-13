function [p] = LagrangeInterpolation(xi,yi,x)
% data given:
% - x is the vector for the domain on which we will plot the polynomial
% - xi set of first coordinates of data points
% - yi set of second coordinates of data points

p = zeros(1,length(x)); %initialize the vector for the polynomial
for i = 1:length(xi)
    Li = 1; % initialize the L variable for the Lagrange interpolant
    for j = 1:length(xi)
        if i ~= j
            Li = Li.*((x-xi(j))./(xi(i)-xi(j)));
        end
    end
    p = p + Li.*yi(i);
end

end