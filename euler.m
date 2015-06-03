function [t, u] = euler(h, Tf, u0, f)
% Simple Euler solver for systems.

t = 0:h:Tf;
N = length(t);
u(:,1) = u0;

for i = 1:(N-1)
    u(:,i+1) = u(:,i) + h*f(t(i), u(:,i));
end
end
