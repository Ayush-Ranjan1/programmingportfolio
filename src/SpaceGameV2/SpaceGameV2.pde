// SpaceGame 2020 December
// by Ayush Ranjan

SpaceShip s1;
ArrayList<Laser> lasers;
ArrayList<Rock> rocks;
ArrayList<Star> stars;
ArrayList<PowerUp> powerups;
ArrayList<EnemyShip> enemyships;
ArrayList<EnemyShipLaser> enemyshiplasers;
Timer timer, poweruptimer, enemyshiptimer;
int score;
int pass, enemyshipHitpoints;
boolean play;
import processing.sound.*;
SoundFile laser;

void setup() {
  size(500, 500);
  s1 = new SpaceShip(50);
  lasers = new ArrayList();
  rocks = new ArrayList();
  stars = new ArrayList();
  powerups = new ArrayList();
  enemyships = new ArrayList();
  enemyshiplasers = new ArrayList();
  timer = new Timer(int(random(1000, 5000)));
  poweruptimer = new Timer(15000);
  enemyshiptimer = new Timer(7000);
  timer.start();
  poweruptimer.start();
//  enemyshiptimer.start();
  score = 0;
  pass = 0;
  enemyshipHitpoints = 30;
  play = false;
  laser = new SoundFile(this, "ISD-Laser4.wav");
}

void draw() {
  noCursor();
  if (!play) {
    startScreen();
  } else {
    background(0);

    stars.add(new Star(int(random(width)), int(random(height)), color(random(200, 255))));
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }

    //enemyships
    if (enemyshiptimer.isFinished()) {
      enemyships.add(new EnemyShip(0, 80, 1000, enemyshipHitpoints));
      enemyshiptimer.start();
    }


    //enemyship rendering
    for (int i = 0; i<enemyships.size(); i++) {
      EnemyShip enemyship = enemyships.get(i);
      enemyship.move();
      enemyship.display();
      // enemy and ship intersection
      if (s1.s1Intersect(enemyship)) {
        s1.hitpoints-=25;
        enemyships.remove(enemyship);
      }
      if (enemyship.isFinished()) {
        enemyshiplasers.add(new EnemyShipLaser(enemyship.x, enemyship.y));
        enemyship.start();
      }
    }

    //enemyshiplasers
    for (int i = enemyshiplasers.size()-1; i>=0; i--) {
      EnemyShipLaser enemyshiplaser = (EnemyShipLaser) enemyshiplasers.get(i);
      enemyshiplaser.fire();
      enemyshiplaser.display();
      
      //enemy laser ship collision
      if (s1.enemyshiplaserIntersect(enemyshiplaser)) {
        s1.hitpoints-=30;
        enemyshiplasers.remove(enemyshiplaser);
      }
      if (enemyshiplaser.reachedBottom()) {
        enemyshiplasers.remove(enemyshiplaser);
      }
    }


    if (timer.isFinished()) {
      rocks.add(new Rock(int(random(width)), -50));
      timer.start();
    }

    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();

      // Rock and Ship collision
      if (s1.rockIntersection(rock)) {
        s1.hitpoints -= rock.hitpoints;
        rocks.remove(rock);
        score-=rock.hitpoints;
      }
      if (rock.reachedBottom()) {
        pass++;
        score -= 5;
        rocks.remove(rock);
      }
    }

    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      laser.display();
      laser.fire();
      //laser and rock collision
      for (int q = 0; q < rocks.size(); q++) {
        Rock rock = rocks.get(q);
        if (rock.laserIntersection(laser)) {
          rock.hitpoints-=10;
          lasers.remove(laser);
          if (rock.hitpoints<1) {
            rocks.remove(rock);
            score-=rock.hitpoints;
          }
        }
        
      //enemyship and s1laser
      for (int k = 0; k<enemyships.size(); k++) {
        EnemyShip enemyship = enemyships.get(k);
        if (enemyship.laserIntersect(laser)) {
          lasers.remove(laser);
          enemyship.hitpoints-=15;
          if (enemyship.hitpoints<1) {
            score+=25;
            enemyships.remove(enemyship);
          }
        }
      }

        
        if (laser.reachedTop()) {
          lasers.remove(laser);
        }
      }
    }
    
    
    //powerup distribution
    if (poweruptimer.isFinished()) {
      powerups.add(new PowerUp(int(random(width)), -50));
      poweruptimer.start();
    }
    //powerup rendering
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp powerup = powerups.get(i);
      powerup.display();
      powerup.move();

      //powerup and ship intersection
      if (s1.powerupIntersection(powerup)) {
        if (powerup.powerup == 0) {
          s1.hitpoints += 25;
        } else if (powerup.powerup == 1) {
          s1.lives += 1;
        }
      }


      //powerup collision
      if (s1.powerupIntersection(powerup)) {
        powerups.remove(powerup);
      }
      if (powerup.reachedBottom()) {
        powerups.remove(powerup);
      }
    }

    s1.display(mouseX, mouseY);
    infoPanel();

    //lives
    if (s1.hitpoints < 1) {
      s1.lives --;
      if (s1.lives>0) {
        s1.hitpoints = 100;
      }
    }

    //game over - add && s1.lives < 1
    if (s1.hitpoints<1 || pass>10) {
      play = false;
      gameOver();
    }
  }
}
void mousePressed() {
  lasers.add(new Laser(color(255, 0, 0), s1.x, s1.y));
  laser.play();
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  text("SpaceGame", width/2, height/2-40);
  text("Click to start!", width/2, height/2-20);
  text("Instructions: Shoot as many rocks and enemy ships as you can!", width/2, height/2+40);
  text("Collect powerups for health and extra lives, and try to survive for as long as you can!", width/2, height/2+60);

  if (mousePressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(222);
  text("Game Over!", width/2, height/2);
  text("Final Score: " + score, width/2, height/2+40);
  noLoop();
}

void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(0, height-50, width, 50);
  fill(255, 100);
  text("HP: " + s1.hitpoints, 25, height-20);
  text("Lives: " + s1.lives, 100, height-20);
  text("Level: ", 180, height - 20);
  text("Score: " + score, 260, height-20);
  text("Missed Rocks: " + pass, 380, height-20);
}
