//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
PImage picBackground;
//
void setup() {
  fullScreen(); //displayWidth, displayHeight
  //size(500, 100);
  appWidth = width;
  appHeight = height;
  //
  //Population
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  picBackground = loadImage("../ImagesUsed/halloween1.png");
  //
  //DIVs
  rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  //
} //End setup
//
void draw() {
  image (picBackground,backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
} //End Draw
//
void keyPressed () {
} //End keyPressed
//
void mousePressed() {
} // End mousePressed
//
//MAIN Program
