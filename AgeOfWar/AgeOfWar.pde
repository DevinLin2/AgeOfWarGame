import java.util.*;

int level, experience, population, gold, enemyPop;
ArrayList<base> bases;
ArrayList<melee> playerUnits;
ArrayList<melee> enemyUnits;
ArrayList<icon> icons;
PImage background1, toolBar;
float playerHealth, enemyHealth;
long lastTime;

void setup() {
  frameRate(20);
  size(1800, 1000);
  initialize();
}

void initialize() {
  background1 = loadImage("medievalBackground");
  toolBar = loadImage("toolBar");
  background1.resize(1800, 1000);
  level = 1;
  experience = 1000;
  population = 0;
  gold = 1000;
  enemyPop = 0;
  bases = new ArrayList<base>();
  playerUnits = new ArrayList<melee>();
  enemyUnits = new ArrayList<melee>();
  icons = new ArrayList<icon>();
  icons.add(new icon(30, 20, 75, 75, "knightIcon", 0));
  icons.add(new icon(115, 20, 75, 75, "fairyIcon", 1));
  icons.add(new icon(200, 20, 75, 75, "dragonIcon", 2));
  icons.add(new icon(285, 20, 75, 75, "wizardIcon", 3));
  icons.add(new icon(600, 20, 75, 75, "arrow", 4));
  bases.add(new base(500, 300, 500, 500, "player", "base1", 1000)); // players home base
  bases.add(new base(1300, 300, 500, 500, "enemy", "base1", 1000)); // enemy base
  playerHealth = bases.get(0).getHealth();
  enemyHealth = bases.get(1).getHealth();
  ;
}

void draw() {
  //println(frameRate);
  background(background1);

  // all draw code goes under this

  image(toolBar, 0, 0, 1800, 100);
  textSize(20);
  fill(255);
  text("UNITS:", 7, 17);
  text("SPECIAL:", 577, 17);
  text("GOLD: " + gold, 1333, 17);
  text("EXPERIENCE: " + experience, 1333, 37);
  text("POPULATION: " + population + "/10", 1333, 57);
  text("YOUR HEALTH: " + playerHealth, 1333, 77);
  text("ENEMY HEALTH: " + enemyHealth, 1333, 97);
  for (int i = 0; i < icons.size(); i++) {
    icons.get(i).display();
  }
  for (int i = 0; i < bases.size(); i++) {
    bases.get(i).display();
  }
  for (int i = 0; i < playerUnits.size(); i++) {
    playerUnits.get(i).setIndex(i);
    playerUnits.get(i).display();
    playerUnits.get(i).move();
    playerUnits.get(i).attack();
    playerUnits.get(i).attackBase();
    if (playerUnits.get(i).getHealth() <= 0) {
      playerUnits.remove(i);
      i--;
      population--;
      enemyUnits.get(0).changeIsAttacking();
    }
  }
  for (int i = 0; i < enemyUnits.size(); i++) {
    enemyUnits.get(i).setIndex(i);
    enemyUnits.get(i).display();
    enemyUnits.get(i).move();
    enemyUnits.get(i).attack();
    enemyUnits.get(i).attackBase();
    if (enemyUnits.get(i).getHealth() <= 0) {
      enemyUnits.remove(i);
      experience += 100;
      gold += enemyUnits.get(i).getCost();
      playerUnits.get(0).changeIsAttacking();
      enemyPop--;
    }
  }
  if (millis() - lastTime >= 8000 && enemyPop < 5) {
    if (level == 1) {
      int index = (int) (Math.random() * 4);
      if (index == 0) {
        enemyUnits.add(new melee(1600, 700, 100, 100, 150, "enemy", "knight", 1.5, 110, 15, 140));
        lastTime = millis();
        enemyPop++;
      }
      if (index == 1) {
        enemyUnits.add(new melee(1560, 725, 70, 70, 150, "enemy", "fairy", 2.5, 200, 15, 110));
        lastTime = millis();
        enemyPop++;
      }
      if (index == 2) {
        enemyUnits.add(new melee(1430, 650, 200, 150, 150, "enemy", "dragon", 1, 300, 30, 500));
        lastTime = millis();
        enemyPop++;
      }
      if (index == 3) {
        enemyUnits.add(new melee(1580, 700, 100, 100, 150, "enemy", "wizard", 1.5, 140, 40, 220));
        lastTime = millis();
        enemyPop++;
      }
    } else {
      int index = (int) (Math.random() * 3);
      if (index == 0) {
        enemyUnits.add(new melee(1470, 700, 120, 120, 150, "enemy", "spider", 2.5, 150, 20, 120));
        lastTime = millis();
        enemyPop++;
      }
      if (index == 1) {
        enemyUnits.add(new melee(1480, 700, 100, 100, 150, "enemy", "robot", 1.5, 235, 30, 150));
        lastTime = millis();
        enemyPop++;
      }
      if (index == 2) {
        enemyUnits.add(new melee(1580, 700, 100, 100, 150, "enemy", "alien", 1.5, 350, 40, 200));
        lastTime = millis();
        enemyPop++;
      }
    }
  }
}

