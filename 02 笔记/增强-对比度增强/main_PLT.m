close all;
clear;
clc;


original_gray_data = imread('lena512_gray.bmp');

original_gray_data_d = double(original_gray_data);

% 分段线性变换测试
a = min(min(original_gray_data));
b = max(max(original_gray_data));
c = 0;
d = 255;
% 利用线性变换，将确保原始图像放缩到0~255
pic1 = LineTransform(original_gray_data_d,[a,b],[c,d]);
% 进行分段线性表换
area_you_like_original = [100,200];
area_you_like_target = [50,250];
Mf = 255;
Mg = 255;
pic2 = PartLineTransform( original_gray_data_d , Mf,area_you_like_original,area_you_like_target,Mg);

area_you_like_original = [100,200];
area_you_like_target = [140,160];
Mf = 255;
Mg = 255;
pic3 = PartLineTransform( original_gray_data_d , Mf,area_you_like_original,area_you_like_target,Mg);


figure()
subplot(2,3,1);
imshow(pic1);
title('原始图像')
subplot(2,3,2);
imshow(pic2);
title('分段线性变换-放大兴趣区间,压缩两端');
subplot(2,3,3);
imshow(pic3);
title('分段线性变换-缩小兴趣区间，拉伸两端')
subplot(2,3,4);
imhist(pic1);
subplot(2,3,5);
imhist(pic2);
subplot(2,3,6);
imhist(pic3);



