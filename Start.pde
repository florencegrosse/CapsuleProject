public class Start extends Screen
{

  boolean personsAreReady;
  PVector person1Position;
  PVector person2Position;
  PImage person1;
  PImage person2;
  PImage personPresent1Image;
  PImage personPresent2Image;
  PImage personAbsentImage;
  int personWidth = 100;
  int personHeight;
  float timeAtValidation; //time when the 2 hands were fist inside
  float validationTime; //it take 2 seconds to validates

  public Start(String id, String next, KinectManager kinect)
  {
    super(id, next, kinect);
    person1Position = new PVector();
    person2Position = new PVector();
    person1Position.x = width/3;
    person1Position.y = height/2;
    person2Position.x = width*2/3;
    person2Position.y = height/2;
    person1 = loadImage("person1.png");
    person2 = loadImage("person1.png");
    personPresent1Image = loadImage("person2.png");
    personPresent2Image = loadImage("person3.png");
    personAbsentImage = loadImage("person1.png");
    personHeight = personWidth*personAbsentImage.height/personAbsentImage.width;
    timeAtValidation = 0;
    validationTime = 1;
  }

  public void draw()
  {

    super.draw();

    pushStyle();

    imageMode(CENTER);
    image(person1, person1Position.x, person1Position.y, personWidth, personHeight);
    image(person2, person2Position.x, person2Position.y, personWidth, personHeight);
    textSize(18);
    fill(255);
    textAlign(CENTER);
    textFont(montserratLight);
    if (kinect.person2Here) //Both persons are here
    {
      text("welcome on board", 0, 30, width, 20);
      person1 = personPresent1Image;
      person2 = personPresent2Image;
    } else if (kinect.person1Here) //Only one person is here
    {
      text("waiting for 1 adventurer", 0, 30, width, 20);
      person1 = personPresent1Image;
      person2 = personAbsentImage;
    } else //Nobody is here, so sad...
    {
      text("waiting for 2 adventurers", 0, 30, width, 20);
      person1 = personAbsentImage;
      person2 = personAbsentImage;
    }

    personsAreReady = kinect.person1Here && kinect.person2Here;

    if (personsAreReady) 
    {
      if (timeAtValidation == 0) timeAtValidation = millis()/1000.0f;
      else 
      {
        float currentTime = millis()/1000.0f;
       
        if (currentTime > timeAtValidation + validationTime)
          {
            personsAreReady = true;
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
    if (kinect != null)
    {
      kinect.reset() ;
    }
  }

  public void run()
  {
    notifyStarted() ;
  }

  public void show()
  {
    super.show();
    personsAreReady = false;
  }

  public void hide()
  {
    super.hide();
  }
}