import java.util.*;

class base {

  float x, y, w, h, healthTotal, currentHealth;
  PImage img;
  String party, imgName; // this string is used to differentiate between player and enemy bases

  base(float xPos, float yPos, float wid, float hei, String p, String name, float hp) {
    x = xPos;
    y = yPos;
    w = wid;
    h = hei;
    party = p;
    imgName = name;
    healthTotal = hp;
    currentHealth = healthTotal;
    img = loadImage(imgName);
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  void display() {
    float drawWidth = (currentHealth / healthTotal) * w; // this scales the current healthbar to the width of the base
    if (party.equals("player") && imgName.equals("base1")) { // flipping the image on the y axis
      scale(-1.0, 1.0);
      image(img, -x, y, w, h);
      scale(-1.0, 1.0);
      //rect(x, y, 10, 10);
      // following code is for health bar
      noStroke();
      fill(255,0,0);
      rect(x - 490, y + 510, drawWidth, 20);
      // Outline
      stroke(0);
      noFill();
      rect(x - 490, y + 510, w, 20);
    } else if (party.equals("enemy") && imgName.equals("base1")) {
      image(img, x, y, w, h);
      // following code is for health bar
      noStroke();
      fill(255,0,0);
      rect(x - 10, y + 510, drawWidth, 20);
      // Outline
      stroke(0);
      noFill();
      rect(x - 10, y + 510, w, 20);
    }
  }

  void setImage(String imageName) {
    imgName = imageName;
    PImage newImage = loadImage(imageName);
    img = newImage;
  }

  void setHealth(float newHP) {
    currentHealth = newHP;
  }
}
