#include<iostream>
#include<opencv2/core.hpp>
#include<opencv2/opencv.hpp>
using namespace cv;
using namespace std;
int main()
{
	//格式输出
	Mat R = Mat(3, 2, CV_8UC3);

	randu(R,0,255);

	cout << "R(default) = " << endl << R << endl << endl;
	
	cout << "R(matlab) = " << endl << format(R, Formatter::FMT_MATLAB) << endl << endl;
	cout << "R(CSV)    = " << endl << format(R, Formatter::FMT_CSV) << endl << endl;
	cout << "R(python) = " << endl << format(R, Formatter::FMT_PYTHON) << endl << endl;
	cout << "R(numpy) = " << endl << format(R, Formatter::FMT_NUMPY) << endl << endl;
	cout << "R(c) = " << endl << format(R, Formatter::FMT_C) << endl << endl;

	// << 输出
	Point2f P(5, 1);

	cout << "Point(2D) = " << P << endl << endl;

	Point3f P3f(2, 6, 7);

	cout << "Point(3D) = " << P3f << endl << endl;




	waitKey(0);


	return 0;
}