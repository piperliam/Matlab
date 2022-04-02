clear all;
close all;
%1/n from n->15 and sum of 1/n
n=15;
sum=0;

for i=n:-1:1
  
    sum=sum+1/i;
    fprintf('Current iteration value %4.6f \n', sum)
end