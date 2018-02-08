public class Action implements Runnable
{
  String _phase = "inactive" ;
  Boolean _running = false ;
  boolean _startMusic = true;
  
  public Action()
  {
    super();
  }
  
  public String getPhase()
  {
    return _phase ; 
  }
  
  public void notifyFinished()
  {
    _phase = "finished" ;
    _running = false ;
    _startMusic = true;
  }
  
  public void notifyStarted()
  {
    _phase = "running" ;
    _running = true ;
  }
  
  public void run()
  {
    
  }
}