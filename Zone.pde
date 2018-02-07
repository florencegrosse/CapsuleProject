public class Zone extends Action
{

  public int radius;
  public PVector origin;
  public color zoneColor;
  public int numHandsOver;
  public color targetColor;
  int transparency;
  float fadeIn;
  boolean fadeInEffect;
  int id; 
  int handOverId;

  public Zone(int _id, PVector pos, int r)
  {

    id = _id;
    origin = pos;
    radius = r;
    zoneColor = color(255, 0);
    numHandsOver = 0;
    transparency = 0;
    fadeIn = 1.25;
    fadeInEffect = false;
    handOverId = -1;
  }

  public void draw()
  {

    pushStyle();

    //check hand pos for zone
    if (fadeInEffect && transparency<255) {

      transparency += fadeIn;

      fill(zoneColor);
      stroke(color(255, transparency));
      strokeWeight(5);
      ellipse(origin.x, origin.y, radius*2, radius*2);
    } else {
      fill(zoneColor);
      stroke(color(255, 255, 255, 200));
      strokeWeight(5);
      ellipse(origin.x, origin.y, radius*2, radius*2);
    }


    numHandsOver = 0;
    targetColor = color(255, 0);
    if (isPointOver(kinect.person1Hand)) {
      numHandsOver++; 
      targetColor = color(255, 255, 255, 120);
      //handOverId = id;
    }
    if (isPointOver(kinect.person2Hand)) {
      numHandsOver++; 
      targetColor = color(255, 255, 255, 120);
    }
    if (numHandsOver == 2) 
    {
      targetColor = color(255, 255, 255, 200);
    }

    zoneColor = targetColor;

    popStyle();
  }

  public boolean isPointOver(PVector point)
  {
    return origin.dist(point) < radius;
  }
}