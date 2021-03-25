class EnemyShip {
  //membervariables
  int x, y, hitpoints, radius, speed, hitpointsStart;
  int savedTime;
  int totalTime;
  PImage photo;

  //constructor
  EnemyShip(int x, int y, int t, int hitpoints) {
    this.x=x;
    this.y=y;
    radius=25;
    speed = 5;
    this.hitpoints = hitpoints;
    this.totalTime=t;
    photo = loadImage("Enemy_Ship-1.png");
    photo.resize(150, 150);
    //easing = 0.05;
  }

  void move() {
    x += speed;
    if (x >= width|| x <= 0) {
      speed *= -1;
      y+= 20;
    }
  }

  boolean laserIntersect(Laser laser) {
    float distance = dist(x, y, laser.x, laser.y); 
    if (distance < radius + laser.radius) { 
      return true;
    } else {
      return false;
    }
  }

  //member methods
  void display() {
    image (photo, x-70, y-75);
  }


  void start() {
    savedTime = millis();
  }

  
  boolean isFinished() { 
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}
