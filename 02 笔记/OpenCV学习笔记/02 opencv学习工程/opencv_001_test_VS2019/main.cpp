#include<iostream>
#include<opencv2/core.hpp>
#include<opencv2/opencv.hpp>
using namespace cv;
int main()
{
	Mat img = imread("C:\\Users\\Administrator\\Desktop\\cat.jpg");  //读一张图片
	namedWindow("原画");  //创建一个“原画”窗口
	imshow("原画", img);   //在窗口中显示图片
	waitKey(20000);  //等待6000ms关闭窗口
	return 0;
}