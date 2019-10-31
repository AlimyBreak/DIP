% 击中击不中变化
% 精通Matlab数字图像处理与识别 Page233

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
%imshow(S1); %被黑色背景包裹的白色正方形,正方形变成为50.

% 击中击不中变换 
U1 = imerode(A,S1); % 用S1来腐蚀A
Ac = 1 - A; % 得到Ac
S2 = 1 - S1;
U2 = imerode(Ac,S2);
result = U1 & U2;

figure();
subplot(2,2,1);
imshow(A);
title('原始图像');
subplot(2,2,2);
imshow(U1)
title('U1');
subplot(2,2,3);
imshow(U2)
title('U2');
subplot(2,2,4);
imshow(result);
title('U1 & U2');

