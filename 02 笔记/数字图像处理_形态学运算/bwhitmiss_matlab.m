% 击中击不中变化
% 精通Matlab数字图像处理与识别 Page234

close all;
clear;
clc;

% 生成原始图像
A = zeros(120,180);
A(11:80,16:75) = 1;
A(56:105,86:135) = 1;
A(26:55,141:170) = 1;
%imshow(A);  %图片中有三个矩形


% 生成结构元素
S1 = zeros(58,58);
S1(5:54,5:54)=1; %物体S1
S2 = 1 - S1;

result = bwhitmiss(A,S1,S2);


figure();
subplot(1,2,1);
imshow(A);
title('原始图像');
subplot(1,2,2);
imshow(result);
title('击中击不中变换后');