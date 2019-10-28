% 精通MATLAB数字图像处理与识别 张铮等编著
% 2013.04.01 第一版
% P218
% 不知道有啥用

close all;
clear;
clc;


im = double(imread('lena.jpg'));
[m,n,p] = size(im);

%1.选出两点颜色为灰色,并以G分量为基准,匹配
F1 = im(1,1,:);
F2 = im(1,2,:);
F1_(1,1,1) = F1(2);
F1_(1,1,2) = F1(2);
F1_(1,1,3) = F1(2);
F2_(1,1,1) = F2(2);
F2_(1,1,2) = F2(2);
F2_(1,1,3) = F2(2);


%2.求k1,k2和l1,l2
K1 = (F1_(1,1,1) - F2_(1,1,1))/(F1(1,1,1) - F2(1,1,1));
K2 = F1_(1,1,1) - K1*F1(1,1,1);
L1 = (F1_(1,1,3)-F2_(1,1,3))/(F1(1,1,3)-F2(1,1,3));
L2 = F1_(1,1,3)-L1*F1(1,1,3);

%
for i = 1:m
    for j = 1:n
        new(i,j,1) = K1*im(i,j,1)+K2;
        new(i,j,2) = im(i,j,2);
        new(i,j,3) = L1*im(i,j,3)+L2;
    end
end

im = uint8(im);
new = uint8(new);

subplot(1,2,1);
imshow(im);
title('原始图');
subplot(1,2,2);
imshow(new);
title('平衡后');

