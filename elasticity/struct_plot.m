function struct_plot(p,t,u)

u=reshape(u(1:numel(p)),size(p));
if any(isinf(u(:))) | any(isnan(u(:))) | max(abs(u(:)))>10
  error('Invalid solution.');
end

clf
p1=p;
p1=p1+0.2*reshape(u,size(p));
uabs=0.2*sqrt(sum(u.^2,2));
patch('vertices',p1,'faces',t,'facevertexcdata',uabs,'facecolor','interp');
axis equal
axis([-1.5,1.5,-1.5,1.5])
set(gca,'clim',[0,0.4]);
drawnow
