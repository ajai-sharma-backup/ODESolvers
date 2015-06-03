function ytop=p3_3c(alpha,beta,T,h)
load struct_data

%init vals.
ytop=zeros(1+T/h,1);
C=alpha*M+beta*K;
I=eye(size(K));
Ftil=[0*F; F];
Ktil=[0*K, I; -K,-C];
Mtil=[I,0*I; 0*I,M];
N = T/h;

%init. butcher array
a11=1/4; 
a12=1/4-sqrt(3)/6; 
a21=1/4+sqrt(3)/6; 
a22=1/4;
b=1/2;

% set up eqns for ks
leftmat=[Mtil-h*a11*Ktil, -h*a12*Ktil;
    -h*a21*Ktil, Mtil-h*a22*Ktil];

u=u0;
for i=1:N
rightmat=h*[Ktil*u+Ftil; Ktil*u+Ftil]; 
ks=leftmat\rightmat; %find ks
u=u+ks(1:end/2)*b+ks(end/2+1:end)*b; %find u_n+1

%plot the object
struct_plot(p,t,u);
ytop(i+1)=u(end/2);
end

end