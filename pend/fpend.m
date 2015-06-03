function f = fpend(u,kspr)
x1 = u(1);
y1 = u(2);
x2 = u(3);
y2 = u(4);

L1 = sqrt(x1^2+y1^2); L2 = sqrt((x2-x1)^2+(y2-y1)^2);

Forcex1 = -kspr*(L1-1)*x1/L1 + kspr*(L2-1)*(x2-x1)/L2;
Forcey1 = -kspr*(L1-1)*y1/L1 + kspr*(L2-1)*(y2-y1)/L2;
Forcex2 = -kspr*(L2-1)*(x2-x1)/L2;
Forcey2 = -kspr*(L2-1)*(y2-y1)/L2;

f = [u(5:8);Forcex1;Forcey1-10;Forcex2;Forcey2-10];
end


