public class ZoneGradient extends Action
{

  public int radius;
  public PVector origin;
  public color zoneColor;
  public int numHandsOver;
  //public color targetColor;

  public ZoneGradient(PVector pos, int r)
  {

    origin = pos;
    radius = r;
    zoneColor = color(200);
    numHandsOver = 0;
  }

  public void draw()
  {

    pushStyle();

    //check hand pos for zone

    //fill(zoneColor);
    //noStroke();
    //ellipse(origin.x, origin.y, radius*2, radius*2);


    drawGradient1(origin.x, origin.y);


    numHandsOver = 0;
    if (isPointOver(kinect.person1Hand)) numHandsOver++;
    if (isPointOver(kinect.person2Hand)) numHandsOver++;
    drawGradient1(origin.x, origin.y);
    if (numHandsOver == 1) drawGradient2(origin.x, origin.y);
    else if (numHandsOver == 2) drawGradient3(origin.x, origin.y);

    //zoneColor = targetColor;

    popStyle();
  }

  void drawGradient1(float x, float y) {

    float h = 120;
    for (int r = radius*2; r > 0; --r) {
      fill(160, h, 255, 100);
      noStroke();
      ellipse(x, y, r, r);
      h = (h + 0.75) % 360;
    }
  }

  void drawGradient2(float x, float y) {

    float h = 120;
    for (int r = radius*2; r > 0; --r) {
      fill(160, h, 255, 100);
      noStroke();
      ellipse(x, y, r, r);
      h = (h + 0.5) % 360;
    }
  }

  void drawGradient3(float x, float y) {

    float h = 120;
    for (int r = radius*2; r > 0; --r) {
      fill(160, h, 255, 100);
      noStroke();
      ellipse(x, y, r, r);
      h = (h + 1) % 360;
    }
  }

  public boolean isPointOver(PVector point)
  {
    return origin.dist(point) < radius;
  }
}