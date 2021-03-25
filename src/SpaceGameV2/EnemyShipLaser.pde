class EnemyShipLaser {
  //member variables
  int x,y,speed, radius;
  color c;
 
  //constructor
  EnemyShipLaser (int x, int y) {
    this.x = x;
    this.y = y;
    speed = 10;
    radius = 4;
    c = color(#1EAA00);
  }
  
  void fire() {
    y += speed;
  }
  
  boolean reachedBottom() {
  if(y>height) {
      return true;
    } else {
      return false;
    }
  }
  
  //member methods
  void display() {
    noStroke();
    fill(c);
    rect(x,y,radius,radius*2);
  }
}
