%  灰度阈值变换
%  f(x) = 0 , x <= T
%  f(x) = 255, x > T
%  T 为给定的阈值

% 灰度阈值变换:将灰度图像转为二值图像,可以将图像分为我们关心和不关心的部分,从而在复杂背景中直接提取出感兴趣的目标

close all;
clear;
clc;

I = imread("lena.bmp");
[M,N] = size(I);
%直接调用im2bw函数
thres = graythresh(I); % 最大
BW = im2bw(I,thres/255);
BW = BW *255;


BW1 = zeros(M,N);
for i = 1:M
    for j = 1:N
        if I(i,j) <= 50
            BW1(i,j) = 0;
        else
            BW1(i,j) = 255;
        end
    end
end

sumsqr(BW - BW1)
