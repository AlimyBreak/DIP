% 直方图归一化


close all;
clear;
clc;


I = imread("lena.bmp");
[M,N] = size(I);

[counts,x] = imhist(I);

counts = counts / (M*N);

figure();
stem(x,counts);
ylim([0,0.025]);
