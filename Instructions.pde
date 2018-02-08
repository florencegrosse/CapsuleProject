public class Instruction extends Screen
{
  Zone zone1;
  Zone zone2;
  
  boolean instructionsAreUnderstood;
  float timeAtValidation; //time when the 2 hands were fist inside
  float validationTime; //it take 2 seconds to validates
  PImage circle;
  int numHandsOverTotal;

  public Instruction(String id, String next, KinectManager kinect)
  {
    super(id, next, kinect);
    zone1 = new Zone(1, new PVector(width/2, height/3), 50);
    zone2 = new Zone(2, new PVector(width/2, height/3*2), 50);
    
    instructionsAreUnderstood = false;
    timeAtValidation = 0;
    validationTime = 2;
    circle = loadImage("cercle_couleur.png");
    numHandsOverTotal = 0;
  }

  public void draw()
  {
    super.draw();

    pushStyle();    

    textSize(18);
    fill(255);
    textAlign(CENTER);
    textFont (montserratLight);
    text("put your hand over a circle \n to go on", 0, 30, width, 100);
    
    imageMode(CENTER);
    image(circle, width/2, height/3, 110, 110);
    image(circle, width/2, height/3*2, 110, 110);

    zone1.musicPlay = false;
    zone2.musicPlay = false;
    
    zone1.draw();
    zone2.draw();
    
    kinect.fadeInEffect = false;
    kinect.draw();
    
    numHandsOverTotal = zone1.numHandsOver + zone2.numHandsOver;

    if (numHandsOverTotal == 2) 
    {
      if (timeAtValidation == 0) timeAtValidation = millis()/1000.0f;
      else 
      {
        float currentTime = millis()/1000.0f;
        float validationProgression = map(currentTime-timeAtValidation, 0, validationTime, 0, 1);
        fill(100);
        rect(width-25, 25, 10, 50);
        fill(255, 255, 255);
        rect(width-25, 25, 10, 50*validationProgression);

        if (currentTime > timeAtValidation + validationTime)
          {
            instructionsAreUnderstood = true;
            notifyFinished();
          }
      }
    } else
    {
      timeAtValidation = 0;
    }
    
    switch(getPhase())
    {
       case "finished" :
       {
           notifyFinished() ;
           break ;
       }
    }
    
    popStyle();
  }
  
  public void notifyFinished()
  {
    super.notifyFinished() ;
    if( kinect != null )
    {
        kinect.reset() ;
    }
  }
  
  public void run()
  {
    notifyStarted() ;
    zone1.notifyStarted() ;
    zone2.notifyStarted() ;
  }

  public void show()
  {
    super.show();
    instructionsAreUnderstood = false;
  }

  public void hide()
  {
    super.hide();
  }
}