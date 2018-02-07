public class StickyHands extends Screen
{

  boolean handsOverlapping;
  float timeAtValidation; //time when the 2 hands were fist inside
  float validationTime; //it take 2 seconds to validates
  boolean highFive;

  public StickyHands(String id, String next, KinectManager kinect)
  {
    super(id, next, kinect);
    
    handsOverlapping = false;
    timeAtValidation = 0;
    validationTime = 2;
    highFive = false;
    
  }

  public void draw()
  {
    super.draw();

    pushStyle();
    textSize(18);
    fill(255);
    textAlign(CENTER);
    textFont (montserratLight);
    text("High five guys !", 0, 30, width, 20);
    
    kinect.fadeInEffect = false;
    kinect.draw();

    if (areHandsOverlapping()) handsOverlapping = true;

    if (handsOverlapping) 
    {
      if (timeAtValidation == 0) timeAtValidation = millis()/1000.0f;
      else 
      {
        float currentTime = millis()/1000.0f;
        float validationProgression = map(currentTime-timeAtValidation, 0, validationTime, 0, 1);
        fill(100);
        rect(width/2, height/2, 10, 100);
        fill(255, 255, 0);
        rect(width/2, height/2, 10, 100*validationProgression);

        if (currentTime > timeAtValidation + validationTime) 
          {
            highFive = true;
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
    if(kinect != null)
    {
        kinect.reset() ;
    }
  }
  
  public void run()
  {
    notifyStarted() ;
  }

  boolean areHandsOverlapping() 
  {
    float overlapping1 = abs(kinect.person1Hand.x - kinect.person2Hand.x + kinect.handWidth);
    float overlapping2 = abs(kinect.person2Hand.x - kinect.person1Hand.x + kinect.handWidth);
    return overlapping1<=2*kinect.handWidth||overlapping2<=kinect.handWidth;
  }

  public void show()
  {
    super.show();
    handsOverlapping = false;
  }

  public void hide()
  {
    super.hide();
  }
}