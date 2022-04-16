clc; close all; clear all;
k1=1;k2=k1;
c=4;
m1=1;
m2=3;
tF=5;

A=[0,1,0,0;-k2/m1,-c/m1,k2/m1,c/m1;0,0,0,1;k2/m2,c/m2,-(k1+k2)/m2,-c/m2];

B=[0;0;0;k1/m2];
C=eye(4);
D=0;

sys=ss(A,B,C,D)
figure(1);
[y,t]=step(sys);


figure(2);
impulse(sys);
