%  ٤��任(ָ���任���ݴα任)
%  y = {(x+esp)}^{\gamma}
%  $\gamma$Ϊ٤��ϵ��, esp Ϊ����ϵ�� , x �� y �ķ�Χ����[0,1];

% $\gamma > 1$ʱ,ͼ��ĸ߻Ҷ�����Աȶ���ǿ
% $\gamma < 1$ʱ,ͼ��ĵͻҶ�����Աȶ���ǿ
% $\gamma < 1, esp = 0$ʱ,ͼ�񲻱�


close all;
clear;
clc;

I = imread("lena.bmp");
[M,N] = size(I);
I_d = double(I) / 255;

%����ͼ��
gamma  = 2       ;
esp    = 0       ;
y1     = (I_d+esp).^(gamma);
y1     = y1*255;

gamma  = 0.5;
esp    = 0 ;
y2     = (I_d+esp).^(gamma);
y2     = y2*255;

gamma  = 1;
esp    = 0 ;
y3     = (I_d+esp).^(gamma);
y3     = y3*255;

figure(1);
subplot(2,2,1);
imshow(I);
title('ԭʼͼ��');
subplot(2,2,2);
imshow(uint8(y1));
title('\gamma = 2,ͼ��ĸ߻Ҷ�����Աȶȵõ���ǿ');
subplot(2,2,3);
imshow(uint8(y2));
title('\gamma = 0.5,ͼ��ĵͻҶ�����Աȶȵõ���ǿ');

subplot(2,2,4);
imshow(uint8(y3));
title('\gamma = 1,����');


figure(2);
J1 = imadjust(I,[],[],2);
J2 = imadjust(I,[],[],0.5);
J3 = imadjust(I,[],[],1);
subplot(2,2,1);
imshow(I);
title('ԭʼͼ��');
subplot(2,2,2);
imshow(J1);
title('\gamma = 2');
subplot(2,2,3);
imshow(J2);
title('\gamma = 0.5');
subplot(2,2,4);
imshow(J3);
title('\gamma = 1');




