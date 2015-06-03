function rk4pend(u0,dt,kspr)

u = u0; %Init.

while true
    %RK4
    k1 = dt*fpend(u,kspr);
    k2 = dt*fpend(u+k1/2,kspr); 
    k3 = dt*fpend(u+k2/2,kspr); 
    k4 = dt*fpend(u+k3,kspr);
    
    u = u+(k1+2*k2+2*k3+k4)/6;
    
    %Draw solution
    pendplot(u)
end

    