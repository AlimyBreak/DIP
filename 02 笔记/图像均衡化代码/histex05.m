%  伽马变换(指数变换或幂次变换)
%  y = {(x+esp)}^{\gamma}
%  $\gamma$为伽马系数, esp 为补偿系数 , x 和 y 的范围都是[0,1];

% $\gamma > 1$时,图像的高灰度区域对比度增强
% $\gamma < 1$时,图像的低灰度区域对比度增强
% $\gamma < 1, esp = 0$时,图像不变


close all;
clear;
clc;

I = imread("lena.bmp");
[M,N] = size(I);
I_d = double(I) / 255;

%处理图像
gamma  = 2       ;
esp    = 0       ;
y1     = (I_d+esp).^(gamma);
y1     = y1*255;

gamma  = 0.5;
esp    = 0 ;
y2     = (I_d+esp).^(gamma);
y2     = y2*255;

gamma  = 1;
esp    = 0 ;
y3     = (I_d+esp).^(gamma);
y3     = y3*255;

figure(1);
subplot(2,2,1);
imshow(I);
title('原始图像');
subplot(2,2,2);
imshow(uint8(y1));
title('\gamma = 2,图像的高灰度区域对比度得到增强');
subplot(2,2,3);
imshow(uint8(y2));
title('\gamma = 0.5,图像的低灰度区域对比度得到增强');

subplot(2,2,4);
imshow(uint8(y3));
title('\gamma = 1,不变');


figure(2);
J1 = imadjust(I,[],[],2);
J2 = imadjust(I,[],[],0.5);
J3 = imadjust(I,[],[],1);
subplot(2,2,1);
imshow(I);
title('原始图像');
subplot(2,2,2);
imshow(J1);
title('\gamma = 2');
subplot(2,2,3);
imshow(J2);
title('\gamma = 0.5');
subplot(2,2,4);
imshow(J3);
title('\gamma = 1');




