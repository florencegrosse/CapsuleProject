public class Question extends Screen
{
  int id;
  String question;
  PImage circle;
  ZoneManager zoneManager;

  public Question(String id, String next, KinectManager kinect, String question)
  {
    super(id, next, kinect, question);
    circle = loadImage("cercle_couleur.png");
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
    text(super.id, width/10, 30, width/10*2, 20);
    textFont(montserratLight);
    text(super.question, width/10*3, 30, width/10*6, 20);

    //display background
    imageMode(CENTER);
    image(circle, width/2, height/2+20, width/5*3, width/5*3);
    //image(test, width/2, height/2+20, width/5*3, width/5*3);
    //fill(color(23,87,56));
    //noStroke();
    //ellipse(width/2, height/2+20, zoneManager.hypo*2, zoneManager.hypo*2);

    zoneManager.draw();
    kinect.fadeInEffect = true;
    kinect.fadeIn = 1;
    kinect.draw();

    switch(zoneManager.getPhase())
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
    if (kinect != null)
    {
      kinect.reset() ;
    }
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