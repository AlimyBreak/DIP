

close all;
clear;
clc;


% 生成固定的种子
rng('default');
R = zeros(80,80,'uint8');
R(1:40,1:40) = randi([192,256],40) - 1;
R(1:40,41:80) = randi([128,256],40) -1;
R(41:80,1:40) = randi([64,256],40) -1;
R(41:80,41:80) = randi(256,40) -1;
%imshow(mat2gray(R))
%imhist(R)
%hist(R)

p_r = zeros(1,256);
s_k = zeros(1,256);
for i = 1:256
    p_r(i) = length(find(R==(i-1))) /(80*80);
    s_k(i) = length(find(R<=(i-1))) /(80*80);
end

R1 = zeros(80,80,'uint8');
for i = 1:80
    for j = 1:80
        R1(i,j) = round(255*s_k(R(i,j)+1));
    end
end

%J = histeq(I,n) 指定直方图均衡后的灰度级数n，默认值为64。 
R2 = histeq(R,256);

sumsqr(R1-R2)

figure();
subplot(3,1,1);
imhist(R);
xlim([0,256])
subplot(3,1,2);
imhist(R1);
xlim([0,256]);
subplot(3,1,3);
imhist(R2);
xlim([0,256]);

figure()
subplot(3,1,1);
imshow(R);
subplot(3,1,2);
imshow(R1);
subplot(3,1,3);
imshow(R2);



