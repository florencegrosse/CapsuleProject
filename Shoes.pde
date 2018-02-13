public class Shoes extends Screen
{

  float timeAtValidation1; //time when the 2 hands were fist inside
  float validationTime1; //it take 2 seconds to validates
  float timeAtValidation2; //time when the 2 hands were fist inside
  float validationTime2; //it take 2 seconds to validates
  float timeAtValidation3; //time when the 2 hands were fist inside
  float validationTime3; //it take 2 seconds to validates

  boolean readingFirstInstruction;
  boolean readingSecondInstruction;
  boolean readingThirdInstruction;
  boolean readingFinished;


  public Shoes(String id, String next)
  {
    super(id, next);

    timeAtValidation1 = 0;
    validationTime1 = 15;
    timeAtValidation2 = 0;
    validationTime2 = 5;
    timeAtValidation3 = 0;
    validationTime3 = 50;

    readingFirstInstruction = true;
    readingSecondInstruction = false;
    readingThirdInstruction = false;
    readingFinished = false;
  }

  public void draw()
  {
    super.draw();

    pushStyle();    

    textSize(18);
    fill(255);
    textAlign(CENTER);
    textFont (montserratLight);
    text("now that you are both here, \n put the glass vial you have been given \n in the heart of the scent machine ", 0, 50, width, 100);



    if (readingFirstInstruction) 
    {
      if (timeAtValidation1 == 0) timeAtValidation1 = millis()/1000.0f;
      else 
      {
        float currentTime1 = millis()/1000.0f;
        float validationProgression1 = map(currentTime1-timeAtValidation1, 0, validationTime1, 0, 1);
        
        if (currentTime1 > timeAtValidation1 + validationTime1)
        {
          fill(255);
          text("then both of you, \n please take off your shoes, \n stand on the grass", 0, 250, width, 100);

          readingSecondInstruction = true;
          
        }
      }
    } else
    {
      timeAtValidation1 = 0;
    }


    if (readingSecondInstruction) 
    {
      if (timeAtValidation2 == 0) timeAtValidation2 = millis()/1000.0f;
      else 
      {
        float currentTime2 = millis()/1000.0f;
        float validationProgression2 = map(currentTime2-timeAtValidation2, 0, validationTime2, 0, 1);
        

        if (currentTime2 > timeAtValidation2 + validationTime2)
        {
          fill(255);
          text("and take a deep breath…", 0, 450, width, 100);

          readingThirdInstruction = true;
          
        }
      }
    } else
    {
      timeAtValidation2 = 0;
    }
    

  
    if (readingThirdInstruction) 
    {
      if (timeAtValidation3 == 0) timeAtValidation3 = millis()/1000.0f;
      else 
      {
        float currentTime3 = millis()/1000.0f;
        float validationProgression3 = map(currentTime3-timeAtValidation3, 0, validationTime3, 0, 1);
        

        if (currentTime3 > timeAtValidation3 + validationTime3)
        {
          readingThirdInstruction = false;
          notifyFinished();
        }
      }
    } else
    {
      timeAtValidation3 = 0;
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
    if ( kinect != null )
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
    readingFirstInstruction = true;
    
  }

  public void hide()
  {
    super.hide();
  }
}