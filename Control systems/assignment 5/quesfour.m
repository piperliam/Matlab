% Liam Piper ; April 2022 ; HW 4 ; Question 4

clc; clear all; close all;

%Input Parameters
m1=1;
m2=1;
k1=10;
k2=10;
c=5;
tF=20;

syms s

%Transfer function from problem 3
A = [0 1 0 0; (-k2/ml) (-c/ml) (k2/ml) (c/ml); 0 0 0 1; (k2/m2) (c/m2) (-(k1+k2)/m2) (-c/m2)];
B = [0; 0; 0; (k1/m2)];
C = [1 0 0 0];
I = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
G_s = C*inv(s*I-A)*B
D=0;

% This will plot the impulse function
sys=ss(A,B,C,D);
figure(1)
impluse(sys,tF);
[y,t] = impulse(sys,tF);

%This will plot the step function
figure(2)
step(sys,tF);
[y,t] = step(sys,tF);

%calculated the rise time, the setting time and the peak overshoot of the
%modes

E = eig(A)

%Mode 1
tR1 = 3/abs(E(1));
tS1 = 4/abs(E(1));

%Mode 2
%just like that of mode 1
tR2 = 3/abs(E(2));
tS2 = 4/abs(E(2));

%Mode 3
tR3 = (1/abs(image(E(3))))*atan2(abs(imag(E(3))),real(E(3)));
tS3 = 4/abs(real(E(3)));
Mp3 = exp((pi*real(E(3)))/abs(imag(E(3))));




