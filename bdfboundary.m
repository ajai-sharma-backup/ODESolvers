% Plots stability regions of BDF6 and TR-BDF2
[x,y]=meshgrid(-3:0.05:3,-3.5:0.05:3.5);
z=x+sqrt(-1)*y;

% BDF6
r=lmmraseval(z,[147,-360,450,-400,225,-72,10],[60,0,0,0,0,0,0]);
contourf(x,y,r,[0,1]), axis equal,pause

% TR-BDF2
u=ones(size(x));
k1 = (1 ./ (1 - z./4) ) .* ...
    (u + z.*u./4);
u = (1 ./ (1 - z./3) ) .* ...
    ((1/3)*(4.*k1-u));
contourf(x,y,abs(u),[0,1]),axis equal,pause