public class Recap extends Screen
{

  public ZoneManagerRecap zoneManager;

  public Recap(String id)
  {
    super(id);
    zoneManager = new ZoneManagerRecap(width/2, height/2+20, 50, 200);
  }

  public void draw()
  {

    super.draw();

    pushStyle();
    zoneManager.draw();
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