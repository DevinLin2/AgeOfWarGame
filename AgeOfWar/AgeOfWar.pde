import java.util.*;

int level, experience, playerHealth, enemyHealth;
ArrayList<base> bases;
ArrayList<melee> meleeUnits;

void setup() {
  frameRate(20);
  size(1800,1000);
  initialize();
}

void initialize() {
  level = 1;
  experience = 0;
  bases = new ArrayList<base>();
  bases.add(new base(500, 300, 500, 500, "player", "base1", 1000)); // players home base
  bases.add(new base(1300, 300, 500, 500, "enemy", "base1", 1000)); // enemy base
  
  // this is test code
  meleeUnits = new ArrayList<melee>();
  meleeUnits.add(new melee(500, 300, 200, 150, 10, "player", "dragon"));
  meleeUnits.add(new melee(1300, 300, 200, 150, 10, "enemy", "dragon"));
}

void draw() {
  println(frameRate);
  PImage background1 = loadImage("medievalBackground");
  PImage toolBar = loadImage("toolBar");
  background1.resize(1800,1000);
  //background(background1);
  
  // all draw code goes under this

  image(toolBar, 0, 0, 1800, 100);
  image(toolBar, 0, 950, 1800, 50);
  for (int i = 0 ; i < bases.size(); i++) {
    bases.get(i).display();
  }
  for (int i = 0; i < meleeUnits.size(); i++) {
    meleeUnits.get(i).display();
    meleeUnits.get(i).move();
  }
}
