function [I] = Gaussian( f,n)

% we need to discern the cases for each n to set the proper nodes and weights 
switch n
   case 2
       x= [-0.5773502692,0.5773502692];
       w= [1,1];
   case 4
       x= [-0.8611363116,-0.3399810436,0.3399810436,0.8611363116];
       w= [0.3478548451,0.6521451549,0.6521451549,0.3478548451];
   case 6
       x= [-0.9324695142,-0.6612093865,-0.2386191861,0.2386191861,0.6612093865,0.9324695142];
       w= [0.1713244924,0.3607615730,0.4679139346,0.4679139346,0.3607615730,0.1713244924];
   case 8
       x= [-0.9602898565,-0.7966664774,-0.5255324099,-0.1834346425,0.1834346425,0.5255324099,0.7966664774,0.9602898565];
       w= [0.1012285363,0.2223810345,0.3137066459,0.3626837834,0.3626837834,0.3137066459,0.2223810345,0.1012285363];
   otherwise
       disp('You need to use n 2,4,6 or 8');
       out=0;
end
I=0;
for i=1:n
    I=I + w(i)*f(x(i));
end
end

