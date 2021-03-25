class SpaceShip {
  //membervariables
  int x, y, hitpoints, lives, radius;
  color c;
  float easing;
  PImage photo;

  //constructor
  SpaceShip(color c) {
    x = 0;
    y = 0;
    hitpoints = 100;
    lives = 3;
    this.c = c;
    easing = 0.05;
    radius = 35;
    photo = loadImage("SpaceShip-1.png");
    photo.resize(150, 150);
  }

  //Rock and Ship collision
  boolean rockIntersection(Rock rock) {
    float distance = dist(x-10, y-10, rock.x, rock.y);
    if (distance <radius + rock.radius) {
      return true;
      
    } else {
      return false;
    }
  }

  //Powerup and Ship collision
  boolean powerupIntersection(PowerUp powerup) {
    float distance = dist(x-10, y-10, powerup.x, powerup.y);
    if (distance < radius + powerup.radius) {
      return true;
      
    } else {
      return false;
    }
  }

  boolean enemyshiplaserIntersect(EnemyShipLaser enemyshiplaser) {
    // Calculate distance
    float distance = dist(x, y, enemyshiplaser.x, enemyshiplaser.y); 

    // Compare distance to sum of radii
    if (distance < radius + enemyshiplaser.radius) { 
      return true;
    } else {
      return false;
    }
  }

//enemyship collsion
  boolean s1Intersect(EnemyShip enemyship) {
    // Calculate distance
    float distance = dist(x, y, enemyship.x, enemyship.y); 
    if (distance < radius + enemyship.radius) { 
      return true;
    } else {
      return false;
    }
  }

  //member methods
  void display(int x, int y) {
    this.x = x;
    this.y = y;
    image(photo, x-84, y-70);
  }
}
