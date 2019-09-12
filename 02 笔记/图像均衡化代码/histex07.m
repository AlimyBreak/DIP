%  �ֶ����Ա任
%  f(x) = (y_1 / x_1)x, x < x_1
%  f(x) = ((y_2 - y_1) / (x_2 - x_1))(x - x_1) + y_1,    x1 <= x <= x_2
%  f(x) = ((255-y_2)/(255_x_2))(x - x_2) + y_2,   x > x_2
% [x_1,x_2] [y_1,y_2] Ϊ��Ҫת���ĻҶȷ�Χ, [y_1,y_2]�������Ա任��б��.

% �� x_1 == y_1 �� x_2 == y_2,��ǿͼ����ԭͼ����ͬ.
% �� x_1 == x_2 �� y_1 = 0 , y_2 = 255,��ͼ��ֻʣ�������Ҷȼ�(��һ��ȫ����̱��0,�м���һ�ηֶκ���û����,���һ�α��255),�ֶ�����������ֵ�ָ������



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
title('ԭʼͼ��');
subplot(1,3,2);
imshow(uint8(O));
title('�ֶ����Ա任-ѹ������');

subplot(1,3,3);
imshow(O);
title('�ֶ����Ա任-ѹ������');