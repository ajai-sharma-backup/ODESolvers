function [t, u] = rk4(h, T, u0, f)
% Simple rk4 solver for systems.

t = 0:h:T;
N = length(t);
u(:,1) = u0;

for i = 1:(N-1)
    k1 = f(t(i), u(:,i));
    k2 = f(t(i) + (h/2), u(:,i) + (h/2)*k1);
    k3 = f(t(i) + (h/2), u(:,i) + (h/2)*k2);
    k4 = f(t(i) + h, u(:,i) + h*k3);
    u(:,i+1) = u(:,i) + (h/6) * (k1 + 2*k2 + 2*k3 + k4);
end
end
