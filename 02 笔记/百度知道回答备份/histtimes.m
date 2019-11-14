
clear;
close all;
clc;

I = imread('1.png');
gray = rgb2gray(I);
gray1 = histeq(gray);
gray2 = histeq(gray1);
gray3 = histeq(gray2);


figure()
subplot(2,1,1);
[count, x] = imhist( gray );
plot(x,count);
xlim([0,255]);
title('原始灰度图像的直方图');

subplot(2,1,2);
[count1, x1] = imhist( gray1 );
plot(x1,count1);
hold on;
[count2, x2] = imhist( gray2 );
plot(x2,count2);
[count3, x3] = imhist( gray3 );
plot(x3,count3);
xlim([0,255]);
legend({'1次histeq','2次histeq','3次histeq'});

sumsqr(count1-count2)
sumsqr(count2-count3)