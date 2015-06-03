function [t, u] = taylor2(h, Tf, u0, f, fp)
% Taylor series method for systems of ODEs based on second order Taylor series expansion.

t = 0:h:Tf;
N = length(t);
u(:,1) = u0;

for i = 1:(N-1)
    u(:,i+1) = u(:,i) + h*f(t(i), u(:,i)) + h^2/2 * fp(t(i), u(:,i));
end
end
