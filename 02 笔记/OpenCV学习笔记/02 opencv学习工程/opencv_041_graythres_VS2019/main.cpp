#include<iostream>
#include<opencv2/core.hpp>
#include<opencv2/opencv.hpp>


using namespace cv;
using namespace std;


int main(void)
{
    Mat im          = imread("./lena.bmp")  ;
    Mat gray;
    Mat om;


    /*转换成灰度图片*/
    cvtColor(im, gray, COLOR_BGR2GRAY);

    /*进行灰度变换并返回门限值*/
    double temp = threshold(gray, om, 0, 255, THRESH_OTSU);

    cout << "threshold = " << temp << endl;

    imshow("im", im);
    imshow("om", om);
    
    waitKey(0)  ;
    return 0    ;
}

