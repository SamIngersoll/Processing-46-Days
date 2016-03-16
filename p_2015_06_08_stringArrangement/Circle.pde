
// Circle contains a list of points

class Circle  {
  private ArrayList<Point> points;  // List of points
  private float radius;             // Radius of circle
  Circle( ArrayList<Point> points, float radius)  {  // Things you have to pass the circle to create it
    this.points = points;
    this.radius = radius;
  }
  void draw()  {
   // Iterates over points in circle
   for ( int i = 0 ; i < this.points.size() ; i++ )  {
    this.points.get(i).draw();  // Tells each point to draw itself
    if ( i > 0 )  {  // Connects the points
      strokeWeight( random( .000001 ) ); 
      stroke( 255, 0, 0 );                
      int num = (int)random(this.points.size()-i, i);           // Generates random number between the last point and the current point in list
      line( this.points.get(i).x, this.points.get(i).y,         // Creates line between random point and current point
            this.points.get(num).x, this.points.get(num).y );
    }
    this.points.get(i).move();  // Tells points to move themselves
   } 
  }
  
}

