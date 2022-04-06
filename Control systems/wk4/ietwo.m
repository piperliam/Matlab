clc; close all; clear all;

%inital parameters 
t0=1;
tf=6;
dt=0.1;
t=t0:dt:tf;
xCurr=[2;1];
xState=zeros(length(xCurr),length(t));
xState(:,1)=xCurr;
ut=@(t) cos(t);
xT=@(t) 3/5*exp(-3*t+3)+7/5*exp(2*t-2);
%% RK4
for i=2:length(t)
    k1=sysDyn(xCurr,ut(t(i)))*dt;
    k2=sysDyn(xCurr+1/2*k1,ut(t(i)+1/2*dt))*dt;
    k3=sysDyn(xCurr+1/2*k2,ut(t(i)+1/2*dt))*dt;
    k4=sysDyn(xCurr+k3,ut(t(i)+1/2*dt))*dt;
    xCurr=xCurr+1/6*k1+1/3*k2+1/3*k3+1/6*k4;
    xState(:,i)=xCurr;

end

figure(1)
%subplot(n,m,x) ; n*m matric of figures with x current plot
subplot(2,1,1)
hold on
fplot(xT,[t0 tf])
plot(t,xState(1,:))
hold off;
plot(t,xState(1,:))
title('x(t)')
subplot(2,1,2)
plot(t,xState(2,:))
title('v(t)')

function xDot=sysDyn(x,u)
    x1=x(1);x2=x(2);
    xDot=[x2;6*x1-x2+u];
    %=xDot=[0,1;6,-1]*x;

end