
class Point  {
  private float x, y, angle, radius;
  Point( float radius, float angle )  {
  this.radius = radius;
  this.angle = angle;
  calcX();
  calcY();
 }
 
 void draw()  {  // Draws offset points of different colors
   strokeWeight( 5 );
   stroke( 255, 0, 0 );
   point( this.x-4, this.y ); 
   stroke( 0, 255, 0 );
   point( this.x+4, this.y ); 
   stroke( 0,0, 255 );
   point( this.x, this.y-4 ); 
   stroke( 0 );
   point( this.x, this.y+4 ); 
 }
 void calcX()  {  // Calculates the x value from the angle
   this.x = this.radius*cos(this.angle)+width/2;
 }
 void calcY()  {  // Calculates the y value from the angle
   this.y = this.radius*sin(this.angle)+height/2;
 }
 void setX( float x )  {
  this.x = x; 
 }
 void setY( float y )  {
  this.y = y; 
 }
 void spin( float increment )  {  // Spins the points
  this.angle += increment; 
  calcX();
  calcY();
 }
}
