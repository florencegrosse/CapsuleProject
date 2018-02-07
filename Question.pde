public class Question extends Screen
{
  int id;
  String question;
  PImage circle;
  int transparency1;
  int transparency2;
  float fadeIn;
  float fadeOut;
  int stepRatio;
  int Id;
  int pumpId;
  int liquidAmount;
  ZoneManager zoneManager;
  
  
 
  public Question(String id, String next, KinectManager kinect, PumpManager pump, String question, int stepRatio, int Id)
  {
    super(id, next, kinect, pump, question, stepRatio, Id);
    circle = loadImage("cercle_couleur.png");
    transparency1 = 0;
    transparency2 = 255;
    fadeIn = 1;
    fadeOut = 1;
    liquidAmount = 0;
    zoneManager = new ZoneManager(width/2, height/2+20, 50, 200);
  }

  public void draw()
  {
    super.draw();

    // display label
    pushStyle();
    textFont(montserratSemiBold);
    textSize (18);
    fill(255);
    textAlign(CENTER);

    text(super.id, width/60, 30, width/10*2, 20);
    textFont(montserratLight);

    //display background
    imageMode(CENTER);
    image(circle, width/2, height/2+20, width/5*3, width/5*3);

    if (transparency2>0) {
      transparency2 -= fadeOut;
      fill(color(255, transparency2));
      textLeading(25);
      text(super.question, 0, 30, width, 50);
    }


    if (transparency1<255) {
      transparency1 += fadeIn;
      textFont(montserratSemiBold);
      fill(color(255, transparency1));
      text("when you", 0, height/2-10, width, 20);
      text("are done, please", 0, height/2+10, width, 20);
      text("select a zone", 0, height/2+30, width, 20);
    } else {
      textFont(montserratSemiBold);
      fill(color(255, transparency1));
      text("when you", 0, height/2-10, width, 20);
      text("are done, please", 0, height/2+10, width, 20);
      text("select a zone", 0, height/2+30, width, 20);
    } 

    for (int i=0; i<zoneManager.zone.length; i++){
    zoneManager.zone[i].fadeInEffect = true;
    }
    zoneManager.draw();
    kinect.fadeInEffect = true;
    kinect.fadeIn = 1;
    kinect.draw();
    
    
    switch(zoneManager.getPhase())
    {
    case "finished" :
      {
        perfumeCommand();
        notifyFinished();
        break ;
      }
    }

    popStyle();
  }
  
  //public int getPerfumeInstruction()
  //{
  //  for (int i=0; i<zoneManager.zone.length; i++)
  //  {
  //  pumpId = zoneManager.handOverIdTotal;
  //  }
    
  //  return pumpId;
  //}

  public void notifyFinished()
  {
    super.notifyFinished() ;
    if (kinect != null)
    {
      kinect.reset() ;
    }
  }
  
  public void perfumeCommand()
  {
  pump.sendPumpCommand(super.Id, super.stepRatio);
  }

  public void run()
  {
    notifyStarted() ;
    zoneManager.notifyStarted() ;
  }

  public void show()
  {
    super.show();
    zoneManager.colorIsSelected = false;
  }

  public void hide()
  {
    super.hide();
  }
}