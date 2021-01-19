PImage Globe;
int index = 0;
boolean window = false;
String displayInfo = "";
boolean instructionDisplay = true;

void setup() {
  size(1024,512);
  Globe = loadImage("WorldMap.jpg");
}

void draw() {
  background(Globe);
  if (index == 0) {
    fill(151, 232, 212);
  }
  else {
    fill(255, 255, 255);
  }
  rect(422,0,90,18);
  if (index == 0) {
    fill(255, 255, 255);
  }
  else {
    fill(151, 232, 212);
  }
  rect(512,0,90,18);
  if (((mouseY<18) && (mouseX>422) && (mouseX<612)) || ((mouseY>200 && mouseY<215) && (mouseX>572) && (mouseX<597) && window==true)) {
    cursor(HAND);
    }
  else {
    cursor(ARROW);
   }
  fill(0);
  textSize(13);
  text("Today",450,13);
  text("Tommorrow",520,13);
  if (window ==true) {
    fill(151, 232, 212);
    strokeWeight(2);
    rect(428,200,164,100);
    fill(0);
    textSize(11);
    textLeading(13);
    text(displayInfo,431,212);
    fill(255, 4, 0);
    rect(577,200,15,15);//exit square on window
    fill(255, 255, 255);
    line(577,200,592,215);
    line(577,215,592,200);
  }
  
  if (instructionDisplay == true) {
    fill(255);
    textSize(26);
    text("Awaiting a location (Click to select)!",430,400);
  }
}


void mouseClicked() {
  instructionDisplay = false;
  float whereLatitude = map(mouseY, 0, height, 90, -90);
  float whereLongitude = map(mouseX, 0, width, -180, 180);
  if ((mouseY<18) && (mouseX>422) && (mouseX<512)) {
    window = false;
    index = 0;
  }
  else if ((mouseY<18) && (mouseX>512) && (mouseX<602)) {
    window = false;
    index = 1;
  }
  else if ((mouseY>200 && mouseY<215) && (mouseX>572) && (mouseX<597)) {
    window = false;
  }
  else {
    displayInfo = CountryWeather(whereLatitude, whereLongitude, index);
    window = true;
  }
}
