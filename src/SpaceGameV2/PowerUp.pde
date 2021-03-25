class PowerUp {
  //member variables
  int x, y, powerup, radius, speed;
  String[] powerupInfo = {"Health", "Extra Life"};
  PImage photo;
  PImage photo2;

  //constructor
  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    radius = 15;
    speed = 8;
    powerup = int(random(2));
    photo = loadImage("ExtraLife.png");
    photo2 = loadImage("Health.png");
  }

boolean reachedBottom() {
  if (y > height+50) {
    return true;
  } else {
    return false;
  }
}

  void move() {
    y += speed;
  }

  //member methods
  void display() {
    noStroke();
    switch(powerup) {
    case 0: //Health Boost
     image (photo2,x-30,y-15);
      break;
    case 1: //Extra Life
     image (photo,x-30,y-15);
      break;
      
    }
  }
}
