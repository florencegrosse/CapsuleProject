public class ZoneRecap extends Action
{

  public int radius;
  public PVector origin;
  public color zoneColor;
  public int numHandsOver;
  public color targetColor;
  PImage circle;

  public ZoneRecap(PVector pos, int r)
  {

    origin = pos;
    radius = r;
    zoneColor = color(255,0);
    numHandsOver = 0;
    circle = loadImage("cercle_couleur.png");
  }

  public void draw()
  {

    pushStyle();

    //check hand pos for zone
    imageMode(CENTER);
    image(circle, origin.x, origin.y, radius*2+5, radius*2+5);
    fill(zoneColor);
    stroke(color(200));
    strokeWeight(5);
    ellipse(origin.x, origin.y, radius*2, radius*2);

    numHandsOver = 0;
    if (isPointOver(kinect.person1Hand)) numHandsOver++;
    if (isPointOver(kinect.person2Hand)) numHandsOver++;
    targetColor = color(255, 0);;
    if (numHandsOver == 1) targetColor = color(39,76,54);
    else if (numHandsOver == 2) targetColor = color(67,124,87);

    zoneColor = targetColor;

    popStyle();
  }

  public boolean isPointOver(PVector point)
  {
    return origin.dist(point) < radius;
  }
}