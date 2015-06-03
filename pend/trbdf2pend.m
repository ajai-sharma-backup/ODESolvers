function trbdf2pend(u0,dt,kspr)

% Initialization 
Tf = 5; N = ceil(Tf/dt); u = u0;

% This function gives you jacobian of fpend to use for finding 
% the Newton method in linearization of 5

    function Df = fpendjac(U,kspr)
        P1(1) = U(1);
        P1(2) = U(2);
        P2(1) = U(3);
        P2(2) = U(4);
        LI = P2 - P1;
        Df = zeros(8,8);
        Df(1:4, 5:8) = eye(4);
        
        P1p = kspr * (1 - norm(P1)) / norm(P1)*eye(2) - ...
            kspr/norm(P1)^3*P1'*P1;
        
        P2p = kspr * (1 - norm(LI)) / norm(LI)*eye(2) - ...
            kspr/norm(LI)^3*LI'*LI;
        
        Df(5:6,1:2) = P1p+P2p; Df(5:6,3:4) = -P2p;
        Df(7:8,1:2) = -P2p;
        Df(7:8,3:4) = P2p;
                
    end

% Solver starts here


% Loop over iteration
for i = 1:N
    k1 = u + dt/4*fpend(u,kspr);
    fprintf('Iter St1   '); fprintf('Norm\n');
    
    %Do a newton to find k1
    for j1 = 1:20
        fpendj = eye(8) - dt/4*fpendjac(k1,kspr);
        fk1old = k1 - dt/4*fpend(k1,kspr)-u-dt/4*fpend(u,kspr);
        fpendjfk1old = fpendj\fk1old;
        k1 = k1 - fpendjfk1old;
        fprintf('%8d %16.10g\n', j1, norm(fpendjfk1old));
        if norm(fpendjfk1old)<1e-8, break; end
    end
    fprintf('\n\n')
    
    uprev = u;
    fprintf('Iter St2   '); fprintf('Norm\n');
    
    % Do a newton to find u_n+1
    for j2 = 1:20
        fpendj = eye(8) - dt/3*fpendjac(u,kspr);
        fk1old = u-dt/3*fpend(u,kspr)-1/3*(4*k1-uprev);
        fpendjfk1old = fpendj\fk1old;
        u = u - fpendjfk1old;
        fprintf('%4d %16.10g\n', j2,norm(fpendjfk1old));
        if norm(fpendjfk1old)<1e-8, break; end
    end
    fprintf('\n');

% Draw the pendulum
pendplot(u)    
end

end

        
    