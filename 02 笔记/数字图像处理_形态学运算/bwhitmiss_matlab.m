% ���л����б仯
% ��ͨMatlab����ͼ������ʶ�� Page234

close all;
clear;
clc;

% ����ԭʼͼ��
A = zeros(120,180);
A(11:80,16:75) = 1;
A(56:105,86:135) = 1;
A(26:55,141:170) = 1;
%imshow(A);  %ͼƬ������������


% ���ɽṹԪ��
S1 = zeros(58,58);
S1(5:54,5:54)=1; %����S1
S2 = 1 - S1;

result = bwhitmiss(A,S1,S2);


figure();
subplot(1,2,1);
imshow(A);
title('ԭʼͼ��');
subplot(1,2,2);
imshow(result);
title('���л����б任��');