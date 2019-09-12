% �Ҷ����Ա任
% $D_B = f(D_A) = f_A*D_A + f_B$
% f_A ������1,��ԱȶȽ�����
% f_A ��С��1,��ԱȶȽ���С

close all;
clear;
clc;

I = imread("lena.bmp");
[M,N] = size(I);


% ���ӶԱȶ�
Fa = 2;
Fb = -55*255;
O1  = Fa .* double(I) + Fb/255;

% ��С�Աȶ�
Fa = 0.5;
Fb = -55*255;
O2 = Fa .* double(I) + Fb/255;

% ���Ե���
Fa = 1;
Fb = 255*5;
O3 = Fa .* double(I) + Fb/255;

% ������ʾ
Fa = -1;
Fb = 255*255;
O4 = Fa .* double(I) + Fb/255;



figure(1);
subplot(2,3,1);
imshow(I);
title('ԭʼͼ��');
subplot(2,3,2)
imshow(uint8(O1));
title('Fa = 2 Fb = -55 ���ӶԱȶ�');
subplot(2,3,3)
imshow(uint8(O2));
title('Fa = 0.5 Fb = -55 ��С�Աȶ�');
subplot(2,3,4)
imshow(uint8(O3));
title('Fa = 1 Fb = 255*5 ���Ե���');
subplot(2,3,5)
imshow(uint8(O4));
title('Fa = -1 Fb = 255*255 ������ʾ');


figure(2)
[H1,x1] = imhist(I,64);
[H2,x2] = imhist(uint8(O1),64);
[H3,x3] = imhist(uint8(O2),64);
[H4,x4] = imhist(uint8(O3),64);
[H5,x5] = imhist(uint8(O4),64);
stem(x1,H1);
hold on;
stem(x2,H2);
stem(x3,H3);
stem(x4,H4);
stem(x5,H5);
legend({'ԭʼͼ��','Fa = 2 Fb = -55 ���ӶԱȶ�','Fa = 0.5 Fb = -55 ��С�Աȶ�','Fa = 1 Fb = 255*5 ���Ե���','Fa = -1 Fb = 255*255 ������ʾ'});