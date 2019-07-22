

import os
from PIL import Image
from PIL import ImageFilter

if __name__ == "__main__":
    filelist = os.listdir();
    if os.path.exists('output')==False:
        os.mkdir('output');

    filelist_dir =  os.listdir('output');
    for each in filelist_dir:
        os.remove('.\\output\\'+each);
        print('remoing ','.\\output\\'+each);
            
    
    
    
    imagename1 = filelist[0];
    imagename2 = filelist[1];
    #imagename5 = filelist[4];
    image1_obj = Image.open(imagename1);
    image2_obj = Image.open(imagename2);
    #image5_obj = Image.open(imagename5);
    #image1_obj.show();
    #print(image1_obj.format,image1_obj.size,image1_obj.mode);
    #print(image2_obj.format,image2_obj.size,image2_obj.mode);
    
    image1_obj_filtered = image1_obj.filter(ImageFilter.CONTOUR);
    #image1_obj_filtered.show();
    image1_obj_filtered.save(r'.\output\image1_obj_filtered.bmp');
    
    image2_obj_filtered = image2_obj.filter(ImageFilter.CONTOUR);
    #image2_obj_filtered.show();
    image2_obj_filtered.save(r'.\output\image2_obj_filtered.bmp');
    
    #image5_obj_filtered = image5_obj.filter(ImageFilter.CONTOUR);
    #image5_obj_filtered.show();
    #image5_obj_filtered.save('plmm_filtered.bmp');
    
    image_blend = Image.blend(image1_obj,image2_obj,0.5);
    image_blend.save(r'.\output\image_blend.bmp');
    #image_blend.show();
    #print(image5_obj.size);
    #image5_obj_resize = image5_obj.resize((1024,1024),Image.ANTIALIAS);
    #print(image5_obj_resize.size);
    #image5_obj.show();
    #image5_obj_resize.show();
    
    r,g,b = image1_obj.split();
    
    new_image1 = Image.composite(image1_obj,image2_obj,g);
    #new_image1.show();
    new_image1.save(r'.\output\image_composite.bmp');
    
    
    
    