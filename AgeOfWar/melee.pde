import java.util.*;

class melee {
  float x, y, w, h, range, xVel, healthTotal, currentHealth, damage;
  PImage img;
  boolean isAttacking;
  String party, imgName;

  melee(float xPos, float yPos, float wid, float hei, float r, String p, String name, float speed, float hp, float d) {
    x = xPos;
    y = yPos;
    w = wid;
    h = hei;
    range = r;
    party = p;
    imgName = name;
    img = loadImage(imgName);
    xVel = speed;
    healthTotal = hp;
    isAttacking = false;
    currentHealth = healthTotal;
    damage = d;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getHealth() {
    return currentHealth;
  }

  void setHealth(float newHP) {
    currentHealth = newHP;
  }

  void move() {
    if (party.equals("player") && isAttacking == false) {
      x += xVel;
    } else if (isAttacking == false) {
      x -= xVel;
    }
  }

  void display() {
    float drawWidth = (currentHealth / healthTotal) * w; // this scales the current healthbar to the width of the base
    if (party.equals("player")) {
      scale(-1.0, 1.0);
      image(img, -x, y, w, h);
      scale(-1.0, 1.0);
      noStroke();
      fill(255, 0, 0);
      rect(x - 3 * w / 4, y - 10, drawWidth / 2, 10);
      // Outline
      stroke(0);
      noFill();
      rect(x - 3 * w / 4, y - 10, w / 2, 10);
    } else {
      image(img, x, y, w, h);
      noStroke();
      fill(255, 0, 0);
      rect(x + w / 4, y - 10, drawWidth / 2, 10);
      // Outline
      stroke(0);
      noFill();
      rect(x + w / 4, y - 10, w / 2, 10);
    }
  }

  void attack() {
    if (party.equals("player")) {
      for (int i = 0; i < enemyUnits.size(); i++) {
        if (dist(enemyUnits.get(i).getX(), enemyUnits.get(i).getY(), x, y) <= range) {
          isAttacking = true;
          if (frameCount % 20 == 0) {
            enemyUnits.get(i).setHealth(enemyUnits.get(i).getHealth() - damage);
          }
        }
      }
    } else {
      for (int i = 0; i < playerUnits.size(); i++) {
        if (dist(playerUnits.get(i).getX(), playerUnits.get(i).getY(), x, y) <= range) {
          isAttacking = true;
          if (frameCount % 20 == 0) {
            playerUnits.get(i).setHealth(playerUnits.get(i).getHealth() - damage);
          }
        }
      }
    }
  }
}
