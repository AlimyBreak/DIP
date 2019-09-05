#include<iostream>
#include<opencv2/core.hpp>
#include<opencv2/opencv.hpp>
using namespace cv;
using namespace std;
int main()
{
	//Mat_

	Mat M(600, 800, CV_8UC1);
	for (int i = 0; i < M.rows; i++)
	{
		uchar* p = M.ptr<uchar>(i);
		for (int j = 0; j < M.cols; j++)
		{
			double d1 = (double)((i+j)%255);
			M.at<uchar>(i, j) = (uchar)(d1);
			//ÏÂÐÐÓÐ´í
			//double d2 = M.at<double>(i,j);
		}
	}


	Mat_<uchar> M1 = (Mat_<uchar>&)M;
	Mat_<uchar> M2 = (Mat_<uchar>)M;
	for (int i = 0; i < M1.rows; i++)
	{
		uchar* p = M1.ptr(i);
		for (int j = 0; j < M1.cols; j++)
		{
			double d1 = (double)((i+j)%255);
			M1(i, j) = (uchar)(d1);
			double d2 = M1(i, j);
		}
	}

	cout << (unsigned long)(M.ptr<uchar>(1)) << endl;
	cout << (unsigned long)(M1.ptr<uchar>(1)) << endl;
	cout << (unsigned long)(M2.ptr<uchar>(1)) << endl;

	imshow("M", M);
	imshow("M1",M1);
	imshow("M2", M2);

	waitKey(0);




	return 0;
}