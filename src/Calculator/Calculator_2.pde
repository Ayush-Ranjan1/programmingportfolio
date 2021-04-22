Button[] numButtons = new Button[10];
Button[] opButtons = new Button[15];
String dVal = "0";
String op = "";
float r = 0.0; //right of operator
float l = 0.0; //left of operator
float result = 0.0; //answer
boolean left = true;

void setup() {
  size(360,360);
  numButtons[0]= new Button(0,320,80,40,"0",true);
  numButtons[1]= new Button(0,280,80,40,"1",true);
  numButtons[2]= new Button(80,280,80,40,"2",true);
  numButtons[3]= new Button(160,280,80,40,"3",true);
  numButtons[4]= new Button(0,240,80,40,"4",true);
  numButtons[5]= new Button(80,240,80,40,"5",true);
  numButtons[6]= new Button(160,240,80,40,"6",true);
  numButtons[7]= new Button(0,200,80,40,"7",true);
  numButtons[8]= new Button(80,200,80,40,"8",true);
  numButtons[9]= new Button(160,200,80,40,"9",true);
  opButtons[0]= new Button(280,160,80,40,"C",false);
  opButtons[1]= new Button(240,160,40,40,"÷",false);
  opButtons[2]= new Button(240,200,40,40,"x",false);
  opButtons[3]= new Button(240,240,40,40,"-",false);
  opButtons[4]= new Button(240,280,40,40,"+",false);
  opButtons[5]= new Button(240,320,40,40,"=",false);
  opButtons[6]= new Button(280,200,80,40,"?",false);
  opButtons[7]= new Button(280,240,80,40,"?",false);
  opButtons[8]= new Button(280,280,80,40,"?",false);
  opButtons[9]= new Button(280,320,80,40,"?",false);
  opButtons[10]= new Button(0,160,80,40,"D",false); //figure out how to do delete
  opButtons[11]= new Button(80,160,80,40,"?",false);
  opButtons[12]= new Button(160,160,80,40,"?",false);
  opButtons[13]= new Button(80,320,80,40,"+/-",false);
  opButtons[14]= new Button(160,320,80,40,".",false);


}

void draw() {
  background(150);
  for(int i=0; i<numButtons.length; i++){
    numButtons[i].display();
    numButtons[i].hover();
  }
   for(int i=0; i<opButtons.length; i++){
    opButtons[i].display();
    opButtons[i].hover();
  }
  updateDisplay();
}
void mousePressed() {
  println("L:" + l + " R:" + r + "Op:" + op);
  
  for(int i=0; i<numButtons.length; i++) {
   if(numButtons[i].hover && dVal.length()<20) {
     if (left) { //left number
       if (dVal.equals("0")) {
          dVal = (numButtons[i].val);
          l = float(dVal);
       }else{
         dVal += (numButtons[i].val);
         l = float(dVal);
       }
     }else{
       if (dVal.equals("0")) {
         dVal = (numButtons[i].val);
         r = float(dVal);
       }else{
         dVal += (numButtons[i].val);
         r = float(dVal);
       }
     }
   }
 }

//operators
for (int i=0; i<opButtons.length; i++) {
  if (opButtons[i].hover && opButtons[i].val.equals("C")) {
    dVal = "0";
    result = 0.0;
    left = true;
    r = 0.0;
    l = 0.0;
    op = " ";
  } else if (opButtons[i].hover && opButtons[i].val.equals("+")) {
    if (!left) {
      performCalc();
    } else {
      op = "+";
      left = false;
      dVal = "0";
    } 
  } else if (opButtons[i].hover && opButtons[i].val.equals("-")) {
    if (!left) {
      performCalc();
    } else {
      op = "-";
      left = false;
      dVal = "0";
    }
  } else if (opButtons[i].hover && opButtons[i].val.equals("x")) {
    if (!left) {
      performCalc();
    } else {
      op = "x";
      left = false;
      dVal = "0";
    }
  } else if (opButtons[i].hover && opButtons[i].val.equals("÷")) {
    if (!left) {
      performCalc();
    } else {
      op = "÷";
      left = false;
      dVal = "0";
    }
  } else if (opButtons[i].hover && opButtons[i].val.equals("=")) {
  performCalc();
  }
}
}

void updateDisplay() {
  fill(50);
  rect(0,0,360,160);
  fill(255);
  textAlign(RIGHT);
  
  //Renders scaling text
  if (dVal.length()<14) {
   textSize(30);
  } else if (dVal.length()<15) {
    textSize(28);
  } else if (dVal.length()<16) {
    textSize(26);
  } else if (dVal.length()<17) {
    textSize(24);
  } else if (dVal.length()<18) {
    textSize(22);
  } else if (dVal.length()<20) {
    textSize(20);
  } else if (dVal.length()<22) {
    textSize(18);
  } else if (dVal.length()<25) {
    textSize(16);
  } else if (dVal.length()<28) {
    textSize(16);
  } else {
    textSize(14);
  }
  
  text(dVal,300,80);
}
void performCalc() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("x")) {
    result = l * r;
  } else if (op.equals("÷")) {
    result = l/r;
  }
  l = result;
  dVal = str(result);
  left = true;
  println("Result:" + result + "Left:" + left);
}
