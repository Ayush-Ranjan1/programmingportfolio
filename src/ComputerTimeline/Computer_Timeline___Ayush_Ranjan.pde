//Ayush Ranjan Computer Timeline
// Sept 2020
boolean hover = false;


void setup() {
  size(900, 400);
}

void draw() {
  background(128);
  drawRef();
  histEvent(100, 200, 125, 25,"Atanasoff-Berry Computer","US, 1939, created by John Vincent Atanasoff and Clifford E. Berry. First binary electronic digital calculating device.",true);
  histEvent(100, 275, 125, 25,"Zuse Z3","Germany, 1941, created by Konrad Zuse. First fully automatic digital computer.",false);
  histEvent(250, 200, 125, 25,"Collossus","Britain, 1943, created by Tommy Flowers. First programmable digital computer.",true);
  histEvent(250, 275, 125, 25,"Harvard Mark I","US, 1944, created by Howard Aiken and IBM. General purpose electro-mechanical computer.",false);
  histEvent(400, 200, 125, 25,"ENIAC","US, 1945, created in the University of Pennsylvania. Much faster and flexible than the Collosus.",true);
  histEvent(400, 275, 125, 25,"Manchester Baby","Britain, 1948, created by Frederic C Williams. First electronic stored program computer.",false);
  histEvent(550, 200, 125, 25,"Manchester Mark I","Britain, 1949, created by Frederic C Williams. Pioneered index registers and operated error free for 9 hours.",true); 
  histEvent(550, 275, 125, 25,"EDSAC","Britain, 1949, created by Maurice Wilkes. It's first programs were: a table of squares and a list of prime numbers. It served as the basis for the first commercially applied computer, the Leo 1.",false);


}

void drawRef() {
  //Draws the timeline
  strokeWeight(5);
  stroke(50);
  line(100, 250, 800, 250);
  
  //draws title info
  textAlign(CENTER);
  textSize(36);
  text("Computer Timeline", width/2, 65);
  
  //descriptive text
  textSize(9);
  text("By Ayush Ranjan", width/2,85);
}

void histEvent(int x, int y, int w, int h, String title, String description, boolean top) {
  //detection of the mouseover
  hover = (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  
  //draw a rectangle
  strokeWeight(2);
  if(hover == true) {
    fill(255);
    text(description, 200, 350);
  } else {
    fill (255);
  }
  rect(x,y,w,h,5);
  
  //text overlay
  textAlign(LEFT);
  fill(0);
  text(title,x+5,y+20);
  
  //connecting line to the timeline
  if(top == true){
    line(x+20,y+25,x+35,y+50);
  } else {
  line(x+20,y,x+35,y-25);
  }
}
