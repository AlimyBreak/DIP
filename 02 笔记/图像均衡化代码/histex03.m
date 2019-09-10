% 灰度线性变换
close all;
clear;
clc;

I = imread("lena.bmp");
[M,N] = size(I);

figure(1);
imshow(I);
title('原始图像');

figure(2);
I = double(I);  %将数据类型转为double,方便计算
[H,x] = imhist(I,64); %计算64个小区间的灰度直方图

% 增加对比度
Fa = 2;
Fb = -55;
O = Fa .* I + Fb/255;


figure(3);
imshow(uint8(O));