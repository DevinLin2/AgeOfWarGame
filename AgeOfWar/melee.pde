import java.util.*;

class melee {
  float x, y, w, h, range, xVel, healthTotal, currentHealth, damage;
  PImage img;
  boolean isAttacking;
  String party, imgName;
  int index, cost;

  melee(float xPos, float yPos, float wid, float hei, float r, String p, String name, float speed, float hp, float d, int c) {
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
    index = -1;
    cost = c;
  }

  int getCost() {
    return cost;
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

  float getWidth() {
    return w;
  }

  void setHealth(float newHP) {
    currentHealth = newHP;
  }

  void setIndex(int newIndex) {
    index = newIndex;
  }

  void changeIsAttacking() {
    isAttacking = false;
  }

  void move() {
    if (party.equals("player") && isAttacking == false) {
      if (index != 0 && dist(playerUnits.get(index - 1).getX(), playerUnits.get(index - 1).getY(), x, y) >= playerUnits.get(index - 1).getWidth() + 10) {
        x += xVel;
      } else if (index == 0) {
        x += xVel;
      }
    } else if (isAttacking == false) {
      if (index != 0 && dist(enemyUnits.get(index - 1).getX(), enemyUnits.get(index - 1).getY(), x, y) >= enemyUnits.get(index - 1).getWidth() + 10) {
        x -= xVel;
      } else if (index == 0) {
        x -= xVel;
      }
    }
  }

  void display() {
    float drawWidth = (currentHealth / healthTotal) * w; // this scales the current healthbar to the width of the base
    if (party.equals("player") && (!imgName.equals("dragon") && !imgName.equals("robot") && !imgName.equals("spider") && !imgName.equals("thanos"))) {
      image(img, x, y, w, h);
      noStroke();
      if (currentHealth >= healthTotal / 3 * 2) {
        fill(90, 255, 90);
      } else if (currentHealth >= healthTotal / 3) {
        fill(255, 255, 52);
      } else {
        fill(255, 51, 51);
      }
      rect(x + w / 4, y - 10, drawWidth / 2, 10);
      // Outline
      stroke(0);
      noFill();
      rect(x + w / 4, y - 10, w / 2, 10);
    } else {
      if (party.equals("enemy") && (imgName.equals("dragon") || imgName.equals("spider") || imgName.equals("robot"))) {
        image(img, x, y, w, h);
        noStroke();
        if (currentHealth >= healthTotal / 3 * 2) {
          fill(90, 255, 90);
        } else if (currentHealth >= healthTotal / 3) {
          fill(255, 255, 52);
        } else {
          fill(255, 51, 51);
        }
        rect(x + w / 4, y - 10, drawWidth / 2, 10);
        // Outline
        stroke(0);
        noFill();
        rect(x + w / 4, y - 10, w / 2, 10);
      } else {
        scale(-1.0, 1.0);
        image(img, -x, y, w, h);
        scale(-1.0, 1.0);
        noStroke();
        if (currentHealth >= healthTotal / 3 * 2) {
          fill(90, 255, 90);
        } else if (currentHealth >= healthTotal / 3) {
          fill(255, 255, 52);
        } else {
          fill(255, 51, 51);
        }
        rect(x - 3 * w / 4, y - 10, drawWidth / 2, 10);
        // Outline
        stroke(0);
        noFill();
        rect(x - 3 * w / 4, y - 10, w / 2, 10);
      }
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

  void attackBase() {
    if (party.equals("player")) {
      for (int i = 0; i < bases.size(); i++) {
        if (1500 - x <= range) {
          isAttacking = true;
          if (frameCount % 20 == 0) {
            bases.get(1).setHealth(bases.get(1).getHealth() - damage);
            enemyHealth -= damage;
          }
        }
      }
    } else {
      for (int i = 0; i < bases.size(); i++) {
        if (x - 290 <= range) {
          isAttacking = true;
          if (frameCount % 20 == 0) {
            bases.get(0).setHealth(bases.get(0).getHealth() - damage);
            playerHealth -= damage;
          }
        }
      }
    }
  }
}
