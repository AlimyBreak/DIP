%��̬ѧ����,��ʴ����


close all;
clear;
clc;

img_rgb = imread('twocoins.jpg');
img_gray = rgb2gray(img_rgb);
%imhist(img_gray); �鿴�Ҷ�ֱ��ͼ,�˹�ȷ�϶�ֵ������ֵ
img_pn = im2bw(img_gray,83/255); %��ֵ��
%imshow(img_pn)
SE1 = strel('disk',4); %Բ�νṹԪ��,�뾶Ϊ2
SE2 = strel('square',4); %�����νṹԪ��,size = 4*4
SE3 = strel('rectangle',[3,5]); %���νṹԪ��,size = 3*5
SE4 = strel('line',10,45);%���ԽṹԪ��,����Ϊ10,�Ƕ�Ϊ45��
SE5 = strel('pair',[3,5]); %����������ĽṹԪ��,x�����ƫ����3,y�����ƫ��Ϊ5
SE6 = strel('diamond',3);%���νṹԪ��,���ε����������ߵĳ��ȶ���2*3+1=7
SE7 = strel('octagon',3);%�˽��εĽṹԪ��,3�Ǹ�λ�ñ�����3�ı���
img_eroded1 = imerode(img_pn,SE1);
img_eroded2 = imerode(img_pn,SE2);
img_eroded3 = imerode(img_pn,SE3);
img_eroded4 = imerode(img_pn,SE4);
img_eroded5 = imerode(img_pn,SE5);
img_eroded6 = imerode(img_pn,SE6);
img_eroded7 = imerode(img_pn,SE7);

figure();
subplot(4,2,1);
imshow(img_pn);
title('ԭͼ');

subplot(4,2,2);
imshow(img_eroded1);
title('Բ�νṹԪ�ظ�ʴ��');

subplot(4,2,3);
imshow(img_eroded2);
title('�����νṹԪ�ظ�ʴ��');

subplot(4,2,4);
imshow(img_eroded3);
title('���ԽṹԪ�ظ�ʴ��');

subplot(4,2,5);
imshow(img_eroded4);
title('����ṹԪ�ظ�ʴ��');

subplot(4,2,6);
imshow(img_eroded5);
title('���νṹԪ�ظ�ʴ��');

subplot(4,2,7);
imshow(img_eroded6);
title('���νṹԪ�ظ�ʴ��');

subplot(4,2,8);
imshow(img_eroded7);
title('�˽��νṹԪ�ظ�ʴ��');