#include<iostream>
#include<opencv2/core.hpp>
#include<opencv2/opencv.hpp>
using namespace cv;
using namespace std;
int main()
{
	Mat grayim(600, 800, CV_8UC1);
	Mat colorim(600, 800, CV_8UC3);
	int i = 0;
	int j = 0;

	for (i = 0; i < grayim.rows; i++)
	{
		for (j = 0; j < grayim.cols; j++)
		{
			grayim.at<uchar>(i, j) = (i + j) %255;
		}
	}

	for (i = 0; i < colorim.rows; i++)
	{
		for (j = 0; j < colorim.cols; j++)
		{
			Vec3b pixel;
			pixel[0] = i % 255;
			pixel[1] = j % 255;
			pixel[2] = (i + j) % 255;

			colorim.at<Vec3b>(i, j) = pixel;
		}
	}


	imshow("test1",grayim);
	imshow("test2", colorim);

	/*
	Mat img = imread("C:\\Users\\Administrator\\Desktop\\cat.jpg");  //读一张图片
	namedWindow("原画");  //创建一个“原画”窗口
	imshow("原画", img);   //在窗口中显示图片
	*/
	waitKey(20000);  //等待6000ms关闭窗口
	return 0;
}