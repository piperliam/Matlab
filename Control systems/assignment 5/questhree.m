% Liam Piper ; April 2022 ; HW 4 ; Question 3

clc; clear all; close all;

%Input Parameters
k1=10;
k2=1;
c=1;
m1=1;
m2=1;
tF=10;

%stating the cell array
syms s

%This calculates the transfer function
A = [0 1 0 0; (-k2/ml) (-c/ml) (k2/ml); 0 0 0 1; (k2/m2) (c/m2) (-(k1+k2)/m2) (-c/m2)];
B = [0;0;0; (k1/m2)];
C = [1 0 0 0];
I = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
G_s = C*inv(s*I-A)*B;
D=0;

%Plot impulse function on figure 1
sys=ss(A,B,C,D);
figure(1)
impulse(sys,tF);
[y,t] = impulse(sys,tF);

%Plot step function on figure 2
figure(2)
step(sys,tF);
[y,t] = impulse(sys,tF);

%calculated the rise time, the setting time and, the peak overshoot of each mode
%used the eigenvalue function
E = eig(A);

%For mode 1
tR1 = (1/abs(imag(E(1))))*atan2(abs(imag(E(1))),real(E(1)));
tSl = 4/abs(real(E(1)));
Mpl = exp((pi*real(E(1)))/abs(imag(E(1))));

%for mode 2
%basiclly the same as for mode 1
tR2 = (1/abs(imag(E(3))))*atan2(abs(imag(E(3))),real(E(3)));
tS2 = 4/abs(real(E(3)));
Mp2 = exp((pi*real(E(3)))/abs(imag(E(3))));


