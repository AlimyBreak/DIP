%��̬ѧ����,��ֵ��ͼ���еı߽���ȡ


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
title('ԭͼ');

subplot(1,2,2);
imshow(edge);
title('�߽�');


