public class ScreenManager
{
  Screen[] screen; //List of the screens for the app
  Screen currentScreen; //Keep track of the currentScreen
  
  
  
  public ScreenManager( Screen[] aScreen )
  {
    screen = aScreen;
    setCurrentScreen(screen[0]);
  }

  public void draw()
  {
    if(currentScreen != null) 
    {
         currentScreen.draw();
         switch( currentScreen.getPhase() )
         {
            case "finished" :
            {
                next()  ;
                break ;
            }
         }
    }
    
  }
  
  //This is the screen switching function that will manage the changing of screens
  public void setCurrentScreen(Screen newScreen)
  {
    //Then we check the new screen is different than the previous, if it's the same, we do nothing
    if(newScreen == currentScreen) return; //If same screen, stop here
    
    if(currentScreen != null)
    {
      //If there was already a screen shown, we hide it
      currentScreen.hide(); 
    }
    
    //We set the currentScreen variable to be the new screen
    currentScreen = newScreen; 
    
    if(currentScreen != null) 
    {
      //We check here if the new currentScreen is not null, if not we show it
      currentScreen.show();
      currentScreen.run() ;
    }
  }

  //Helper functions

  //This function helps automatically go to the next screen
  public void next()
  {
    //int index = getScreenIndex(currentScreen); //get the current screen index
    
    int index = -1 ;
    
    if( currentScreen.next != null )
    {
       index = getScreenIndexByID( currentScreen.next ) ;
    }
    else
    {
        index = getScreenIndex(currentScreen);
        if (index == -1) 
        {
          //If we didn't found any screen, it probably means that there is no current screen. 
          //Let's say then that the next screen will be the first screen in the list.
          index = 0;
        } else
        {
          //If not, we add 1 to the index so we are targeting the next screen in the list
          index = index+1;
        }
    }



    //Before setting it up, we have to check that the index is not greater than the number of screens, 
    //otherwise it will crash because it can't access an element "outside" the array
    //So we are checking if the index is greater or equal to the length of the array, because the last "valid" index is 1 less
    //than the actual size ( index 0 = first element, so index <size-1> is the last element in the array)
    if (index >= screen.length)
    {
      //We are probably on the last screen, what should be do ?
      //For now, let's go the the first screen again
      println("We are on the last screen, go the the first screen again");
      index = 0;
    }

    //Now we are sure that our target screen exist, let's set it as the current Screen
    Screen targetScreen = screen[index];
    setCurrentScreen(targetScreen);
  }

  //This function helps automatically go to the previous screen
  public void previous()
  {
    int index = getScreenIndex(currentScreen); //get the current screen index

    if (index == -1) 
    {
      //Same as in the nextScreen() function
      index = 0;
    } else
    {
      //If not, we subtract 1 to the index so we are targeting the next screen in the list
      index = index-1;
    }

    //Because this is previous Screen, we don't have to check if it's the last screen 
    //but if it was first screen, then the index would be -1
    if (index < 0)
    {
      //We were probably on the first screen, what should be do ?
      //For now, let's do nothing
      println("We already are on the first screen, doing nothing");
      return;
    }

    //Now we are sure that our target screen exist, let's set it as the current Screen
    Screen targetScreen = screen[index];
    setCurrentScreen(targetScreen);
  }

  int getScreenIndex(Screen screenToCheck)
  {
    for (int i=0; i<screen.length; i++) //We go through all screens
    {
      //When the screen checked is the same as the one we are looking for, it will return the index at which it is in the screens array.
      if (screen[i] == screenToCheck) return i;
    }

    //If we didn't find the screen, we return -1 to signal that it was not found (this is a convention)
    return -1;
  }
  
  int getScreenIndexByID(String id)
  {
    for (int i=0; i<screen.length; i++) //We go through all screens
    {
      //When the screen checked is the same as the one we are looking for, it will return the index at which it is in the screens array.
      if (screen[i].id == id) return i;
    }

    //If we didn't find the screen, we return -1 to signal that it was not found (this is a convention)
    return -1;
  }
  
  
}