public class Instruction extends Screen
{
  ZoneGradient zoneGradient;
  
  boolean instructionsAreUnderstood;
  float timeAtValidation; //time when the 2 hands were fist inside
  float validationTime; //it take 2 seconds to validates

  public Instruction(String id, String next, KinectManager kinect)
  {
    super(id, next, kinect);
    zoneGradient = new ZoneGradient(new PVector(width/2, height/2), 100);
    
    instructionsAreUnderstood = false;
    timeAtValidation = 0;
    validationTime = 2;
  }

  public void draw()
  {
    super.draw();

    pushStyle();    

    textSize(18);
    fill(255);
    textAlign(CENTER);
    textFont (montserratLight);
    text("move your hand hover the circle", 0, 30, width, 20);

    zoneGradient.draw();
    
    kinect.fadeInEffect = false;
    kinect.draw();

    if (zoneGradient.numHandsOver == 2) 
    {
      if (timeAtValidation == 0) timeAtValidation = millis()/1000.0f;
      else 
      {
        float currentTime = millis()/1000.0f;
        float validationProgression = map(currentTime-timeAtValidation, 0, validationTime, 0, 1);
        fill(100);
        rect(zoneGradient.origin.x+zoneGradient.radius+10, zoneGradient.origin.y-zoneGradient.radius/2, 10, zoneGradient.radius);
        fill(255, 255, 0);
        rect(zoneGradient.origin.x+zoneGradient.radius+10, zoneGradient.origin.y-zoneGradient.radius/2, 10, zoneGradient.radius*validationProgression);

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
    zoneGradient.notifyStarted() ;
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