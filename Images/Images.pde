/* Program Notes
 -
 */
//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
PImage picBackground;
Boolean nightmode=false; //Note: clock can turn on automatically
Boolean BrightnessControl=false; // ARROWS
int BrightnessNumber = 255; //Range 1 - 255
//
void setup() {
  //fullScreen(); //displayWidth, displayHeight
  size(500, 500);
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
  tint(255, 128); //Grey Scale: 1/2 tint (i.e. 128/226=1/2)
  tint(64, 64, 40); //Grey Scale: 1/2 tint (i.e. 128/226=1/2)
  image (picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
} //End setup
//
void draw() {
  //background(255); //built in bug, 1 pixel
  rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  //
  if (BrightnessControl==true ) tint(255, BrightnessNumber); //Grey Scale: 1/2 tint (i.e. 128/226=1/2)
  //if ( nightmode==true ) tint(64, 64, 40); //Grey Scale: 1/2 tint (i.e. 128/226=1/2)
  if (nightmode==true) {
    tint(64, 64, 40);
    println(nightmode);
  } else {
    noTint(); //See processing DOC
    println(nightmode);
  }
  image (picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
} //End Draw
//
void keyPressed () {
  if (key == 'n' || key=='N' ) {
    if (nightmode==true) {  //Nightmode, basic control is Boolean
      nightmode = false;
    } else {
      nightmode = true;
    }
  }
  //Brightness: ARROWS activate BrightnessControl, Never off
  //Note: nightmode does turn off
  if (key == '[Special keybind]' || key == '[Special keybind]') { //Brightness keybind
  BrightnessControl = true;
  // start here with brightness toggles 
  
  }
  //
} //End keyPressed
//
void mousePressed() {
} // End mousePressed
//
//MAIN Program
