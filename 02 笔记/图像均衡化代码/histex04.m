% �Ҷȶ����任
% ��һ�ֻҶȵķ����Ա任,�ڸ���ҶƵ����Ӧ��.
% $t = c\log{(1+s)}$
% s: Դ�Ҷ�ֵ
% c: ����ϵ��
% t: �任���Ŀ��Ҷ�ֵ
% s��Сʱ,����б�ʺܴ�;s�ϴ�ʱ,����б�ʺ�С

% ͨ���۲�Ƶ��(������)��֪:
% ���������Ҷȴ����ͼ��,��ͻҶ�����ԱȶȻ�����,����ϸ�ڽ�����ǿ.


close all;
clear;
clc;

I = imread("lena.bmp");
[M,N] = size(I);

I_d = double(I);

%����ͼ��
c = 30;
t1 = c*log(1+I_d);

figure(1);
subplot(1,2,1);
imshow(I);
title('ԭʼͼ��');
subplot(1,2,2);
imshow(uint8(t1));
title('c = 30 ʱ�Ķ����任ͼ��');

%����Ƶ��
F = fft2(im2double(I));
F = fftshift(F);
F = abs(F);
T = log(F+1); 
figure(2);
subplot(1,2,1);
imshow(F,[]);%�Զ���һ��
title('ԭͼ��Ƶ��');
subplot(1,2,2);
imshow(T,[]); %�Զ���һ��
title('�����任���Ƶ��');



