import java.util.*;

int level, experience, playerHealth, enemyHealth;
ArrayList<base> bases;

void setup() {
  frameRate(60);
  size(1800,1000);
  initialize();
}

void initialize() {
  level = 1;
  experience = 0;
  bases = new ArrayList<base>();
  bases.add(new base(500, 300, 500, 500, "player", "base1", 1000)); // players home base
  bases.add(new base(1300, 300, 500, 500, "enemy", "base1", 1000)); // enemy base
}

void draw() {
  PImage background1 = loadImage("medievalBackground");
  PImage toolBar = loadImage("toolBar");
  background1.resize(1800,1000);
  background(background1);
  image(toolBar, 0, 0, 1800, 100);
  image(toolBar, 0, 950, 1800, 50);
  for (int i = 0 ; i < bases.size(); i++) {
    bases.get(i).display();
  }
}
