% �Ҷ����Ա任
close all;
clear;
clc;

I = imread("lena.bmp");
[M,N] = size(I);

figure(1);
imshow(I);
title('ԭʼͼ��');

figure(2);
I = double(I);  %����������תΪdouble,�������
[H,x] = imhist(I,64); %����64��С����ĻҶ�ֱ��ͼ

% ���ӶԱȶ�
Fa = 2;
Fb = -55;
O = Fa .* I + Fb/255;


figure(3);
imshow(uint8(O));