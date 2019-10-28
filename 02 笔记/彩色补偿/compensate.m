% ��ͨMATLAB����ͼ������ʶ�� ���  2013.04.01��һ��
% P216
% https://www.ilovematlab.cn/thread-583206-1-1.html ��������λ��
close all;
clear;
clc;


im = double(imread('lena.jpg'));


[m,n,p] = size(im);


% ��ȡ���ĵ�
[h1,k1] = min(255 - im(:,:,1) + im(:,:,2) + im(:,:,3));  % ��ȡȥ��ɫ���Ľ����������Сֵ h1 ��ֵ,k1��λ������
[j1,minx] = min(h1);
i1 = k1(minx); % ???????????????(���ĵ�Ϊλ���� i1,j1)

r1 =  im(i1,j1,1);
g1 =  im(i1,j1,2);
b1 =  im(i1,j1,3);

R = 0.30*r1 + 0.59*g1 + 0.11*b1;

% ��ȡ���̵ĵ�
[h2,k2] = min(255 - im(:,:,2) + im(:,:,1) + im(:,:,3));  % ��ȡȥ��ɫ���Ľ����������Сֵ h2 ��ֵ,k2��λ������
[j2,minx] = min(h2);
i2 = k2(minx); % ???????????????(���̵ĵ�Ϊλ���� i2,j2)

r2 =  im(i2,j2,1);
g2 =  im(i2,j2,2);
b2 =  im(i2,j2,3);

G = 0.30*r2 + 0.59*g2 + 0.11*b2;

% ��ȡ�����ĵ�
[h3,k3] = min(255 - im(:,:,3) + im(:,:,1) + im(:,:,2));  % ��ȡȥ��ɫ���Ľ����������Сֵ h2 ��ֵ,k2��λ������
[j3,minx] = min(h3);
i3 = k3(minx); % ???????????????(�����ĵ�Ϊλ���� i3,j3)

r3 =  im(i3,j3,1);
g3 =  im(i3,j3,2);
b3 =  im(i3,j3,3);

B = 0.30*r3 + 0.59*g3 + 0.11*b3;

A1 = [r1,r2,r3;g1,g2,g3;b1,b2,b3];
A2 = [R,0,0;0,G,0;0,0,B];
C = A1*inv(A2);

for i = 1:m
    for j = 1:n
        imR = im(i,j,1);
        imG = im(i,j,2);
        imB = im(i,j,3);
        temp = inv(C)*[imR;imG;imB];
        S(i,j,1) = temp(1);
        S(i,j,2) = temp(2);
        S(i,j,3) = temp(3);
    end
end

S = uint8(S);


figure();

subplot(1,2,1);
imshow(uint8(im));
title('ԭʼͼ');
subplot(1,2,2);
imshow(S);

return;

clear;
A = [1,3,2;0.5,8,1;2,6,1.5];

[h1,k1] = min(A);
[x,y] = min(h1);