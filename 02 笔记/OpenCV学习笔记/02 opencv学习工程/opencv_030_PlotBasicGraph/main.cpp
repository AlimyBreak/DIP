#include<iostream>
#include<opencv2/core.hpp>
#include<opencv2/opencv.hpp>


using namespace cv;
using namespace std;

//int event, int x, int y, int flags, void* userdata
Mat mat = Mat(1000, 1000, CV_8SC1);

void draw_circle(int event, int x, int y, int flags, void* userdata)
{
    static int i = 0;
    if(event == EVENT_LBUTTONDBLCLK)
    {
        if (i++ % 2 == 0)
        {
            circle(mat, Point(x, y), 20, Scalar(0));
        }
        else
        {
            circle(mat, Point(x, y), 40, Scalar(0));
        }
    }
}


int main(void)
{
    mat = 255;
    line(mat, Point(500, 0), Point(500, 1000), 5);
    line(mat, Point(0, 500), Point(1000, 500), 5);
    rectangle(mat, Rect(250, 250, 500, 500), Scalar(0));
    //RotatedRect(const Point2f& center, const Size2f& size, float angle);
    ellipse(mat, RotatedRect(Point2f(250,250), Size2f(40, 80), 3.14f), Scalar(0));
    circle(mat, Point(500, 500), 50, Scalar(0));
    putText(mat,"Hello World",Point(250,500), FONT_ITALIC,2,Scalar(0));
    
    Point points[2][4];
    points[0][0] = Point(100, 115);
    points[0][1] = Point(255, 135);
    points[0][2] = Point(140, 365);
    points[0][3] = Point(100, 300);
    points[1][0] = Point(300, 315);
    points[1][1] = Point(555, 335);
    points[1][2] = Point(340, 565);
    points[1][3] = Point(300, 500);
    const Point* pts[] = { points[0],points[1] };
    int npts[] = { 4,4 };
    polylines(mat, pts, npts,2,true, Scalar(0));
    
    namedWindow("test");
    setMouseCallback("test", draw_circle);
    int start = getTickCount();
    int i = 10;
    while (i--)
    {
        imshow("test", mat);
        waitKey(1);
        //cvWaitKey();
    }
    int end = getTickCount();

    cout << ((end  - start) / getTickFrequency())<< endl;
    //add()
    
    waitKey(0);
    return 0;
}