public class ZoneRecap extends Action
{

  public int radius;
  public int id;
  public PVector origin;
  public color zoneColor;
  public int numHandsOver;
  public color targetColor;
  PImage circle;
  
  public String[] fragrance = {"lavender", "citrus", "musc", "mint", "rose", "jasmin"};

  public ZoneRecap(PVector pos, int r, int _id)
  {

    origin = pos;
    radius = r;
    id = _id;
    zoneColor = color(255, 0);
    numHandsOver = 0;
    circle = loadImage("cercle_couleur.png");
  }

  public void draw()
  {

    pushStyle();

    //check hand pos for zone
    imageMode(CENTER);
    image(circle, origin.x, origin.y, radius*2+5, radius*2+5);
    fill(color(255, 255, 255, 100));
    noStroke();
    ellipse(origin.x, origin.y, radius*2, radius*2);
    textSize(8);
    textAlign(CENTER, CENTER);
    fill(0);
    textFont(montserratSemiBold);
    text("10%\n"+fragrance[id], origin.x-radius/2-20, origin.y-radius+8, 100, 100);

    numHandsOver = 0;
    if (isPointOver(kinect.person1Hand)) numHandsOver++;
    if (isPointOver(kinect.person2Hand)) numHandsOver++;
    targetColor = color(255, 0);
    ;
    if (numHandsOver == 1) targetColor = color(39, 76, 54);
    else if (numHandsOver == 2) targetColor = color(67, 124, 87);

    zoneColor = targetColor;

    popStyle();
  }

  public boolean isPointOver(PVector point)
  {
    return origin.dist(point) < radius;
  }
}