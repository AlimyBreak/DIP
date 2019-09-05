#include<iostream>
#include<opencv2/core.hpp>
#include<opencv2/opencv.hpp>
using namespace cv;
using namespace std;
int main()
{
	Mat grayim1(600, 800, CV_8UC1);
	Mat grayim2(600, 800, CV_8UC1);

	grayim1 = 40;
	grayim2 = 50;

	Mat grayim3 = grayim1 + grayim2 + 1;
	Mat grayim4 = grayim1 * 2 + 1;
	Mat grayim5 = grayim4.diag(0) + grayim4.col(1);

	cout << (int)((grayim3.ptr<uchar>(0))[0]) << endl;
	cout << (int)((grayim4.ptr<uchar>(0))[0]) << endl;
	cout << (int)((grayim5.ptr<uchar>(0))[0]) << endl;

	return 0;
}