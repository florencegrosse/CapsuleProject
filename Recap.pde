public class Recap extends Screen
{

  public ZoneManagerRecap zoneManager;

  public Recap(String id, PerfumeManager perfumeManager, PumpManager pump)
  {
    super(id, perfumeManager, pump);
    zoneManager = new ZoneManagerRecap(width/2, height/2+20, 50, 200);
  }

  public void draw()
  {

    super.draw();

    pushStyle();
    zoneManager.draw();
    
    //ArrayList<PerfumeInstruction> instructions = perfumeManager.instructions ;
    //int l = instructions.size() ;
    //for (int i=0; i<l; i++)
    //{
    //  PerfumeInstruction instruction = instructions.get( i ) ;
    //  pump.sendPumpCommand(instruction.pumpId, instruction.liquidAmount);
      
    //  // TODO send instructions
    //}
    
    //pump.update();
    
    popStyle();
  }

  public void show()
  {
    super.show();
  }

  public void hide()
  {
    super.hide();
  }
}