function [t, u] = eutrap(lambda, u0, h)
% Solves u' = lambda(u-cos(t) - sin(t) given lambda, u(0) and step size
% via Backward Euler and Trapezoidal, plots the solutions.

t = 0:h:3;
N = length(t);
utrue = exp( lambda * t ) * (u0-1) + cos(t);

ube = u0;
ut = u0;
for i = 1:N-1
    % Backward Euler
    ube(i+1) = (1 / (1 - h * lambda)) * ...
        (ube(i) - h * lambda * cos(t(i+1)) - h * sin(t(i+1)));
    
    % Trapezoidal
    ut(i+1) = (1 / (1 - h * lambda/2)) * ...
        (ut(i) + h/2 * (...
        lambda*(ut(i)-cos(t(i))) - sin(t(i)) - ...
        lambda*cos(t(i+1)) - sin(t(i+1))));
    
end

plot(t, ut, t, ube, t, ut)
title('Solution of (2) via Backward Euler and Trapezoidal') 
legend('Exact','Backward Euler','Trapezoidal', 'Location', 'NorthEast')

end

