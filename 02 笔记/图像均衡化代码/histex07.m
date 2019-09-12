%  分段线性变换
%  f(x) = (y_1 / x_1)x, x < x_1
%  f(x) = ((y_2 - y_1) / (x_2 - x_1))(x - x_1) + y_1,    x1 <= x <= x_2
%  f(x) = ((255-y_2)/(255_x_2))(x - x_2) + y_2,   x > x_2
% [x_1,x_2] [y_1,y_2] 为需要转换的灰度范围, [y_1,y_2]决定线性变换的斜率.

% 若 x_1 == y_1 且 x_2 == y_2,增强图像与原图像相同.
% 若 x_1 == x_2 且 y_1 = 0 , y_2 = 255,则图像只剩下两个灰度级(第一段全部编程变成0,中间那一段分段函数没有了,最后一段变成255),分段线性起到了阈值分割的作用



close all;
clear;
clc;

I = imread("lena.bmp");
[M,N] = size(I);


x_1 = 100;
x_2 = 100;
y_1 = 0;
y_2 = 255;

O = zeros(M,N);

for i = 1:M
    for j = 1:N
        
        if I(i,j) <= x_1
            O(i,j) = (y_1/x_1)*I(i,j);
        elseif I(i,j) <= x_2
            O(i,j) = ((y_2 - y_1)/(x_2 - x_1))*(I(i,j) - x_1) + y_1;
        else
            O(i,j) = ((255-y_2)/(255-x_1))*(I(i,j) - x_2) + y_2;        
        end
    end
end


O1 = im2bw(double(I),100/255);
O1 = O1*255;

figure();
subplot(1,3,1);
imshow(I);
title('原始图像');
subplot(1,3,2);
imshow(uint8(O));
title('分段线性变换-压缩两端');

subplot(1,3,3);
imshow(O);
title('分段线性变换-压缩两端');