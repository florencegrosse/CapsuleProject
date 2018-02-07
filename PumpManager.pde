import processing.serial.*;

public class PumpManager extends Action
{
  Serial myPort;
  boolean isConnected;
  
  public PumpManager(PApplet parent)
  {
    println("Serial ports :");
    printArray(Serial.list());

    String portName = "/dev/tty.usbmodem1411";//Serial.list()[0];
    try
    {
      myPort = new Serial(parent, portName, 9600);
      isConnected = true;
    }catch(Exception e)
    {
      println("Couldn't connect to the port : "+e.getMessage());
    }
  }

  public void update()
  {
    if(isConnected) while (myPort.available() > 0) print((char)myPort.read());
  }
  
  
  
  public void draw()
  {
    if(isConnected) fill(50,240,0);
    else fill(240,50,0);
    
    ellipse(width-20,20,10,10);
  }
  
  //public void getPerfumeRecipe(int[] liquidAmounts){
   
  //  for(int i = 0;i<liquidAmounts.length;i++){
      
  //    sendPumpCommand(i,liquidAmounts[i]);
      
  //  }
    
    
  //}

  public void sendPumpCommand(int pumpID, int ml)
  {
    if(!isConnected) return;
    
    println("Sending pump command for #"+pumpID+" for "+ml+" ml");
    myPort.write((byte)pumpID);
    myPort.write((byte)ml);
    myPort.write(255); //end message
  }
}