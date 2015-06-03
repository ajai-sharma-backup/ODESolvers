function pendplot(u)

for i=1:size(u,2)
  x1=u(1,i); y1=u(2,i); x2=u(3,i); y2=u(4,i);
  
  cla,axis equal,axis([-3,3,-3,3]),grid on
  line([-.2,.2],[0,0],'linewidth',5,'color','b')
  line([0,x1,x2],[0,y1,y2],'linewidth',3,'color','k')
  line([x1,x2],[y1,y2],'linestyle','none','marker','.', ...
       'markersize',32,'color','r')
  pause(0.01)
end
