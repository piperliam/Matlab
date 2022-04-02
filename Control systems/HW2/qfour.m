%Question 4
syms n x
K1=symsum(1/(1+n*3),n,0,4);
disp(K1)

syms n x
K2=symsum(1/(1+n*3),n,0,16);
disp(K2)

syms n x
K3=symsum(1/(1+n*3),n,0,64);
disp(K3)
