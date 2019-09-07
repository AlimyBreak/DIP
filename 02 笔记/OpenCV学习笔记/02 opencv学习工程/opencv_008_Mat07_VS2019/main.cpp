#include	<iostream>
#include	<opencv2/core.hpp>
#include	<opencv2/opencv.hpp>
//#include	<opencv2/imgproc/imgproc_c.h> IplImage
using namespace cv;
using namespace std;
int main()
{
	//cout << Scalar::all(10) << endl;
	Mat mat1(100, 100, CV_8UC1, Scalar(0));
	Mat mat2(100, 100, CV_8UC1, Scalar(255));
	Mat mat3(100, 100, CV_8UC3, Scalar(0,0,255));
	Mat mat4(100, 100, CV_8UC3, Scalar(0, 255, 0));
	Mat mat5(100, 100, CV_8UC3, Scalar(255, 0, 0));

	imshow("mat1",mat1);
	imshow("mat2",mat2);
	imshow("mat3", mat3);
	imshow("mat4", mat4);
	imshow("mat5", mat5);
	waitKey(0);

	return 0;
}

