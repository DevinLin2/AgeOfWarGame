import java.util.*;

class melee {
  float x, y, w, h, range, xVel;
  PImage img;
  boolean isAttacking;
  String party, imgName;
  
  melee(float xPos, float yPos, float wid, float hei, float r, String p, String name) {
    x = xPos;
    y = yPos;
    w = wid;
    h = hei;
    range = r;
    party = p;
    imgName = name;
    img = loadImage(imgName);
    xVel = 5;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  void move() {
    if (party.equals("player")) {
      x += xVel;
    } else {
      x -= 1;
    }
  }
  
  void display() {
    if (party.equals("player")) {
      pushMatrix();
      scale(-1.0, 1.0);
      image(img, -x, y, w, h);
      popMatrix();
    } else {
      image(img, x, y, w, h);
    }
  }
}
