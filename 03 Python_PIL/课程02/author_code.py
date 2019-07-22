
from PIL import Image


img = Image.open('fg.jpg');
new = Image.new('L',img.size,255);
width,height = img.size;