void mousePressed() {
  if (level == 1) {
    if (mouseX <= 105 && mouseX >= 30 && mouseY <= 95 && mouseY >= 20) {
      if (population < 10 && gold >= 140) {
        playerUnits.add(new melee(220, 700, 100, 100, 150, "player", "knight", 1.5, 110, 15, 140));
        population++;
        gold -= 140;
      }
    }
    if (mouseX <= 190 && mouseX >= 115 && mouseY <= 95 && mouseY >= 20) {
      if (population < 10 && gold >= 110) {
        playerUnits.add(new melee(245, 725, 70, 70, 150, "player", "fairy", 2.5, 200, 15, 110));
        population++;
        gold -= 110;
      }
    }
    if (mouseX <= 275 && mouseX >= 200 && mouseY <= 95 && mouseY >= 20) {
      if (population < 10 && gold >= 500) {
        playerUnits.add(new melee(375, 650, 200, 150, 150, "player", "dragon", 1, 300, 30, 500));
        population++;
        gold -= 500;
      }
    }
    if (mouseX <= 360 && mouseX >= 285 && mouseY <= 95 && mouseY >= 20) {
      if (population < 10 && gold >= 220) {
        playerUnits.add(new melee(220, 700, 100, 100, 150, "player", "wizard", 1.5, 140, 40, 220));
        population++;
        gold -= 220;
      }
    }
  } else {
    if (mouseX <= 105 && mouseX >= 30 && mouseY <= 95 && mouseY >= 20) {
      if (population < 10 && gold >= 120) {
        playerUnits.add(new melee(330, 700, 120, 120, 150, "player", "spider", 2.5, 150, 20, 120));
        population++;
        gold -= 120;
      }
    }
    if (mouseX <= 190 && mouseX >= 115 && mouseY <= 95 && mouseY >= 20) {
      if (population < 10 && gold >= 150) {
        playerUnits.add(new melee(330, 700, 100, 100, 150, "player", "robot", 1.5, 235, 30, 150));
        population++;
        gold -= 150;
      }
    }
    if (mouseX <= 275 && mouseX >= 200 && mouseY <= 95 && mouseY >= 20) {
      if (population < 10 && gold >= 200) {
        playerUnits.add(new melee(230, 700, 100, 100, 150, "player", "alien", 1.5, 350, 40, 200));
        population++;
        gold -= 200;
      }
    }
    if (mouseX <= 360 && mouseX >= 285 && mouseY <= 95 && mouseY >= 20) {
      if (population < 10 && gold >= 800) {
        playerUnits.add(new melee(350, 600, 150, 200, 150, "player", "thanos", 1, 9999, 100, 800));
        population++;
        gold -= 800;
      }
    }
  }
  if (mouseX <= 675 && mouseX >= 600 && mouseY <= 95 && mouseY >= 20 && experience >= 1000) {
    if (level == 1) {
      icons.clear();
      icons.add(new icon(30, 20, 75, 75, "spiderIcon", 0));
      icons.add(new icon(115, 20, 75, 75, "robotIcon", 1));
      icons.add(new icon(200, 20, 75, 75, "alienIcon", 2));
      icons.add(new icon(285, 20, 75, 75, "thanosIcon", 3));
      icons.add(new icon(600, 20, 75, 75, "arrow", 4));
      background1 = loadImage("background2");
      background1.resize(1800, 1000);
      experience -= 1000;
    }
    level = 2;
  }
}
