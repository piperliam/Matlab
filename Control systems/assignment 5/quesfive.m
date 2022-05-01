% Liam Piper ; April 2022 ; HW 4 ; Question 5

clc; clear all; close all;

%find eigenvalues of A to find the modes
A = [-6.868*10^(-3) 1.395*10^(-2) 0 -32.2; -9.055*10^(-2) -0.3151 774.0 0; 1.187*10^(-4) -1.026*10^(-3) -0.4285 0; 0 0 1 0];
%used the eigenvalue function
E = eig(A);

%mode 1 (2nd order)
tRl = (1/abs(imag(E(1))))*atan2(abs(imag(E(1))),real(E(1)));
tSl = 4/abs(real(E(1)));
Mpl = exp((pi*real(E(1)))/abs(imag(1)));



%mode 2 (2nd order)

tR2 = (1/abs(imag(E(3))))*atan2(abs(imag(E(3))),real(E(3)));
tS2 = 4/abs(real(E(3)));
Mp2 = exp((pi*real(E(3)))/abs(imag(3)));

