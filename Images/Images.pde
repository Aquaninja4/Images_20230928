/* Program Notes
 - extra marks for colour variables
 */
//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
PImage picBackground;
Boolean nightmode=false; //Note: clock automatically will turn on
Boolean BrightnessControl=false; // ARROWS
int BrightnessNumber = 255; //Range 1 - 255
//int RedNumber = ;
//int GreenNumber = ;
//int BlueNumber = ;
//
void setup() {
  //fullScreen(); //displayWidth, displayHeight
  size(500, 500);
  appWidth = width;
  appHeight = height;
  //
  //Population
  int hourNightMode = hour(); //24 hour clock
  println (hourNightMode);
  if (hourNightMode>22) {
    nightmode=true;
  } else if (hourNightMode<07) {
    nightmode=true;
  } else {
    nightmode=false;
  }
  backgroundImageX = appWidth*0;
  backgroundImageY = appHeight*0;
  backgroundImageWidth = appWidth-1;
  backgroundImageHeight = appHeight-1;
  picBackground = loadImage("../ImagesUsed/halloween1.png");
  //
  //DIVs
  //rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  //
} //End setup
//
void draw() {
  //background(255); //built in bug, 1 pixel
  rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  //
  if (BrightnessControl==true ) tint(255, BrightnessNumber);
  { //Grey Scale: 1/2 tint (i.e. 128/226=1/2)
    if ( BrightnessNumber<1  ) {
      BrightnessNumber=1;
    } else if (BrightnessNumber>255) {
      BrightnessNumber=255;
    } else {
      //Empty Else
    }
    tint (255, BrightnessNumber);
    println(BrightnessNumber);
  }



  //if ( nightmode==true ) tint(64, 64, 40); //Grey Scale: 1/2 tint (i.e. 128/226=1/2)
  if (nightmode==true) {
    tint(64, 64, 40); // more marks if numbers are varibles, (error check), ( // blue at should have a limit of 40
    //println(nightmode);
  } else {
    noTint(); //See processing DOC
    //println(nightmode);
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
  if (key == CODED && keyCode == UP || keyCode == DOWN ) { //Brightness keybind
    BrightnessControl = true;
    if (key == CODED && keyCode == UP) BrightnessNumber++;
    if (key == CODED && keyCode == DOWN) BrightnessNumber-- ;
    // start here with brightness toggles
  }
  //
  //println(BrightnessNumber);
} //End keyPressed
//
void mousePressed() {
} // End mousePressed
//
//MAIN Program
