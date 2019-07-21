close all;
clear;
clc;


original_gray_data = imread('lena512_gray.bmp');

original_gray_data_d = double(original_gray_data);

% 线性变换测试
a = min(min(original_gray_data));
b = max(max(original_gray_data));
c1 = a*2;
d1 = b/2;
c2 = 0;
d2 = 255;

if(d1 > 255)
    d1 = 255;
end
if(d2 > 255)
    d2 = 255;
end
pic1 = LineTransform(original_gray_data_d,[a,b],[c1,d1]);
pic2 = LineTransform(original_gray_data_d,[a,b],[c2,d2]);
figure()
subplot(2,3,1);
imshow(original_gray_data);
title('原始图像')
subplot(2,3,2);
imshow(pic1);
title('线性变换-压缩');
subplot(2,3,3);
imshow(pic2);
title('线性变换-拉伸')
subplot(2,3,4);
imhist(original_gray_data);
subplot(2,3,5);
imhist(pic1);
subplot(2,3,6);
imhist(pic2);


