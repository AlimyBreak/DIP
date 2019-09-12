% 灰度对数变换
% 是一种灰度的非线性变换,在傅里叶频谱中应用.
% $t = c\log{(1+s)}$
% s: 源灰度值
% c: 比例系数
% t: 变换后的目标灰度值
% s较小时,曲线斜率很大;s较大时,曲线斜率很小

% 通过观察频谱(幅度谱)可知:
% 经过对数灰度处理的图像,其低灰度区域对比度会增加,暗部细节将被增强.


close all;
clear;
clc;

I = imread("lena.bmp");
[M,N] = size(I);

I_d = double(I);

%处理图像
c = 30;
t1 = c*log(1+I_d);

figure(1);
subplot(1,2,1);
imshow(I);
title('原始图像');
subplot(1,2,2);
imshow(uint8(t1));
title('c = 30 时的对数变换图像');

%处理频谱
F = fft2(im2double(I));
F = fftshift(F);
F = abs(F);
T = log(F+1); 
figure(2);
subplot(1,2,1);
imshow(F,[]);%自动归一化
title('原图像频谱');
subplot(1,2,2);
imshow(T,[]); %自动归一化
title('对数变换后的频谱');



