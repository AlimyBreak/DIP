#include<iostream>
#include<opencv2/core.hpp>
#include<opencv2/opencv.hpp>


using namespace cv;
using namespace std;


int main(void)
{
    Mat im          = imread("./lena.jpg")  ;
    Mat rgb_arr[3]                          ;

    /* 分解成3个通道*/
    split       (   im                       ,  rgb_arr     )   ; 
    imshow      (   "0-lena.jpg-original"    ,  im          )   ;
    imshow      (   "1-rgb_arr[0]=Red"       ,  rgb_arr[0]  )   ;
    imshow      (   "2-rgb_arr[1]=Green"     ,  rgb_arr[1]  )   ;
    imshow      (   "3-rgb_arr[2]=Blue"      ,  rgb_arr[2]  )   ;
    
    equalizeHist(   rgb_arr[0]  ,   rgb_arr[0]  );
    equalizeHist(   rgb_arr[1]  ,   rgb_arr[1]  );
    equalizeHist(   rgb_arr[2]  ,   rgb_arr[2]  );
    
    /*三通道合并*/
    merge       (   rgb_arr                 , 3, im )   ;
    imshow      (   "4-lena.jpg-equalized"  ,    im )   ;
    
    waitKey(0)  ;
    return 0    ;
}

