#include<iostream>
#include<opencv2/core.hpp>
#include<opencv2/opencv.hpp>
using namespace cv;
int main()
{
	Mat img = imread("C:\\Users\\Administrator\\Desktop\\cat.jpg");  //��һ��ͼƬ
	namedWindow("ԭ��");  //����һ����ԭ��������
	imshow("ԭ��", img);   //�ڴ�������ʾͼƬ
	waitKey(20000);  //�ȴ�6000ms�رմ���
	return 0;
}