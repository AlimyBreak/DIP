% https://blog.csdn.net/zzx2016zzx/article/details/82725712
% ����������ͷ�ĵط�����Ч��.


close all;
clear ;
clc;



vid = videoinput('winvideo', 1, 'YUY2_640x480');
set(vid,'ReturnedColorSpace','rgb');
vidRes=get(vid,'VideoResolution');
width=vidRes(1);
height=vidRes(2);
nBands=get(vid,'NumberOfBands');
figure('Name', 'Matlab��������ͷ', 'NumberTitle', 'Off', 'ToolBar', 'None', 'MenuBar', 'None');
hImage=image(zeros(vidRes(2),vidRes(1),nBands));
preview(vid,hImage);
