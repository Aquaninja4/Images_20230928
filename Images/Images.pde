/* Program Notes
 - extra marks for colour variables, make blue adjustable just like brightness 0 - 40 , (65% for numbers, more for variables)
 */
//Global Variables
int appWidth, appHeight;
float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float bikeXrect, bikeYrect, bikeWidthRect, bikeHeightRect, bikeWidth, bikeHeight;
float pumpkinGhostXrect, pumpkinGhostYrect, pumpkinGhostWidthRect, pumpkinGhostHeightRect, pumpkinGhostWidth, pumpkinGhostHeight;
PImage picBackground, bikeForeground, pumpkinGhostPortrait;
Boolean nightmode=false; //Note: clock automatically will turn on
Boolean BrightnessControl=false; // ARROWS
int BrightnessNumber = 255; //Range 1 - 255
//
void setup() {
  fullScreen(); //displayWidth, displayHeight
  //size(500, 500);
  appWidth = width;
  appHeight = height;
  //
  //Population
  //Original Aspect Ratios of Imagees to Change
  //Compare the side Lengths to see which is bigger
  //"Compress" the biggest side into the rect()
  //Multiply the Image's Aspect Ratio to the smaller side
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
  backgroundImageWidth = appWidth;
  backgroundImageHeight = appHeight;
  //
  bikeXrect = appWidth*1/14;
  bikeYrect = appHeight*1/8;
  bikeWidthRect = appWidth*2.25/7; //2/14
  bikeHeightRect = appHeight*1/4;
  //
  pumpkinGhostXrect = appWidth*1/2;
  pumpkinGhostYrect = bikeYrect;
  pumpkinGhostWidthRect = bikeWidthRect;
  pumpkinGhostHeightRect = bikeHeightRect;
  //Aspect Ratio Calculations
  //Determine Aspect Ratio
  //Compare dimension to get larger dimension
  //Calculate Smaller Dimenion
  //Rewrite variables based on rect() vars
  //Aspect Ratio Change
  //backgroundImageWidth = 980; //From Image File
  //backgroundImageHeight = 980;//From Image File
  bikeWidth = 860.0;//From Image File
  bikeHeight = 529.0;//From Image File
  pumpkinGhostWidth = 980.0;//From Image File
  pumpkinGhostHeight = 980.0;//From Image File
  float aspectRatio = 0.0; //Local Variable
  //float rectDimensionMemory = 0.0; //Assigned ZERO b/c IF' //???
  if (bikeWidth >= bikeHeight) { //Bike Image if Landscape
    //Comparison Verification
    //
    println("BIKE is Landscape");
    aspectRatio = bikeHeight / bikeWidth;; // smaller / Larger if int
    //memory of smaller side
    bikeWidth = bikeWidthRect;
    bikeHeight = aspectRatio * bikeWidth;
    if ( bikeHeight > bikeHeightRect ) {
      println("ERROR: Aspect Calcualtion Too Big");
      //
      //
      //
    }
  } else { //Bike Image if Portrait
    //Comparison Verification
    println("BIKE is Portrait");
    //
    aspectRatio = bikeWidth / bikeHeight; // smaller / Larger if int
    //memory of smaller side
    bikeHeight = bikeHeightRect;
    bikeWidth = aspectRatio * bikeHeight;
    if ( bikeWidth > bikeWidthRect ) {
      println("ERROR: Aspect Calcualtion Too Big");
    }
    } //End IF
    //
    //
    //
    if (pumpkinGhostWidth >= pumpkinGhostHeight) { //Pumpkin Image if Portrait
      //Comparison Verification
      //
      println("PUMPKIN is Portrait");
      aspectRatio = pumpkinGhostHeight / pumpkinGhostWidth; // smaller/large=0 if int, use casting
      pumpkinGhostWidth = pumpkinGhostWidthRect;
      pumpkinGhostHeight = aspectRatio * pumpkinGhostWidth;
      if (pumpkinGhostWidth > pumpkinGhostWidthRect) { //ERROR Catch is pumpkinGhostHeightRect > pumpkinGhostHeight
        println("ERROR: Aspect Calcualtion Too Big");
        //
        //
        //
      }
    } else { //Pumpkin Image if Landscape
      println("PUMPKIN is Landscape");
      aspectRatio = pumpkinGhostWidth / pumpkinGhostHeight;
      //memory of smaller side
      pumpkinGhostHeight = pumpkinGhostHeightRect;
      pumpkinGhostWidth = aspectRatio* pumpkinGhostHeight;
      if (pumpkinGhostWidth > pumpkinGhostWidthRect) { //ERROR Catch is pumpkinGhostHeightRect > pumpkinGhostHeight
        println("ERROR: Aspect Calcualtion Too Big");
      }
    } //End IF
    //
    //
    //
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
    //rect(bikeXrect, bikeYrect, bikeWidthRect, bikeHeightRect); //bike
    //rect(pumpkinGhostXrect, pumpkinGhostYrect, pumpkinGhostWidthRect, pumpkinGhostHeightRect);
    //
  } //End setup
  //
  void draw() {
    //background(255); //built in bug, 1 pixel
    rect(bikeXrect, bikeYrect, bikeWidthRect, bikeHeightRect); //bike
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
      tint(64, 64, 40, BrightnessNumber); // ( // blue at should have a limit of 40
      //println(nightmode);
    } else {
      tint (BrightnessNumber, BrightnessNumber, BrightnessNumber, BrightnessNumber);
      //println(nightmode);
    }
    //rect(backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
    //
    image (picBackground, backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight);
    image(bikeForeground, bikeXrect, bikeYrect, bikeWidth, bikeHeight); //bike
    image(pumpkinGhostPortrait, pumpkinGhostXrect, pumpkinGhostYrect, pumpkinGhostWidth, pumpkinGhostHeight); // pumpkinGhost
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
  //End MAIN Program
