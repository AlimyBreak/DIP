% ���л����б仯
% ��ͨMatlab����ͼ������ʶ�� Page233

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
%imshow(S1); %����ɫ���������İ�ɫ������,�����α��Ϊ50.

% ���л����б任 
U1 = imerode(A,S1); % ��S1����ʴA
Ac = 1 - A; % �õ�Ac
S2 = 1 - S1;
U2 = imerode(Ac,S2);
result = U1 & U2;

figure();
subplot(2,2,1);
imshow(A);
title('ԭʼͼ��');
subplot(2,2,2);
imshow(U1)
title('U1');
subplot(2,2,3);
imshow(U2)
title('U2');
subplot(2,2,4);
imshow(result);
title('U1 & U2');

