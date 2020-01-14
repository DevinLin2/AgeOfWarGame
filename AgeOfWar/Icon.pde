import java.util.*;

class icon {
  
  float x, y, w, h;
  PImage img;
  String imgName;
  int index;
  
  icon(float xPos, float yPos, float wid, float hei, String name, int i) {
    x = xPos;
    y = yPos;
    w = wid;
    h = hei;
    imgName = name;
    img = loadImage(imgName);
    index = i;
  }
  
  void display() {
    stroke(2);
    fill(41, 29, 154);
    rect(x, y, w, h);
    image(img, x, y, w, h);
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
}
