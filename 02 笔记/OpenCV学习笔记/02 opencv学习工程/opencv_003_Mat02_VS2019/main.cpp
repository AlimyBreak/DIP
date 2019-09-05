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


	/*通过迭代器访问*/
	MatIterator_<uchar> grayit, grayend;
	for (grayit = grayim.begin<uchar>(), grayend=grayim.end<uchar>(); grayit!= grayend; grayit++)
	{
		*grayit = rand() % 255;
	}

	MatIterator_<Vec3b> colorit, colorend;
	for (colorit = colorim.begin<Vec3b>(), colorend = colorim.end<Vec3b>(); colorit != colorend; colorit++)
	{
		(*colorit)[0] = rand() % 255;
		(*colorit)[1] = rand() % 255;
		(*colorit)[2] = rand() % 255;
	}

	imshow("gray1", grayim);
	imshow("color1", colorim);

	waitKey(0);

	/*通过数据指针*/
	for (i = 0; i < grayim.rows; i++)
	{
		uchar* p = grayim.ptr<uchar>(i);
		for (j = 0; j < grayim.cols; j++)
		{
			p[j] = (i + j) % 255;
		}
	}

	for (i = 0; i < colorim.rows; i++)
	{
		Vec3b* p = colorim.ptr<Vec3b>(i);
		for (j=0;j<colorim.cols;j++)
		{
			p[j][0] = i % 255	;	// Blue
			p[j][1] = j % 255	;	// Green
			p[j][2] = 0			;	// Read
		}
	}

	imshow("gray2", grayim);
	imshow("color2", colorim);

	waitKey(0);  //等待6000ms关闭窗口
	return 0;
}