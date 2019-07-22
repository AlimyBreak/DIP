***

Ref:

https://www.bilibili.com/video/av33764802?from=search&seid=14524126148259593141

Python开发利用图像处理程序模拟人类绘画功能(素描写生)

1. 导入相关库
2. 分析PIL图像处理模块，分析RGB三原色通道组成
3. 实现效果

***



## 一.  导入相关模块

+ 图像处理模块(PIL/pillow)的导入

```python
from PIL import Image
```
​	支持的文件格式: jpg,png,gif,bmp...

+ 打开文件，获取 __图像模式__ ，获取 __图像大小__ (单位是像素:pixel),获取像素点的值

```python
image_obj = Image.open(filename);
mode_ori = image_obj.mode;
size_ori = image_obj.size;
pixel_00 = image_obj.getpixel((0,0));
```

图像模式有9种

| 模式代号 |               模式含义                |
| :------: | :-----------------------------------: |
|    1     |    1位像素，黑和白，存位8位的像素     |
|    L     |          8位像素，黑色和白色          |
|    P     | 8位像素，使用调色板映射到其他任何模式 |
|   RGB    |      3\*8位像素， 真彩(真实彩色)      |
|   RGBA   |       4\*8位像素，真彩+透明通道       |
|   CMYK   |         4\*8位像素，颜色隔离          |
|  YCbCr   |       3\*8位像素，彩色视频格式        |
|    I     |             32位整型像素              |
|    F     |            32位浮点型像素             |

+ new 一个新的图像

```python
mode = 'L'; # 8位灰度图
size = image_obj.size; # 尺寸
color = 255; # 颜色(纯白)
image_new = Image.new(mode,size,color); #新建一个8位灰度图,尺寸为image_obj.size,初始颜色位纯白.
```


## 二.图片的组成
+ RGB三原色的叠加组成图片.

+ 数字图像的本质就是一个多维矩阵,一般是3维矩阵.

+ 在RGB模式下,一张图片的像素数据所占的空间大小为: height\* width \* 3(Bytes)

+ 在L模式下,$0\to 255$来区分不同亮度,值越大,颜色越亮.

+ 图像的深度:指存储每个像素所用的位数.在RGB模式下,图像的深度是24.

+ 彩色图转灰度图
```python
img_gray_obj = img_rgb_obj.convert('L');
img_gray_obj.show();
```

+ 画图需要什么? 画笔(Pen_Size),扩散器(处理边缘 Color_diff)

  



