% —ßœ∞ π”√imshow


close all;
clear;
clc;


I = imread("lena.bmp");
figure();
subplot(3,1,1);
imshow(I);
subplot(3,1,2);
[counts,x] = imhist(I,64);
size(x);
size(counts);
stem(x,counts);
ylim([0,3000]);
subplot(3,1,3);
imhist(I,64);
ylim([0,3000]);