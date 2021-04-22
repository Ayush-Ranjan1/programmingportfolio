class Button {
  // Member Variable
  int x,y,w,h;
  color c1,c2,c3;
  String val;
  boolean hover, isNumber;

  // Constructor
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal, boolean isNumber) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c1 = #FFFFFF;
    c2 = #F0F0F0;
    c3 = #FA8A2D;
  
    val = tempVal;
    hover = false;
    this.isNumber = isNumber;
  }
  
  // Display Method
  void display() {
    textSize(20);
  if (isNumber){
    if(hover) {
      fill(c2);
      } else {
        fill(c1);
    }
    rect(x,y,w,h,8);
    fill(0);
    textSize(20);
    text(val,x+20,y+20);
  } else {
    if (hover) {
       fill(c1);
    } else {
      fill(c3);
    }
    rect(x,y,w,h,8);
    fill(0);
    text(val, x+20, y+20);
  }
}

  // Hover Method
  void hover() {
    hover = (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  }
}
