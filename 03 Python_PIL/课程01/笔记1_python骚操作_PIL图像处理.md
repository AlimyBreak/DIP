***

Ref:

https://www.bilibili.com/video/av41723319?from=search&seid=14524126148259593141

***



知识点:

+ 获取文件夹下的文件列表,返回值是个列表 。

```python
import os

filelist = os.listdir();
print(filelist(0))

```

+ 图片文件的打开和显示，打印图片对象信息

```python
from PIL import Image

imagename1 = '1.jpg'；
image_obj = Image.open(imagename1);
Image.show(image_obj);
```

+ 对图片进行手绘效果转换(滤波器处理,等高线处理,检测边沿)

```python
from PIL import ImageFilter

imageFiltered = image_obj.filter(ImageFilter.CONTOUR);
```

+ 图片文件保存
```python
imageFiltered.save('imageFiltered.bmp')
```

+ 同尺寸同模式图片合并1,融合公式为$out = image1 * (1.0 - alpha) + image2 * alpha $
```python
alpha = 0.5; #透明度 取0,全是image1_obj,取1,全是image2_obj
Image.Blend(image1_obj,image2_obj,alpha);
```

+ 同尺寸同模式图片合并2
```python
r,g,b = image1_obj.split();#从原始图像中分离三个分量，这三个通道还是图像对象
newImage = Image.composite(image1_obj,image2_obj,r);
```


+ 图片尺寸缩放
```python
image1_obj_new = image1_obj.resize((1024,1024),Image.ANTIALIAS);
#(1024,1024) 目标尺寸
#Image.ANTIALIAS,抗锯齿,反走样
```







