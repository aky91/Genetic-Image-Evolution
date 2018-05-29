PImage img;
PImage img2;
void setup(){
  size(400,300);
  img = loadImage( "fruit.jpg");
  img2 = createImage(200, 150, RGB);
}

void draw(){
   
  
  
  loadPixels();
  
  for (int x = 0; x < img2.width; x++ ) {
    for (int y = 0; y < img2.height; y++ ) {
      int loc = x + y * img2.width;
      img2.pixels[loc] = (int)color(brightness(img.pixels[loc]));
    }
  }
  updatePixels();
  
  image(img2,0,0);
}
