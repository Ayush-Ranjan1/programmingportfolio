class Rock {
  //member variables
  int x, y, hitpoints, speed, radius;
  PImage photo;

  //constructor
  Rock (int x, int y) {
    this.x = x;
    this.y = y;
    hitpoints = 25;
    speed = int(random(2, 5));
    photo = loadImage("Rock3.png");
    photo.resize(50, 50);
    radius = 25;
  }

//laser and rock collision
  boolean laserIntersection(Laser laser) {
    float distance = dist(x, y, laser.x, laser.y);
    if (distance <radius + laser.radius) {
      return true;
    } else {
      return false;
    }
  }


  boolean reachedBottom() {
    if (y > height+50) {
      return true;
    } else {
      return false;
    }
  }

  void move() {
    y+=speed;
  }

  //member methods
  void display() {
    image(photo, x-20, y-5);
  }
}
