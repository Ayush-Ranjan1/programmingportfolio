class Laser {
  //member variables
  int x,y,speed, radius;
  color c;
 
  //constructor
  Laser (color c, int x, int y) {
    this.x = x;
    this.y = y;
    this.c = c;
    speed = 10;
    radius = 4;
  }
  
  void fire() {
    y-=speed;
  }
  
  boolean reachedTop() {
  if(y<0) {
      return true;
    } else {
      return false;
    }
  }
  
  //member methods
  void display() {
    noStroke();
    fill(c);
    rectMode(CENTER);
    rect(x,y,radius,radius*2);
  }
}
