

# <center>win64\_vs2019\_opencv4.1.1环境部署笔记</center>

***

| 文件版本 | 修改内容 | 作者 |    日期    | 备注 |
| :------: | :------: | :--: | :--------: | :--: |
|   V0.1   |    -     | YQW  | 2019.09.02 |  -   |



***

Ref:

  1.  [数字图像处理 opencv的安装及vs2017环境的配置](https://blog.csdn.net/C2681595858/article/details/82824853)

  2.  [visual studio 下载地址](https://visualstudio.microsoft.com/)

    3.  [opencv 下载地址](https://opencv.org/releases/)

配套软件版本:

1. opencv-4.1.1-vc14_vc15.exe
2. visual studio 2019(vs_community__570987256.1565750156.exe)



***

## 1.  材料准备

+ 装有win64操作系统的电脑一台；
+ 下载并安装VS2019；
+ 下载opencv的安装包,我这里下载到的是 opencv-4.1.1-vc14_vc15.exe 版本；



## 2.  安装opencv

+ 解压opencv-4.1.1-vc14_vc15.exe生成$opencv$文件夹，将这个文件夹改名$opencv411$,并将这个文件夹放在$D$盘文件夹下
+ 将__D:\\opencv411\\build\\x64\\vc15\\bin__加入到操作系统的环境变量中的系统路径中去.





## 3.  配置Visual Stduio 

+ 打开Visual Studio ,新建一个空项目,在此新项目中新建$main.cpp$文件;
+ 选中解决方案右键单击打开__属性__按钮
  + 将平台调整为__x64__,配置为__Debug__不变,点击应用按钮;
  + 在__VC++目录__的__包含目录__下新增
    + __D:\\opencv411\\build\\include__
    + __D:\\opencv411\\build\\include\\opencv2__
  + 在__VC++目录__的_库目录__下新增
    + __D:\\opencv411\\build\\x64\\vc15\\lib__
  + 在__链接器__的__输入__的__附加依赖项__下增加
    + __D:\\opencv411\\build\\x64\\vc15\\lib\\opencv\_world411d.lib__





## 4.  工程验证

+  注意把生成工程的配置修改为__x64__和__Debug__;
+  准备一张猫片(cat.jpg)
+  在$main.cpp$中输入
```C++
#include<iostream>
#include<opencv2/core.hpp>
#include<opencv2/opencv.hpp>
using namespace cv;
int main()
{
	Mat img = imread("C:\\Users\\Administrator\\Desktop\\cat.jpg");  //读一张图片
	namedWindow("原画");  //创建一个“原画”窗口
	imshow("原画", img);   //在窗口中显示图片
	waitKey(6000);  //等待6000ms关闭窗口
	return 0;
}
```

+  编译允许无错误,桌面会弹出窗口显示准备好的图片.

   ![cat_show](01_win64_vs2019_opencv.assets/cat_show.jpg)
