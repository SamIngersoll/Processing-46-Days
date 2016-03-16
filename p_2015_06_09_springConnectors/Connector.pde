

class Connector  {
 int to, from;  // Pointers of from and to points
 Connector( int to, int from)  {
  this.to = to;
  this.from = from;
 }
 void draw()  {
  strokeWeight( 0.5 );
  line( points.get(to).x, points.get(to).y, points.get(from).x, points.get(from).y ); // Connects points
 }
}
