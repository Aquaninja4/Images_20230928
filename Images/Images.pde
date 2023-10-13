/* Program Notes
 - extra marks for colour variables, make blue adjustable just like brightness 0 - 40 , (65% for numbers, more for variables)
 */
//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float bikeX, bikeY, bikeWidth, bikeHeight;
float pumpkinGhostX, pumpkinGhostY, pumpkinGhostWidth, pumpkinGhostHeight;
PImage picBackground, bikeForeground, pumpkinGhostPortrait;
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
  //
  bikeX = appWidth*1/14;
  bikeY = appHeight*1/8;
  bikeWidth = appWidth*2.4/7; //2/14
  bikeHeight = appHeight*1/4;
  //
  pumpkinGhostX = bikeX;
  pumpkinGhostY = appHeight*5/8;
  pumpkinGhostWidth = bikeWidth;
  pumpkinGhostHeight = bikeHeight ;
    //Aspect Ratio Calculations
    //Determine Aspect Ratio
    //Compare dimension to get larger dimension
    //Calculate Smaller Dimenion
    //Rewrite variables based on rect() vars
  //concatenation of pathways
  String up = "..";
  String open = "/";
  String imagesPath = up + open;
  String imagesUsed = "imagesUsed/";
  String halloweenBackgroundImage = "halloween_pattern_background.jpg";
  String bikeImage = "bike.jpg";
  String pumpkinGhostImage = "halloween1.png";
  picBackground = loadImage(imagesPath + imagesUsed + halloweenBackgroundImage);
  bikeForeground = loadImage (imagesPath + imagesUsed + bikeImage);
  pumpkinGhostPortrait = loadImage (imagesPath + imagesUsed + pumpkinGhostImage);
  //
  //DIVs
  //rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  rect(bikeX, bikeY, bikeWidth, bikeHeight); //bike
  rect(pumpkinGhostX, pumpkinGhostY, pumpkinGhostWidth, pumpkinGhostHeight);
  //
} //End setup
//
void draw() {
  //background(255); //built in bug, 1 pixel
  rect(bikeX, bikeY, bikeWidth, bikeHeight); //bike
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
    tint(64, 64, 40); // ( // blue at should have a limit of 40
    //println(nightmode);
  } else {
    noTint(); //See processing DOC
    //println(nightmode);
  }
  image (picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
  image(bikeForeground, bikeX, bikeY, bikeWidth, bikeHeight); //bike
  image(pumpkinGhostPortrait, pumpkinGhostX, pumpkinGhostY, pumpkinGhostWidth, pumpkinGhostHeight); // pumpkinGhost
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
