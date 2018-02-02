import processing.sound.*;
import processing.video.*;

PFont montserratLight;
PFont montserratMedium;
PFont montserratSemiBold;

ScreenManager screenManager;
PumpManager pump;
KinectManager kinect;
Movie test;

import system.signals.Signal ;

void setup()
{
  size(800, 600);
  pixelDensity(2);

  test = new Movie(this, "texture.MP4");
  test.loop();

  montserratLight = createFont("Montserrat-Light.otf", 20);
  montserratMedium = createFont("Montserrat-Medium.otf", 20);
  montserratSemiBold = createFont("Montserrat-SemiBold.otf", 20);

  pump = new PumpManager(this);
  kinect = new KinectManager();

  Screen[] screen = new Screen[] //Initialization of all the screens
  {
    new Start("start", "instructions", kinect), 
      new Instruction("instructions", "activity 1", kinect), 
      new Question("activity 1", "activity 2", kinect, "person X, ask person Y gnagnagna"), 
      new Question("activity 2", "activity 3", kinect, "person Y, ask person X gnignigni"), 
      new Question("activity 3", "activity 4", kinect, "person X, ask person Y gnognogno"), 
      new Question("activity 4", "activity 5", kinect, "person Y, ask person X gneugneugneu"), 
      new Question("activity 5", "activity 6", kinect, "person X, ask person Y what's the capital of Albany"), 
      new StickyHands("activity 6", "recap", kinect), 
      new Recap("recap")
  };

  screenManager = new ScreenManager(screen);
}

void sendMessage( String message )
{
  println( message ) ;
}

void movieEvent(Movie m) {
    m.read();
  }
  
void draw()
{
  background(255);
  pump.update();
  screenManager.draw();
  pump.draw();
  //kinect.draw();
}


void mousePressed()
{
  kinect.mousePressed();
}

void mouseReleased()
{
  kinect.mouseReleased();
}

void mouseDragged()
{
  kinect.mouseDragged();
}


void keyPressed(KeyEvent e)
{
  println(e.getKeyCode());

  switch(e.getKeyCode())
  {
  case 37: //Arrow Left
    screenManager.previous();
    break;

  case 38: //Arrow up
    break;

  case 39: //Arrow right
    screenManager.next();
    break;

  case 40: //Arrow down
    break;
  }

  kinect.keyPressed(e);
}