%Liam Piper HW3 Problem 1
clc; close all; clear all;
%parameters 
t0=1;
tf=7;
dt=0.1;
t=t0:dt:tf;
xCurr=[7;5];
xState=zeros(length(xCurr),length(t));
xState(:,1)=xCurr;

%now for the actual mathlab calculates for me
for i=2:length(t)
    k1=sysDyn(xCurr)*dt;
    k2=sysDyn(xCurr+1/2*k1)*dt;
    k3=sysDyn(xCurr+1/2*k2)*dt;
    k4=sysDyn(xCurr+k3)*dt;
    xCurr=xCurr+1/6*k1+1/3*k2+1/3*k3+1/6*k4;
    xState(:,i)=xCurr;
end

%now for the graph
figure(1)
subplot(2,1,1)
hold on
plot(t,xState(1,:))
hold off;
title('x(t) RK4 Method Graph')
subplot(2,1,2)
t=[1:.1:7];
x=(12.*t-5).*exp(1-t);
plot(t,x)
title('x(t) Analytical Method')


function xDot=sysDyn(x)
x1=x(1);x2=x(2);
xDot=[x2;-2*x2-x1];
end
