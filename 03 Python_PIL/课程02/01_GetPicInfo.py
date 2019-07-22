

from PIL import Image

if __name__ == "__main__":
    
    pic_file_name = 'lzl01.jpg';
    
    #打开图片文件
    image_obj = Image.open(pic_file_name);
    #获取图片模式、尺寸和像素点信息
    image_mode = image_obj.mode;
    image_size = image_obj.size;
    pixel_00   = image_obj.getpixel((55,110));
    
    #pixel_00 = (100,200,150);
    #image_obj.putpixel((55,110),pixel_00);
    #pixel_00   = image_obj.getpixel((55,110));
    
    
    print(image_mode,image_size,pixel_00);

    #image_new.show();
    
    #彩色图转灰度图
    image_gray_obj = image_obj.convert('L');
    #image_gray_obj.show();
    

    
    #for i in range(pen_size+1,width-pen_size-1): #横向遍历
    #    for j in range(pen_size+1,height-pen_size+1): #纵向遍历
    #        original_color = 255;
    
    
    #这里之后没看懂在干啥
    #画图,首先获取图像的size,高度和宽度
    image_obj = image_obj.convert('L');
    width,height = image_obj.size;
    pen_size = 3;   #画笔
    color_diff = 6; #扩散器
    # new 一个新的，转换模式
    image_new = Image.new('L',image_size,0);
    for i in range(pen_size+1,width-pen_size-1):
        for j in range(pen_size+1,height-pen_size-1):
            originalcolor = 255;
            lcolor = sum([image_obj.getpixel((i,j+r)) for r in range(pen_size)]);
            rcolor = sum([image_obj.getpixel((i,j-r)) for r in range(pen_size)]);
            if abs(lcolor - rcolor)>color_diff:
                originalcolor -= (255-image_obj.getpixel((i,j))) // 4;
                image_new.putpixel((i,j),originalcolor);
            
            qcolor = sum([image_obj.getpixel((i+r,j)) for r in range(pen_size)]);
            wcolor = sum([image_obj.getpixel((i-r,j)) for r in range(pen_size)]);
            if abs(qcolor - wcolor)>color_diff:
                originalcolor -= (255-image_obj.getpixel((i,j))) // 4;
                image_new.putpixel((i,j),originalcolor);
            
            qcolor = sum([image_obj.getpixel((i+r,j-r)) for r in range(pen_size)]);
            wcolor = sum([image_obj.getpixel((i-r,j+r)) for r in range(pen_size)]);
            if abs(qcolor - wcolor)>color_diff:
                originalcolor -= (255-image_obj.getpixel((i,j))) // 4;
                image_new.putpixel((i,j),originalcolor);   
                
            qcolor = sum([image_obj.getpixel((i+r,j-r)) for r in range(pen_size)]);
            wcolor = sum([image_obj.getpixel((i-r,j+r)) for r in range(pen_size)]);
            if abs(qcolor - wcolor)>color_diff:
                originalcolor -= (255-image_obj.getpixel((i,j))) // 4;
                image_new.putpixel((i,j),originalcolor);   
            
            

    image_new.show();  
    
            
