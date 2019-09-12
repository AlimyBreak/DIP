%  �Ҷ���ֵ�任
%  f(x) = 0 , x <= T
%  f(x) = 255, x > T
%  T Ϊ��������ֵ

% �Ҷ���ֵ�任:���Ҷ�ͼ��תΪ��ֵͼ��,���Խ�ͼ���Ϊ���ǹ��ĺͲ����ĵĲ���,�Ӷ��ڸ��ӱ�����ֱ����ȡ������Ȥ��Ŀ��

close all;
clear;
clc;

I = imread("lena.bmp");
[M,N] = size(I);
%ֱ�ӵ���im2bw����
thres = graythresh(I); % ���
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
