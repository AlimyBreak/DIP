%形态学处理,二值化图像中的边界提取


close all;
clear;
clc;

I_rgb = imread('twocoins.jpg');
I_gray = rgb2gray(I_rgb);
I_bw = im2bw(I_gray,83/255);

se = strel('square',3);

I_bw_inner = imerode(I_bw,se);

edge = I_bw - I_bw_inner;

figure();
subplot(1,2,1);
imshow(I_bw);
title('原图');

subplot(1,2,2);
imshow(edge);
title('边界');


