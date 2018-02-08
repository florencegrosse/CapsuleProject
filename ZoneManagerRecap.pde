public class ZoneManagerRecap extends Action
{
  ZoneRecap[] zone; 

  public int numHandsOverTotal;
  public int i;

  public PVector origin = new PVector(0, 0);

  public int radius;
  public int hypo;
  public float difx;
  public float dify;
  public boolean colorIsSelected;
  public float timeAtValidation; //time when the 2 hands were fist inside
  public float validationTime; //it take 2 seconds to validates

  public ZoneManagerRecap(int aX, int aY, int aRadius, int aHypo)
  {

    origin.x = aX ;
    origin.y = aY ;
    i = 0;
    radius = aRadius;
    hypo = aHypo;
    difx = (hypo-radius)*sin(radians(60))/sin(radians(90));
    dify = (hypo-radius)*sin(radians(30))/sin(radians(90));
    colorIsSelected = false;
    timeAtValidation = 0;
    validationTime = 2;

    zone = new ZoneRecap[]
      {
      new ZoneRecap(new PVector(origin.x, origin.y-hypo+radius), radius, 0), 
      new ZoneRecap(new PVector(origin.x, origin.y+hypo-radius), radius, 1), 
      new ZoneRecap(new PVector(origin.x-difx, origin.y-dify), radius, 2), 
      new ZoneRecap(new PVector(origin.x+difx, origin.y+dify), radius, 3), 
      new ZoneRecap(new PVector(origin.x+difx, origin.y-dify), radius, 4), 
      new ZoneRecap(new PVector(origin.x-difx, origin.y+dify), radius, 5)
    };
  }


  public void draw()
  {
    pushStyle();

    numHandsOverTotal = 0 ;

    for (int i=0; i<zone.length; i++)
    {
      zone[i].draw();
      numHandsOverTotal += zone[i].numHandsOver;
    }

    textSize(8);
    textAlign(CENTER, CENTER);
    fill(255);
    textFont(montserratLight);
    text("Thanks\nfor\npaticipating!\n\nYou guys have created\na scent together.\nTake it back\nfrom the machine,\nit is yours now.", origin.x-radius, origin.y-radius*4, width, 500);

    if (numHandsOverTotal == 2) 
    {
      if (timeAtValidation == 0) timeAtValidation = millis()/1000.0f;
      else 
      {
        float currentTime = millis()/1000.0f;
        float validationProgression = map(currentTime-timeAtValidation, 0, validationTime, 0, 1);
        fill(100);
        rect(width-25, 25, 10, radius);
        fill(255, 255, 255);
        rect(width-25, 25, 10, radius*validationProgression);

        if (currentTime > timeAtValidation + validationTime)
        {
          colorIsSelected = true;
          notifyFinished();
        }
      }
    } else timeAtValidation = 0;

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
    if ( kinect != null )
    {
      kinect.reset() ;
    }
  }

  public void run()
  {
    notifyStarted() ;
    for (int i=0; i<zone.length; i++)
    {
      zone[i].notifyStarted();
    }
  }
}