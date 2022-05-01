% Liam Piper ; April 2022 ; HW 4 ; Question 2

clc; clear all; close all;

t0 = 0;
tf = 20;
dt = 0.1;
t = t0:dt:tf;

%The x that was calculated from problem 1
x = -0.009696*exp(-sqrt(4.3707)*t)+0.0096*exp(sqrt(4.3707)*t);

%the plot output
plot(t, x)
title("Resultant Impulse Response during 20s")
xlabel("time in seconds")
ylabel("x3(t)")
