public class Screen extends Action
{
  public String id;
  public String question;
  public String next;
  public KinectManager kinect ;

  public Screen( String id )
  {
    this.id = id;
    this.next = null;
    this.kinect = null;
    this.question = null;
  }

  public Screen( String id, String next )
  {
    this.id = id;
    this.next = next;
    this.kinect = null;
    this.question = null;
  }

  public Screen( String id, String next, KinectManager kinect )
  {
    this.id = id;
    this.next = next;
    this.kinect = kinect;
    this.question = null;
  }

  public Screen( String id, String next, KinectManager kinect, String question)
  {
    this.id = id;
    this.next = next;
    this.kinect = kinect;
    this.question = question;
  }

  public void draw()
  {
    pushStyle();
    //fill(0);
    //text("Screen : "+this.id, 10, 10, 200, 20);
    popStyle();
  }

  public void show()
  {
  }

  public void hide()
  {
  }
}