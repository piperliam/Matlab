
%Harris Corner Detection Program
%Liam Piper


clear all; close all; clc;

%import image file
im=imread('higgins.jpg');
figure
imshow(im)
%converting the image into greyscale as to help w/ errors
im = rgb2gray(im);

%Apply the Sobel operators
%Allows for x&y gradient values of every pixel in image
dx=[1 0 -1;
    2 0 -2;
    1 0 -1];  

dy=[1 2 1;
    0 0 0;
    -1 -2 -1];     
 
%Taking the 2D convolution of the matrices
Ix=conv2(im, dx, 'same');
Iy=conv2(im, dy, 'same');

% Image for each pixel in the image
%imagine it as a 3x3 box around each pixel and find corner strength at a
%function
%this is known as a the Harris value
Ix2 = Ix .^ 2;
Iy2 = Iy .^ 2;
Ixy = Ix .* Iy;

%defining the size of the kernel
%also known as nullspace
kernel_size=3;

%Find the sum of the products of the derivatives of each pixel using the
%kernel size as reference
sum_all = ones([kernel_size,kernel_size]);

%Taking the 2D convolution of the matrices
Sx2=conv2(Ix2, sum_all, 'same');
Sy2=conv2(Iy2, sum_all, 'same');
Sxy=conv2(Ixy, sum_all, 'same');

kernel_size=3;
%empirically determined constant
k=0.04;
%Defining our threshold for identifing
Threshold=2.5*10e+09;

%defining rows and cols in accordance w/ image
[numOfRows, numOfColumns]=size(im);

%Calculation of R
%(R is Harris reponse)
R_avg = 0;
for x=1:numOfRows
   for y=1:numOfColumns
       %Define at each pixel(x, y) the matrix M
       M = [Sx2(x, y) Sxy(x, y); Sxy(x, y) Sy2(x, y)];
       
       %Calculate response of the detector for each pixel
       R = det(M) - k * (trace(M) ^ 2);
       
       %Threshold on value of R
       if (R > Threshold)
          im = insertMarker(im,[y,x]);
          
       %Then take the sume of R
       R_avg = R_avg + R;
       end
   end
end
  
%just redefining average of R
R_avg=R_avg/(numOfRows*numOfColumns);

%Displaying calculated values of R
disp(sprintf("R average : %d", R_avg));
disp(sprintf("A better threshold: %d", R_avg * 4));
disp(sprintf("to %d" , R_avg * 5));

%Show orgional image
figure
imshow(im)

%Apply first R value to image (green)
im=imread('higgins.jpg');
im = rgb2gray(im);
%im = imgaussfilt (im, 4);
C = corner(im);

%Apply range of R value to image (red)
figure
imshow(im)
hold on
plot(C(:,1),C(:,2),'r*');

       