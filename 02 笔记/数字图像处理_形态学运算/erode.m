%形态学处理,腐蚀操作


close all;
clear;
clc;

img_rgb = imread('twocoins.jpg');
img_gray = rgb2gray(img_rgb);
%imhist(img_gray); 查看灰度直方图,人工确认二值化的阈值
img_pn = im2bw(img_gray,83/255); %二值化
%imshow(img_pn)
SE1 = strel('disk',4); %圆形结构元素,半径为2
SE2 = strel('square',4); %正方形结构元素,size = 4*4
SE3 = strel('rectangle',[3,5]); %矩形结构元素,size = 3*5
SE4 = strel('line',10,45);%线性结构元素,长度为10,角度为45度
SE5 = strel('pair',[3,5]); %包含两个点的结构元素,x方向的偏移是3,y方向的偏移为5
SE6 = strel('diamond',3);%菱形结构元素,菱形的两条中心线的长度都是2*3+1=7
SE7 = strel('octagon',3);%八角形的结构元素,3那个位置必须是3的倍数
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
title('原图');

subplot(4,2,2);
imshow(img_eroded1);
title('圆形结构元素腐蚀后');

subplot(4,2,3);
imshow(img_eroded2);
title('正方形结构元素腐蚀后');

subplot(4,2,4);
imshow(img_eroded3);
title('线性结构元素腐蚀后');

subplot(4,2,5);
imshow(img_eroded4);
title('两点结构元素腐蚀后');

subplot(4,2,6);
imshow(img_eroded5);
title('菱形结构元素腐蚀后');

subplot(4,2,7);
imshow(img_eroded6);
title('矩形结构元素腐蚀后');

subplot(4,2,8);
imshow(img_eroded7);
title('八角形结构元素腐蚀后');