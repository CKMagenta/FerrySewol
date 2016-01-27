% 2008144235 ±èÁøÇù
%HW_9 Problem_2_(c)

function [x,y,y_a,err] =odeRK4(ODE,a,b,h,yINI)
% Runge-Kutta 4th order method

x(1)=a; y(1)=yINI;
N=(b-a)/h;

for i = 1:N;
    x(i+1)=x(i)+h;
    K1=ODE(x(i),y(i));
    xhalf=x(i)+h/2;
    yK1=y(i)+K1*h/2;
    K2=ODE(xhalf,yK1);
    yK2=y(i)+K2*h/2;
    K3=ODE(xhalf,yK2);
    yK3=y(i)+K3*h;
    K4=ODE(x(i+1),yK3);
    y(i+1)=y(i)+(K1+2*K2+2*K3+K4)*h/6;
end
% Calculate Analytical Solution and error in each steps
for j=1:N+1
    y_a(j)=9*exp(x(j)/2)-2*x(j)-4;
    err(j)=y(j)-y_a(j);
end
