#include<iostream>
#include<opencv2/core.hpp>
#include<opencv2/opencv.hpp>
using namespace cv;
using namespace std;
int main()
{
	Mat grayim1(600, 800, CV_8UC1);
	int i = 0;

	// 提取矩阵的一行或者一列
	grayim1 = 0;
	grayim1.row(300) = 128;
	grayim1.col(400) = 255;
	grayim1.row(300) = grayim1.row(300) * 3 / 2;

	//imshow("grayim1", grayim1);
	//waitKey(0);  


	// 用range 选择多行或多列
	Mat grayim2 = grayim1(Range::all(), Range(0,600));

	

	cout << "grayim2.rows  = "<< grayim2.rows << endl;
	cout << "grayim2.cols = " << grayim2.cols << endl;

	//imshow("grayim2", grayim2);
	//waitKey(0);

	// 提取感兴趣区域 - 构造函数
	Mat img(Size(1800,1240),CV_8UC1);
	Mat roi1(img, Rect(50,50,500,500));
	//imshow("img",img);
	//imshow("roi1", roi1);

	// 提取感兴趣趋区域 - Range对象
	Mat roi2 = img(Range(50,500),Range(50,500));
	//imshow("roi2", roi2);

	//  提取感兴趣趋区域 - Range 构造
	Mat roi3 = Mat(img,Range(50,500),Range(50,500));
	//imshow("roi3", roi3);
	
	
	// 取对角线元素
	Mat  diag1 = img.diag(0);
	cout << "diag1.rows = "<< diag1.rows << endl;
	cout << "diag1.cols = " << diag1.cols << endl;
	
	waitKey(0);




	return 0;
}