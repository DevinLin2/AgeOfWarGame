import java.util.*;

int level, experience, playerHealth, enemyHealth;
ArrayList<base> bases;
ArrayList<melee> playerUnits;
ArrayList<melee> enemyUnits;
PImage background1, toolBar;

void setup() {
  frameRate(20);
  size(1800,1000);
  initialize();
}

void initialize() {
  background1 = loadImage("medievalBackground");
  toolBar = loadImage("toolBar");
  background1.resize(1800,1000);
  level = 1;
  experience = 0;
  bases = new ArrayList<base>();
  playerUnits = new ArrayList<melee>();
  enemyUnits = new ArrayList<melee>();
  bases.add(new base(500, 300, 500, 500, "player", "base1", 1000)); // players home base
  bases.add(new base(1300, 300, 500, 500, "enemy", "base1", 1000)); // enemy base
  
  // this is test code
  playerUnits.add(new melee(500, 300, 200, 150, 100, "player", "dragon", 5, 100, 10));
  enemyUnits.add(new melee(1300, 300, 200, 150, 100, "enemy", "dragon", 5, 100, 10));
  playerUnits.add(new melee(200, 300, 200, 150, 100, "player", "dragon", 5, 100, 10));
  enemyUnits.add(new melee(1600, 300, 200, 150, 100, "enemy", "dragon", 5, 100, 10));
}

void draw() {
  println(frameRate);
  background(background1);
  
  // all draw code goes under this

  image(toolBar, 0, 0, 1800, 100);
  image(toolBar, 0, 950, 1800, 50);
  for (int i = 0 ; i < bases.size(); i++) {
    bases.get(i).display();
  }
  for (int i = 0; i < playerUnits.size(); i++) {
    playerUnits.get(i).setIndex(i);
    playerUnits.get(i).display();
    playerUnits.get(i).move();
    playerUnits.get(i).attack();
    if(playerUnits.get(i).getHealth() <= 0) {
      playerUnits.remove(i);
      i--;
    }
  }
  for (int i = 0; i < enemyUnits.size(); i++) {
    enemyUnits.get(i).setIndex(i);
    enemyUnits.get(i).display();
    enemyUnits.get(i).move();
    enemyUnits.get(i).attack();
    if(enemyUnits.get(i).getHealth() <= 0) {
      enemyUnits.remove(i);
      i--;
    }
  }
}
